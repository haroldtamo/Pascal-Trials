unit Harryboy;
interface
uses crt,graph;
const time=0;
var pilote,mode,i,j:integer;
procedure demandstage;
procedure initialize;
procedure interface_calco;
implementation
procedure demandstage;
begin
pilote:=detect; i:=101;j:=50;
initgraph(pilote,mode,' ');
setcolor(15);
setfillstyle(1,14);
bar(100,50,500,450);
setcolor(black);
outtextxy(i,j+1,'MOKEM MOKEM TAMO          yaound‚,le 15 Avril 2011');
delay(time);
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
procedure initialize;
begin
pilote:=detect;
initgraph(pilote,mode,' ');
end;
procedure interface_calco;
const max=340; z=2;
BEGIN
initialize;
setcolor(15);
setfillstyle(1,9);
bar3D(100,100,170,140,z,topon);
bar3D(190,100,260,140,z,topon);
bar3D(280,100,350,140,z,topon);
bar3D(370,100,440,140,z,topon);
bar3D(460,100,530,140,z,topon);{fin creation carreau 1ere ligne}
outtextxy(130,115,'1');
outtextxy(220,115,'2');
outtextxy(310,115,'3');
outtextxy(390,115,'Sin');
outtextxy(480,115,'Cos'); {fin remplissage des carreaux
{fin de la 1ere ligne}
{d‚but 2eme ligne}
bar3D(100,160,170,200,z,topon);
bar3D(190,160,260,200,z,topon);
bar3D(280,160,350,200,z,topon);
bar3D(370,160,440,200,z,topon);
bar3D(460,160,530,200,z,topon);
outtextxy(130,175,'4');
outtextxy(220,175,'5');
outtextxy(310,175,'6');
outtextxy(390,175,'Tan');
outtextxy(480,175,'Exp(x)');
{fin 2eme ligne}
{d‚but 3eme ligne}
bar3D(100,220,170,260,z,topon);
bar3D(190,220,260,260,z,topon);
bar3D(280,220,350,260,z,topon);
bar3D(370,220,440,260,z,topon);
bar3D(460,220,530,260,z,topon);
outtextxy(130,235,'7');
outtextxy(220,235,'8');
outtextxy(310,235,'9');
outtextxy(400,235,'xý');
outtextxy(470,235,'Sqrt(x)');
{fin 3eme ligne}
{d‚but 4eme ligne}
bar3D(100,280,170,320,z,topon);
bar3D(190,280,260,320,z,topon);
bar3D(280,280,350,320,z,topon);
bar3D(370,280,440,320,z,topon);
bar3D(460,280,530,320,z,topon);
outtextxy(130,295,'0');
outtextxy(220,295,'.');
outtextxy(310,295,'+/-');
outtextxy(400,295,'Ln');
outtextxy(480,295,'Log');
readln;
end;

BEGIN
END.