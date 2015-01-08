program concatenation;
uses crt;
var s,c,d,h,g:string;
begin
clrscr;
s:='harold est le plus fort c vrai?';
c:=copy(s,8,20);
writeln(c);
d:='oui c lui le meilleur';
h:=concat(s,d);
g:=s+d;
writeln(g);
write(h);
readln;
end.