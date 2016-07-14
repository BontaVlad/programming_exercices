import
  strutils

proc ask_question(question: string): int =
  echo question
  parseInt(readLine(stdin))

let first = ask_question("What is the first number")
let second = ask_question("What is the second number")

echo("\n")
echo("$1 + $2 = $3\n" % [$first, $second, $(first + second)],
     "$1 - $2 = $3\n" % [$first, $second, $(first - second)],
     "$1 * $2 = $3\n" % [$first, $second, $(first * second)],
     "$1 / $2 = $3\n" % [$first, $second, $(first / second)])
