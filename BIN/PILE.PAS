program pile;
uses crt;
type tpile=^pilec;
     pilec=record
           entier:integer;
           suiv:tpile;
           end;
var p,s,a:tpile;
    b:pilec;
    n,i,e:integer;
procedure empiler(var s:tpile);
var q:tpile;
begin
    writeln('entrez l''entier');
    new(q);
    readln(q^.entier);
    q^.suiv:=nil;
    s^.suiv:=q;
    s:=q;
end;
procedure emppiler(var p:tpile;e:integer);
var j,i:tpile;
begin
i:=p;
while i<>nil do i:=i^.suiv;
new(j);
j^.entier:=e;
j^.suiv:=nil;
i^.suiv:=j;
i:=j;
end;
begin
    clrscr;
    repeat
       inc(i);
       writeln('entrez un elt');
       readln(e);
       emppiler(p,e);
       {if n=0 then
         p:=s;
       inc(n);}
    until i=5;
    a:=p;
    i:=0;
    repeat
        inc(i);
        writeln('le ',i,'Šme element est',a^.entier);
        a:=a^.suiv;
    until i=5;
    readln
end.
