{GotoXY.PAS}

{Sample code for the GotoXY procedure.}

{ For Windows: }
{ uses WinCrt; }

uses Crt;

var
 C: PChar;i:longint;

begin
 repeat
 clrscr;
 textcolor(red);
 GotoXY(30,12);
 Writeln('tu est trop belle');
 i:=i+1;
 until(i=2345677);
 readln;
end.


