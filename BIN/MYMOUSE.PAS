unit mymouse;
{unit‚ contenant l' objet souris}

interface

type mouse=object
            constructor init;
            function getx:integer;
            function gety:integer;
            procedure display;
            procedure hide;
            function click:boolean;
           end;
  function getx:integer;
            function gety:integer;
            procedure display;
            procedure hide;
            function click:boolean;

implementation

uses cgmouse;

constructor mouse.init;
  begin
  initmouse;
  end;


procedure mouse.hide;
 begin
 masquer;
 end;


procedure mouse.display;
begin
afficher;
end;


function mouse.click:boolean;
begin
click:=button=1;
end;


function mouse.getx:integer;
 var x,y:integer;
 begin
 getmousepos(x,y);
 getx:=x;
 end;


function mouse.gety:integer;
 var x,y:integer;
 begin
 getmousepos(x,y);
 gety:=y;
 end;


begin
initmouse;
end.
