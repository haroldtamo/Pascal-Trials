procedure presentation;
begin
    clrscr;
    writeln('Bienvenue dans le projet de Ken Master');
end;
procedure classer(var classe:etudiant);
var val:donnee;
    va:integer;
begin
    va:=nbre;
    repeat
        i:=0;
        repeat
             inc(i);
             if classe[i].nom>classe[i+1].nom then
               begin
                   val:=classe[i];
                   classe[i]:=classe[i+1];
                   classe[i+1]:=val;
               end;
        until i=va;
        dec(va);
    until va=0;
    for i:=1 to nbre do
      classe[i].num:=i;
end;
procedure nouveau(var classe:etudiant;var nbre:integer);
var new:donnee;
begin
    inc(nbre);
    with new do
      begin
          num:=nbre;
          write('Entrez le nom du nouvel etudiant: ');
          readln(nom);
          majstr(nom);
          write('Entrez l''E-mail de ',nom,': ');
          readln(email);
          write('Entrez le numero de telephone de ',nom,': ');
          readln(tel);
          writeln('Entrez la date d''anniversaire de ',nom,': ');
          with anniv do
            begin
                write('Entrez son jour de naissance: ');
                readln(jour);
                write('Entrez son mois de naissance: ');
                readln(mois);
            end;
          write('Entrez le nom du quartier de ',nom,': ');
          readln(quartier);
      end;
    classe[nbre]:=new;
    classer(classe);
end;
function search(nom:string;var num:integer):boolean;
var b:boolean;
    j:integer;
begin
    j:=1;
    while (nom<>classe[j].nom)and(j<=nbre) do
      inc(j);
    if nom=classe[j].nom then
      begin
          b:=true;
          num:=j;
      end
    else b:=false;
    search:=b;
end;
procedure supprime;
var nom,info:string;
begin
    repeat
    writeln('De quel information disposez vous pour supprimer un etudiant nom\numero?');
    repeat
    writeln('l''information doit etre son nom complet ou son numero');
    writeln('si vous ne maitrisez pas l''ecriture du nom allez regarder le numero correspondant');
    readln(info);
    minstr(info);
    until (info='numero')or(info='nom')or(info='aide')or(info='annuler');
    case info[2] of
    'u':begin
            write('entrez le numero de l''etudiant a supprimer: ');
            readln(num);
            while (num<0)or(num>nbre) do
              begin
                  writeln('il y a ',nbre,' etudiant dans la classe');
                  readln(num);
              end;
            if num<nbre then
              begin
                  for i:= num to nbre do
                    begin
                        classe[i]:=classe[i+1];
                        classe[i].num:=i;
                    end;
              end;
            dec(nbre);
        end;
    'o':begin
            writeln('Entrez le nom complet de l''etudiant a supprimer');
            readln(nom);
            majstr(nom);
            while search(nom,num)=false do
              begin
                  writeln('Cet etudiant n''est pas dans la classe');
                  readln(nom);
                  majstr(nom);
              end;
              if num<nbre then
                begin
                    for i:= num to nbre do
                      begin
                          classe[i]:=classe[i+1];
                          classe[i].num:=i;
                      end;
                end;
            classe[nbre+1]:=t;
            dec(nbre);
        end;
    'i':begin
            writeln('pour annuler la suppression, saississez "annuler"');
            readln;
        end;
    end;
    until info='annuler';
end;
procedure modi;
var reponse:char;
begin
    with classe[num] do
      begin
          writeln('voulez-vous modifier le nom de ',nom,'o\n?');
          readln(reponse);
          min(reponse);
          if reponse='o' then
            begin
                write('entrez le nouveau nom de ',nom);
                readln(nom);
            end;
          writeln('voulez-vous modifier l''E-mail de ',nom,'o\n?');
          readln(reponse);
          min(reponse);
          if reponse='o' then
            begin
                write('entrez le nouveau E-mail de ',nom);
                readln(email);
            end;
          writeln('voulez-vous modifier le numero de telephone de ',nom,'o\n?');
          readln(reponse);
          min(reponse);
          if reponse='o' then
            begin
                write('entrez le nouveau numero de ',nom,': ');
                readln(tel);
            end;
          writeln('voulez-vous modifier la date de naissance de ',nom,'o\n?');
          readln(reponse);
          min(reponse);
          if reponse='o' then
            begin
                with anniv do
                  begin
                     write('entrez le nouveau jour de naissance de ',nom,': ');
                     readln(jour);
                     write('entrez le mois de naissance de ',nom,': ');
                     readln(mois);
                  end;
            end;
          writeln('voulez-vous modifier le quartier de ',nom,'o\n?');
          readln(reponse);
          min(reponse);
          if reponse='o' then
            begin
                write('entrez le nouveau quartier de ',nom,': ');
                readln(quartier);
            end;
      end;
