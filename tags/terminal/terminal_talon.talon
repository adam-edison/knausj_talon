tag: terminal
-

tail talon [log] [<number>]:
    lines = number or 30
    insert('tail -f -{lines} ~/.talon/talon.log\n')