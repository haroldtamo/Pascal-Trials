program pair_impair;
label 1;
var a:longint;
begin
   1:  repeat
     writeln('entrez une autre valeur entiere');

     readln(a);
     until (a>0);
     if odd(a) then
     begin
     writeln('ce nombre est impair ');
     end
     else
     writeln('ce nombre est pair');
     goto 1

     ;readln;
end.