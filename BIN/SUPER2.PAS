program supermarche;
uses crt;
type articles= record
                 march: string;
                 code:  integer;
                 p_unit: integer
                 end;
  var i :integer;
begin
clrscr;
write('marchandises');
write('code':15);
writeln('prix unitaire':25);
for i:=1 to 9 do
begin
writeln(i:25);
end;
gotoxy(1,2);
write('pain');
writeln('125  Fcfa':50);
write('lait');
writeln('450  Fcfa':50);
write('oeuf');
writeln('75  Fcfa':50);
write('Savon macabo');
writeln('500  Fcfa':50);
write('Lait de toilette');
writeln('6475  Fcfa':50);
write('Balle de Basketball');
writeln('69500  Fcfa':50);
write(' Cl‚ USB 128Go');
writeln('105 000  Fcfa':50);
write('d‚tergent');
writeln('7800  Fcfa':50);
write('yaourts');
writeln('375  Fcfa':50);
write('serpillŠre');
writeln('1200  Fcfa':50);
readln;
end.




