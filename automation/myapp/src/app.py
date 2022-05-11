
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

