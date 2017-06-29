const jiraConnect = require('./jira-connect')
const sanatizeTicket = require('./sanitize-ticket-id')

module.exports = async (issueId, transitionId) => {
  const jira = await jiraConnect()
  const user = await jira.getCurrentUser();

  const [{ transitions }, ] = await Promise.all([
    jira.listTransitions(issueId),
    jira.updateIssue(issueId, {
      fields: { assignee: user },
      update: {
        comment: [{
          add: { body: 'Moving to in progress! (I am a bot)' },
        }]
      },
    }),
    jira.transitionIssue(issueId, {
      transition: { id: transitionId },
    }),
  ]);

  return transitions.find(x => x.id == transitionId)
}

if (require.main === module) {
  if (args.length !== 2)
    (console.error('Incorrect arguments'), process.exit(1))

  module.exports(sanatizeTicket(args[0]), args[1])
    .then(x => x ? `Transitioning ${args[0]} to ${x.name} was successful` : 'Failed transition')
    .then(console.log)
    .catch(x => (console.error(x), process.exit(1)))
}
