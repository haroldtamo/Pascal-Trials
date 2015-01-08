program moyelev2;
uses crt;
type  etudiant=record
               nom:string;
               moyenne:real;
               end;
      tab= ARRAY[1..10] OF etudiant;
var t:tab;s,b,c:real;i,a,j:integer;
begin
clrscr;
      repeat
            writeln('entrez le nombre d ‚tudiants');
            readln(a);
      until (a>0) and (a<10);
      i:=1;
      while i<=a do
          begin
               writeln('entrez le nom de l etudiant ',i);
               with t[i] do
               begin
                    readln(nom);
               end;
               writeln('entrez les notes de l''eleve ', t[i].nom,' et arretez avec un nombre n‚gatif');
               s:=0;j:=0;
               repeat
                    readln(b);
                    if b>=0 then
                        begin
                            s:=s+b;j:=j+1;
                        end;
               until(b<0);
               if j<>0 then
                  begin
                      with t[i] do
                           begin
                                c:=s/j;
                                moyenne:=(c);
                           end;
                           end
                  else
                      begin
                           with t[i] do
                           begin
                          moyenne:=0;
                          end;
                       end;
     i:=i+1;
 end;


 write('nom');
 writeln('         moyenne');
 writeln;
 i:=1;
 while i<=a do
 begin
 with t[i] do
 begin
 write(nom);
 if moyenne<>0 then
 begin
 writeln('         ',moyenne);
 end
 else
 begin
 writeln('         *');
 end;
 end;
 i:=i+1;
 end;
 readln;
 end.

