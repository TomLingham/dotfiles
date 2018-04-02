const keytar = require("keytar");
const prompt = require("prompt");

const schema = {
  properties: {
    username: {
      required: true
    },
    password: {
      hidden: true
    }
  }
};

if (!args[0]) {
  console.error("Must provide service identifier. (e.g. jira)");
  process.exit();
}

const SERVICE_NAME = args[0];

console.log(`Storing credentials for service: ${SERVICE_NAME}`);

prompt.start();

prompt.get(schema, function(err, { username, password }) {
  keytar
    .setPassword(SERVICE_NAME, username, password)
    .then(() => console.log(`Credentials set successfully!`))
    .catch(console.error);
});
