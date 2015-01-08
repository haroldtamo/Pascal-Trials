program moyeleve;
uses crt;
const N=2;M=2;
type tab=ARRAY[1..N] OF string;
     tabi=ARRAY[1..M] OF real;
     var t:tab;A:tabi;i,j:integer;b,s:real;
begin
 clrscr;

for i:=1 to N do
begin
writeln('entrez le nom de l eleve');
readln(t[i]);
writeln('entre les notes de: ',t[i]);
s:=0;j:=0;
repeat
readln(b);
if b>=0 then
begin
s:=s+b;
end;
until (b<0);
A[i]:=s/M;
end;
write('nom');
writeln('       moyenne');
for i := 1 to N do
begin
write(t[i]);
 if A[i]=0 then
begin
writeln('          *');
end
else
begin
writeln('       ',A[i]:0:2);
end;
end;
readln;
end.