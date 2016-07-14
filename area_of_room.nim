import
  strutils

type Answer = enum aYes, aNo

const conversion_value = 3.2808
var units = "feet"

proc ask_yes_no(question: string): Answer =
  echo(question, " (y/n)")
  while true:
    case readLine(stdin)
    of "y", "Y", "yes", "Yes":
      return Answer.aYes  # Enums can be qualified
    of "n", "N", "no", "No":
      return Answer.aNo
    else: echo("Please be clear: yes or no")

proc ask_question(question: string): int =
  var anwser = ""
  while true:
    echo question
    anwser = readLine(stdin)
    if anwser != "":
      try:
        return parseInt(anwser)
      except ValueError:
        echo "Input a valid int not crap"

proc calculate_area(lenght, width: int): int =
  lenght * width

proc convert_to_meters(input: int): float =
  return float(input) / conversion_value

proc convert_to_feet(input: int): float =
  return float(input) * conversion_value

case ask_yes_no("Use meters? if no we use feet")
of aYes:
  units = "meters"
of aNo:
  discard

let lenght = ask_question("What is the length of the room in $#?: " % units)
let width = ask_question("What is the width of the room in $#?: " % units)


let area = calculate_area(lenght, width)

echo "You enter dimensions of $1 $3 by $2 $3." % [$lenght, $width, units]
echo "Area in $# $#" % [units, $area]

case units
of "meters":
  echo "Area in feet $#" % [formatFloat(convert_to_feet(area), precision=4)]
of "feet":
  echo "Area in meters $#" % [formatFloat(convert_to_meters(area), precision=4)]
else:
  discard
