const getPassword = require("./get-password");
const Jira = require("jira-client");

module.exports = () =>
  getPassword().then(password => {
    return new Jira({
      protocol: "https",
      host:
        process.env.JIRA_HOST ||
        (console.error("Jira host not set"), process.exit(1)),
      username: whoami,
      password: password,
      apiVersion: "2",
      strictSSL: false
    });
  });
