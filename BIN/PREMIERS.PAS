program premiers;
uses crt;
type tab=array[1..100] of longint;
var t:tab; p,a,s,q,i,r:longint;
begin
writeln('entrez le nombre a d‚composer');
i:=1;
repeat
readln(a);
until (a>0);
while i<=a do
begin
q:=a div i;
r:=a mod i;
if r<>0 then i:=i+1;
if r=0 then
begin
a:=q;
t[i] :=i;
i:=i+1;
end;
end;
p:=i;i:=1;
repeat
s:=1;

if t[i]=t[i+1] then
begin
s:=s+1;
i:=i+1;
write(t[i],'^',s,'*');
end;
if t[i]<>t[i+1]  then write(t[i],'*');
i:=i+1;
until i>p;
readln;
end.

