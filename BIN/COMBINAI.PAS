program cobinaison;
label 1
;var p,n,d,f,b,g,h,c,s,e:int;

begin
     repeat

   1:  writeln('entrez deux valeurs entieres');
     readln(p,n);
     until(p>0) and  ( n>0);
       if p>n then
       begin
       d:=p;
       p:=n;
       n:=d;
       end;
       f:=1;
       g:=n;
       h:=p;
       while n>0 do
       begin
       f:=f*n;
       n:=n-1;
       end;
       b:=1;
       while p>0 do
       begin
       b:=b*p;
       p:=p-1;
       end;
       c:=1;
       s:=n-p;
       while s>0 do
       begin
       c:=c*s;
       s:=s-1;
       end;
       e:=f div (b*c);
       writeln('le nombre de facons de choisir',h,'objets pris parmi',g,'est:',e);

       writeln('pour continuer tapez 1');
       readln(c);
       if c=1 then
       begin
       goto 1
       end
       else
       writeln('goodbye');
       end.
       readln;
end.


