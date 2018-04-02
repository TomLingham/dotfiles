module.exports = function(candidate) {
  const ticketRegExp = new RegExp("^GST-[0-9]+$", "i");
  const numberOnlyRegExp = new RegExp("^[0-9]+$");

  if (ticketRegExp.test(candidate)) return candidate.toUpperCase();

  if (numberOnlyRegExp.test(candidate)) return `GST-${candidate}`;

  // Alright, you must really be a gumby...
  const saveMyButtRegExp = new RegExp("([0-9]{4})$");
  let matches;
  if ((matches = candidate.match(saveMyButtRegExp))) return `GST-${matches[1]}`;

  throw new Error("Ticket ID is invalid");
};

if (require.main === module) {
  try {
    console.log(module.exports(args[0] || ""));
  } catch (e) {
    console.error(e.message);
    process.exit(1);
  }
}
