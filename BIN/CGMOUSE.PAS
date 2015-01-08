unit cgmouse;
{les routines pour utiliser la souris}
interface
uses crt,dos;
var
   regs : registers;

function initmouse : boolean;
Procedure Afficher ;
Procedure Masquer ;
Procedure getmousepos ( var mX, mY : integer ) ;
function button : integer;

implementation

function initmouse: boolean;
begin
   regs.ax:=$00;
   intr($33,regs);
   if regs.ax=0 then
      initmouse := false;
   if regs.ax=-1 then
      initmouse := true;
end;

{Affichage du curseur}
procedure afficher ;
begin
     regs.ax := $01;
     intr($33,regs);
end;

{Masque du curseur }
procedure Masquer ;
begin
     regs.ax := $02;
     intr($33,regs);
end;


Procedure getmousepos ( var mX, mY : integer );
begin
   regs.ax := $03;
   intr($33,regs);
   Mx := regs.cx;
   My := regs.dx
end;


function button : integer;
begin
   regs.ax := $03;
   intr($33,regs);
   button := regs.bx;
end;

End .
