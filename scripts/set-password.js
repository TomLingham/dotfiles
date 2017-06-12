const keytar = require('keytar')
const prompt = require('prompt')


const schema = {
  properties: {
    username: {
      required: true,
    },
    password: {
      hidden: true,
    }
  }
}

prompt.start()

prompt.get(schema, function (err, { username, password }) {
  console.log(err, username, password);

  keytar.setPassword(passid, username, password)
    .then(console.log)
})


