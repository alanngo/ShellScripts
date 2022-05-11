RED='\u001b[31m'
GREEN='\u001b[32m'
BLUE='\u001b[34m'
YELLOW='\u001b[33m'

# usage
DIR=${1:-"."}
SRC="src"
PY=$DIR"/"$SRC
echo "creating flask project..."

if [ $DIR != "." ]; then
  mkdir $DIR
fi
mkdir $PY

# create makefile
echo '
install:
	pip3 install -r requirements.txt

test:
	python3 src/test/tests.py

run:
	python3 src/app.py'>> $DIR"/Makefile"

# READ ME
echo '
# Flask App (requires python 3.8)

## Prerequisites
```bash
$ make install
```
## How To Run Main App
```bash
$ make run
```

## How To Run Unit Tests
```bash
$ make test
```

## File Structure

``src/app.py`` main file

``src/api/``  API routes go here

``src/exception/`` contains all user-defined exception

``src/repository/``  DB config goes here

``src/service/`` bussiness logic goes here

``src/test/``  unit tests go here

``src/util/`` contains default exception handler and helper files/constants/functions go here
' >> $DIR"/README.md"

# main app
echo "
from flask import *
from flask_cors import *
from util.error_advice import advice

app = Flask(__name__)
app.register_blueprint(advice)

@app.route('/', methods=['GET'])
def index():
    return {'mssg':'Totally Accurate Battle Simulator is the best game ever'}

if __name__ == '__main__':
    CORS(app) # lets other programs consume app
    app.debug = True
    app.run()
" >> "$PY/app.py"

# create .gitignore
echo -e "${BLUE}Creating $DIR/.gitignore"
echo ".idea/
*/__pycache__
.vscode
*/sandbox.*
*/*.log
*/**/__pycache*
err.log
*/*.diff" >> $DIR"/.gitignore"

# create install requirements
echo -e "${BLUE}Creating $DIR/requirements.txt"
echo "dnspython==2.0.0
Flask==1.1.2
Flask-Cors==3.0.9
gunicorn==20.0.4
pymongo==3.11.0" >> $DIR"/requirements.txt"

# create subdirectories
SUB_DIR=("api" "repository" "exception" "service" "test" "util")
for E in ${SUB_DIR[*]}; do
    echo -e "${BLUE}Creating $PY"/"$E" && mkdir $PY"/"$E   
done

# database cradentials
echo -e "${BLUE}Creating $PY/repository/database.py"
echo "
DATABASE = 'ENTER DB NAME HERE'
HOST = 'ENTER HOST HERE'
PORT = 'ENTER PORT HERE' # enter as an int value
URI = 'ENTER DB URI HERE'
" >> $PY"/repository/database.py"

# create unit tests
echo -e "${BLUE}Creating $PY/test/tests.py"
echo "
import unittest


# TODO: write unit tests
class MyTestCase(unittest.TestCase):
    def test_something(self):
        pass


if __name__ == '__main__':
    unittest.main()
">>$PY"/test/tests.py"

# create error logging file
echo "import logging

logging.basicConfig(level=logging.DEBUG, filename='err.log')
logger = logging.getLogger()
logger.addHandler(logging.StreamHandler())


def log(exception):
    ex_name = type(exception).__name__
    message = f'{ex_name}: {exception}'
    logger.error(message)
" >>$PY"/util/logger.py"


echo "from flask import Blueprint
from util.logger import log

advice = Blueprint('advice', __name__)


# error advice
@advice.app_errorhandler(Exception)
def handle_general_error(e: Exception):
    log(e)
    message = str(e)
    return {f'{type(e).__name__}': message}, 400
" >>$PY"/util/error_advice.py"

# getting started
echo -e "${YELLOW}Prerequisites:
$ cd $DIR
$ pip install -r requirements.txt
$ python3 app.py"
echo -e "${GREEN}DONE! Happy devloping :)"