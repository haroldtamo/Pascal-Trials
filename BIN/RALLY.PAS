program rally;
uses crt,graph;
const bloch=17;
      blocb=203;
      blocg=47;
      blocd=153;
type tableau=array[1..5]of integer;
     tab=array[1..5]of string;
var i,j,bx,by:tableau;
    tan,x,y,w,a,d:integer;
    time:longint;
    ch:array[1..5]of char;
    bal,b:array[1..5]of boolean;
    position,pos:tab;
function bloc(i,j:tableau;position:tab;tan:integer):boolean;
var bo:boolean;
    a,b:integer;
begin
    bo:=false;
    a:=1;
    for b:=1 to 5 do
      begin
          if b<>tan then
            begin
                case position[b][1] of
                'h':begin
                        case position[tan][1] of
                        'b':begin
                                if ((i[b]=i[tan]-12)and(j[b]>j[tan]-6))or((i[b]=i[tan]-6)and(j[b]>j[tan]-12))or
                                   ((i[b]=i[tan])and(j[b]>j[tan]-18))or
                                   ((i[b]=i[tan]+6)and(j[b]>j[tan]-12))or((i[b]=i[tan]+12)and(j[b]>j[tan]-6))then
                                   bo:=true;
                            end;
                        'h':begin
                                if ((i[b]=i[tan]-12)and(j[b]>j[tan]+12))or((i[b]=i[tan]-6)and(j[b]>j[tan]+18))or
                                   ((i[b]=i[tan])and(j[b]>j[tan]+12))or
                                   ((i[b]=i[tan]+6)and(j[b]>j[tan]+18))or((i[b]=i[tan]+12)and(j[b]>j[tan]+12))then
                                   bo:=true;
                            end;
                        'g':begin
                                if ((i[b]<i[tan]+12)and(j[b]=j[tan]-6))or((i[b]<i[tan]+6)and(j[b]=j[tan]-12))or
                                   ((i[b]<i[tan]+18)and(j[b]=j[tan]))or
                                   ((i[b]<i[tan]+18)and(j[b]=j[tan]+6))or((i[b]<i[tan]+12)and(j[b]=j[tan]+12))then
                                   bo:=true;
                            end;
                        'd':begin
                                if ((i[b]<i[tan]-6)and(j[b]=j[tan]-12))or((i[b]<i[tan]-12)and(j[b]=j[tan]-6))or
                                   ((i[b]<i[tan]-18)and(j[b]=j[tan]))or
                                   ((i[b]<i[tan]-12)and(j[b]=j[tan]+12))or((i[b]<i[tan]-18)and(j[b]=j[tan]+6))then
                                   bo:=true;
                            end;
                        end;
                    end;
                'b':begin
                        case position[tan][1] of
                        'b':begin
                                if ((i[b]=i[tan]-12)and(j[b]>j[tan]-12))or((i[b]=i[tan]-6)and(j[b]>j[tan]-18))or
                                   ((i[b]=i[tan])and(j[b]>j[tan]-12))or
                                   ((i[b]=i[tan]+6)and(j[b]>j[tan]-18))or((i[b]=i[tan]+12)and(j[b]>j[tan]-12))then
                                   bo:=true;
                            end;
                        'h':begin
                                if ((i[b]=i[tan]-12)and(j[b]>j[tan]+6))or((i[b]=i[tan]-6)and(j[b]>j[tan]+12))or
                                   ((i[b]=i[tan])and(j[b]>j[tan]+18))or
                                   ((i[b]=i[tan]+6)and(j[b]>j[tan]+12))or((i[b]=i[tan]+12)and(j[b]>j[tan]+6))then
                                   bo:=true;
                            end;
                        'g':begin
                                if ((i[b]<i[tan]+18)and(j[b]=j[tan]-6))or((i[b]<i[tan]+12)and(j[b]=j[tan]-12))or
                                   ((i[b]<i[tan]+18)and(j[b]=j[tan]))or
                                   ((i[b]<i[tan]+12)and(j[b]=j[tan]+6))or((i[b]<i[tan]+6)and(j[b]=j[tan]+12))then
                                   bo:=true;
                            end;
                        'd':begin
                                if ((i[b]<i[tan]-12)and(j[b]=j[tan]-12))or((i[b]<i[tan]-18)and(j[b]=j[tan]-6))or
                                   ((i[b]<i[tan]-18)and(j[b]=j[tan]))or
                                   ((i[b]<i[tan]-16)and(j[b]=j[tan]+12))or((i[b]<i[tan]-12)and(j[b]=j[tan]+6))then
                                   bo:=true;
                            end;
                        end;
                    end;
                'g':begin
                        case position[tan][1] of
                        'b':begin
                                if ((i[b]=i[tan]-12)and(j[b]>j[tan]-6))or((i[b]=i[tan]-6)and(j[b]>j[tan]-12))or
                                   ((i[b]=i[tan])and(j[b]>j[tan]-18))or
                                   ((i[b]=i[tan]+6)and(j[b]>j[tan]-18))or((i[b]=i[tan]+12)and(j[b]>j[tan]-12))then
                                   bo:=true;
                            end;
                        'h':begin
                                if ((i[b]=i[tan]-12)and(j[b]>j[tan]+6))or((i[b]=i[tan]-6)and(j[b]>j[tan]+12))or
                                   ((i[b]=i[tan])and(j[b]>j[tan]+18))or
                                   ((i[b]=i[tan]+6)and(j[b]>j[tan]+18))or((i[b]=i[tan]+12)and(j[b]>j[tan]+12))then
                                   bo:=true;
                            end;
                        'g':begin
                                if ((i[b]<i[tan]+18)and(j[b]=j[tan]-6))or((i[b]<i[tan]+12)and(j[b]=j[tan]-12))or
                                   ((i[b]<i[tan]+12)and(j[b]=j[tan]))or
                                   ((i[b]<i[tan]+18)and(j[b]=j[tan]+6))or((i[b]<i[tan]+12)and(j[b]=j[tan]+12))then
                                   bo:=true;
                            end;
                        'd':begin
                                if ((i[b]<i[tan]-6)and(j[b]=j[tan]-12))or((i[b]<i[tan]-12)and(j[b]=j[tan]-6))or
                                   ((i[b]<i[tan]-18)and(j[b]=j[tan]))or
                                   ((i[b]<i[tan]-6)and(j[b]=j[tan]+12))or((i[b]<i[tan]-12)and(j[b]=j[tan]+6))then
                                   bo:=true;
                            end;
                        end;
                    end;
                'd':begin
                        case position[tan][1] of
                        'b':begin
                                if ((i[b]=i[tan]-12)and(j[b]>j[tan]-12))or((i[b]=i[tan]-6)and(j[b]>j[tan]-18))or
                                   ((i[b]=i[tan])and(j[b]>j[tan]-18))or
                                   ((i[b]=i[tan]+6)and(j[b]>j[tan]-12))or((i[b]=i[tan]+12)and(j[b]>j[tan]-6))then
                                   bo:=true;
                            end;
                        'h':begin
                                if ((i[b]=i[tan]-12)and(j[b]>j[tan]+12))or((i[b]=i[tan]-6)and(j[b]>j[tan]+18))or
                                   ((i[b]=i[tan])and(j[b]>j[tan]+18))or
                                   ((i[b]=i[tan]+6)and(j[b]>j[tan]+12))or((i[b]=i[tan]+12)and(j[b]>j[tan]+6))then
                                   bo:=true;
                            end;
                        'g':begin
                                if ((i[b]<i[tan]+12)and(j[b]=j[tan]-6))or((i[b]<i[tan]+6)and(j[b]=j[tan]-12))or
                                   ((i[b]<i[tan]+18)and(j[b]=j[tan]))or
                                   ((i[b]<i[tan]+12)and(j[b]=j[tan]+6))or((i[b]<i[tan]+6)and(j[b]=j[tan]+12))then
                                   bo:=true;
                            end;
                        'd':begin
                                if ((i[b]<i[tan]-12)and(j[b]=j[tan]-12))or((i[b]<i[tan]-18)and(j[b]=j[tan]-6))or
                                   ((i[b]<i[tan]-12)and(j[b]=j[tan]))or
                                   ((i[b]<i[tan]-12)and(j[b]=j[tan]+12))or((i[b]<i[tan]-18)and(j[b]=j[tan]+6))then
                                   bo:=true;
                            end;
                        end;
                    end;
                end;
            end;
      end;
    bloc:=bo;