end;
procedure modifier;
var nom,info:string;
begin
    repeat
    writeln('De quel information disposez vous pour modifier un etudiant nom\numero?');
    repeat
    writeln('l''information doit etre son nom complet ou son numero');
    writeln('si vous ne maitrisez pas l''ecriture du nom allez regarder le numero correspondant');
    readln(info);
    minstr(info);
    until (info='numero')or(info='nom')or(info='aide')or(info='annuler');
    case info[2] of
    'u':begin
            write('entrez le numero de l''etudiant a modifier: ');
            readln(num);
            while (num<0)or(num>nbre) do
              begin
                  writeln('il y a ',nbre,' etudiant dans la classe');
                  readln(num);
              end;
            modi;
        end;
    'o':begin
            writeln('Entrez le nom complet de l''etudiant a modifier');
            readln(nom);
            majstr(nom);
            while search(nom,num)=false do
              begin
                  writeln('Cet etudiant n''est pas dans la classe');
                  readln(nom);
                  majstr(nom);
              end;
            modi;
        end;
    'i':begin
            writeln('pour annuler la modification, saississez "annuler"');
            readln;
        end;
    end;
    until info='annuler';
end;
procedure formater;
begin
    if nbre<>0 then
      begin
          for i:=1 to nbre do
            classe[i]:=t;
      end;
    nbre:=0;
end;
procedure tirepasse;
begin
    assign(p,'passe.txt');
    reset(p);
    read(p,motdepasse);
    close(p);
end;
procedure recevoirpasse(var pour:string);
var et:char;
begin
    pour:='';
    repeat
    et:=readkey;
    if et<>#13 then
      begin
          pour:=concat(pour,et);
          write('*');
      end;
    until et=#13;
    writeln;
end;
procedure acces(var compte:string);
var b:boolean;
begin
    b:=false;
    repeat
    write('veuillez entrez votre nom d''acces: ');
    readln(compte);
    delay(time);
    while (compte<>'visiteur')and(compte<>'administrateur') do
      begin
          clrscr;
          textcolor(red);
          writeln('Nom de compte invalide ');
          textcolor(lightgray);
          write('veuillez entrez votre nom d''acces: ');
          readln(compte);
          delay(time);
      end;
    clrscr;
    gotoxy(20,10);
    writeln('nom valide');
    if compte='administrateur' then
      begin
          write('veuillez entrez votre mot de passe: ');
          recevoirpasse(passe);
          delay(time);
          tirepasse;
          if passe<>motdepasse then
             write('Acces refuse! Mot de passe incorrect')
          else
            begin
                clrscr;
                gotoxy(20,10);
                writeln('passe valide');
                b:=true;
            end;
      end
    else
       b:=true;
    until b=true;
end;
procedure console;
begin
    write('GL1A\>');
end;
function commander:boolean;
var b:boolean;
begin
    b:=false;
    i:=1;
    while (i<=nc)and(commande<>commandes[i]) do
       inc(i);
    if commande=commandes[i] then
       b:=true;
    commander:=b;
end;
procedure modifierpasse(var p:text);
var pas:string;
    conserve:char;
    b:boolean;
