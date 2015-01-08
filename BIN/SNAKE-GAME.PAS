program snake;
{programme principal du jeu}
uses crt,graph;
label fin;
const dimmax=15;
      dx=5;dy=5;
type carreaux=record
     x,y,c:integer;
     end;
     grille=record
            x1,x2,y1,y2:integer;
            end;
var pom,cbonus:record
        x,y,r,c:integer;
    end;
    tab:array[1..dimmax] of carreaux;
    cloture:record
            x1,y1,x2,y2,c:integer;
            end;
    long,sercolor,sens,point,pt,tempo,ibonus,pbonus,rep:integer;
    tch:char;
    touch,terminer,bon:boolean;
    coordmenu,cgain:grille;

{$i cadre.pas}
{$i menu.pas}


{--------------------------------------------------}
procedure rotation1(n:integer);
 var i:integer;
 begin
 for i:=n downto 2 do
  tab[i]:=tab[i-1];
 for i:=1 to (dimmax-n)do;
end;
{-----------------------------------------}
procedure deplace1(var sens:integer);
 label debut;
 begin
 debut:
  case sens of
   1,-1:begin
        if keypressed then
         begin
          tch:=readkey;
          case tch of
           #72:begin sens:=2;goto debut;end;
           #80:begin sens:=-2;goto debut ;end;
          end;
        end;
        if sens=1 then
         begin
          tab[1].x:=tab[2].x+dx;
          tab[1].y :=tab[2].y;
         end
         else
          begin
          tab[1].x:=tab[2].x-dx;
          tab[1].y :=tab[2].y;
         end;
        end;
   2,-2:begin
        if keypressed then
         begin
          tch:=readkey;
          case tch of
           #77:begin sens:=1;goto debut;end;
           #75:begin sens:=-1;goto debut ;end;
          end;
        end;
        if sens=2 then
         begin
          tab[1].y:=tab[2].y-dy;
          tab[1].x :=tab[2].x;
         end
         else
          begin
          tab[1].y:=tab[2].y+dy;
          tab[1].x :=tab[2].x;
         end;
     end;
   end;
end;
{---------------------------------------}
procedure taille(var l:integer);
 begin
 inc(l);
 end;
{-------------------------------------------}
procedure pomme(var x,y:integer);
 begin
 randomize;
 with cloture do
  begin
   repeat
    x:=random(x2-x1-pom.r)+x1+pom.r;
    y:=random(y2-y1-pom.r)+y1+pom.r;
    until (x mod dx=0) and (y mod dy=0);
  end;
 end;
{-----------------------------------------------}
procedure affichepomme;
 begin
 setcolor(14);
 circle(pom.x,pom.y,pom.r);
 setfillstyle(1,0);
 floodfill(pom.x,pom.y,14);
 setcolor(0);
 circle(pom.x,pom.y,pom.r);
 setcolor(pom.c);
 pomme(pom.x,pom.y);
 circle(pom.x,pom.y,pom.r);
 setfillstyle(1,pom.c);
 floodfill(pom.x,pom.y,pom.c);
 end;
{---------------------------------------}
procedure controle(var toucher:boolean);
function queue:boolean;
 var i,j:integer;
     test :boolean;
 begin
 test:=false;
  for j:= 2 to long do
    if (tab[1].x=tab[j].x) and (tab[1].y=tab[j].y) then begin
     test:=true;
     outtext('toucher');
     end;
 for i:=1 to (dimmax-long) do;
 queue:=test;
 end;
 {...............}
 function barriere:boolean;
  var test :boolean;
  begin
  test:=false;
  if (tab[1].x=cloture.x1) or (tab[1].x=cloture.x2) then
   test:=true;
  if (tab[1].y=cloture.y1) or (tab[1].y=cloture.y2) then
   test:=true;
   barriere:=test;
  end;
  {...............}
 begin
 toucher:=queue or barriere;
end;
{----------------------------------------------}
procedure affichecar(x,y,color:integer);
 var a,b:record
          x,y:integer;
         end;
begin
 a.x:=x-2;
 a.y:=y-2;
 b.x:=x+2;
 b.y:=y+2;
 setfillstyle(1,color);
 bar(a.x,a.y,b.x,b.y);
end;
{--------------------------------------}
procedure serpent;
begin
 affichecar(tab[1].x,tab[1].y,sercolor);
 affichecar(tab[long].x,tab[long].y,0);
 rotation1(long);
 deplace1(sens);
 affichecar(tab[1].x,tab[1].y,red);
 delay(tempo);
