import
  strutils

proc ask_question(question: string): string =
  echo question
  return readLine(stdin)

var noun = ask_question("Enter a noun: ")
var verb = ask_question("Enter a verb: ")
var adjective = ask_question("Enter an adjective: ")
var adverb = ask_question("Enter an adverb: ")

echo("Do you $# your $# $# $# " % [noun, verb, adjective, adverb])
