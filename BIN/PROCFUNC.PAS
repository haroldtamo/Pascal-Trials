program utile;
uses crt;
const N=12;
type vecteur= ARRAY[1..N] OF INTEGER;
var x,y,z:integer; c:boolean;
procedure obtenir_param(var a,b,c:integer);
begin
writeln('entrez 3 valeurs');
readln(a,b,c);
end;
function verif(a,b,c:integer): boolean;
begin
if (a>0) and (b>0) and (c>0) then
begin
verif:= true;
end
else
begin
verif:= false;
end;
end;
procedure do_som(a,b,c:integer);
var som:integer;
begin
som:=a+b+c;
writeln( a,' + ',b,' + ',c,' = ',som);
end;
   begin
obtenir_param(x,y,z);
c:=verif(x,y,z);
if c=true then
begin
do_som(x,y,z);
end
else
begin
write('l''un des nombre est n�gatif conard');
end;
   readln;
   end.