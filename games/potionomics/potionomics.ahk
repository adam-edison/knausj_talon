#Persistent

F12::
Reload
return

#IfWinActive, Potionomics

1::
Loop 1
{
  MouseClick, left
  Sleep, 20
  MouseClick, left
}
return

q::
MouseClickDrag, left,1,1,0,-500,2,R
Sleep, 50
MouseMove, 0, 500, 2, R
return

e::
MouseMove, 3400, 1150
Sleep, 100
MouseClick, left
Sleep, 100
MouseMove, 2000, 1850
return

x::
MouseMove, 1470, 1810
Sleep, 100
MouseClick, left
Sleep, 1200
MouseMove, 320, 420
MouseClick, left
Sleep, 200
MouseMove, 1030, 1095
MouseClick, left
Sleep, 9000
MouseMove, 1908, 1750
Sleep, 100
MouseClick, left
return

4::
Loop 4
{
  MouseClick, left
  Sleep, 20
  MouseClick, left
  Sleep, 1000
}
return

#IfWinNotActive, Potionomics
return