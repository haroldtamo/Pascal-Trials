program test;
uses crt;
var s,s1,s2:string;e,I,I1,I2,c,code:integer;d:char;
begin
writeln('effectuer l''addition');
e:=1;
{repeat
d:=readkey;
write(d);
if d<>'+' then s[e]:=d;
inc(e);
until d='+';}
readln(s1);
d:=readkey;
if d='+' then readln(s2);
val(s1,I1,code);
val(s2,I2,code);
if code=0 then
begin

write('somme',I1+I2);
end
else write('erreur a la ligne ',code);
readln;
end.