const keytar = require("keytar");

module.exports = (service, username) => keytar.getPassword(service, username);

if (require.main === module) {
  if (!args[0] || !args[1]) {
    console.log("Must provide service and username.");
    process.exit(1);
  }
  module
    .exports(args[0], args[1])
    .then(console.log)
    .catch(x => (console.error("Unable to get password", x), process.exit(1)));
}
