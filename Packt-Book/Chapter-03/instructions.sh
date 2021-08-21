#Build the docker file
docker build --tag thoughts-backend .

#run the image
docker run -it -p 8000:8000 thoughts-backend