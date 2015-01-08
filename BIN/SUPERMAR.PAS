program supermarche;
uses crt;
label 1;
const N=3;
type articles= record
                 CODE:integer;
                 march: string;
                 p_unit: integer;
                 nbre:integer;
                 p_total:integer;
                 end;
     tab=ARRAY[1..N] OF articles;
var  t:tab;i,a,w,pos,c,z,total:integer; trouve,x:string;

   begin
      clrscr;
     for i:=1 to N do
         begin
            t[i].nbre:=0;
         end;
     for i:=1 to N   do
         begin
            t[i].code:=i;
         end;
       i:=1;
       t[i].march:='lait';
       i:=i+1;
       t[i].march:='pain';
       i:=i+1;
       t[i].march:='oeufs';
       i:=1;
       t[i].p_unit:=450;
       i:=i+1;
       t[i].p_unit:=125;
       i:=i+1;
       t[i].p_unit:=75;
  write('code');
  write('marchandises':15);
  writeln('prix_unitaire':25);
  total:=0;
     for i:=1 to N do
         begin
            write(t[i].code);
            write(t[i].march:15);
            writeln(t[i].p_unit:25);
         end;
   writeln('combien de marchandises voulez-vous?');
     repeat
        readln(c)
     until (c>0) and (c<=N);
     for i:=1 to c do
         begin
1:         writeln('entrez le code de la marchandise que vous voulez');
           readln(a);
   trouve:='faux';
  while (t[i].code<>a) and (i<=N) do
  begin
  i:=i+1;
  end;
  if t[i].code=a then
  begin
  trouve:='vrai';
  pos:=i;
  writeln('combien de ',t[i].march,' voulez-vous');
  end
  else
  begin
  writeln('vous  avez entr‚ un code erron‚');
  goto 1;
  end;
  readln(w);
    if t[i].nbre<>0 then
      begin
      writeln('vous avez deja command‚ ', t[i].nbre , t[i].march);
      writeln('voulez vous ajoutez sur la commande pr‚c‚dente?');
      readln(x);
         if x='oui' then
            begin
            writeln('entrez la quantit‚ a ajouter');
            readln(z);
            t[i].nbre:=t[i].nbre+z;
            end;
         if x='non' then
            begin
         goto 1;
            end;
     end;
     if t[i].nbre=0 then
       begin
       t[i].nbre:=w;
       end;

  t[i].p_total:=t[i].nbre*t[i].p_unit;
   total:=total+t[i].p_total;
   end;
   clrscr;
   write('code');
   write('marchandise':10);
   write('prix_unitaire':10);
   write('quantit‚':10);
   writeln('prix_total':10);
   for i:=1 to N do
      begin
      write(t[i].code);
      write(t[i].march:10);
      write(t[i].p_unit:10);
      write(t[i].nbre:10);
      writeln(t[i].p_total:10);
      end;
      write('_________________________________________TOTAL ',total);
readln;
end.