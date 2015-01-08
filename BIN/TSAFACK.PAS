program toto;n
uses crt;
var a,b, i,j,x,y:integer;
begin
a:=1;b:=1;i:=0; j:=0;x:=1;y:=1;
repeat
x:=x+a;
y:=x+b;
gotoxy(x,y);
writeln('0');
     if i=0  then   x:=x+1
      if x=80 then  i:=1;
if i=1 then x:=x-1;

if j=0 then j:=j+1
if y=0 then j=1;
if j=1 then y:=y-1;
until keypressed;
end.



