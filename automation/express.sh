RED='\u001b[31m'
GREEN='\u001b[32m'
BLUE='\u001b[34m'
YELLOW='\u001b[33m'
WHITE='\u001b[37m'
PROJECT=${1:-"."}

mkdir $PROJECT
mkdir $PROJECT'/src'

function createJS()
{
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
    
    echo '
import express, { json, urlencoded } from "express"
import cors from "cors"
import dotenv from "dotenv"

dotenv.config()
const HOST = process.env.HOST || "localhost"
const PORT = process.env.PORT || 3200
const APP = express()

// set up body parser
const BODY_PARSER = { extended: true }
APP.use(cors())
APP.use(json(BODY_PARSER))
APP.use(urlencoded(BODY_PARSER))

APP.get(`/`, (req, res) => {
    res.json({ mssg: "spongebob is the best cartoon ever" })
})

APP.listen(PORT, () => console.log(`http://${HOST}:${PORT}`))
    ' >>$PROJECT'/src/index.js'
    
}

function createTS()
{
    echo 'import express, {Application, Request, Response} from "express"
import cors from "cors"
import dotenv from "dotenv"
dotenv.config()
const PORT: string | number = process.env.PORT || 3200
const HOST: string = process.env.HOST || "localhost"

const app: Application = express()

app.use(cors())
const BODY_PARSER = {extended: true}
app.use(express.json())
app.use(express.urlencoded(BODY_PARSER))

app.get("/", (req: Request, res: Response)=>{
    res.json({
        mssg: "licking doorknobs on other planets is illegal"
    })
})

app.listen(PORT, (): void => console.log(`http://${HOST}:${PORT}`))'>>$PROJECT'/src/index.ts'
    
    echo '{
  "name": "express-ts",
  "version": "1.0.0",
  "description": "",
  "main": "src/index.js",
  "scripts": {
    "test": "echo \"Error: no test specified\" && exit 1",
    "clean": "rm -rf node_modules package-lock.json && npm install",
    "dev": "ts-node-dev --respawn src/index.ts",
    "start": "tsc && node src/index.js"
  },
  "keywords": [],
  "author": "",
  "license": "ISC",
  "dependencies": {
    "cors": "^2.8.5",
    "dotenv": "^10.0.0",
    "express": "^4.17.1"
  },
  "devDependencies": {
    "@types/cors": "^2.8.12",
    "@types/express": "^4.17.13",
    "nodemon": "^2.0.15",
    "ts-node-dev": "^1.1.8"

  }
    }'>>$PROJECT'/package.json'
    tsc --init && mv -v "$PWD/tsconfig.json" "$PROJECT"
    echo "done"
}
echo "use typescript? y/n"
read USETS
if [[ $USETS == "y" || $USETS == "Y" || -z $USETS ]]; then
  createTS
else
  createJS
fi

# gitignore and instructions to start
echo "
node_modules
.env" >> $PROJECT"/.gitignore"
touch $PROJECT"/.env"
echo "$PROJECT" >> $PROJECT"/README.md"

echo -e ${GREEN}"To run your express app, run the following commands."
echo -e ${GREEN} "1. $ cd $PROJECT"
echo -e ${GREEN} "2. $ npm install && npm start"
echo -e ${GREEN}"If you are having problems w/ running your app, use $ pkill -9 node && npm start"