end;

procedure initgraphe;
var a,b:integer;
begin
    a:=detect;
    initgraph(a,b,' ');
    if graphresult<>grOK then
       begin
           writeln(' erreur graphique');
           halt(1);
       end;
end;
procedure tank(var i,j:integer);
begin
    bar(i-9,j-3,i-3,j+9);
    bar(i-3,j-9,i+3,j+3);
    bar(i+3,j-3,i+9,j+9);
end;
procedure fenetre_de_jeu;
begin
    rectangle(blocg,bloch,blocd,blocb);
end;
procedure efface_precedent(i,j:integer;position:string);
begin
    setfillstyle(1,0);
    case position[1] of
    'h':begin
            bar(i-9,j-3,i-3,j+9);
            bar(i-3,j-9,i+3,j+3);
            bar(i+3,j-3,i+9,j+9);
        end;
    'b':begin
            bar(i-9,j-9,i-3,j+3);
            bar(i-3,j-3,i+3,j+9);
            bar(i+3,j-9,i+9,j+3);
        end;
    'd':begin
            bar(i-9,j-9,i+3,j-3);
            bar(i-3,j-3,i+9,j+3);
            bar(i-9,j+3,i+3,j+9);
        end;
    'g':begin
            bar(i-3,j-9,i+9,j-3);
            bar(i-9,j-3,i+3,j+3);
            bar(i-3,j+3,i+9,j+9);
        end;
    end;
