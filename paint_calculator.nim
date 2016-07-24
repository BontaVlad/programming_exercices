import
  strutils,
  math

const paint_consumption = 350    #galons

proc ask_question(question: string): int =
  var anwser = ""
  while true:
    echo question
    anwser = readLine(stdin)
    try:
      return parseInt(anwser)
    except ValueError:
      echo "Please make sure you input a valid number"


let room_width = ask_question("Room width")
let room_height = ask_question("Room height")

let room_area = room_width * room_height

let required_paint = room_area / paint_consumption

echo "You will need to purchase $# galons of paint to cover $# square feet" % [$ceil(required_paint), $room_area]
