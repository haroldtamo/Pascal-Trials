program facto;
uses crt;
type tab=array [1..100] of longint;
var t:tab;a,stock,decompte,q,b,r,i,j:longint;
begin
writeln('entrez le nombre a decomposer');
repeat
readln(a);
until a>0;
i:=2;stock:=a; j:=1;
repeat
q:=a div i;
r:= a mod i;
if r=0 then
begin
t[j]:=i;
a:=q;
j:=j+1;
end;
if r<>0 then i:=i+1;
until i>(stock div 2);
b:=j;j:=1; decompte:=1;
repeat
decompte:=1;
repeat
if t[j]=t[j+1] then
begin
decompte:=decompte+1;
j:=j+1;
end;
until t[j]<>t[j+1];
if decompte=1 then write (t[j],'*');
if decompte>1 then write (t[j],'E',decompte,'*');
until  j=b;
readln;
end.
