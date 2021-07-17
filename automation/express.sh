RED='\u001b[31m'
GREEN='\u001b[32m'
BLUE='\u001b[34m'
YELLOW='\u001b[33m'
WHITE='\u001b[37m'
PROJECT=${1:-"."}

mkdir $PROJECT
mkdir $PROJECT'/src'

echo '{
  "name": "my-project",
  "version": "1.0.0",
  "description": "sample app created with automation",
  "main": "src/index.js",
  "type": "module",
  "scripts": {
    "test": "echo \"Error: no test specified\" && exit 1",
    "start": "node src/index.js",
    "dev": "nodemon src/index.js",
    "clean": "rm -rf node_modules package-lock.json && npm install"
  },
  "author": "",
  "license": "ISC",
  "devDependencies": {
    "nodemon": "^2.0.6"
  },
  "dependencies": {
    "cors": "^2.8.5",
    "dotenv": "^10.0.0",
    "express": "^4.17.1"
  }
}
'>> $PROJECT'/package.json'

echo 'import express from "express"
import cors from "cors"
import dotenv from "dotenv"

dotenv.config()
const HOST = process.env.HOST || "localhost"
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

APP.listen(PORT, () => console.log(`http://${HOST}:${PORT}`))' >>$PROJECT'/src/index.js'

# .gitignore
echo "
node_modules
.env" >> $PROJECT"/.gitignore"
touch $PROJECT"/.env"
echo "$PROJECT" >> $PROJECT"/README.md"

echo -e ${GREEN}"To run your express app, run the following commands."
echo -e ${GREEN} "1. $ cd $PROJECT"
echo -e ${GREEN} "2. $ npm install && npm start"
echo -e ${GREEN}"If you are having problems w/ running your app, use $ pkill -9 node && npm start"