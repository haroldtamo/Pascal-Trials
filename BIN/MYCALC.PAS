{                    *********************************************
                     **            Mycalc 1.0                   **
                     **   @ Un programme de kpizingui darryl @  **
                     **       nobi_8@hotmail.com                **
                     **  Une calculatrice scientifique basique  **
                     **                                         **
                     *********************************************

}

program mycalc_1_0;


uses graph, crt, myscreen, mybutton, mymouse, showbmp;

 var ecran:pscreen;
    souris:mouse;
    bouton:benter;
    mode,pilote,i:integer;

const dim=45;
var tab:array[1..dim] of ^button;

{remplissage des touches de la calculatrice dans le tableau tab}
 procedure charges;
 var pdigit:^bdigit;
    penter:^benter;
    pmove:^bmove;
    pmemory:^bmemory;
    pclear:^bclear;
    psave:^bsave;
    pexit:^bexit;
    pabout:^babout;

const name:array[1..24] of string[10]=
          ('7',  '8', '9',   '(',    ')' ,   '+'
           ,'4', '5', '6',   'sin(', 'cos(', '-'
           ,'1', '2', '3',   '^', 'û(' ,'*'
           ,'0', '.', 'abs(', 'ln(', 'exp(', '/'
           );


  var i,j,k:integer;
      debutx,debuty:integer;
      dx,dy:integer;

begin

debutx:=150;
debuty:=200;
dx:=50; dy:=30;
k:=1;

for i:=1 to 4 do
 for j:=1 to 6 do
  begin
  new(pdigit,init(debutx +dx*(j-1),debuty+dy*(i-1),name[k]));
  tab[k]:=pdigit;
  k:=k+1;
  end;
i:=25;

new(pmemory,init(debutx,debuty-dy,'M'));
tab[i]:=pmemory;
inc(i);

new(pmemory,init(debutx+dx,debuty-dy,'RM'));
tab[i]:=pmemory;
inc(i);

new(pmemory,init(debutx+2*dx,debuty-dy,'MCL'));
tab[i]:=pmemory;
inc(i);

new(pmove,init(debutx+3*dx,debuty-dy,'<-'));
tab[i]:=pmove;
inc(i);

new(pmove,init(debutx+4*dx,debuty-dy,'->'));
tab[i]:=pmove;
inc(i);

new(pclear,init(debutx+5*dx,debuty-dy,'DEL'));
tab[i]:=pclear;
inc(i);

new(pclear,init(debutx+6*dx,debuty-dy,'CLR'));
tab[i]:=pclear;
inc(i);
new(penter,init(debutx+dx*6,debuty+dy*3,'RUN'));
tab[i]:=penter;
inc(i);
new(psave,init(debutx+dx*6,debuty+dy*2,'SAVE'));
tab[i]:=psave;
inc(I);
new(Pexit,init(debutx+dx*6,debuty+dy,'EXIT'));
tab[i]:=pexit;
inc(i);
new(pabout,init(debutx+6*dx,debuty,'ABOUT'));
tab[i]:=pabout;
inc(i);
end;


procedure decharge;
var i:integer;
begin
for i:=1 to dim do
 if tab[i]<>nil then
  dispose(tab[i],done);
end;



                       {corps du program}


BEGIN

{inititqlisqtion du mode grqphique}
mode:=detect;
pilote:=0;
initgraph(mode,pilote,'c:\tp7\bgi');
cleardevice;

{initialisation de l' ecran}
new(ecran,init(200,50,50,200));
mybuttoninit(ecran,souris);
ecran^.insert;
ecran^.dataline:='';
ecran^.displaydataline;
ecran^.displaystatusline;
souris.display;

{insertion des digit;}
charges;
for i:=1 to dim do
 if tab[i]<>nil then
  begin
  tab[i]^.insert;
  end;

 {affiche du logo du createur}
 pbmp('logo.bmp',150,330);

repeat

if souris.click then
begin
for i:=1 to dim do
 if tab[i]<>nil then
  tab[i]^.onclick;
end;

until ecran^.exite;
{on libere les ressources}
decharge;

closegraph;

end.
