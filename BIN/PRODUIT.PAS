program produit_par_somme;
uses crt;
var  y,i,s,n:word;
begin
   clrscr;
   repeat
      writeln('entrez un entier strictement positif');
      readln(y);
   until(y>0);
       i:=1;
       s:=1;
     while(i<=y)do
     begin
       repeat
         writeln('entre un entier strictement positif');
         readln(n);
       until(n>0);
       s:=s*n;
       i:=i+1;
       end;

      writeln('le produit des entiers courant est:',s);

      readln;
end.



