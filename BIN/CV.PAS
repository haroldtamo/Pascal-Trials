unit cv;
interface
uses crt,graph;
const time=10000;
var pilote,mode,i,j:integer;
procedure demandstage;
implementation
procedure demandstage;
begin
pilote:=detect; i:=101;j:=50;
initgraph(pilote,mode,' ');
bar(100,50,500,450);
setcolor(black);
outtextxy(i,j+1,'MOKEM MOKEM TAMO          yaound‚,le 15 Avril 2011');
delay(time-7000);
outtextxy(i,J+9,'Harold');
delay(time);
outtextxy(i,j+18,'Tel: 78 12 40 85');
delay(time);
outtextxy(i+120,j+70,'A monsieur le representant r‚sident');
delay(time);
outtextxy(i+160,j+80,'      de l''IAI-Cameroun ');
delay(time);
outtextxy(i,j+140,'Objet: demande de d‚molition');
delay(time);
outtextxy(i+160,j+190,'Monsieur,');
delay(time);
outtextxy(i+30,j+210,'je viens par la pr‚sente auprŠs de votre haute');
delay(time);
outtextxy(i+30,J+230,'bienveillance solliciter de votre part un peu ');
delay(time);
outtextxy(i+30,
j+250,' de s‚rieux et de reflexion car votre ‚cole');
delay(time);
outtextxy(i+30,j+270,'manque cruellement de professionnalisme.En effet');
delay(time);
outtextxy(i+30,j+290,'elle ne forme que des bureaucrates point barre');
delay(time);
outtextxy(i+30,j+310,'Ainsi,pour y rem‚dier, pardon d‚missionnez.Bye');
delay(time+1000);
outtextxy(i+230,j+360,'L''‚tudiant fach‚');
readln;
closegraph;
end;
BEGIN
END.