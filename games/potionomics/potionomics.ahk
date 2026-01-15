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

4::
Loop 4
{
  MouseClick, left
  Sleep, 20
  MouseClick, left
  Sleep, 1000
}
return

j::
MouseMove, 100, 100, 2, R
Sleep, 500
MouseMove, -100, -100, 2, R
return

numpad4::
MouseMove, -200, 0, 2, R
return

numpad6::
MouseMove, 200, 0, 2, R
return

#IfWinNotActive, Potionomics
return