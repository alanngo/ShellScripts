
echo "
const RED = '\x1b[31m'
const GREEN = '\x1b[32m'
const YELLOW = '\x1b[33m'
const BLUE = '\x1b[34m'
const WHITE = '\x1b[37m'

// DO NOT EXPORT
const LOG = (arg, color, type) => console.log(color+''+type+''+new Date().toLocaleString()+WHITE+':'+color, arg)

const out = (arg) => LOG(arg, WHITE, 'LOG')
const debug = (arg) => LOG(arg, GREEN, 'DEBUG')
const info = (arg) => LOG(arg, BLUE, 'INFO')
const warn = (arg) => LOG(arg, YELLOW, 'WARNING')
const err = (arg) => LOG(arg, RED, 'ERROR')
export default {out, debug, info, warn, err}" >> "log.js"


echo "DONE"