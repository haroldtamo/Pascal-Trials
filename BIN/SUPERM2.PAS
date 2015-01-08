program supermarche;
uses crt;
label 1;
const N=5;
type articles= record
                 CODE:longint;
                 march: string;
                 p_unit: longint;
                 nbre:longint;
                 p_total:longint;
                 end;
     tab=ARRAY[1..N] OF articles;
var  t:tab;i,a,w,pos,c,z,k:integer;
     trouve,x:string;
     total:longint;

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
       i:=i+1;
       t[i].march:='basketball';
       i:=i+1;
       t[i].march:='T-shirt';
       i:=1;
       t[i].p_unit:=450;
       i:=i+1;
       t[i].p_unit:=125;
       i:=i+1;
       t[i].p_unit:=75;
       i:=i+1;
       t[i].p_unit:=69500;
       i:=i+1;
       t[i].p_unit:=4850;
  write('code');
  write('marchandises':15);
  writeln('prix_unitaire':25);
  total:=0;
     for i:=1 to N do
         begin
            write(t[i].code);
            write(t[i].march:15);
            writeln(t[i].p_unit:25);
            writeln('_______________________________________________');
         end;
          writeln('combien de marchandises voulez-vous?');
     repeat
             readln(c);
             if c>N then
             begin
             writeln('nous n''avons que ',N,' marchandises en stock');
             end;
             if c<0 then
             begin writeln('entrez un nombre positif');
             end;
     until (c>0) and (c<=N);
     k:=1;
     While k<=c do
         begin
1:         writeln('entrez le code de la marchandise que vous voulez');
           readln(a);
   trouve:='faux'; i:=1;
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
      writeln('vous avez deja command‚ ', t[i].nbre,'  ',t[i].march);
      writeln('voulez vous ajouter sur la commande pr‚c‚dente?');
      readln(x);
         if x='OUI' then
            begin
            t[i].nbre:=t[i].nbre+w;
            k:=k-1;
            total:=total- t[i].p_total;
            end;
         if x='NON' then
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
   k:=k+1;
   end;
   clrscr;
   write('code');
   write('marchandise':15);
   write('prix_unitaire':15);
   write('quantit‚':15);
   writeln('prix_total':15);
   for i:=1 to N do
      begin
      if  t[i].nbre<>0 then
      begin
      write(t[i].code);
      write(t[i].march:15);
      write(t[i].p_unit:15);
      write(t[i].nbre:15);
      writeln(t[i].p_total:15);
      end;
      end;
      write('___________________________________________________________________TOTAL ',total);
readln;
end.