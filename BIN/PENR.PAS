program etx;
uses crt;
type point=^enre;
     enre=record
     f:text;
     suiv:point;
     end;
var a:integer;
    fpoint:point;
    faire:char;
begin
    clrscr;
    new(fpoint);
    writeln('que voulez vous faire');
    readln(faire);
    assign(fpoint^.f,'nombre.txt');
    case faire of
    'v':begin
          reset(fpoint^.f);
          if ioresult=0 then
            begin
                readln(fpoint^.f,a);
                writeln('le nombre enregistre est ',a);
            end;
        end;
    'a':begin
            rewrite(fpoint^.f);
            readln(a);
            writeln(fpoint^.f,a);
        end;
    end;
    close(fpoint^.f);
    readln;
end.