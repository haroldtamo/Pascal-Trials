program pgcd;
label 1
;var a,c,b,d,r,q,i:longint;
begin
1:repeat
writeln('entrez deux entiers');
readln(a,b);
until (a>0)and(b>0);
if a<b then
begin
d:=a;
a:=b;
b:=d;
end;
i:=1;
repeat
q:=a div b;
r:=a mod b;
a:=b;

b:=r;
until(r=0);
writeln('le pgcd est:',a);
writeln('pour continuer tapez 1');
readln(c);
if c=1 then
begin
goto 1
end
else
begin
writeln('goodbye');
end;
readln;
end.