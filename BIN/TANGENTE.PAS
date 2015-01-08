program tangente;{Je n'ai pas fini}
uses crt;
var x,tan:real;
    choix:integer;
begin
 repeat
  clrscr;
  write('Entrez un r‚el pour d‚terminer sa tangente:');
  readln(x);
  if cos(x)=0 then
   writeln('tan(',x:0:3,'rad)= n existe pas')
  else
  begin
   tan:=sin(x)/cos(x);
   writeln('tan(',x:0:3,'rad)=',tan:0:3);
  end;
  writeln('Voulez-vous continuer?');
  writeln('1-Oui');
  writeln('2-Non');
  write('Entrez votre choix(1/2):');
  readln(choix);
  while((choix<1)or(choix>2))do
  begin
   writeln('Le choix est incorrect!');
   write('Veuillez entrer correctement votre choix(1/2):');
   readln(choix);
  end;
 until choix=2;
 repeat
 until keypressed;
end.