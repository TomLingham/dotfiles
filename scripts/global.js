// Remove the first two args (node path and filename)
// and set to args - I'll use this a lot
global.args = process.argv.slice(2)

// We need the pwd a fair bit
global.pwd = process.env.PWD

// Let's put my username where I can grab it a little easier too
global.whoami = process.env.USER

// Set the key we are going to use to store
// keychain access against
global.passid = process.env.TOMLPASS

// Yea... so umm...
process.env.NODE_TLS_REJECT_UNAUTHORIZED = '0'

// We gon' use lodash everywheres
global._ = require('lodash')

global.b64e = str => Buffer.from(str, 'utf8').toString('base64')
global.b64d = str => Buffer.from(str, 'base64').toString('utf8')
