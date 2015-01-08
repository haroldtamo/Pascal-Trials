program couples;
uses crt;
var a,b,x,i,c:integer;
begin
clrscr;
    repeat
    writeln('entrez un nombre strictement positif');
    readln(x);
    until(x>0);



    i:=1;
    while(i<=x) do
    begin
    repeat
    writeln('entrez deux valeurs entieres');
    readln(a,b);
    until(a>=0) and (b>=0);
    c:=0;
    while a>0 do
    begin
    c:=c+b;
    a:=a-1;

    end;
    writeln('le produit de ces deux nombres est:', c);
    i:=i+1;
   end;
   readln;
   end.
