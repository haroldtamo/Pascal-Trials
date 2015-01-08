program exemple2;
uses crt,dos;
var f: text;
    nom: string;
    choix: char;
procedure lecture;
    begin
      Append(f);
      Reset(f);
      Readln(f,nom);
      writeln(nom);
    end;
begin
clrscr;
Assign(f, 'ini.txt');
rewrite(f);
write(' entrez le nom d''utilisateur: ');
readln(nom);
nom:='dernier utilisateur: '+nom;
writeln(f,nom);
close(f);
write (' voulez-vous lire le fichier init.txt? O/N?');
readln(choix);
if (choix='O') or (choix='o') then lecture;
readln;
end.