program first;
uses crt;
const N=100;
type enreg= record
        occ:integer;
        diviseur:longint;
        end;

    tab= array [1..N]  of enreg;

var i,stock,b,a,gardindice,q,r:longint; t:tab;

begin
      for i:=1 to N do
       begin
       t[i].occ:=1;
       t[i].diviseur:=0;
      end;
       writeln('entrez le nombre a decomposer');
      repeat
        readln(a);
      until a>0;
       stock:=a;b:=2; i:=1;
       repeat
        q:= a div b;
        r:=a mod b;
          if r <>0 then b:=b+1;
          if r=0 then
            begin
            if t[i].diviseur=b then
             begin
               t[i].occ:=t[i].occ+1;
               t[i].diviseur:=b;
            end;
            if t[i].diviseur<>b then
              begin
              if t[i].diviseur=0 then t[i].diviseur:=b;
              if t[i].diviseur<>0 then
              begin
              t[i+1].diviseur:=b;
              i:=i+1;
            end;
         end;
         end;
         if b> (stock div 2) then t[i].diviseur:=b;
         a:=q;
         until b> (stock div 2);
         gardindice:=i;
        i:=1;
        repeat
          if t[i].occ>1  then write(t[i].diviseur,'^',t[i].occ,'*');
          if t[i].occ<=1 then write(t[i].diviseur,'*');
          i:=i+1;
        until  i=gardindice;
readln;
end.


