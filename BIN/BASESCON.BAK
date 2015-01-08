program base2;
uses crt;
label 1,2;
type tab=ARRAY[1..100] OF INTEGER;
var t:tab;a,b,q,r,i,d:integer; e:string;
begin
2: clrscr;
repeat
writeln('entrez la base dans laquelle vous voulez travailler entre 2 et 10');
 readln(b);
until((b>=2) and (b<=10));
repeat
writeln('entrez le nombre entier a convertir dans cette base');
readln(a);
d:=a;
until(a>0);
i:=1;
repeat
q:=a div b;
r:= a mod b;
t[i] := r;
i:=i+1;
a:=q;
until(a<b);
if a=0 then
begin
goto 1;
end;
write( d   ,  '='  );
write(a);
1:  i:=i-1;
while i>=1 do
begin
write(  t[i]);
i:=i-1;
end;

writeln(  'en cette base');
writeln('tapez H pour arreter');
readln(e);
if e='H' then
begin
write('goodbye');
end
else
begin
goto 2;
end;
readln;
end.



