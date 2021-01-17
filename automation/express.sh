RED='\u001b[31m'
GREEN='\u001b[32m'
BLUE='\u001b[34m'
YELLOW='\u001b[33m'
WHITE='\u001b[37m'

if [ -z $1 ]; then
    echo -e "${RED}Specify a project name!"
    echo -e "${BLUE}Usage: $ bash express.sh <PROJ NAME>"
    exit
fi
mkdir ${1}
mkdir ${1}'/src'

echo '{
  "name"': '"'${1}'"'',
  "version": "1.0.0",
  "description": "",
  "main": "index.js",
  "type":"module",
  "scripts": {
    "test": "echo \"Error: no test specified\" && exit 1",
    "start": "nodemon src/index.js"
  },
  "author": "",
  "license": "ISC",
  "devDependencies": {
    "nodemon": "^2.0.6"
  },
  "dependencies": {
    "cors": "^2.8.5",
    "express": "^4.17.1"
  }
}'>> ${1}'/package.json'

echo 'import express from "express"
import cors from "cors"
const PORT = process.env.PORT||3200
const APP = express()

// set up body parser
const BODY_PARSER ={ extended: true }
APP.use(cors()) 
APP.use(express.json(BODY_PARSER))
APP.use(express.urlencoded(BODY_PARSER))

APP.get(`/`, (req, res) => 
{
    res.json({mssg: "spongebob is the best cartoon ever"})
})

APP.listen(PORT, () => console.log(`http://localhost:${PORT}`))' >>${1}'/src/index.js'

sudo npm install --prefix $1 

echo -e ${GREEN}"To run your express app, run the following commands."
echo -e ${GREEN} "1. $ cd $1"
echo -e ${GREEN} "2. $ npm install && npm start"
echo -e ${GREEN}"If you are having problems w/ running your app, use $ pkill -9 node && npm start"