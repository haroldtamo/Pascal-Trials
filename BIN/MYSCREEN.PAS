unit myscreen;
{unit‚ contenant l' objet screen : l' ecran}
interface

const maxdataline=50;
const maxresultline=20;

type screen=object

             private

               x,y,height,width,fix:integer;
               cursor:byte;
               meme:real; {memoire}
               ydata, yresult, ystatus:integer;

             public

               exite:boolean;
               dataline:string[maxdataline];{ligne contenant les calcul
                                             ex: 2*sin(10) }
               resultline:string[maxresultline]; {ligne contenant le resultat}
               base:(bin,oct,dec,hex);{base dans laquelle sera ecrit
                                       le resultat du calcul }
               memory:(off,on);{indique si la memoire est utilis‚e}
               angle:(deg,grad,rad);

               constructor init(x1,y1,h,w :integer);
               procedure insert; {affiche l' ecran}
               procedure displaystatusline; {affiche la bar de status: bin-rad-...}
               procedure displayresultline;{affiche le resulta du calcul}
               procedure displaydataline;{affiche l' expression saisie par l' utilisateur}
               procedure add(ch:string); {ajoute un mot dataline}
               procedure deletes;
               procedure left;
               procedure right;
               procedure resultat; {le result du calcul courant}
               procedure clear;
               procedure setmemory(s:string);{s='on' ou 'off'}

             end;

implementation

uses graph,arithm;

 constructor screen.init(x1,y1,h,w:integer);
 begin
  x:=x1;
  y:=y1;
  width:=w;
  height:=h;
  ydata:=y1+5;
  yresult:=y1+20;
  ystatus:=y1+height-12;
  cursor:=1;
  exite:=false;
  memory:=off;
  angle:=rad;
  base:=dec;
  fix:=5;
 end;


 procedure screen.insert;
  begin
  setfillstyle(1,blue);
  bar (x-2,y-2,x+width+2,y+height+2);
  setfillstyle(1,lightblue);
  bar (x,y,x+width,y+height);
  setcolor(blue);
  line(x,y+height-2-10,x+width,y+height-2-10);
  end;


  procedure screen.displaystatusline;
   const t:array[1..3] of integer=(10,50,80);
   begin
   settextstyle(2,0,4);
   setcolor(yellow);

   if memory=on then
    outtextxy(x+2+t[1],ystatus,'mem')
   else
    begin
    setcolor(lightblue);
    outtextxy(x+2+t[1],ystatus,'mem')  ;
    end;
    setcolor(lightblue);
   outtextxy(x+2+t[2],ystatus,'þþþ');
   setcolor(yellow);
   case base of
     bin:outtextxy(x+2+t[2],ystatus,'bin');
     oct:outtextxy(x+2+t[2],ystatus,'oct');
     dec:outtextxy(x+2+t[2],ystatus,'dec');
     hex:outtextxy(x+2+t[2],ystatus,'hex');
   end;

   setcolor(lightblue);
   outtextxy(x+2+t[3],ystatus,'þþþþ');
   setcolor(yellow);
   case angle of
    deg:outtextxy(x+2+t[3],ystatus,'deg');
    grad:outtextxy(x+2+t[3],ystatus,'grad');
    rad:outtextxy(x+2+t[3],ystatus,'rad');
   end;
  end;


  procedure screen.displaydataline;
   const view=15;
   var debut,i,dx:byte;
       ch:string;
   begin
   i:=11;
   dx:=5;
   setfillstyle(1,blue);
   bar(x,y,x+width,ydata+18);
   debut:=(cursor div 15)*15;
   ch:='            ';
   settextstyle(2,0,6);
   setcolor(yellow);
   outtextxy(x+2+dx,ydata,ch);
   ch:=copy(dataline,debut,view);
   outtextxy(x+2+dx,ydata,ch);

   debut:=cursor mod 10;
   ch:='_';
   outtextxy(x+2+dx+(-1+debut)*i,ydata+2,ch);

   end;


   {remplace dans la chaine dataline M: la memoire par sa valeur}
   function replace(chaine,mot,remplace:string):string;
    var l,a:byte;
        c,cs:string[maxdataline];
    begin
    l:=length(chaine);
    a:=1;
    cs:='';
    while a<=l do
     begin
     if chaine[a]<>' ' then
       if chaine[a]<>'M' then
        cs:=cs+chaine[a]
       else
        begin
        cs:=cs+remplace;
        end;
        a:=a+1;
       end;
    replace:=cs;
   end;


   procedure screen.displayresultline;
    var ch1:string;
   begin
   setfillstyle(1,blue);
   bar(x,yresult+5,x+width,y+height-10);
   settextstyle(2,0,6);
   setcolor(yellow);
   ch1:='            ';
   outtextxy(x+2+1,yresult,ch1);
   ch1:=resultline;
   while length(ch1)<maxresultline do
    ch1:=' '+ch1;
   outtextxy(x+2+1,yresult,ch1);
  end;
  {ajoute un element sous forme de chaine dans dataline}
  procedure screen.add(ch:string);
   begin
   if (length(dataline)+length(ch))<maxdataline  then
      begin
      if dataline='' then
       dataline:=ch
      else
      dataline:=copy(dataline,1,cursor-1)+ch+copy(dataline,cursor,length(dataline));
    cursor:=cursor+length(ch);
    end;
   end;

  {efface le caractere courant de dataline}
   procedure screen.deletes;
    begin
    if dataline[cursor]<>'' then
     if dataline[cursor] in ['0'..'9'] then
      delete(dataline,cursor,1)
     else
      if (dataline[cursor]='(') and ((dataline[cursor-1] in ['a'..'z'])) then
        repeat
         delete(dataline,cursor,1);
         cursor:=cursor-1;
        until (not (dataline[cursor] in ['a'..'z'])) or (cursor<=0)

     else
      delete(dataline,cursor,1)
    end;

   {mouvement vers la droite du curseur}
    procedure screen.right;
     begin
     {if cursor<=length(dataline) then
      begin
      if dataline[cursor+1]in ['a'..'z'] then
       begin
       repeat
       if not(copy(dataline,cursor,1)='') then
        cursor:=cursor+1;
       until ((cursor+1)>length(dataline)) or (not (dataline[cursor] in ['a'..'z']));
       end
      else
      if not(copy(dataline,cursor,1)='') then }
      if cursor<=(length(dataline)) then
       cursor:=cursor+1;
   {end;}
  end;


  {mouvement vers la gauche du curseur}
 procedure screen.left;
 begin
 {if length(dataline)<>0 then
 if cursor>1 then
  if (dataline[cursor-1]='(') and (cursor>2)   then
   begin
   if (dataline[cursor-2] in ['a'..'z']) then
   repeat
    cursor:=cursor-1;
   until (not(dataline[cursor] in ['a'..'z'])) or (cursor<1)
   else
    cursor:=cursor-1
  end
  else }
  if cursor>1 then
   cursor:=cursor-1;
 end;


 procedure screen.resultat;
  var valeur:real;
      ch,ch2:string;
      i:integer;
  begin
  if dataline<>'' then
  begin
  dataline:=dataline;
  ch:=dataline;
  str(meme:1:5,ch2);
  ch:=replace(ch,'M',ch2);
   for i:=1 to length(ch) do
   if ch[i]=' ' then
    delete(ch,i,1);
   valeur:=resulte(ch+' ');
  if iserror then
   begin
   resultline:=geterrortype;
   cursor:=getcarcour;
   displaydataline;
   end
  else
   str(valeur:10:fix,resultline);
  end
 else
 resultline:='empty line';
  end;



 procedure screen.clear;
  begin
  dataline:='';
  cursor:=1;
  end;


 {conserve le resultat du calcul courant en memoire}
procedure screen.setmemory(s:string);
 var i:integer;
 begin
 if s='on' then
  begin
  resultat;
  val(resultline,meme,i);
  memory:=on;
  end
 else
 memory:=off;
 displaystatusline;
 end;

begin

end.
