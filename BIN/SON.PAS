program    song;
var n,i: integer;
begin
 writeln (' bonjour! nous vous fourssons ici une table de multiplication de' );
 write (' votre choix. quelle table desirez-vous?');
 readeln (n);
 for i:=1 to 12 do
  begin
    writeln(n,'x',i,'=',n*i);
  end;
end.