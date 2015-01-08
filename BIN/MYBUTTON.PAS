
unit mybutton;
{contient l' objet button et ses deriv‚s}

interface

uses crt,graph,myscreen,mymouse;

type pscreen=^screen;

type button=object

              private

               x,y,dx,dy:integer;
               color:byte;
               name:string[5];

              public

               constructor init(bx,by:integer;s:string);
               function onmouseover:boolean;
               function onmouseout:boolean;
               function onclick:boolean;
               procedure handle;virtual;{definit l' action … executer
                                         quand on click sur un bouton}
               procedure insert;{affiche un bouton}
               destructor done;virtual;

             end;


{definit l' ecran et la souris avec lesquels les boutons vont interagir}
procedure mybuttoninit(var e:pscreen;m:mouse);

{les objets deriv‚s}

{boutons dont l' action est d' afficher un mot: '1' '2' 'sin' ...}
type bdigit=object(button)
             constructor init(bx,by:integer;s:string);
             procedure handle;virtual;
             private
              value:string[5];
            end;


{bouton dont l' action est d' effacer l' ecran}
type bclear=object(button)
             procedure handle;virtual;
            end;

 {permet de conserver le resultat d' un calcul en memoire}
type bmemory=object(button)
             procedure handle;virtual;
            end;

{bouton dont l' action est de sauver les calculs dans un fichier}
type bsave=object(button)
             procedure handle;virtual;
            end;

{pour quitter le programme}
type bexit=object(button)
             procedure handle;virtual;
            end;

{l' action est d' executer les calculs}
type benter=object(button)
             procedure handle;virtual;
            end;

{mouvement du curseur}
type bmove=object(button)
             procedure handle;virtual;
            end;

{about the author: … propos de l' auteur de ce programme}
type babout=object(button)
               procedure handle;virtual;
               end;

implementation

const colorout=white;
       coloron=yellow;
var bscreen:pscreen;
    bmouse:mouse;

constructor button.init(bx,by:integer;s:string);
 begin
 x:=bx;
 y:=by;
 name:=s;
 color:=colorout;
 dx:=18;
 dy:=10;
 end;

 procedure button.handle; {virtuel pur}
 begin
 end;

function button.onmouseover:boolean;
 begin
 if (bmouse.getx>=(x-dx)) and (bmouse.getx<=(x+dx)) then
   if (bmouse.gety>=(y-dy)) and (bmouse.gety<=(y+dy)) then
    begin
    onmouseover:=true;
    color:=coloron;
    insert;
    end
   else
    onmouseover:=false
   else
    onmouseover:=false;
end;

function button.onmouseout:boolean;
 begin
 if not onmouseover then
  begin
  color:=colorout;
  onmouseout:=true;
  end
 else
  onmouseout:=false;
end;


function  button.onclick:boolean;
 begin
 if onmouseover and bmouse.click then
  begin
  onclick:=true;
  handle ;
  delay(400);
  color:=colorout;
  insert;
   end
   else
  onclick:=false;
 end;


procedure button.insert;
begin
bmouse.hide;
settextstyle(2,0,4);
setcolor(color);
setfillstyle(1,blue);
bar(x-dx,y-dy,x+dx,y+dy);
setfillstyle(1,lightblue);
bar(x-dx,y-dy,x+dx-2,y+dy-2);
outtextxy(x-dx+5,y-dy+1,name);
bmouse.display;
end;


destructor button.done;
 begin
 end;

{implementation des objets deriv‚s}


procedure mybuttoninit(var e:pscreen; m:mouse);
 begin
 bscreen:=e;
 bmouse:=m;
 end;

constructor bdigit.init(bx,by:integer;s:string);
 begin
 button.init(bx,by,s);
 value:=s;
end;

procedure bdigit.handle;
 begin
 bscreen^.add(value);
 bscreen^.displaydataline;
 end;


procedure bclear.handle;
 begin
 if name='DEL' then
  bscreen^.deletes
 else
  bscreen^.clear;
 bscreen^.displaydataline;
 end;


procedure bmemory.handle;
begin
if name='M' then
 bscreen^.setmemory('on')
else
 if name='RM' then
  bscreen^.add('M')
 else
  bscreen^.setmemory('off');
bscreen^.displaydataline;
end;


procedure benter.handle;
 begin
 bscreen^.resultat;
 bscreen^.displayresultline;
end;


procedure bmove.handle;
 begin
 if name='<-' then
  bscreen^.left
 else
  bscreen^.right;
 bscreen^.displaydataline;
 end;


procedure bexit.handle;

 begin
 bscreen^.exite:=true;
 end;


procedure bsave.handle;
{lire le nom du fichier}
function readname:string;
 var ch:string[14];
     c:char;
     xa,ya,dy,dx:integer;
 BEGIN
 xa:=200;
 ya:=400;
 dy:=30;
 dx:=150;
 setfillstyle(1,red);
 bar(xa,ya,xa+dx,ya+dy);
 setfillstyle(1,0);
 bar(xa+2,ya+2,xa+dx-2,ya+dy-2);
 settextstyle(2,0,5);
 setcolor(yellow);
 outtextxy(xa-dx-20,ya+5,' enter the file name :');
 ch:='';
 repeat
  if keypressed then
   begin
   c:=readkey;
   case c of
        'a'..'z','A'..'Z','0'..'9','-','.','\':begin
                                       ch:=ch+upcase(c);
                                      bar(xa+2,ya+2,xa+dx-2,ya+dy-2);
                                       outtextxy(xa+15,ya+5,ch);
                                       end;
        {efface} #8:begin
                    ch:=copy(ch,1,length(ch)-1);
                    bar(xa+2,ya+2,xa+dx-2,ya+dy-2);
                    outtextxy(xa+15,ya+5,ch);
                    end;
   end;
  end;
 until c=#13;  {enter}
 setcolor(0);
 outtextxy(xa-dx-20,ya+5,' enter the file name :');
  bar(xa-dx-10,ya-10,xa+dx+20,ya+dy+20);
 readname:=ch;
end;

var filename:string;
    f:text;
 begin

filename:=readname;

if filename<>'' then
begin
{$I-}
assign(f,filename);
 append(f);
if ioresult<>0 then
 rewrite(f);
 writeln(f,'           ****************************************');
 writeln(f,'           *                                      *');
 writeln(f,'           *        mycalc 1.0 by kpizingui darryl*');
 writeln(f,'           *                 ENJOY !              *');
 writeln(f,'           *          nobi_8@hotmail.com          *');
 writeln(f,'           ****************************************');
 writeln(f);
 writeln(f);
 writeln(f);
{$I+}
writeln(f,'expression: ',bscreen^.dataline );
writeln(f,'result : ',bscreen^.resultline);
writeln(f);
writeln(f);
close(f);
end;
end;

procedure babout.handle;
 begin
bscreen^.dataline:='by kpizingui darryl';
bscreen^.resultline:='nobi_8@hotmail.com';
bscreen^.displayresultline;
bscreen^.displaydataline;
end;


begin
end.




