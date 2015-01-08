{ReadKey.PAS}

{Sample code for the ReadKey function.}

{ For Windows: }
{ uses WinCrt; }

uses Crt;

var
 C: Char;

begin
 Writeln('appuie sur une touche et voit la magie de Harryboy');
 writeln;
 repeat
 C := Readkey;
 writeln('je peux sentir la pression de tes doigts et je sais que...');
 writeln;
 Writeln(' tu viens de presser la touche ', C, ', dont le code ASCII est ', Ord(C), '.');
 until C='h';
 readln;
 clrscr;
 end.


