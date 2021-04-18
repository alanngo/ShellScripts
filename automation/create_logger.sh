function es6()
{
    echo "
import fs from 'fs'

const RED = '\x1b[31m'
const GREEN = '\x1b[32m'
const YELLOW = '\x1b[33m'
const BLUE = '\x1b[34m'
const WHITE = '\x1b[37m'

// DO NOT EXPORT
const LOG = (arg, color, type) => 
{
    const PREFIX=type+' '+new Date().toLocaleString()
    fs.appendFile('debug.log', PREFIX+' '+arg+'\n', (err)=>
    {
        if (err) throw err
        console.log(color+' ' +PREFIX+WHITE+':'+color, arg, WHITE)
    })
}

const out = (arg) => LOG(arg, WHITE, 'LOG')
const debug = (arg) => LOG(arg, GREEN, 'DEBUG')
const info = (arg) => LOG(arg, BLUE, 'INFO')
const warn = (arg) => LOG(arg, YELLOW, 'WARNING')
const err = (arg) => LOG(arg, RED, 'ERROR')


export default {out, debug, info, warn, err}" >> "log.js"
}

function commonjs()
{
    echo "
const fs = require('fs')

const RED = '\x1b[31m'
const GREEN = '\x1b[32m'
const YELLOW = '\x1b[33m'
const BLUE = '\x1b[34m'
const WHITE = '\x1b[37m'

// DO NOT EXPORT
const LOG = (arg, color, type) => 
{
    const PREFIX=type+' '+new Date().toLocaleString()
    fs.appendFile('debug.log', PREFIX+' '+arg+'\n', (err)=>
    {
        if (err) throw err
        console.log(color+' ' +PREFIX+WHITE+':'+color, arg, WHITE)
    })
}

const out = (arg) => LOG(arg, WHITE, 'LOG')
const debug = (arg) => LOG(arg, GREEN, 'DEBUG')
const info = (arg) => LOG(arg, BLUE, 'INFO')
const warn = (arg) => LOG(arg, YELLOW, 'WARNING')
const err = (arg) => LOG(arg, RED, 'ERROR')


module.exports = {out, debug, info, warn, err}" >> "log.js"
}

OPTION=${1:-"es6"}

if [ $OPTION == "commonjs" ]; then
    commonjs && echo "created commonjs logger"
elif [ $OPTION == "es6" ]; then
    es6 && echo "created es6 logger"
else 
    echo "USAGE: "
    echo " $ create_logger: generate js logger as es6"
    echo " $ create_logger es6: generate js logger as es6"
    echo " $ create_logger commonjs: generate js logger as commonjs"
    echo " $ create_logger help: opens help menu"
fi
echo "DONE"