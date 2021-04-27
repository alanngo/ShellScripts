function es6()
{
    echo "
import fs from 'fs'

// fatal 
const BG_RED='\x1b[41m'
const BLACK= '\x1b[30m'

// error
const RED = '\x1b[31m'

// warning
const YELLOW = '\x1b[33m'

// info
const BLUE = '\x1b[34m'

// debug
const GREEN = '\x1b[32m'

// other
const WHITE = '\x1b[37m'
const BG_BLACK='\x1b[40m'

// DO NOT EXPORT
const LOG = (arg, color, type) => 
{
    const PREFIX=type+' '+new Date().toLocaleString()
    fs.appendFile('debug.log', PREFIX+' '+arg+'\n', (err)=>
    {
        if (err) throw err
        console.log(color+' ' +PREFIX+WHITE+':'+color, arg, BG_BLACK+WHITE)
    })
}

const debug = (arg) => LOG(arg, GREEN, 'DEBUG')
const info = (arg) => LOG(arg, BLUE, 'INFO')
const warn = (arg) => LOG(arg, YELLOW, 'WARNING')
const err = (arg) => LOG(arg, RED, 'ERROR')
const fatal = (arg) => LOG(arg, BG_RED+BLACK, 'FATAL')


export default {debug, info, warn, err, fatal}
" >> "log.js"
}

function commonjs()
{
    echo "
const fs = require('fs')

// fatal 
const BG_RED='\x1b[41m'
const BLACK= '\x1b[30m'

// error
const RED = '\x1b[31m'

// warning
const YELLOW = '\x1b[33m'

// info
const BLUE = '\x1b[34m'

// debug
const GREEN = '\x1b[32m'

// other
const WHITE = '\x1b[37m'
const BG_BLACK='\x1b[40m'

// DO NOT EXPORT
const LOG = (arg, color, type) => 
{
    const PREFIX=type+' '+new Date().toLocaleString()
    fs.appendFile('debug.log', PREFIX+' '+arg+'\n', (err)=>
    {
        if (err) throw err
        console.log(color+' ' +PREFIX+WHITE+':'+color, arg, BG_BLACK+WHITE)
    })
}

const debug = (arg) => LOG(arg, GREEN, 'DEBUG')
const info = (arg) => LOG(arg, BLUE, 'INFO')
const warn = (arg) => LOG(arg, YELLOW, 'WARNING')
const err = (arg) => LOG(arg, RED, 'ERROR')
const fatal = (arg) => LOG(arg, BG_RED+BLACK, 'FATAL')

module.exports = {debug, info, warn, err, fatal}" >> "log.js"
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