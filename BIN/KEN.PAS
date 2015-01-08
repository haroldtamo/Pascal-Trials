unit ken;
interface
var a:char;
    nom:string;
procedure maj(var a:char);
procedure min(var a:char);
procedure majstr(var nom:string);
procedure minstr(var nom:string);
implementation

procedure maj(var a:char);
begin
    case a of
    'a':a:='A';'n':a:='N';
    'b':a:='B';'o':a:='O';
    'c':a:='C';'p':a:='P';
    'd':a:='D';'q':a:='Q';
    'e':a:='E';'r':a:='R';
    'f':a:='F';'s':a:='S';
    'g':a:='G';'t':a:='T';
    'h':a:='H';'u':a:='U';
    'i':a:='I';'v':a:='V';
    'j':a:='J';'w':a:='W';
    'k':a:='K';'x':a:='X';
    'l':a:='L';'y':a:='Y';
    'm':a:='M';'z':a:='Z';
    end;
end;
procedure min(var a:char);
begin
    case a of
    'A':a:='a';'N':a:='n';
    'B':a:='b';'O':a:='o';
    'C':a:='c';'P':a:='p';
    'D':a:='d';'Q':a:='q';
    'E':a:='e';'R':a:='r';
    'F':a:='f';'S':a:='s';
    'G':a:='g';'T':a:='t';
    'H':a:='h';'U':a:='u';
    'I':a:='i';'V':a:='v';
    'J':a:='j';'W':a:='w';
    'K':a:='k';'X':a:='x';
    'L':a:='l';'Y':a:='y';
    'M':a:='m';'Z':a:='z';
    end;
end;
procedure majstr(var nom:string);
var i:integer;
begin
    for i:=1 to length(nom) do
     maj(nom[i]);
end;
procedure minstr(var nom:string);
var i:integer;
begin
    for i:=1 to length(nom) do
     min(nom[i]);
end;

begin
end.
