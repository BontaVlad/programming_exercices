import
  strutils,
  math,
  sequtils

const TAX_PER = 5.5 / 100

type
  Product = tuple
    quantity: int
    price: float
  Answer = enum aYes, aNo
  Checkout = tuple
    brut: float
    tax: float
    total: float


proc ask_question(question: string): string =
  var answer = ""
  echo question
  while true:
    answer = readLine(stdin)
    if answer != "":
      return answer
    echo question

proc ask_for_confirmation(question: string): Answer =
  echo(question, "[y]/n")
  while true:
    case readLine(stdin)
    of "y", "Y", "Yes":
      return Answer.aYes
    of "n", "N", "No":
      return Answer.aNo
    of "":
      return Answer.aYes
    else: echo "Please be clear: yes or no"

proc ask_for_int(question: string): int =
  while true:
    try:
      return parseInt(ask_question(question))
    except ValueError:
      echo "Please give a valid int"

proc ask_for_float(question: string): float =
  while true:
    try:
      return parseFloat(ask_question(question))
    except ValueError:
      echo "Please give a valid int"

proc ask_for_products(): seq[Product] =
  var products: seq[Product] = @[]

  while ask_for_confirmation("Add products? ") == Answer.aYes:
    var product: Product
    product.quantity = ask_for_int("Product quantity")
    product.price = ask_for_float("Product price")
    echo $product
    products.add(product)
  return products

proc checkout(products: seq): Checkout =
  var res: Checkout

  for product in products:
    res.brut += product.price * float(product.quantity)

  res.tax = res.brut * TAX_PER
  res.total = res.brut + res.tax
  return res

proc main() {.discardable.} =
  echo "Please chose youre products"
  let products = ask_for_products()
  let res = checkout(products)
  echo("Subtotal ", $res.brut)
  echo("Tax ", $res.tax)
  echo("Total ", $res.total)

when isMainModule:
  main()
