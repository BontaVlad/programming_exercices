import
  strutils,
  times

proc ask_question(question: string): int =
  echo question
  parseInt(readLine(stdin))

let current_age = ask_question("What is your current age?: ")
let would_retire = ask_question("At what age would you like to retire?: ")
let more_work = would_retire - current_age
let now = getLocalTime(getTime())

echo("You have $1 years left until you can retire" % $more_work)
echo("It's $1, so you can retire in $2" % [$now.year, $(now + more_work.years).year])