end;
{--------------------------------}
procedure ecran ;
 begin

 with cloture do
  begin
  setfillstyle(1,yellow);
  bar(x1,y1-2,x2,y1);
  bar(x1,y2,x2,y2+2);
  bar(x2,y1-2,x2+2,y2+2);
  bar(x1-2,y1-2,x1,y2+2);
  setfillstyle(1,0);
  bar(x1,y1,x2,y2);
  end;
 end;
{--------------------------}
procedure affichepoint(c:integer);
 var ch:string[5];
 begin
 str(point,ch);
 setcolor(c);
 settextstyle(2,0,6);
 setfillstyle(1,0);
 bar(cgain.x1+4,cgain.y2-30,cgain.x1+100,cgain.y2-13);
 outtextxy(cgain.x1+5,cgain.y2-30,'SCORE :'+ch);
 end;

{-------------------------------}
procedure touchepom;
 begin
  if(tab[1].x=pom.x) and (tab[1].y=pom.y) then
   begin
   taille(long);
   affichepomme;
   affichepoint(0);
   inc(point,pt);
   affichepoint(yellow);
   affichecar(tab[1].x,tab[1].y,blue);
   sound(250);
   delay(300);
   nosound;
   affichecar(tab[1].x,tab[1].y,red);
   end;
 end;
{-----------------------------}
procedure pause;
begin
 if (tch='x') or (tch='X') then
  begin
  tch:='q';
  repeat
   if keypressed then
    begin
    tch:=readkey;
    end;
 until (tch='X') or (tch='x');
 tch:='q';
end;
end;
{-----------------------------}
procedure initialiser;
 var aux,i:integer;
 begin
 cloture.c:=yellow;
 long:=3;
 for i:=1 to long do
  tab[i].x:=i*i;
 tab[1].x:=cloture.x1+50;
 tab[1].y:=cloture.y1+50;
 pomme(pom.x,pom.y);
 randomize;
 aux:=random(3);
 case aux of
  0:sens:=-1;
  3:sens:=-2;
  else
   sens:=aux;
 end;
 tch:='a';
 sercolor:=brown;
 touch:=false;
 pom.c:=green;
 pom.r:=2;
end;
{-------------------------------------------}
procedure barrage(var b1,b2:grille);
 begin
 b1.x1:=cloture.x1+100;
 b1.x2:=b1.x1+100;
 b1.y1:=cloture.y1+50;
 b1.y2:=b1.y1+2;
 b2.x1:=(b1.x1+b1.x2)div 2;
 b2.x2:=b2.x1+2;
 b2.y1:=b1.y2+20;
 b2.y2:=cloture.y2-20;
 end;


procedure pomme2(var x,y:integer);
 var b1,b2:grille;
    test1,test2:boolean;
 begin
 test1:=false;
 test2:=false;
 barrage(b1,b2);
 randomize;
 with cloture do
  begin
  repeat
   pomme(x,y);
   if (x in [b1.x1-pom.r..b1.x2-pom.r]) and (y in [b1.y1-pom.r..b1.y2-pom.r]) then
     test1:=true;
   if (x in [b2.x1-pom.r..b2.x2-pom.r]) and (y in [b2.y1-pom.r..b2.y2-pom.r]) then
     test2:=true;
  until ((not test1) and (not test2));
  end;
end;
{------------------------------------------}
procedure affichepom2;
begin
 setcolor(pom.c);
 pomme2(pom.x,pom.y);
 circle(pom.x,pom.y,pom.r);
 setfillstyle(1,pom.c);
 floodfill(pom.x,pom.y,pom.c);
end;
{---------------------------}
procedure touchepom2;
begin
  if(tab[1].x=pom.x) and (tab[1].y=pom.y) then
   begin
   taille(long);
   affichepom2;
   affichepoint(0);
   inc(point,pt);
   affichepoint(yellow);
   affichecar(tab[1].x,tab[1].y,blue);
   sound(250);
   delay(300);
   nosound;
   affichecar(tab[1].x,tab[1].y,red);
   end;
end;
{-------------------------------------}
procedure vitesse;
 var ch:char;
 begin
 settextstyle(2,0,4);
 setcolor(yellow);
 with cloture do
  begin
  outtextxy(x1+10,y1+10,'SELECT THE SPEED OF THE GAME :');
  outtextxy(x1+10,y1+20,' 1:LOW   2:MEDIUM    3:FAST');
  end;
  ch:='a';
  repeat
   if keypressed then
    ch:=readkey;
  until (ch in ['1'..'3']);
  case ch of
   '1':tempo:=100;
   '2':tempo:=90;
   '3':tempo:=75;
  end;
