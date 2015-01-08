program multi3;
uses crt;
var  i,j:integer;
begin
clrscr;
for j:=1 to 10 do
begin
for i:=1 to 10 do
write(j*i:8 );
writeln;
end;
readln;
end.