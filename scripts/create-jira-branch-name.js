const _ = require('lodash')
const jiraConnect = require('./jira-connect')
const sanitizeTicket = require('./sanitize-ticket-id')

const typeMap = {
  Bug: 'fix',
}

module.exports = async (issueId) => {
  const jira = await jiraConnect()

  const issue = await jira.findIssue(issueId, '', ['summary', 'issuetype'])
  const fields = issue.fields

  return `${typeMap[fields.issuetype.name] || 'feature'}/${issueId}-${_.kebabCase(_.truncate(fields.summary, { length: 60, omission: '' }))}`
}


if (require.main === module) {
  module.exports(sanitizeTicket(args[0]))
    .then(console.log)
    .catch(x => (console.error(x), process.exit(1)))
}
