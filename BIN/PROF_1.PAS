program suite;
uses crt;
var n,i:integer;
    u1,u2,v2,un,vn:real;
begin
    writeln('Entrer u1,u2,v2');
    readln(u1,u2,v2);
    repeat
        writeln('entrez le rang des termes … calculer');
        readln(n);
    until n>2;
    i:=0;
    repeat
        un:=2*u2-u1;
        vn:=v2*un;
        u1:=u2;
        u2:=un;
        v2:=vn;
        i:=i+1;
    until i=n-2;
    writeln('un au rang ',n,' est ',un);
    writeln('vn au rang ',n,' est ',vn);
    readln;
end.