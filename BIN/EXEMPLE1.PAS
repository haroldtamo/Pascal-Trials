program exemple13;
uses crt,dos;
var f:text;
s: string;
begin
assign(f, 'c:/autoexec.bat');
reset(f);
writeln('affichzge du contenu du fichier AUTOEXEC.BAT:');
repeat
readln(f,s);
writeln(s);
until eof(f);
readln;
end.