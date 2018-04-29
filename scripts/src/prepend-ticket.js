const fs = require("fs");

const ticketRegex = new RegExp("([A-Z]{3}-[0-9]+)");

const commitMsgPath = `${pwd}/${args[0]}`;
const branchName = args[2];
const prevCommitMsg = fs.readFileSync(commitMsgPath).toString();

const getTicketId = str => str.match(ticketRegex)[1].toUpperCase();

if (!ticketRegex.test(branchName)) {
  // Exit silently as there is no ticket in our branch name
  // so I am probably just hacking
  process.exit(0);
}

fs.writeFileSync(commitMsgPath, `${getTicketId(args[2])}: ${prevCommitMsg}`);
