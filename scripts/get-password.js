const keytar = require('keytar')

module.exports = () => keytar
  .getPassword(passid, whoami)

if (require.main === module) {
  module.exports()
    .then(console.log)
    .catch(x => (console.error(x), process.exit(1)))
}