import
  strutils,
  math


proc ask_question(question: string): int =
  var anwser: string = ""
  while true:
    echo question
    anwser = readLine(stdin)
    try:
      return parseInt(anwser)
    except ValueError:
      echo "Please make sure you input a valid number"

let n_people = ask_question("How many people do you have?")
let n_pizzas = ask_question("How many pizzas do you have?")
let slices = splitDecimal(n_people / n_pizzas)


echo "$# people with $# $#" % [$n_people, $n_pizzas, if n_pizzas > 1: "pizzas" else: "pizza"]
echo "Each person gets $1 slice$2 of pizza$2" % [$slices.intpart, if slices.intpart > 1: "s" else: ""]
echo "There are $# leftovers" % [if slices.floatpart > 0: $slices.floatpart else: "no"]
