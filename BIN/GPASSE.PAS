program gpasse;
uses crt;
const N=54;P=26;Q=36;
        car:array [1..N] of char=('a','z','e','r','t','y','u','i','o','p'
                                 ,'q','s','d','f','g','h','j','k','l','m',
                                  'w','x','c','v','b','n','0','9','8','7','6','5','4','3','2','1','?','/','','&','Ç',
                                  '(','-','ä','_','á','Ö',')','+',
                                  '¯','*','%','ó','ú');
        Num: array [1..10] of char=('0','1','2','3','4','5','6','7','8','9');

 var a,j,i:1..N;  choix:1..7;


    procedure paskelkonq;
       begin
       writeln('combien de caracteres voulez vous dans votre pass');
       repeat
        readln(a);
       until (a>0);

        for i:=1 to a do
        begin
        j:=random(N);
        write(car[j]);
        end;

    end;
    procedure loweralpha;
      begin
      writeln('combien de caracteres voulez vous dans votre pass');
       repeat
        readln(a);
       until (a>0) ;
       i:=1;
       while i<=a do
        begin
        j:=random(P);
        write(car[j]);
        i:=i+1;
        end;
    end;
    procedure upperalpha;
     begin
     writeln('combien de caracteres voulez vous dans votre pass');
      repeat
       readln(a);
      until (a>0) ;
      for i:=1 to a do
       begin
       j:=random(P);
       write(upcase(car[j]));
      end;
    end;
  procedure lowNumAlpha;
      begin
      writeln('combien de caracteres voulez vous dans votre pass');
    repeat
     readln(a);
    until (a>0) ;
    i:=1;
    while i<=a do
     begin
     j:=random(Q);
     write(car[j]);
     i:=i+1;
    end;
   end;
   procedure UpNumAlpha;
   begin
    writeln('combien de caracteres voulez vous dans votre pass');
    repeat
    readln(a);
    until (a>0) ;
    i:=1;
     while i<=a do
      begin
       j:=random(Q);
       write(upcase(car[j]));
       i:=i+1;
     end;
   end;
   procedure Number;
    begin
    writeln('combien de chiffres voulez-vous dans votre pass?');
     repeat readln(a);
     until(a>0);
     for i:=1 to a do
      begin
       j:=random(10);
      write(Num[j]);
     end;
   end;

begin
clrscr;
Randomize;

writeln('Quel genre de mot de passe voulez-vous?:');
writeln('        1- tous les caractäres');
writeln('        2- uniquement des lettres minuscules');
writeln('        3- uniquement des letrres majuscules');
writeln('        4- uniquement des chiffres');
writeln('        5- des chiffres et minuscules');
writeln('        6- des chiffres et majuscules');
writeln('        7- des chiffres, minuscules et majuscules');
readln(choix);

               if choix=1 then paskelkonq;
                if choix=2 then loweralpha;
                if choix=3 then upperalpha;
                if choix=4 then Number;
                if choix=5 then LowNumAlpha;
                if choix=6 then UpNumAlpha;
readln;
end.