begin
    b:=false;
    repeat
    write('Entrez l''ancien mot de passe: ');
    recevoirpasse(passe);
    delay(time);
    tirepasse;
    while (passe<>motdepasse)and(passe<>'aide')and(passe<>'annuler')do
       begin
           writeln('Cet ancien mot de passe est incorrect');
           write('Entrez a nouveau l''ancien mot de passe: ');
           recevoirpasse(passe);
           delay(time);
       end;
    if passe='aide' then
      begin
          writeln('Pour quitter de l''option modifier le mot de passe, saississez "annuler"');
          readln;
      end
    else
      begin
          if passe=motdepasse then
            begin
                write('Entrez le nouveau mot de passe: ');
                recevoirpasse(passe);
                write('Entrez de nouveau le mot de passe: ');
                recevoirpasse(pas);
                if passe<>pas then
                  begin
                      writeln('Les mots de passe entres sont differents');
                  end
                else
                  begin
                      if passe=motdepasse then
                        begin
                            writeln('Le nouveau mot de passe est egale a l''ancien');
                            writeln('voulez vous le conservez o\n?');
                            repeat
                                 conserve:=readkey;
                                 min(conserve);
                            until (conserve='o')or(conserve='n');
                            if conserve='o' then
                              begin
                                  b:=true;
                                  writeln('Mot de passe change');
                                  assign(p,'passe.txt');
                                  rewrite(p);
                                  write(p,passe);
                                  close(p);
                              end;
                        end
                      else
                         begin
                             writeln('Mot de passe change');
                             assign(p,'passe.txt');
                             rewrite(p);
                             write(p,passe);
                             close(p);
                         end;
                  end;
            end
          else
             b:=true;
      end;
    until b=true;
end;
procedure modifierdonnee;
begin
    if commande='ajouter' then
       begin
           if nbre=n then
             writeln('La classe est pleine')
           else
             nouveau(classe,nbre);
       end
    else
       begin
           if commande='supprimer' then
              begin
                  if nbre=0 then
                     writeln('la classe est vide')
                  else
                     supprime;
              end
           else
              begin
                  if commande='modifier' then
                    begin
                        if nbre=0 then
                          writeln('la classe est vide')
                        else
                          modifier;
                    end
                  else
                       formater;
              end;
       end;
end;
procedure afficherdonnee(nbre:integer);
begin
    clrscr;
    writeln('________________________________________________________________________________');
    writeln('No|         nom          |       email      |   tel   |  an |   quartier  |');
    writeln('________________________________________________________________________________');
    for i:=1 to nbre do
      begin
         with classe[i] do
           begin
               writeln(num:2,'|',nom:20,'|',email,'|',tel:9,'|',anniv.jour:2,' ',anniv.mois:3,'|',quartier:10);
               writeln('________________________________________________________________________________');
           end;
      end;
end;
function search2(nom:string;var num:integer):boolean;
var b:boolean;
    j:integer;
begin
    j:=1;
    while (nom<>classe[j].email)and(j<=nbre) do
      inc(j);
    if nom=classe[j].email then
      begin
          b:=true;
          num:=j;
      end
    else b:=false;
    search2:=b;
end;
function search3(nom:string;var num:integer):boolean;
var b:boolean;
    j:integer;
begin
    j:=1;
    while (nom<>classe[j].tel)and(j<=nbre) do
      inc(j);
    if nom=classe[j].tel then
      begin
          b:=true;
          num:=j;
      end
    else b:=false;
    search3:=b;
end;
function search5(nom:string;var num:integer):boolean;
var b:boolean;
    j:integer;
begin
    j:=1;
    while (nom<>classe[j].quartier)and(j<=nbre) do
      inc(j);
    if nom=classe[j].quartier then
      begin
          b:=true;
          num:=j;
      end
    else b:=false;
    search5:=b;
end;
function search1(mois:string3;var j:integer;var nume:nums):boolean;
var b:boolean;
begin
    i:=1;
    j:=0;
    b:=false;
    while (i<=nbre) do
      begin
          if mois=classe[i].anniv.mois then
            begin
                inc(j);
                b:=true;
                nume[j]:=i;
            end;
          inc(i);
      end;
    search1:=b;
end;
function search4(mois:string;var j:integer;var nume:nums):boolean;
var b:boolean;
begin
    i:=1;
    j:=0;
    b:=false;
    while (i<=nbre) do
      begin
          if mois=classe[i].anniv.jour then
            begin
                inc(j);
                b:=true;
                nume[j]:=i;
            end;
          inc(i);
      end;
    search4:=b;
