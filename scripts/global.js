// Remove the first two args (node path and filename)
// and set to args - I'll use this a lot
global.args = process.argv.slice(2);


// We need the pwd a fair bit
global.pwd = process.env.PWD;