end;
procedure droite(var i,j,tan:integer;var position:string;f,g:tableau;posi:tab);
begin
    if position='droite' then
       inc(i,6);
    if (i>=blocd-12)or(bloc(f,g,posi,tan)=true) then
       dec(i,6);
    bar(i-9,j-9,i+3,j-3);
    bar(i-3,j-3,i+9,j+3);
    bar(i-9,j+3,i+3,j+9);
    position:='droite';
end;
procedure gauche(var i,j,tan:integer;var position:string;f,g:tableau;posi:tab);
begin
    if position='gauche' then
       dec(i,6);
    if (i<=blocg+12)or(bloc(f,g,posi,tan)=true) then
       inc(i,6);
    bar(i-3,j-9,i+9,j-3);
    bar(i-9,j-3,i+3,j+3);
    bar(i-3,j+3,i+9,j+9);
    position:='gauche';
end;
procedure haut(var i,j,tan:integer;var position:string;f,g:tableau;posi:tab);
begin
    if position='haut' then
       dec(j,6);
    if (j<=bloch+12)or(bloc(f,g,posi,tan)=true) then
       inc(j,6);
    bar(i-9,j-3,i-3,j+9);
    bar(i-3,j-9,i+3,j+3);
    bar(i+3,j-3,i+9,j+9);
    position:='haut';
end;
procedure bas(var i,j,tan:integer;var position:string;f,g:tableau;posi:tab);
begin
    if position='bas' then
       inc(j,6);
    if (j>=blocb-12)or(bloc(f,g,posi,tan)=true) then
       dec(j,6);
    bar(i-9,j-9,i-3,j+3);
    bar(i-3,j-3,i+3,j+9);
    bar(i+3,j-9,i+9,j+3);
    position:='bas';
end;
procedure change(var i,j,tan:integer; var position:string;ch:char;f,g:tableau;posi:tab);
begin
    efface_precedent(i,j,position);
    setfillstyle(1,15);
    case ch of
    #72:haut(i,j,tan,position,f,g,posi);
    #80:bas(i,j,tan,position,f,g,posi);
    #77:droite(i,j,tan,position,f,g,posi);
    #75:gauche(i,j,tan,position,f,g,posi);
    end;
end;
procedure apparition(var i,j:integer);
const apo:array[1..2]of integer=(bloch+12,blocb-12);
      apa:array[1..2]of integer=(blocg+12,blocd-12);
var x,y:integer;
begin
    x:=random(2);
    y:=random(2);
    i:=apa[x+1];
    j:=apo[y+1];
end;
procedure  hazard(var ch:char);
var a:integer;
begin
    a:=random(5);
    case a of
    0:ch:=#72;
    1:ch:=#80;
    2:ch:=#77;
    3:ch:=#75;
    4:ch:=#13;
    end;
end;
procedure balle(var bx,by:integer);
begin
    bar(bx-3,by-3,bx+3,by+3);
end;
procedure efface_balle(bx,by:integer);
begin
    setfillstyle(1,0);
    balle(bx,by);
