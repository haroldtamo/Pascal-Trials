{LineTo.PAS}

{Sample code for the LineTo procedure.}

uses Crt, Graph;

var Gd, Gm: Integer;
begin
 Gd := Detect;
 InitGraph(Gd, Gm, ' ');
 if GraphResult <> grOk then
   Halt(1);
 Randomize;
 repeat
   LineTo(Random(200), Random(200));
 until KeyPressed;
 Readln;
 CloseGraph;
end.
