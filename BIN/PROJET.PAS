program gl1a;
uses crt,ken;
const n=10;
      nc=11;
      time=1000;
      commandes:array[1..nc]of string=('ajouter','afficher','modifier','passe','supprimer','creer','changer','formater',
      'exit','rechercher','aide');
type string3=string[3];
     donnee=record
            num:1..n;
            nom:string;
            email:string;
            tel:string;
            anniv:record
                  jour:string;
                  mois:string3;
                  end;
            quartier:string;
            end;
     etudiant=array[1..n]of donnee;
     nums=array[1..n]of integer;
var classe:etudiant;
    t:donnee;
    nume:nums;
    f:file of etudiant;
    p,nb,aide:text;
    passe,motdepasse,commande:string;
    nbre,i,num:integer;
    compte:string;
{$I proc.pas}
procedure sauve;
begin
    assign(nb,'nombre.txt');
    rewrite(nb);
    write(nb,nbre);
    close(nb);
end;
Begin
    presentation;
    readln(commande);
    if commande='creer' then
      begin
          assign(p,'passe.txt');
          assign(nb,'nombre.txt');
          rewrite(p);
          rewrite(nb);
          readln(motdepasse);
          write(p,motdepasse);
          write(nb,nbre);
          close(p);
          close(nb);
      end;
    acces(compte);
    assign(nb,'nombre.txt');
    reset(nb);
    read(nb,nbre);
    close(nb);
    repeat
    console;
    case compte[1] of
    'a':begin
            readln(commande);
            minstr(commande);
            while commander=false do
              begin
                  writeln('Cette commande n''est pas valide');
                  console;
                  readln(commande);
                  minstr(commande);
              end;
            case commande[3] of
            'o','p','d','r':begin
                            if (nbre=n)and(commande='ajouter') then
                              writeln('on ne peut plus ajouter d''etudiants car la classe est pleine')
                            else
                            begin
                            if nbre=0 then
                              begin
                                  assign(f,'gl1a.txt');
                                  rewrite(f);
                                  modifierdonnee;
                                  write(f,classe);
                                  close(f);
                                  sauve;
                              end
                            else
                              begin
                                  assign(f,'gl1a.txt');
                                  reset(f);
                                  read(f,classe);
                                  close(f);
                                  modifierdonnee;
                                  rewrite(f);
                                  write(f,classe);
                                  close(f);
                                  sauve;
                              end;
                            end;
                        end;
            'f','c':begin
                        if nbre=0 then
                          writeln('la classe est vide')
                        else
                           begin
                               assign(f,'gl1a.txt');
                               reset(f);
                               read(f,classe);
                               close(f);
                               voir;
                           end;
                    end;
            's':modifierpasse(p);
            'a':acces(compte);
            end;
        end;
    'v':begin
            readln(commande);
            minstr(commande);
            while commander=false do
              begin
                  writeln('Cette commande n''est pas valide');
                  console;
                  readln(commande);
                  minstr(commande);
              end;
            case commande[2] of
            'j','u','o':begin
                            writeln('vous n''avez pas acces a cette commande');
                        end;
            'f','e':begin
                        if nbre=0 then
                          writeln('la classe est vide')
                        else
                           begin
                               assign(f,'gl1a.txt');
                               reset(f);
                               read(f,classe);
                               close(f);
                               voir;
                           end;
                    end;
            'h':acces(compte);
            'i':aides;

            end;
        end;
    end;
    until commande='exit';
End.