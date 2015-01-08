program equation;
uses crt;
label 1,2 ;
var  a,b,c,d,re1,re2,im1,im2:real;
     e:string;
begin
1: clrscr;

           writeln('BIENVENUE DANS LE PROGRAMME DE HARRYBOY');
           writeln;
           writeln('IL VOUS AIDERA DANS LA RESOLUTION DE TOUTES VOS EQUATIONS DE LA FORME:');
           writeln;
           writeln('aXý + bX + c = 0');
           writeln;
           writeln('Veuillez entrez a, b et c dans l ordre');
           readln(a,b,c);
              if a=0 then
                begin
                  if b=0 then
                    begin

                      if c=0 then
                        begin
                        writeln('Cette ‚quation admet une infinit‚ de solutions');
                        Writeln;

                        goto 2;
                        end
                        else
                        begin
                        writeln('Cette equation n admet aucune solution');
                        goto 2;
                       end;
                     end
                     else
                     begin
                     writeln('Cette ‚quation admet comme solution unique X =',(-c)/b:0:2);
                     goto 2;
                     end;
                    end
                else
                begin
                d:=(b*b)-4*a*c;
                if d=0 then
                begin
                writeln('cette ‚quetion admet une solution double:', (-b)/(2*a):0:2);
                writeln;
                goto 2;
                end
                else
                begin
                if d<0 then
                begin
                writeln('Cette ‚quation  admet des solutions complexes');
                re1:=(-b)/(2*a);
                re2:=re1;
                im1:=sqrt(d*d);
                im2:=-im1;
                writeln('X1=',(re1):0:0,'+',(im1):0:0,'i','et','X2=',re2:0:0,'+' , (im2):0:0,'i' )
                ;writeln;
                goto 2;
                end
                else
                begin
                writeln('Cette equation admet deux solutions que sont:');
                writeln;
                writeln('X1=',((-b)+sqrt(d))/(2*a):0:2,  'et');
                writeln('X2=',((-b)-sqrt(d))/(2*a):0:2);
                end;
               2: writeln('POUR RESOUDRE UNE AUTRE EQUATION TAPER SUR N IMPORTE QUELLE TOUCHE');
                writeln;
                writeln('SI PAR CONTRE VOUS EN AVEZ  MARRE TAPEZ SUR H COMME Harryboy');
                readln(e);
                if e='H' then
                begin
                writeln('Goodbye');
                end
                else
                begin
                goto 1;

                end;
end;
end;
readln;
end.




