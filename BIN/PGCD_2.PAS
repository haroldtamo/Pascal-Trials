program  pgcd;
var m,n,r,x,p,po,k:word;
begin
     repeat
     writeln('DIEU EST GRAND');
     writeln('bonjour chez vous,nous esperons que vous vous portez bien');
     WRITELN('ce programme permet de calculer le pgcd et le ppcm du couple que vous entrerer');
     writeln('entre un couple dentiers strictement positif');
     readln(m,n);
     until(m>0)and(n>0);
     if(m<n)then
      begin
        x:=m;
        m:=n;
        n:=x;
     end;
     po:=m*n;
     while(n<>0)do
     begin
     r:=m mod n;
     m:=n;
     n:=r;
     end;
     p:=m;
     k:=po div p;
     writeln('le pgcd du couple est:', p ,'et son ppcm est:', k );
     readln;
end.