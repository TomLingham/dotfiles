const jiraConnect = require('./jira-connect')

const typeMap = {
  Bug: 'fix',
}

module.exports = async (issueId) => {
  const jira = await jiraConnect()

  const issue = await jira.findIssue(issueId, '', ['summary', 'issuetype'])
  const fields = issue.fields

  return `${typeMap[fields.issuetype.name] || 'feature'}/${issueId}-${_.kebabCase(fields.summary)}`
}


if (require.main === module) {
  module.exports(args[0])
    .then(console.log)
    .catch(x => (console.error(x), process.exit(1)))
}
