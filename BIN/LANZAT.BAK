program  lanzat;
uses crt;
const N=20;
var a,s,b:integer;
    x,y:byte;
begin
clrscr;
  Randomize;
  textcolor(random(16));
  writeln('Bienvenue dans le jeu de Harryboy.Allez, amusez-vous bien');
    repeat
  x:=30;
  y:=10;
  window(x,y,x+20,y+1);
  textbackground(random(16));
  write('press enter to play');
  until keypressed;
  window(1,1,80,25);
  textcolor(random(16));

    clrscr;
  writeln;
  writeln('choisi un nombre quelconque entre 1 et ',N,' et on vera si tu es chanceux');
  s:=1;b:=random(20);
  textcolor(random(16));
  repeat
 readln(a);
  if a<b then
  begin
  writeln('plus haut');
  s:=s+1;
  end;
   if a>b then
   begin
   writeln('plus bas');
   s:=s+1;
   end;
   until (a=b);
   textcolor(random(16));
   if s=1 then
   begin
   writeln('Tu es un as : trouver du premier coup...sorcier!!');
   end;
   if s>5 then
   begin
   writeln('Pardoooon, ne joue jamais au Lotto..dire qu il a fallu ',s,' fois pour que tu trouve');
   end;
   if s<5 then
   begin
   write(' Pas mal! tu as su trouver le bon nombre en ',s,' coups seulement');
   end;

  readln;
end.
