{Ce programme a ‚t‚ con‡u par kpizingui darryl.
le jeu tetris n' est plus … presenter, alors ce programme permet de jouer
… ce jeu.
Noubliez pas de consulter le fichier modification pour savoir comment faire
pour ajouter de nouvelles pieces.
contact: nobi_8@hotail.com
}

program tetris;
uses crt,graph;
const rows=20; cols=10;
     dx=20;{distance suivant  l' horizontale entre 2 briques}
     dy=10;
     xaffichage=520;{abscisse pour l' affichage du score, niveau,...}
     dim=18; {nombre de piece disponible}
type piece=record
            x,y:longint;
            on:boolean;
            end;
     {forme:liste enum‚r‚ contenant le nom des pieces disponibles dans le jeu.
      chaque piece a un mon, cela permet de les manipuler individuellement.
       Et il est donc plus facile d' ajouter une nouvelle piece. pour ‡a, consulter
       le fichier modification }
     forme=(carre,ligne1,ligne2,puzzlehaut,puzzlebas,puzzledroit,puzzlegauche,
            l1haut,l1bas,l1droit,l1gauche,l2haut,l2bas,l2droit,l2gauche,r1vert
            ,r1horiz,r2vert,r2horiz);
     {figure:definie une piece}
     figure=record
            t:array[1..4,1..4] of piece;
            forme:forme;
            end;
const {initialiation d' une table avec les differentes pieces disponible dand le jeu}
      tbl:array[0..18] of forme=(carre,ligne1,ligne2,puzzlehaut,puzzlebas,puzzledroit,puzzlegauche,
                                 l1haut,l1bas,l1droit,l1gauche,l2haut,l2bas,l2droit,l2gauche,r1vert
                                ,r1horiz,r2vert,r2horiz);


var {grille: matrice principale du jeu}
    grille:array[1..rows+1,1..cols+1] of piece;
    score,vitesse,niveau:integer;
    difficulte:(debutant,expert);

{ ici commence les procedures}

{initialisation des champs on a la valeur false.
 ici aux ressort sans forme definie}
procedure initon(var aux:figure);
  var i,j:integer;
  begin
  for i:=1 to 4 do
   for j:=1 to 4 do
   aux.t[i,j].on:=false;
  end;

{construction des differentes figures}
{principe de la construction:
 .une figure est constitu‚e d' une matrice 4*4 o— les cases "on" qui
   reprentent cette figure … la valeur true
 .pour conctruire une figure donn‚e, on met on:=true pour les cases
 qui constituent cette figure. un representation graphique aidera sans doute}

procedure constcarre(var aux:figure);
 var i,j:integer;
 begin
 initon(aux);
 for i:=1 to 2 do
  for j:=1 to 2 do
   aux.t[i,j].on:=true;
   aux.forme:=carre;
 end;

procedure constligne1(var aux:figure);
 var i:integer;
 begin
 initon(aux);
 for i:= 1 to 4 do
  aux.t[1,i].on:=true;
  aux.forme:=ligne1;
 end;

procedure constligne2(var aux:figure);
 var i:integer;
 begin
 initon(aux);
 for i:=1 to 4 do
  aux.t[i,1].on:=true;
 aux.forme:=ligne2;
 end;

 procedure constpuzzlehaut(var aux:figure);
  var i:integer;
  begin
  initon(aux);
  aux.forme:=puzzlehaut;
  for i:=1 to 3 do
   aux.t[2,i].on:=true;
  aux.t[1,2].on:=true;
  end;

 procedure constpuzzlebas(var aux:figure);
  var i:integer;
  begin
  initon(aux);
  aux.forme:=puzzlebas;
  for i:=1 to 3 do
   aux.t[1,i].on:=true;
   aux.t[2,2].on:=true;
  aux.forme:=puzzlebas;
 end;

procedure constpuzzledroit(var aux:figure);
var i:integer;
begin
initon(aux);
aux.forme:=puzzledroit;
for i:=1 to 3 do
 aux.t[i,1].on:=true;
aux.t[2,2].on:=true;
end;

procedure constpuzzlegauche(var aux:figure);
 var i:integer;
 begin
 initon(aux);
 aux.forme:=puzzlegauche;
 for i:=1 to 3 do
  aux.t[i,2].on:=true;
 aux.t[2,1].on:=true;
end;

procedure constl1haut(var aux:figure);
 var i:integer;
 begin
 initon(aux);
 aux.forme:=l1haut;
 for i:=1 to 3 do
  aux.t[i,1].on:=true;
 aux.t[3,2].on:=true;
 end;

 procedure constl1bas(var aux:figure);
 var i:integer;
 begin
 initon(aux);
 aux.forme:=l1bas;
 for i:=1 to 3 do
  aux.t[i,2].on:=true;
 aux.t[1,1].on:=true;
 end;

 procedure constl1gauche(var aux:figure);
 var i:integer;
 begin
 initon(aux);
 aux.forme:=l1gauche;
 for i:=1 to 3 do
  aux.t[2,i].on:=true;
 aux.t[1,3].on:=true;
 end;

procedure constl1droit(var aux:figure);
 var i:integer;
 begin
 initon(aux);
 aux.forme:=l1droit;
 for i:=1 to 3 do
  aux.t[1,i].on:=true;
 aux.t[2,1].on:=true;
 end;

procedure constl2haut(var aux:figure);
 var i:integer;
 begin
 initon(aux);
 aux.forme:=l2haut;
 for i:=1 to 3 do
  aux.t[i,2].on:=true;
 aux.t[3,1].on:=true;
 end;

procedure constl2bas(var aux:figure);
 var i:integer;
 begin
 initon(aux);
 aux.forme:=l2bas;
 for i:=1 to 3 do
  aux.t[i,1].on:=true;
 aux.t[1,2].on:=true;
 end;

procedure constl2droit(var aux:figure);
 var i:integer;
 begin
 initon(aux);
 aux.forme:=l2droit;
 for i:=1 to 3 do
  aux.t[2,i].on:=true;
 aux.t[1,1].on:=true;
 end;

procedure constl2gauche(var aux:figure);
 var i:integer;
 begin
 initon(aux);
 aux.forme:=l2gauche;
 for i:=1 to 3 do
  aux.t[1,i].on:=true;
 aux.t[2,3].on:=true;
 end;

procedure constr1vert(var aux:figure);
var i:integer;
begin
initon(aux);
aux.forme:=r1vert;
for i:=1 to 2 do
 aux.t[i,1].on:=true;
for i:=2 to 3 do
 aux.t[i,2].on:=true;
end;

procedure constr1horiz(var aux:figure);
var i:integer;
begin
initon(aux);
aux.forme:=r1horiz;
for i:=2 to 3 do
 aux.t[1,i].on:=true;
for i:=1 to 2 do
 aux.t[2,i].on:=true;
end;

procedure constr2vert(var aux:figure);
var i:integer;
begin
initon(aux);
aux.forme:=r2vert;
for i:=1 to 2 do
 aux.t[i,2].on:=true;
for i:=2 to 3 do
 aux.t[i,1].on:=true;
end;

procedure constr2horiz(var aux:figure);
var i:integer;
begin
initon(aux);
aux.forme:=r2horiz;
for i:=1 to 2 do
 aux.t[1,i].on:=true;
for i:=2 to 3 do
 aux.t[2,i].on:=true;
end;

{fin de la construction des figures}

{changeforme: definie la figure qui remplacera celle qui est visible
quand la touche haut du curseur est appuy‚e
}
procedure changeforme(var aux:figure);
var a:forme;
begin
a:=aux.forme;
case a of

 carre:constcarre(aux);

 ligne1,ligne2:if (a=ligne1) then
                constligne2(aux)
                else constligne1(aux);

 puzzlehaut,puzzlebas,puzzledroit,puzzlegauche
               :case a of
                 puzzlehaut  :constpuzzlegauche(aux);
                 puzzlegauche:constpuzzlebas(aux);
                 puzzlebas   :constpuzzledroit(aux);
                 puzzledroit :constpuzzlehaut(aux);
               end;

 l1haut,l1bas,l1droit,l1gauche:case a of
                               l1haut   :constl1gauche(aux);
                               l1gauche :constl1bas(aux);
                               l1bas    :constl1droit(aux);
                               l1droit  :constl1haut(aux);
                               end;

 l2haut,l2bas,l2droit,l2gauche:case a of
                               l2haut   :constl2gauche(aux);
                               l2gauche :constl2bas(aux);
                               l2bas    :constl2droit(aux);
                               l2droit  :constl2haut(aux);
                               end;

 r1vert,r1horiz                :if a=r1vert then
                                  constr1horiz(aux)
                                  else constr1vert(aux);

 r2vert,r2horiz                :if a=r2vert then
                                constr2horiz(aux)
                                else constr2vert(aux);
 end;
end; {fin}

{longmax: retourne le nombre de cases maximales occup‚ par une figure
 sur horizontale et la verticale}
function longmax(aux:figure):integer;
var i,j,s,a,b:integer;
begin
a:=0; b:=0;
for i:=1 to 4 do
 begin
 s:=0;
 for j:=1 to 4 do
  if aux.t[i,j].on then
   s:=s+1;
 if s>a then
  a:=s;
 end;
for i:=1 to 4 do
 begin
 s:=0;
 for j:=1 to 4 do
  if aux.t[j,i].on then
   s:=s+1;
 if s>b then
  b:=s;
 end;
if a> b then
 longmax:=a
  else longmax:=b;
end;{fin}

{verifie si les conditions sont r‚unies pour changer la forme d' une figure}
procedure change(var aux:figure);
var test:boolean;
    i,j,a:integer;
begin
test:=false;
{verifie sur l' horizontale}
a:=aux.t[1,1].x-grille[1,cols].x;
a:=abs(a) div dx;
if a>=longmax(aux) then
 test:=true;
{pour la verticale}
if test then
 begin
 for i:=1 to rows do
  for j:=1 to cols do
   begin
   if (grille[i,j].y>aux.t[1,1].y) and (grille[i,j].on) then
    begin
    a:=grille[i,j].y-aux.t[1,1].y;
    a:=abs(a) div dy;
    if (grille[i,j].x>=aux.t[1,1].x) and (grille[i,j].x<+aux.t[1,4].x) then
                      if a<longmax(aux) then
                       test:=false;
   end; {if}
  end;{for}
 end;{if}
if test then
 changeforme(aux);
end;{fin}

{deplacegauche:deplace la figure … gauche si cela est possible}
procedure deplacegauche(var aux:figure);
 var test:boolean;
     i,j,k,l,a:integer;
 begin
 test:=true;
 {c' est plus la peine de deplacer la figure si elle deja sur le bord gauche}
 if aux.t[1,1].x<=grille[1,1].x then
  test:=false;
 {on est l… au millieu d' autres pieces donc attention pour ne pas
  en ecraser d' autres}
 for i:=1 to 4 do
  for j:=1 to 4 do
   if (aux.t[i,j].on) then
    for k:=1 to rows do
     for l:=1 to cols do
      if (grille[k,l].on) then
       if (grille[k,l].y=aux.t[i,j].y) and (grille[k,l].x=(aux.t[i,j].x-dx)) then
         test:=false;
 {si c' est oui alors deplacement … gauche}
 if test then
  for i:=1 to 4 do
   for j:=1 to 4 do
    aux.t[i,j].x:=aux.t[i,j].x-dx;
end;{fin}

{pareil que pour deplacegauche}
procedure deplacedroit(var aux:figure);
 var test:boolean;
     i,j,k,l:integer;
 begin
 test:=true;
 for i:=1 to 4 do
  for j:=1 to 4 do
  if aux.t[i,j].on=true then
   if aux.t[i,j].x>=(grille[1,cols].x) then
    test:=false;

 for i:=1 to 4 do
  for j:=1 to 4 do
   if (aux.t[i,j].on) then
    for k:=1 to rows do
     for l:=1 to cols do
      if (grille[k,l].on) then
       if (grille[k,l].y=aux.t[i,j].y) and (grille[k,l].x=(aux.t[i,j].x+dx)) then
         test:=false;

 if test then
  for i:=1 to 4 do
   for j:=1 to 4 do
    aux.t[i,j].x:=aux.t[i,j].x+dx;
end;{fin}

{deplace la figure en bas si c' est encore possible.renvoie true
 si c' est le cas}
function deplacebas(var aux:figure):boolean;
var test:boolean;
    i,j,k,l:integer;
    ch:string;
begin
test:=true;
{est on deja au fond?}
for i:=1 to 4 do
 for j:=1 to 4 do
 if aux.t[i,j].on=true then
  if (aux.t[i,1].y>=grille[rows,1].y) then
     test:=false;
{au milieu des briques}
 for i:=1 to 4 do
  for j:=1 to 4 do
   if (aux.t[i,j].on) then
    for k:=1 to (rows) do
     for l:=1 to (cols) do
      if (grille[k,l].on) then
       if (grille[k,l].x=aux.t[i,j].x) then
        if  (grille[k,l].y=(aux.t[i,j].y+dy)) then
         test:=false;
{ ok on la deplace}
if test then
 for i:=1 to 4 do
  for j:=1 to 4 do
   aux.t[i,j].y:=aux.t[i,j].y+dy;
deplacebas:=test;
end;{fin}

{combin‚e avec effaceligne, on supprime une ligne de grille si toutes
 les cases on sont true}
procedure supprime(a:integer);
 var i,j:integer;
begin
for i:=a downto 2 do
 for j:=1 to cols do
  grille[i,j].on:=grille[i-1,j].on;
end;{fin}

procedure affichegrille;forward;

function effaceligne:integer;
{efface les lignes de grille o— les champs on est true}
var test:boolean;
    i,j,sum:integer;
begin
sum:=0;{nombre de ligne effacer}
for i:=rows downto 1 do
 begin
 test:=true;
 for j:=1 to cols do
  test:=test and grille[i,j].on;
  if test then
   begin
   supprime(i);
   sum:=sum+1;
   end;
 end;
setfillstyle(1,0);
bar(grille[1,1].x-9,grille[1,1].y-8,grille[rows,cols].x+9,grille[rows,cols].y+8);
affichegrille;
effaceligne:=sum;
end;{fin}

{copies les champs on de la figure sur les champs on de grille si les
 coordonn‚es correspondent et si on=true quand la figure ne peut plus se
 deplacer vers le bas}
procedure recordposition(aux:figure);
 {enregistre la position finale des briques dans grille}
 var i,j,k,l:integer;
 begin
 for i:=1 to 4 do
  for j:=1 to 4 do  begin
   for k:=1 to rows do
    for l:=1 to cols do
    if aux.t[i,j].on then  begin
     if (grille[k,l].x=aux.t[i,j].x) and (grille[k,l].y=aux.t[i,j].y) then
       grille[k,l].on:=true;
       end;
       end;
end;{fin}

{controle du clavier}
function move(tch:char;var aux:figure):boolean;
 begin
 move:=true;
 case tch of
  {touche du haut} #72:change(aux);
  {touche du bas} #80:move:=deplacebas(aux);
  {touche droite} #77:deplacedroit(aux);
  {touche gauche} #75:deplacegauche(aux);
 end;
end;

{construction d' une brique}
procedure constbrique(Col, Lin, Col1, Lin1: Integer);
begin
  setFillStyle (1, 7);
  bar (Col, Lin, Col1, Lin1);
  setColor (15);
  setLineStyle (0, 1, 1);
  line (Col, Lin, Col1, Lin);
  line (Col, Lin, Col, Lin1);
  line (Col, Lin+ 1, Col1, Lin+ 1);
  line (Col+ 1, Lin, Col+ 1, Lin1);
  line (Col, Lin+ 2, Col1, Lin+ 2);
  line (Col+ 2, Lin, Col+ 2, Lin1);
  setColor (8);
  line (Col, Lin1, Col1, Lin1);
  line (Col+ 1, Lin1- 1, Col1, Lin1- 1);
  line (Col+ 2, Lin1- 2, Col1, Lin1- 2);
  line (Col1, Lin, Col1, Lin1);
  line (Col1- 1, Lin+ 1, Col1- 1, Lin1);
  line (Col1- 2, Lin+ 2, Col1- 2, Lin1);
  setColor (7);
  line (Col, Lin, Col+ 2, Lin+ 2);
  line (Col1, Lin1, Col1- 2, Lin1- 2);
end;{fin}
{construction d' une piece}
procedure constfigure(aux:figure);
 var i,j:integer;
 begin
 for i:=1 to 4 do
  for j:=1 to 4 do
   if (aux.t[i,j].y>=grille[1,1].y) then
    if aux.t[i,j].on then
     constbrique(aux.t[i,j].x-(dx div 2)+2,aux.t[i,j].y-(dy div 2)+2,aux.t[i,j].x+(dx div 2)-2,aux.t[i,j].y+(dy div 2)-2);

 end;

procedure effacebrique(x1,y1,x2,y2:integer);
 begin
 setfillstyle(1,0);
 bar(x1-1,y1-1,x2+1,y2+1);
 end;

procedure effacefigure(aux:figure);
 var i,j:integer;
 begin
 for i:=1 to 4 do
  for j:=1 to 4 do
   if aux.t[i,j].y>=grille[1,1].y then
    if aux.t[i,j].on then
       effacebrique(aux.t[i,j].x-(dx div 2)+2,aux.t[i,j].y-(dy div 2)+2,aux.t[i,j].x+(dx div 2)-2,aux.t[i,j].y+(dy div 2)-2);
 end;
 {quand une figure touche le plafond alors le jeu est fini}
 function partieperdue:boolean;
  var test:boolean;
      i:integer;
  begin
  test:=false;
  for i:=1 to cols do
   if (grille[1,i].on) then
    test:=true;
 partieperdue:=test;
end;

{choix au hazard de la prochaine figure}
procedure nextfigure(var aux:figure);
 var choix:integer;
 begin
 choix:=random(dim);
 aux.forme:=tbl[choix];
 changeforme(aux);
 end;

procedure affichenext(aux:figure);
const ycoord=150;
var i,j:integer;
    fig:figure;
begin
for i:=1 to 4 do
 for j:=1 to 4 do
  fig.t[i,j].on:=true;
aux.t[1,1].x:=xaffichage+1;
aux.t[1,1].y:=ycoord+25;
for i:=1 to 4 do
 begin
 for j:=2 to 4 do
  begin
  aux.t[i,j].y:=aux.t[i,1].y;
  aux.t[i,j].x:=aux.t[i,j-1].x+dx;
  end;
 if i<4 then
  begin
  aux.t[i+1,1].y:=aux.t[i,1].y+dy;
  aux.t[i+1,1].x:=aux.t[1,1].x;
  end;
 end;
 fig:=aux;
 for i:=1 to 4 do
  for j:=1 to 4 do
   fig.t[i,j].on:=true;
 setcolor(yellow);
 settextstyle(2,0,4);
 outtextxy(xaffichage,ycoord,'SUIVANT :');
 effacefigure(fig);
 constfigure(aux);
 end;

{affichage de la vitesse et du niveau du jeu}
procedure stage(spped,level:integer);
 const ycoord=220;
 var ch:string;
 begin
 setfillstyle(1,0);
 bar(xaffichage,ycoord,xaffichage+50,ycoord+70);
 settextstyle(2,0,4);
 setcolor(yellow);
 outtextxy(xaffichage+1,ycoord+3,'VITESSE :');
 str(vitesse:2,ch);
 outtextxy(xaffichage+5,ycoord+25,ch);
 str(level:2,ch);
 outtextxy(xaffichage+1,ycoord+40,'NIVEAU :');
 outtextxy(xaffichage+5,ycoord+55,ch);
 end;

procedure  affichescore(score:integer);
 const ycoord=100;
 var ch:string;
 begin
 setcolor(yellow);
 settextstyle(2,0,4);
 setfillstyle(1,0);
 bar(xaffichage+1,ycoord,xaffichage+50,ycoord+45);
 outtextxy(xaffichage+5,ycoord+5,'SCORE :');
 str(score:5,ch);
 outtextxy(xaffichage+5,ycoord+17,ch);
 end;
{inititialisation des coordonn‚es d' une piece avant de commencer sa descente}
procedure initfigure(var aux:figure);
 var i,j:integer;
 begin
 aux.t[4,1].y:=grille[1,5].y;
 aux.t[4,1].x:=grille[1,5].x;
 for i:=4 downto 1 do
  begin
  for j:=2 to 4 do
   begin
   aux.t[i,j].x:=aux.t[i,j-1].x+dx;
   aux.t[i,j].y:=aux.t[i,1].y;
   end;
  if i>1 then
   begin
   aux.t[i-1,1].x:=aux.t[4,1].x;
   aux.t[i-1,1].y:=aux.t[i,1].y-dy;
   end;
  end;
 end;{fin}

 procedure level(indice:integer);
  var i,j:integer;
  begin
  randomize;
  if indice<>1 then
   for i:=rows downto (rows-indice) do
    for j:=1 to 6 do
     grille[i,1+random(10)].on:=true;
 end;


 procedure initgrille(ind:integer);
  var i,j:integer;
  begin
  for i:=1 to rows do
   for j:=1 to cols do
    grille[i,j].on:=false;
  grille[1,1].x:=300;grille[1,1].y:=100;
  for i:=1 to rows do
   begin for j:=2 to cols do
    begin
    grille[i,j].y:=grille[i,1].y;
    grille[i,j].x:=grille[i,j-1].x+dx;
    end;
    begin
    grille[i+1,1].x:=grille[1,1].x;
    grille[i+1,1].y:=grille[i,1].y+dy;
    end;
   end;
   level(ind);
  end;{fin}

 procedure affichedifficulte;
  const ycoord=290;
  begin
  setfillstyle(1,0);
  bar(xaffichage,ycoord,xaffichage+100,ycoord+50);
  setcolor(yellow);
  outtextxy(xaffichage+1,ycoord+5,'DIFFICULTE');
  if difficulte=expert then
   outtextxy(xaffichage+3,ycoord+18,'EXPERT')
   else outtextxy(xaffichage+5,ycoord+18,'DEBUTANT');
  end;

  procedure affichegrille;
   var i,j,a,b:integer;
   begin
   setcolor(green);
   setfillstyle(1,0);
   bar(grille[1,1].x,grille[1,1].y,grille[rows,cols].x,grille[rows,cols].y);
   setlinestyle(0,3,2);
   rectangle(grille[1,1].x-10,grille[1,1].y -7,grille[rows,cols].x+10,grille[rows,cols].y+7);
   setcolor(0);
   line(grille[1,1].x-dx,grille[1,1].y-dy,grille[1,cols].x+dx,grille[1,1].y-dy);
   setcolor(2);
   for i:=rows downto 1 do
    for j:=1 to cols do
     if grille[i,j].on then
      constbrique(grille[i,j].x-(dx div 2)+2,grille[i,j].y-(dy div 2)+2,grille[i,j].x+(dx div 2)-2,grille[i,j].y+(dy div 2)-2);
   end;
{vide le buffer du clavier}
Procedure ClearKbdBuffer;
Begin
  MemW[Seg0040:$001A] := MemW[Seg0040:$001C];
End;

procedure pause;
begin
settextstyle(2,0,4);
setcolor(0);
outtextxy(300,400,'PAUSE :APPUEZ SUR Z');
repeat
setcolor(random(2));
delay(500);
outtextxy(300,400,'POUR CONTINUER APPUYEZ SUR Z');
until keypressed;
setcolor(0);
outtextxy(300,400,'POUR CONTINUER APPUYEZ SUR Z');
setcolor(yellow);
outtextxy(300,400,'PAUSE :APPUEZ SUR Z');
ClearKbdBuffer
end;

{controle d' une piece lors de sa descente}
function tour(var piece:figure):boolean;
{tour=true si arret du jeu}
var test,fin,arret:boolean;
    tch:char;
    compteur:integer;
begin
fin:=false;
initfigure(piece);
constfigure(piece);
delay(100-vitesse*10);
repeat
compteur:=0;
clearkbdbuffer;
repeat
compteur:=compteur+1;
if keypressed then
 begin
 tch:=readkey;
 tch:= upcase(tch);
 if tch='Z' then pause
  else
   case tch of
    #72,#80,#75,#77: arret:=move(tch,piece);
    #27            :fin:=true;
    end;
   end;
  constfigure(piece);
  delay(100-vitesse*10);
  effacefigure(piece);
  until  fin or (not arret) or (compteur>8);
  if arret then
   begin
   effacefigure(piece);
   arret:=deplacebas(piece);
   constfigure(piece);
   delay(100-10*vitesse);
   end;
  effacefigure(piece);
  until fin or (not arret);
  tour:=fin;
 end;{fin}
{niveau expert  }
procedure niveauexpert;
 var a,b:boolean;
     i,j:integer;
 begin
 {on une rotation de la grille}
 for i:=1 to rows do
  begin
  a:=grille[i,1].on;
  grille[i,1].on:=grille[i,cols].on;
  for j:=1 to cols-1 do
   begin
   b:=grille[i,j+1].on;
   grille[i,j+1].on:=a;
   a:=b;
   end;
  end;
 setfillstyle(1,0);
 bar(grille[1,1].x-9,grille[1,1].y-6,grille[rows,cols].x+9,grille[rows,cols].y+6);

  affichegrille;
 end;{fin}

{boucle principale du jeu}
procedure partie;
 var point,i:integer;
     arret:boolean;
     piece,aux:figure;

 begin
 randomize;
 point:=0;  score:=0;
 affichescore(score);
 stage(vitesse,niveau);
 initgrille(niveau);
 affichegrille;
 nextfigure(aux);
 affichenext(aux);
repeat
piece:=aux;
arret:=tour(piece);
recordposition(piece);
affichegrille;
nextfigure(aux);
affichenext(aux);
 i:=effaceligne;
 point:=point+i;
 if i<>0 then
  begin
  score:=score+10*i;
  if i>=3 then
   score:=score+20;
  affichescore(score);
  if (point mod 20)=0 then
   begin
   vitesse:=vitesse+1;
   if (vitesse mod 2)=0 then
   niveau:=niveau+1;
   if vitesse>10 then
    vitesse:=10;
   if niveau>5 then
     niveau:=5;
   stage(vitesse,niveau);
   initgrille(niveau); affichegrille;
   score:=score+100;  affichescore(score);
   end;
  end;
  if difficulte=expert then
   niveauexpert;
 until arret or partieperdue;
end;{fin}

procedure menu(var choix:integer);
 const labele:array[1..7] of string=('NOUVEAU JEU','CHOIX DU NIVEAU +/-','CHOIX DE LA VITESSE +/-',
               'DIFFICULTE +/-', 'MEILLEUR SCORE','AIDE','QUITTER');
       xcoord=20; ycoord:array[1..7] of integer=(50,65,80,95,110,125,140);
 var i:integer;
     tch:char;
     arret:boolean;
 begin
 setfillstyle(2,blue);
 bar(10,40,200,180);
 setfillstyle(2,lightblue);
 bar(15,45,180,170);
 settextstyle(2,0,4);
 setcolor(lightgray);
 for i:=1 to 7 do
  outtextxy(xcoord,ycoord[i],labele[i]);
 setcolor(yellow);
 outtextxy(xcoord,ycoord[1],labele[1]);
 i:=1;
 arret:=false;
 repeat
  if keypressed then
   begin
   tch:=readkey;
   case tch of
 {enter}   #13:begin
               choix:=i;
               arret:=true;
               end;
 {echap}   #27:begin
               choix:=-1;
               arret:=true;
               end;
 {haut}    #72:begin
               i:=i-1;
               setcolor(lightgray);
               outtextxy(xcoord,ycoord[i+1],labele[i+1]);
               if i=0 then
                i:=7;
               setcolor(yellow);
               outtextxy(xcoord,ycoord[i],labele[i]);
               end;
 {bas}    #80:begin
               i:=i+1;
               setcolor(lightgray);
               outtextxy(xcoord,ycoord[i-1],labele[i-1]);
               if i=8 then
                i:=1;
               setcolor(yellow);
               outtextxy(xcoord,ycoord[i],labele[i]);
               end;
 {gauche}  #75,'-':case i of
                    2:begin
                      niveau:=niveau-1;
                      if niveau=0 then
                       niveau:=5;
                      stage(vitesse,niveau);
                      end;
                    3:begin
                      vitesse:=vitesse-1;
                      if vitesse=0 then
                       vitesse:=10;
                       stage(vitesse,niveau);
                      end;
                    4:begin
                      if difficulte=expert then
                       difficulte:=debutant
                        else difficulte:=expert;
                      affichedifficulte;
                      end;
                    end;

 {droite}   #77,'+':case i of
                    2:begin
                      niveau:=niveau+1;
                      if niveau=6 then
                       niveau:=1;
                      stage(vitesse,niveau);
                      end;
                    3:begin
                      vitesse:=vitesse+1;
                      if vitesse>=11 then
                       vitesse:=1;
                      stage(vitesse,niveau);
                      end;
                    4:begin
                      if difficulte=expert then
                       difficulte:=debutant
                        else difficulte:=expert;
                       affichedifficulte;
                      end;
                    end;
 end;{case}
 end;{if}
 until arret;
 end;{fin}

procedure aide;
 const path='aide.dat';
 var fichier:text;
     ch:string;
     y:integer;
     tch:char;
 begin
 setfillstyle(1,0);
 bar(0,0,640,460);
 assign(fichier,path);
 {$I-} reset(fichier); {$I+}
 if ioresult<>0 then
  begin
  outtextxy(100,100,'fichier introuvable');
  delay(2000);
  exit;
  end;
 y:=1;
 while not eof(fichier) do
  begin
  readln(fichier,ch);
  outtextxy(50,y,ch);
  y:=y+15;
  end;
 tch:='a';
 repeat
 if keypressed then
 tch:=readkey;
 until tch=#27;
 close(fichier);
 clrscr;
 end;

procedure enregistrerscore;
 const path='score.dat';
 var ch:longint;
     fichier:text;
 begin
 assign(fichier,path);
 {$I-} reset(fichier); {$I+}
 if ioresult=0 then
  begin
  readln(fichier,ch);
  ch:=ch div 15;
  if ch>score then
   begin
   close(fichier);
   rewrite(fichier);
   writeln(fichier,score*15,niveau*15,vitesse*15);
   end;
  end
  else begin
   rewrite(fichier);
   writeln(fichier,score*15,niveau*15,vitesse*15);
   end;
  close(fichier);
 end;{fin}

procedure lirescore;
 const path='score.dat';
 var fichier:text;
     sc,niv,vit:longint;
     a:string[10];
     tch:char;
 begin
 assign(fichier,path);
{$I-} reset(fichier);{$I+}
 if ioresult<>0 then
  begin
  sc:=0; niv:=1; vit:=1;
  end
  else begin
   readln(fichier,sc,niv,vit);
   sc:=sc div 15; niv:=niv div 15; vit:=vit div 15;
   close(fichier);
   end;
  clrscr;
  setfillstyle(2,blue);
  bar(0,0,640,420);
  setfillstyle(1,lightblue);
  bar(200,100,400,300);
  setcolor(yellow);
  outtextxy(250,101,'MEILLEUR SCORE');
  str(sc,a); outtextxy(201,115,'SCORE : '+a);
  str(niv,a); outtextxy(201,130,'NIVEAU : '+a);
  str(vit,a); outtextxy(201,140,'VITESSE : '+a);
  tch:='a';
  repeat
  if keypressed then
  tch:=readkey;
  until tch=#27;
  clrscr;
  end;{fin}

 procedure lejeu;
  var choix:integer;
  bool:boolean;
  fig:figure;
  begin
  setfillstyle(1,0);
  bar(0,0,640,460);
  score:=0;
  niveau:=1;
  vitesse:=1;
  choix:=8;
  difficulte:=debutant;
  settextstyle(2,0,4);
  setcolor(yellow);
  outtextxy(300,400,'PAUSE :APPUEZ SUR Z');
  repeat
   initgrille(1);
   affichegrille;
   affichescore(score);
   stage(vitesse,niveau);
   nextfigure(fig);
   affichenext(fig);
   affichedifficulte;
   menu(choix);
   case choix of
    1:begin
      partie;
      enregistrerscore;
      settextstyle(2,0,4);
      setcolor(yellow);
      setfillstyle(1,0);
      bar(grille[5,5].x,grille[5,5].y,grille[5,5].x+50,grille[5,5].y+10);
      outtextxy(grille[5,5].x+5,grille[5,5].y+1,'GAME OVER !');
      delay(2000);
      end;
    5:lirescore;
    6:aide;
    -1,7:begin
      setfillstyle(1,0);
      bar(0,0,640,460);
      setcolor(yellow);
      settextstyle(2,0,4);
      outtextxy(100,100,'ARRET DU JEU EN COURS ...');
      delay(1000);
      end;
    end;{case};
   setfillstyle(1,0);
   bar(0,0,640,460);
   until (choix=-1) or (choix=7);
  end;{fin}
procedure initgraphe(path:string);
var
 grDriver: Integer;
 grMode: Integer;
 ErrCode: Integer;
begin
 grDriver := Detect;
 InitGraph(grDriver, grMode,path);
 ErrCode := GraphResult;
 if ErrCode <> grOk then
   Writeln('Graphics error:', GraphErrorMsg(ErrCode));
end;


{le programme principal}

BEGIN
initgraphe('c:\tp7\bgi');
setfillstyle(1,0);
bar(0,0,640,420);
lejeu;
clrscr;
closegraph;
end.