program permutation;
uses crt;
label 1;
var a,b,c:integer;
begin
    clrscr;
    writeln('entrez 3 entiers');
    1: readln(a,b,c);
    if a or b or c>=0 then
      begin
          a:=a+b+c;
          c:=a-c-b;
          b:=a-c-b;
          a:=a-c-b;
          writeln('le nouvel ordre est ',a,';',b,';',c);
          readln;
      end
    else
      begin
          writeln('donne moi 3 entiers');
          goto 1
      end;
end.
