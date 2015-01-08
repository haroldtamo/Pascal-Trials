program zodiaque;
type tdate = record
             jour: integer;
             mois:string;
             signe:string;
             end;
  date = array [1..12] of tdate=
                  (jour: 23; mois:'decembre';signe:'sagittaire'),
                  (jour:20; mois:'janvier'; signe:'capricorne'),
                  (jour:20;  mois:'fevrier'; signe:'verseau'),
                  (jour:21; mois:'mars'; signe:'poisson'),
                  (jour:20; mois:'avril'; signe:'b‚lier'),
                  (jour:21; mois:'mai';  signe:'taureau'),
                  (jour:21; mois:'juin'; signe:'g‚meau'),
                  ( jour:22;mois:'juillet';signe:'cancer'),
                  (jour:23;mois: 'aout';  signe:'lion'),
                  (jour:23;mois: 'septembre'; signe:'vierge'),
                  (jour:23; mois:'octobre';  signe: 'balance'),
                  (jour:22; mois : 'novembre'; signe:'scorpion);



var journ:integer;
    moisn:string[10];
    trouve:boolean;
    nbv,i:integer;

begin
write('donnez votre jour de naissance: ');
readln(journ);
write('donnez votre mois de naissance: ');
readln(moisn);

i:=0;
trouve:=false;
while(i<12) and not trouve do
  begin
  i:=i+1;
  if date[i]=moisn then trouve:=true;
  end;
  if trouve then
  begin write('vous etes n‚ sous le signe suivant: ');
  if (journ>=date[i].jour) then i:=(i+1) mod 12;
  writeln(date[i].signe);
  end
  else
  writeln('erreur de nom de mois');
  end;
  readln;
  end.
