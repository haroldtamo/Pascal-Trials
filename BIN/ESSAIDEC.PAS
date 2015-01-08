program jaitrouve;
uses crt;
var a,b,c,d,e:longint;
begin
clrscr;
     writeln('entrez dans l ordre le jour et le mois de placement et en chiffre');
     readln(a,b);
     writeln('entrez maintenant le jour  et le mois d echeance toujours en chiffre');
     readln(c,d);
     e:=d-b;
     while e>1 do
     begin
     c:=c+30;
     e:=e-1;
     end;
     c:=c+(30-a);
     writeln('le nombre de jour est de :',c);
     readln;
end.