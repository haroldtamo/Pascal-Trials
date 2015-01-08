uses crt;
var s:string;decompte,somme,i,x,error:integer;c:char;
    t:array[1..100] of integer;
begin
writeln('effectuez une op‚ration');
i:=1; decompte:=1;
repeat
repeat
c:=readkey;
if c<>'+' then
begin
write(c);
s:=s+c;
end
else
begin
write(c);
end;
until c='+';
val(s,x,error);
if error=0 then
begin
t[i]:=x;
i:=i+1;
end;
until c= #13;
decompte:=i;
somme:=0;i:=1;
repeat
somme:= somme+t[i];
i:=i+1;
until i=decompte;
write(somme);
readln;
end.