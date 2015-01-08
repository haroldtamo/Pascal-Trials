uses Crt;

var
  X, Y: Byte;
begin
  TextBackground(Black);   { Clear screen }
  ClrScr;
  repeat
    X := Succ(Random(80));   { Draw random windows }
    Y := Succ(Random(25));
    Window(X, Y, X + Random(10), Y + Random(8));
    writeln('HARRYBOY');
    TextBackground(Random(16));   { In random colors }

  until KeyPressed;

end.

