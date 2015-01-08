program ahmed(input,output);
type etudiant=record
          nom:string;
          moy:real;
        end;
const  n=10;
type vec=packed array[1..n] of etudiant;
var t:vec; i,a,b:integer; som,moy,note:real;
begin
    writeln('entre le nombre d etudiant');
    readln(a);
    for i:=1 to a do
      writeln('entre le nom de l etudiant');
       with t[i] do
         readln(nom);
          writeln('entre les notes de l etudiant',t[i].nom);
           b:=0; som:=0;
           repeat
             readln(note);
              if note