uses crt,graph,harryboy;
const  z=2; color=6{lorqu'une touche est appuy‚e};
       time=500{pour le change des couleurs};
       timeS=50{pour le son};
       couleur=1{celle des touche};
var c:char; f,a,b:word;
procedure intro_calco;
begin
initialize;
setfillstyle(1,15);
bar(1,1,639,479);
settextstyle(5,0,5);{police et taille du nom de la calculatrice}
setcolor(2);
outtextxy(140,10,'Harryboy Scientific');
outtextxy(220,50,'Calculator');
moveto(6,130);{pour mettre le logo sur le cot‚ gauche}
settextstyle(4,1,5);
outtext('H   S   C');
moveto(570,130);{pour mettre le logo sur le cot‚ droit}
settextstyle(7,1,5);
outtext('H   S   C');
moveto(50,390);
settextstyle(5,0,0);
setcolor(4);
outtext('la perfection n''‚tant pas de ce monde ');
outtextxy(20,410,'pour toute critique merci de me contacter au ');
outtextxy(200,440,'78 12 40 85');
settextstyle(0,0,0);{retour au mode texte normal}
setfillstyle(1,9);
bar(50,100,580,400);
moveto(170,180);
setcolor(15);
outtext('welcome to the Harryboy calculator');
moveto(195,200);
outtext('I hope that will help you!');
moveto(200,220);
outtext('        Enjoy!!!           ');
moveto(250,325);
setcolor(black);
outtext('enable sound?(Y/N)');
repeat
c:=readkey;
if c='Y' then f:=2000;
if c='N' then f:=0;
until (c='Y') or (c='N');
closegraph;
end;
procedure ecran;
begin
setcolor(0);
setlinestyle(0,$c3,3);
rectangle(80,10,550,340);
rectangle(83,13,547,337);
setcolor(black);
setlinestyle(0,$c3,3);
rectangle(120,30,510,80);
setfillstyle(1,15);
bar(124,34,506,76);
setlinestyle(0,$c3,0);
setcolor(15);
end;
BEGIN
intro_calco;
initialize;
setfillstyle(1,8);
bar(1,1,640,480);
setcolor(15);
setfillstyle(1,couleur);
bar3D(100,100,170,140,z,topon);
bar3D(190,100,260,140,z,topon);
bar3D(280,100,350,140,z,topon);
bar3D(370,100,440,140,z,topon);
bar3D(460,100,530,140,z,topon);{fin creation carreau 1ere ligne}
outtextxy(130,115,'1');
outtextxy(220,115,'2');
outtextxy(310,115,'3');
outtextxy(390,115,'Sin');
outtextxy(480,115,'Cos'); {fin remplissage des carreaux}
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
outtextxy(400,235,'Xý');
outtextxy(480,235,'û(x)');
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
outtextxy(400,295,'ln');
outtextxy(480,295,'Log');
Ecran; a:=130;b:=40;
REPEAT {permet de faire briller une touche lorqu'elle est appuy‚e}
c:=readkey;
if c='0' then
begin
sound(f); delay(timeS);nosound;
setfillstyle(1,color);
bar(100,280,170,320);
outtextxy(130,295,'0');
delay(time);
setfillstyle(1,couleur);
bar3D(100,280,170,320,z,topon);
outtextxy(130,295,'0');
setcolor(0);  {affichage a l'ecran}
moveto(a,b);
outtext(c);
setcolor(15);
end;
if c='1' then
begin
sound(f); delay(timeS);nosound;
setfillstyle(1,color);
bar(100,100,170,140);
outtextxy(130,115,'1');
delay(time);
setfillstyle(1,couleur);
bar3D(100,100,170,140,z,topon);
outtextxy(130,115,'1');
setcolor(0);
moveto(a,b);
outtext(c);
setcolor(15);
end;
if c='2' then
begin
sound(f); delay(timeS);nosound;
setfillstyle(1,color);
bar(190,100,260,140);
outtextxy(220,115,'2');
delay(time);
setfillstyle(1,couleur);
bar3D(190,100,260,140,z,topon);
outtextxy(220,115,'2');
setcolor(0);
moveto(a,b);
outtext(c);
setcolor(15);

end;
if c='3' then
begin
sound(f); delay(timeS);nosound;
setfillstyle(1,color);
bar(280,100,350,140);
outtextxy(310,115,'3');
delay(time);
setfillstyle(1,couleur);
bar3D(280,100,350,140,z,topon);
outtextxy(310,115,'3');
setcolor(0);
moveto(a,b);
outtext(c);
setcolor(15);

end;
if c='S' then
begin
sound(f); delay(timeS);nosound;
setfillstyle(1,color);
bar(370,100,440,140);
outtextxy(390,115,'Sin');
delay(time);
setfillstyle(1,couleur);
bar3D(370,100,440,140,z,topon);
outtextxy(390,115,'Sin');
setcolor(0);
moveto(a,b);
outtext('Sin(');
setcolor(15);

end;
if c='C' then
begin
sound(f); delay(timeS);nosound;
setfillstyle(1,color);
bar(460,100,530,140);
outtextxy(480,115,'Cos');
delay(time);
setfillstyle(1,couleur);
bar3D(460,100,530,140,z,topon);
outtextxy(480,115,'Cos');
setcolor(0);
moveto(a,b);
outtext('Cos(');
setcolor(15);

end;
if c='4' then
begin
sound(f); delay(timeS);nosound;
setfillstyle(1,color);
bar(100,160,170,200);
outtextxy(130,175,'4');
delay(time);
setfillstyle(1,couleur);
bar3D(100,160,170,200,z,topon);
outtextxy(130,175,'4');
setcolor(0);
moveto(a,b);
outtext(c);
setcolor(15);

end;
if c='5' then
begin
sound(f); delay(timeS);nosound;
setfillstyle(1,color);
bar(190,160,260,200);
outtextxy(220,175,'5');
delay(time);
setfillstyle(1,couleur);
bar3D(190,160,260,200,z,topon);
outtextxy(220,175,'5');
setcolor(0);
moveto(a,b);
outtext(c);
setcolor(15);

end;
if c='6' then
begin
sound(f); delay(timeS);nosound;
setfillstyle(1,color);
bar(280,160,350,200);
outtextxy(310,175,'6');
delay(time);
setfillstyle(1,couleur);
bar3D(280,160,350,200,z,topon);
outtextxy(310,175,'6');
setcolor(0);
moveto(a,b);
outtext(c);
setcolor(15);

end;
if c='T' then
begin
sound(f); delay(timeS);nosound;
setfillstyle(1,color);
bar(370,160,440,200);
outtextxy(390,175,'Tan');
delay(time);
setfillstyle(1,couleur);
bar3D(370,160,440,200,z,topon);
outtextxy(390,175,'Tan');
setcolor(0);
moveto(a,b);
outtext('tan(');
setcolor(15);

end;
if c='E' then
begin
sound(f); delay(timeS);nosound;
setfillstyle(1,color);
bar(460,160,530,200);
outtextxy(480,175,'Exp(x)');
delay(time);
setfillstyle(1,couleur);
bar3D(460,160,530,200,z,topon);
outtextxy(480,175,'Exp(x)');
setcolor(0);
moveto(a,b);
outtext('e(');
setcolor(15);

end;
if c='7' then
begin
sound(f); delay(timeS);nosound;
setfillstyle(1,color);
bar(100,220,170,260);
outtextxy(130,235,'7');
delay(time);
setfillstyle(1,couleur);
bar3D(100,220,170,260,z,topon);
outtextxy(130,235,'7');
setcolor(0);
moveto(a,b);
outtext(c);
setcolor(15);

end;
if c='8' then
begin
sound(f); delay(timeS);nosound;
setfillstyle(1,color);
bar(190,220,260,260);
outtextxy(220,235,'8');
delay(time);
setfillstyle(1,couleur);
bar3D(190,220,260,260,z,topon);
outtextxy(220,235,'8');
setcolor(0);
moveto(a,b);
outtext(c);
setcolor(15);

end;
if c='9' then
begin
sound(f); delay(timeS);nosound;
setfillstyle(1,color);
bar(280,220,350,260);
outtextxy(310,235,'9');
delay(time);
setfillstyle(1,couleur);
bar3D(280,220,350,260,z,topon);
outtextxy(310,235,'9');
setcolor(0);
moveto(a,b);
outtext(c);
setcolor(15);

end;
if c=chr(253) then
begin
sound(f); delay(timeS);nosound;
setfillstyle(1,color);
bar(370,220,440,260);
outtextxy(400,235,'xý');
delay(time);
setfillstyle(1,couleur);
bar3D(370,220,440,260,z,topon);
outtextxy(400,235,'xý');
setcolor(0);
moveto(a,b);
outtext('ý=');
setcolor(15);

end;
if c='R' then
begin
sound(f); delay(timeS);nosound;
setfillstyle(1,color);
bar(460,220,530,260);
outtextxy(470,235,'sqRt(x)');
delay(time);
setfillstyle(1,couleur);
bar3D(460,220,530,260,z,topon);
outtextxy(480,235,'û(x)');
setcolor(0);
moveto(a,b);
outtext('û');
setcolor(15);

end;
if (c='-') or (c='+') then
begin
sound(f); delay(timeS);nosound;
setfillstyle(1,color);
bar(280,280,350,320);
outtextxy(310,295,'+/-');
delay(time);
setfillstyle(1,couleur);
bar3D(280,280,350,320,z,topon);
outtextxy(310,295,'+/-');
setcolor(0);
moveto(a,b);
outtext(c);
setcolor(15);

end;
if c='.' then
begin
sound(f); delay(timeS);nosound;
setfillstyle(1,color);
bar(190,280,260,320);
outtextxy(220,295,'.');
delay(time);
setfillstyle(1,couleur);
bar3D(190,280,260,320,z,topon);
outtextxy(220,295,'.');
setcolor(0);
moveto(a,b);
outtext(c);
setcolor(15);

end;
if c='l' then
begin
sound(f); delay(timeS);nosound;
setfillstyle(1,color);
bar(370,280,440,320);
outtextxy(400,295,'ln');
delay(time);
setfillstyle(1,couleur);
bar3D(370,280,440,320,z,topon);
outtextxy(400,295,'ln');
setcolor(0);
moveto(a,b);
outtext('ln(');
setcolor(15);

end;
if c='L' then
begin
sound(f); delay(timeS);nosound;
setfillstyle(1,color);
bar(460,280,530,320);
outtextxy(480,295,'Log');
delay(time);
setfillstyle(1,couleur);
bar3D(460,280,530,320,z,topon);
outtextxy(480,295,'Log');
setcolor(0);
moveto(a,b);
outtext('Log(');
setcolor(15);

end;
a:=a+10;
UNTIL c=CHAR(0);{(c<>'1') AND (c<> '0') AND (c<>'2') AND (c<>'3') AND (c<>'S') AND (c<>'C') AND (c<>'4')
AND (c<>'5') AND (c<>'6')AND (c<>'7') AND (c<>'8') AND (c<>'9') AND (c<>'l') AND (c<>'L') AND (c<>'+') AND (c<>'-')
AND (c<>'.') AND (c<>'X') AND (c<>'R') AND (c<>'E') AND (c<>'T');}
readln;
end.
