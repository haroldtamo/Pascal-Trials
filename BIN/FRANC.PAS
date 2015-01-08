program moyenne;
const m=10;
type etudiant=record
           nom:string;
           moyenne:real;
       end;
type tab=array[1..m] of etudiant;
var b,i,n:integer;som,moy,note:real;
    t:tab;
begin
      writeln('entre le nombre d  etudiants');
      repeat
       readln(b);
      until(b>0) and (b<=m);
      for i:=1 to b do
          begin
            writeln('entre le nom de l etudiant ');

          with t[i]  do
            begin
              readln(nom);
              n:=0;  som:=0;
              writeln('entre les note de ' ,t[i].nom );
                 repeat
                  readln(note);
                    if note>=0 then
                       begin
                          n:=n+1;
                         som:=som+note;
                       end;
                  until(note<0);
           if n<>0 then
                begin
                 moy:=som/n;
     t[i].moyenne:=moy;
      end
      else
      begin
      t[i].moyenne:=0;
      end;
      end;
      end;
      write('nom');
      writeln('          moyenne');
      for i:=1 to b do
      begin
      with t[i]  do
      begin
      write(nom);
      if t[i].moyenne<>0 then
      begin
      writeln(t[i].moyenne);
      end
      else
      BEGIN
      writeln('             *');
      end;
      END;
      end;
      readln;
      end.



