#Tutorioal from  https://www.digitalocean.com/community/tutorials/how-to-make-a-web-application-using-flask-in-python-3

VIR_ENV_DIR="venv" 
if [ ! -d $VIR_ENV_DIR ] 
then
    python3 -m venv $VIR_ENV_DIR
fi 
source $VIR_ENV_DIR/bin/activate
pip install -r requirements.txt

export FLASK_APP=app
export FLASK_ENV=development
#flask run 

