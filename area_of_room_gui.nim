#TODO finish gui

import
  ui,
  strutils


const conversion_value = 3.2808

var mainwin*: ptr Window

proc onClosing*(w: ptr Window; data: pointer): cint {.cdecl.} =
  controlDestroy(mainwin)
  ui.quit()
  return 0


proc main*() =
  var o: ui.InitOptions
  var err: cstring
  var box: ptr Box
  var hbox: ptr Box
  var group: ptr Group
  var length_entry: ptr Entry
  var length_label: ptr Label
  var width_entry: ptr Entry
  var width_label: ptr Label


  err = ui.init(addr(o))
  if err != nil:
    echo "error initializing ui: ", err
    freeInitError(err)
    return

  mainwin = newWindow("Area of room", 500, 100, 1)
  windowSetMargined(mainwin, 1)
  windowOnClosing(mainwin, onClosing, nil)

  box = newVerticalBox()
  boxSetPadded(box, 1)
  windowSetChild(mainwin, box)
  hbox = newHorizontalBox()
  boxSetPadded(hbox, 1)
  boxAppend(box, hbox, 1)
  group = newGroup("Room dimensions")
  groupSetMargined(group, 1)
  boxAppend(hbox, group, 0)

  length_entry = newEntry()
  length_label = newLabel("Length of the room in feet")

  width_entry = newEntry()
  width_label = newLabel("Width of the room in feet")
  # entrySetText(entry, "Entry")
  # entryOnChanged(entry, onEntryChanged, nil)
  boxAppend(box, length_label, 0)
  boxAppend(box, length_entry, 0)
  boxAppend(box, width_label, 0)
  boxAppend(box, width_entry, 0)
  boxAppend(box, newHorizontalSeparator(), 0)

  controlShow(mainwin)
  ui.main()
  ui.uninit()

main()
