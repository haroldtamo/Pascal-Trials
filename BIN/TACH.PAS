program multi;
 uses crt;
  var i,j,c:integer;
 begin
  clrscr;
  gotoxy(14,2);textbackground(10);
 writeln('Ce program fait la table de muti');
  writeln;writeln;
  writeln('Entree un nombre');
   readln(j);
    for i:=1 to 12 do
   begin
    c:=j*i;
   writeln(c:5,'  =  ',i,'  *  ',j);writeln;
   writeln;
   end;
   readln;
  end.