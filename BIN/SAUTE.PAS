program saute;
uses crt;
const raquette='***';
   var x,y,spaceX,spaceY,i,j:integer;
       c:string;



begin
x:=1;y:=1;i:=1;j:=1;

repeat
gotoxy(x,y);
write('O');
gotoxy(1,1);
delay(100);

spaceX:=x;spaceY:=y;
gotoxy(spaceX,spaceY);
write(' ');

        if y=25 then  j:=-1
          else if y=1 then j:=1;

               if x=80 then i:=-1
                  else if x=1 then i:=1;
inc(x,i);inc(y,j);

until keypressed;
readln;
end.