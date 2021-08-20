# https://kubernetes.io/docs/tasks/tools/install-kubectl-macos/

# install brew first/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

#install kubectl
brew install kubernetes-cli


#install minikube
#https://minikube.sigs.k8s.io/docs/start/
brew install minikube

#install Docker
#https://docs.docker.com/desktop/mac/install/

#start a kuberenetes cluster
minikube start

#create encoded password
#echo -n <super-secret-passwod> | base64
echo -n supersecret | base64
#c3VwZXJzZWNyZXQ=

#create secrets.yml file and insert the password generated above
wget https://gist.githubusercontent.com/RikKraanVantage/b2144a9717b0821fdb3d508a8ee386e1/raw/ca4595013f2da5695b648fced5c86374067110d4/secrets.yml
#update passwod based on output from above
# apply secrets to kubernetes cluster
kubectl apply -f secrets.yml
#test it worked
kubectl get secrets 

#create persistant storage
wget https://gist.githubusercontent.com/RikKraanVantage/40c548bc9eaf25ea30e7f04372d183f1/raw/f01ef3ef051358d7fd9c739ae0e9b10ac7475930/pv.yml -O persistent-volume.yml
kubectl apply -f persistent-volume.yml
#check to see it worked
kubectl describe pv mysql-pv-volume
kubectl describe pvc mysql-pv-claim
# test if you can reach the mounted data
minikube ssh
- sudo mkdir /mnt/data
- sudo sh -c "echo 'Hello from Kubernetes storage' > /mnt/data/index.html"
- cat /mnt/data/index.html

#Create Database
wget https://gist.githubusercontent.com/RikKraanVantage/870855b6c294e772a968550d7a9eddbd/raw/131092cf805fd4e5abdf582b6a1a58be2acc1d4f/mysql-deployment.yml
docker pull mysql
kubectl apply -f mysql-deployment.yml
#test to see if the pods are deployed
kubectl get pods

#Install mysql client inside the cluster
kubectl run -it --rm --image=mysql --restart=Never mysql-client -- mysql --host mysql --password=supersecret
#inside mysql create database and schema
  CREATE DATABASE flaskapi;
  USE flaskapi;
  CREATE TABLE users(user_id INT PRIMARY KEY AUTO_INCREMENT, user_name VARCHAR(255), user_email VARCHAR(255), user_password VARCHAR(255));