end;
{-------------------------------------}
procedure facile;
 begin
 point:=0;
 pt:=50;
 affichepoint(yellow);
 initialiser;
 setfillstyle(1,0);
 with cloture do
 begin
  bar(x1,y1,x2,y2);
  vitesse;
  bar(x1,y1,x2,y2);
  end;
  ecran;
 affichepomme;
 delay(500);
 repeat
  serpent;
  controle(touch);
  touchepom;
  pause;
 until (long=dimmax) or touch or (tch=#27);
 delay(1000);
 setfillstyle(1,0);
 settextstyle(2,0,4);
setcolor(yellow);
 with cloture do
 begin
 bar(x1,y1,x2,y2);
 outtextxy(x1+100,y1+10,'GAME OVER');
 end;
end;
{-------------------------------}
procedure ecran2;
 var a,b:grille;
 begin
 ecran;
 barrage(a,b);
 setfillstyle(1,cloture.c);
 bar(a.x1,a.y1,a.x2,a.y2);
 bar(b.x1,b.y1,b.x2,b.y2);
end;
{-----------------------------------}
procedure controle2(var bool:boolean);
 var test: boolean;
 function obstacle1:boolean;
  var tes:boolean;
      a,b:grille;
  begin
  tes:=false;
  barrage(a,b);
  if (tab[1].x<=a.x2) and (tab[1].x>=a.x1) then
   if (tab[1].y<=a.y2) and (tab[1].y>=a.y1) then
    tes:=true;
  obstacle1:=tes;
 end;
 {--------------------------------------}
 function obstacle2:boolean;
  var tes:boolean;
        a,b:grille;
  begin
  tes:=false;
  barrage(a,b);
 if (tab[1].x<=b.x2) and (tab[1].x>=b.x1) then
   if (tab[1].y<=b.y2) and (tab[1].y>=b.y1) then
   tes:=true;
  obstacle2:=tes;
end;
begin
controle(test);
bool:=test or obstacle1 or obstacle2;
end;
{-----------------------------------------}
procedure moyen;
 begin
 point:=0;
 pt:=50;
 affichepoint(yellow);
 initialiser;
 with cloture do
 begin
 setfillstyle(1,0);
  bar(x1,y1,x2,y2);
  vitesse;
  bar(x1,y1,x2,y2);
  end;
 ecran2;
 affichepomme;
 delay(500);
 repeat
  serpent;
  controle2(touch);
  touchepom2;
  pause;
 until (long=dimmax) or touch or (tch=#27);
 delay(1000);
 setfillstyle(1,0);
settextstyle(2,0,4);
setcolor(yellow);
 with cloture do
 begin
 bar(x1,y1,x2,y2);
 outtextxy(x1+100,y1+10,'GAME OVER');
 end;
 end;
 {---------------------------------------------}
procedure graphique(chemin:string);
  var
 grDriver: Integer;
 grMode: Integer;
 ErrCode: Integer;
begin
 grDriver := Detect;
 grmode:=0;
 InitGraph(grDriver, grMode,chemin);
 ErrCode := GraphResult;
 if ErrCode <> grOk then
   Writeln('Graphics error:', GraphErrorMsg(ErrCode));
 cleardevice;
end;
{----------------------------------}
procedure aide;
begin
settextstyle(2,0,4);
setcolor(yellow);
setfillstyle(1,0);
with cloture do
 begin
 bar(x1,y1,x2,y2);
outtextxy(x1+100,y1+10,'SNAKE - GAME');
outtextxy(x1+10,y1+30,'DIRIGEZ LE SEPENT POUR QU'' IL MANGE');
outtextxy(x1+10,y1+40,'TOUTES LES POMMES');
outtextxy(x1+100,y1+60,'KANDOR_GAMES');
end;
end;
{-------------------------------------}
BEGIN
 graphique('c:\tp7\bgi');
 accueil;
 ecran;
 tempo:=90;{vitesse du jeu.diminuez le pour que la vitesse augmente}
 rep:=0;
 terminer:=false;
 repeat
  main_menu(rep);
  case rep of
   1:facile;
   2:moyen;
   3:aide;
   4:terminer:=true;
  end;
 until terminer;
 delay(500);
 closegraph;
 END.


 case rep of
  '1':begin
      tempo:=100;
      facile;
      end;
  '2':begin
      tempo:=100;
      moyen;
      end;
  #27:goto fin;
 end;
 if long>=dimmax then
  outtextxy(200,10,'vous avez gagn‚')
  else
   if long<dimmax then
    outtextxy(200,10,'vous avez perdu');
 outtextxy(200,100,'continue?');
 readln(rep);
 cleardevice;
until (rep='n') or (rep='N');
fin:
closegraph;
END.

