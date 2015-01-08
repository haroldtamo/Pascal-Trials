program rebours;
uses crt;
var i:1..25; c:char;
procedure patientez;
begin
clrscr;
repeat
gotoxy(40,12);
writeln('Veuillez patienter');
writeln;
writeln;
write('       ',i);
gotoxy(1,1);
delay(1000);
clrscr;
i:=i-1;
until(i=0) or keypressed;
end;

   begin
    clrscr;
        i:=25;
     window(30,9,60,20);
     repeat
     writeln('appuyez h pour');
     writeln(' lancer le ');
     writeln('telechargement');
     gotoxy(1,1);
     c:=readkey;
     until((c)='h');
     patientez;
end.