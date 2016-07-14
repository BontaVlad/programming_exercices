import
  strutils


const conversion_value = 3.2808

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

let lenght_feet = ask_question("What is the length of the room in feet?: ")
let width_feet = ask_question("What is the width of the room in feet?: ")

let area_feet = calculate_area(lenght_feet, width_feet)

echo "You enter dimensions of $1 feet by $2 feet." % [$lenght_feet, $width_feet]
echo "Area in feet $#" % [$area_feet]
echo "Area in meters $#" % [formatFloat(convert_to_meters(area_feet), precision=4)]
