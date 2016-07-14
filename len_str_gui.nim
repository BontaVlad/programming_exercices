import ui

var mainwin*: ptr Window

var label: ptr Label

proc onClosing*(w: ptr Window; data: pointer): cint {.cdecl.} =
  controlDestroy(mainwin)
  ui.quit()
  return 0

proc onEntryChanged*(entry: ptr Entry; data: pointer) {.cdecl.} =
  var value = entryText(entry)
  labelSetText(label, $value.len)


proc main*() =
  var o: ui.InitOptions
  var err: cstring
  var box: ptr Box
  var hbox: ptr Box
  var group: ptr Group
  var entry: ptr Entry


  err = ui.init(addr(o))
  if err != nil:
    echo "error initializing ui: ", err
    freeInitError(err)
    return

  mainwin = newWindow("Lenght of string", 500, 100, 1)
  windowSetMargined(mainwin, 1)
  windowOnClosing(mainwin, onClosing, nil)

  box = newVerticalBox()
  boxSetPadded(box, 1)
  windowSetChild(mainwin, box)
  hbox = newHorizontalBox()
  boxSetPadded(hbox, 1)
  boxAppend(box, hbox, 1)
  group = newGroup("Lenth of given string")
  groupSetMargined(group, 1)
  boxAppend(hbox, group, 0)

  entry = newEntry()
  label = newLabel("")
  entrySetText(entry, "Entry")
  entryOnChanged(entry, onEntryChanged, nil)
  boxAppend(box, entry, 1)
  boxAppend(box, newHorizontalSeparator(), 0)
  boxAppend(box, label, 0)


  controlShow(mainwin)
  ui.main()
  ui.uninit()

main()
