module.exports = function(candidate) {
  const ticketRegExp = new RegExp("^[A-Z]{3}-[0-9]+$", "i");

  if (ticketRegExp.test(candidate)) return candidate.toUpperCase();

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