end;
function rencontre(var i,j:tableau;bx,by,a:integer;position:tab):boolean;
var b:boolean;
begin
    b:=false;
    a:=1;
    while (a<=5)and(b=false) do
      begin
          case position[a][1] of
          'd':begin
                  if((bx in[i[a]-9..i[a]+3])and(by in[j[a]-9..j[a]-3]))or((bx in[i[a]-3..i[a]+9])and(by in[j[a]-3..j[a]+3]))or
                    ((bx in[i[a]-9..i[a]+3])and(by in[j[a]+3..j[a]+9]))then
                    b:=true;
              end;
          'g':begin
                  if((bx in[i[a]-3..i[a]+9])and(by in[j[a]-9..j[a]-3]))or((bx in[i[a]-9..i[a]+3])and(by in[j[a]-3..j[a]+3]))or
                    ((bx in[i[a]-3..i[a]+9])and(by in[j[a]+3..j[a]+9]))then
                    b:=true;
              end;
          'h':begin
                  if((bx in[i[a]-9..i[a]-3])and(by in[j[a]-3..j[a]+9]))or((bx in[i[a]-3,i[a]+3])and(by in[j[a]-9,j[a]+3]))or
                    ((bx in[i[a]+3..i[a]+9])and(by in[j[a]-3..j[a]+9]))then
                    b:=true;
              end;
          'b':begin
                  if((bx in[i[a]-9..i[a]-3])and(by in[j[a]-9..j[a]+3]))or((bx in[i[a]-3..i[a]+3])and(by in[j[a]-3..j[a]+9]))or
                    ((bx in[i[a]+3..i[a]+9])and(by in[j[a]-9..j[a]+3]))then
                    b:=true;
              end;
          end;
          inc(a);
      end;
    rencontre:=b;
end;
function arret(var bx,by,a:integer;i,j:tableau;position:tab):boolean;
var b:boolean;
begin
    b:=false;
    if ((bx in[blocg+6..blocd-6])and(by in[bloch+6..blocb-6]))then
       b:=true;
  {  if (rencontre(i,j,bx,by,a,position)=true)then;
       b:=false;   }
    arret:=b;
end;
procedure viser(b:boolean;pos:string;var bx,by,a:integer;i,j:tableau;position:tab);
begin
    efface_balle(bx,by);
    case pos[1] of
    'h':dec(by);
    'b':inc(by);
    'd':inc(bx);
    'g':dec(bx);
    end;
    setfillstyle(1,4);
    balle(bx,by);
    if arret(bx,by,a,i,j,position)=false then
      efface_balle(bx,by);
end;
begin
initgraphe;
randomize;
i[1]:=100;
j[1]:=110;
tan:=1;
fenetre_de_jeu;
tank(i[1],j[1]);
position[1]:='haut';
position[2]:='haut';
apparition(i[tan+1],j[tan+1]);
repeat
{     if tan<4 then
       apparition(i[tan+1],j[tan+1]);
     for d:= 2 to tan+1 do
     begin}
     if time mod 10000=0 then
       begin
           hazard(ch[tan+1]);  x:=tan+1;
           case ch[tan+1] of
           #77,#72,#75,#80:change(i[tan+1],j[tan+1],x,position[tan+1],ch[tan+1],i,j,position);
           #13:begin
                   if bal[tan+1]=false then
                    begin
                        pos[tan+1]:=position[tan+1];
                        bal[tan+1]:=true;
                        case pos[tan+1][1] of
                        'g':begin bx[tan+1]:=i[tan+1]-15;by[tan+1]:=j[tan+1];end;
                        'h':begin by[tan+1]:=j[tan+1]-15;bx[tan+1]:=i[tan+1];end;
                        'b':begin by[tan+1]:=j[tan+1]+15;bx[tan+1]:=i[tan+1];end;
                        'd':begin bx[tan+1]:=i[tan+1]+15;by[tan+1]:=j[tan+1];end;
                        end;
                    end;
               end;
           end;
       end;
 {    end;      }
     for w:=1 to tan+1 do
     begin
     b[w]:=arret(bx[w],by[w],a,i,j,position);
{     if a=w then
     begin      }
     if b[w]=false then
       bal[w]:=false;
{     end;    }
     if (bal[w]=true)and(time mod 300=0) then
       viser(b[w],pos[w],bx[w],by[w],a,i,j,position);
     end;
     if keypressed then
       begin
           ch[1]:=readkey;   y:=1;
           case ch[1] of
           #27:halt(1);
           #80,#72,#77,#75:change(i[1],j[1],y,position[1],ch[1],i,j,position);
           #13:begin
                   if bal[1]=false then
                    begin
                        pos[1]:=position[1];
                        bal[1]:=true;
                        case pos[1][1] of
                        'g':begin bx[1]:=i[1]-15;by[1]:=j[1];end;
                        'h':begin by[1]:=j[1]-15;bx[1]:=i[1];end;
                        'b':begin by[1]:=j[1]+15;bx[1]:=i[1];end;
                        'd':begin bx[1]:=i[1]+15;by[1]:=j[1];end;
                        end;
                    end;
               end;
           'p':begin
                   repeat
                   setcolor(15);
                   outtextxy(200,250,'appuyer sur p');
                   until keypressed;
                   setcolor(0);
                   outtextxy(200,250,'appuyer sur p');
              end;
           end;
       end;
{     if tan<4 then
       inc(tan,1);     }
     inc(time,100);
     delay(10);
until ch[1]=#27;
readln;
end.