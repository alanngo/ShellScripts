RED='\u001b[31m'
GREEN='\u001b[32m'
BLUE='\u001b[34m'
YELLOW='\u001b[33m'
WHITE='\u001b[37m'


# get name of app
echo "Enter the name of your MERN app: "
read APP
PROJ="${APP,,}"

# build directories
mkdir $PROJ
SERVER=$PROJ"/server"
CLIENT=$PROJ"/client"
mkdir $SERVER 
mkdir $SERVER"/src"

# backend 
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
    "express": "^4.17.1",
    "heroku": "^7.52.0"
  }
}
'>> $SERVER"/package.json"

echo '
import express from "express"
import cors from "cors"
import MongoClient from "mongodb"
const PORT = process.env.PORT || 3200
const APP = express()

// set up body parser
const BODY_PARSER ={ extended: true }
APP.use(express.json(BODY_PARSER))
APP.use(express.urlencoded(BODY_PARSER))

APP.use(cors()) // cross origin

const MONGO_URL=`` // insert mongo url here
const DB_NAME = "" // insert db url here
const COLLECTION_NAME="" // collection name goes here
const OPTIONS =  {useUnifiedTopology: true }

MongoClient.connect(MONGO_URL, OPTIONS).then(client => 
{
    // set up connection
    const DB = client.db(DB_NAME)
    const COLLECTION = DB.collection(COLLECTION_NAME)
    console.log("successfully connected to mongodb")
    
    // routes go here
    APP.get(`/`, (req, res) => 
    {
        res.json({mssg: "spongebob is the best cartoon ever"})
    })
    
}).catch((err) => console.log(err));

APP.listen(PORT, () => console.log(`http://localhost:${PORT}`))' >>$SERVER'/src/index.js'

echo "web: npm run start">>$SERVER'/Procfile'

echo "
node_modules
*.log
package-lock.json
" >> $SERVER"/.gitignore"
echo "$SERVER" >> $SERVER"/README.md"

echo -e "${GREEN}successfully created backend"
echo -e ${YELLOW}"WARNING: make sure you have node 12 or above!⚠️"
echo -e ${YELLOW}"To check, run '$ node -v'"
echo -e ${WHITE}"To run your express app, run the following commands."
echo -e ${WHITE} "1. $ cd $SERVER"
echo -e ${WHITE} "2. $ npm install && npm run dev"
echo -e ${WHITE}"If you are having problems w/ running your app, use $ pkill -9 node && npm start"


# frontend
create-react-app $CLIENT
echo "yay done😃"