end;
procedure afficheetudiant;
begin
           writeln('________________________________________________________________________________');
           writeln('No|         nom          |       email      |   tel   |  an |   quartier  |');
           writeln('________________________________________________________________________________');
           with classe[num] do
             begin
                 writeln(num:2,'|',nom:20,'|',email,'|',tel:9,'|',anniv.jour:2,' ',anniv.mois:3,'|',quartier:10);
                 writeln('________________________________________________________________________________');
             end;
end;
procedure recherche;
var info,cherche:string;
    cherches:string3;
    j:integer;
begin
    repeat
    writeln('De quel information disposez vous pour effectuer la recherche');
    repeat
    writeln('l''information doit etre un element specifique des donnees');
    readln(info);
    minstr(info);
    until (info='numero')or(info='nom')or(info='email')or(info='tel')or(info='jour')or(info='mois')or(info='quartier')or
    (info='aide')or(info='annuler');
    if info='numero' then
       begin
           write('entrez le numero de l''etudiant recherche: ');
           readln(num);
           while (num<0)or(num>nbre) do
              begin
                  writeln('il y a ',nbre,' etudiants dans la classe');
                  write('entrez le numero de l''etudiant recherche: ');
                  readln(num);
              end;
           delay(time);
           afficheetudiant;
       end;
    if info='nom' then
      begin
          write('entrez le nom de l''etudiant recherche: ');
          readln(cherche);
          majstr(cherche);
          while search(cherche,num)=false do
              begin
                  writeln('Cet etudiant n''est pas dans la classe');
                  write('entrez le nom de l''etudiant recherche: ');
                  readln(cherche);
                  majstr(cherche);
              end;
          afficheetudiant;
      end;
    if info='email' then
      begin
          write('entrez l''E-mail de l''etudiant recherche: ');
          readln(cherche);
          while search2(cherche,num)=false do
              begin
                  writeln('Aucun etudiant n''a cet E-mail');
                  write('entrez l''E-mail de l''etudiant recherche: ');
                  readln(cherche);
              end;
          afficheetudiant;
      end;
    if info='tel' then
      begin
          write('entrez le numero de telephone de l''etudiant recherche: ');
          readln(cherche);
          while search3(cherche,num)=false do
              begin
                  writeln('Aucun etudiant n''a ce numero');
                  write('entrez le numero de telephone de l''etudiant recherche: ');
                  readln(cherche);
              end;
          afficheetudiant;
      end;
    if info='jour' then
      begin
          write('entrez le jour de naissance de l''etudiant recherche: ');
          readln(cherche);
          while search4(cherche,j,nume)=false do
              begin
                  writeln('Aucun etudiant n''est ne ce jour');
                  write('entrez le jour de naissance de l''etudiant recherche: ');
                  readln(cherche);
              end;
          afficherdonnee(j);
      end;
    if info='mois' then
      begin
          write('entrez le mois de naissance de l''etudiant recherche: ');
          readln(cherches);
          while search1(cherches,j,nume)=false do
              begin
                  writeln('Aucun etudiant n''est ne ce mois');
                  write('entrez le mois de naissance de l''etudiant recherche: ');
                  readln(cherches);
              end;
          afficherdonnee(j);
      end;
    if info='quartier' then
      begin
          write('entrez le nom du quartier de l''etudiant recherche: ');
          readln(cherche);
          while search5(cherche,num)=false do
              begin
                  writeln('Aucun etudiant n''habite dans ce quartier');
                  write('entrez le nom du quartier de l''etudiant recherche: ');
                  readln(cherche);
              end;
          afficheetudiant;
      end;
    if info='aide' then
      begin
          writeln('pour annuler la modification, saississez "annuler"');
          readln;
      end;
    until info='annuler';
end;

procedure voir;
begin
    clrscr;
    if commande='afficher' then
       afficherdonnee(nbre)
    else
       recherche;
end;
procedure aides;
var de:string;
begin
    assign(aide,'aide.txt');
    if ioresult<>0 then
      begin
          writeln('fichier introuvable');
          delay(time);
          exit;
      end;
    reset(aide);
    while not eof(aide) do
      begin
          readln(aide,de);
          writeln(de);
      end;
    repeat

    until keypressed;
    close(aide);
end;