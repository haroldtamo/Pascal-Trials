unit arithm;
{execution des calculs numeriques}


interface
procedure avancer; {avance le curseur }
function iserror:boolean;
function geterrortype:string;
function getcarcour:integer; {donne la position courante du curseur}
function expression:real; { fonction commen‡ant les appels recursifs :
                          fait les operation d' addition}
function terme:real; {operation de multiplication}
function facteur:real;{nombre seul ou avec parentheses}
function fonction:real;{traite les fonctions mathemetiques}
function resulte(l:string):real;

{-----------------------------------------}
implementation

type str255=string[100];

var ligne:str255;
    carcour:integer;
    oper_add,oper_mult,chiffre:set of char;
    errortype:string;
    error:boolean;

{calcule un nombre … la puissance exposant n}
function pow(a:real;n:real):real;
 var y,x,z,aux:real;
     negatif_n,negatif_a:boolean;
     i:integer;
begin
if trunc(n)<>n then
 begin
 error:=true;
 errortype:='n non integer: x^n';
 exit
 end;

negatif_n:=n<0;
negatif_a:=a<0;
x:=abs(a);
y:=abs(n);
z:=1;
while y<>0 do
 begin
 aux:=y/2-trunc(y/2);
 if aux<>0 then
  begin
  z:=z*x;
  y:=y-1;
  end
 else
  begin
  x:=x*x;
  y:=trunc(y/2);
  end
 end;

if ((n/2-trunc(n/2))<>0) and negatif_a then
 z:=z*-1;

if (negatif_n) then
 z:=1/z;
pow:=z;
end;
{---------------------------------}

function fonct(f:str255;valeur:real):real;
 var v:real;
 begin
 writeln(f);
 if  f='abs'         then v:=abs(valeur)
 else if  f='sin'    then v:=sin(valeur)
 else if  f='cos'    then v:=cos(valeur)
 else if  f='sqr'    then v:=sqr(valeur)
 else if  f='û'   then
           begin
           if valeur<0 then
            begin
            error:=true;
            errortype:='sqrt: negative number';
            exit;
            end;
           v:=sqrt(valeur);
           end
  else if  f='ln'   then
          begin
           if valeur<=0 then
            begin
            error:=true;
            errortype:='ln: negative number';
            exit;
            end;
           v:=ln(valeur);
           end
 else if f='exp' then   v:=exp(valeur)

  else if  f='' then  v:=valeur
   else
      begin

          error:=true;
          errortype:='undefine function';
          exit
       end ;
  fonct:=v;
 end;
{---------------------------------}

 procedure avancer;
  begin
  repeat
  carcour:=carcour+1;
  until  (ligne[carcour]<>' ') or (carcour=length(ligne));
  end;

 {---------------------------------}
 function iserror:boolean;
 begin
 iserror:=error;
 end;
{---------------------------------}
 function geterrortype:string;
  begin
  geterrortype:=errortype;
  end;
 {---------------------------------}
 function getcarcour:integer;
  begin
  getcarcour:=carcour
  end;
 {---------------------------------}
 function exposant:real; forward;
 {---------------------------------}
  function expression:real;
   var valeur:real;
       operators:char;
   begin
   if error then
    exit;
   valeur:=fonction;
   while ligne[carcour] in oper_add do
    begin
    operators:=ligne[carcour];
    avancer;
    if operators='+' then
     valeur:=valeur+fonction
    else
     valeur:=valeur-fonction;
    end;
   expression:=valeur;
  end;
{---------------------------------}
  function fonction:real;
   var ch:str255;
       valeur:real;
   begin
   if error then
    exit;
   ch:='';
   while (ligne[carcour] in ['a'..'z',chr(251)]) and (carcour<=length(ligne)) do
    begin
    ch:=ch+ligne[carcour];
    avancer;
    end;
   valeur:=exposant;
   fonction:=fonct(ch,valeur);
   end;

{------------------------------}
function exposant:real;
    var valeur:real;
        operators:char;
        a,f:real;
    begin
    if error then
     exit;
    valeur:=terme;
    while ligne[carcour]='^' do
     begin
     avancer;
     f:=terme;
      valeur:=pow(valeur,f)
     end;

    exposant:=valeur;
   end;


{-------------------------------}

   function terme:real;
    var valeur:real;
        operators:char;
        a:real;
    begin
    if error then
     exit;
    valeur:=facteur;
    while ligne[carcour] in oper_mult do
     begin
     operators:=ligne[carcour];
     avancer;
     if operators='*' then
      valeur:=valeur*facteur
     else
      begin
      a:=facteur;
      if a=0 then
       begin
       error:=true;
       errortype:='overflow error';
       exit;
       end;
      valeur:=valeur/a;
     end;
     end;
    terme:=valeur;
   end;
  {---------------------------------}

   function facteur:real;
    var valeur:real;
        code:integer;
        ch:string;
   begin

   if error then
    exit;

   valeur:=0;
   if ligne[carcour]='(' then
    begin
    avancer;
    facteur:=expression;
    if ligne[carcour]<>')' then
     begin
     error:=true;
     errortype:=''')''missing';
     exit
     end;
     avancer;
    end
    else
     if ligne[carcour] in ['a'..'z'] then
      facteur:=expression
     else
      begin
      if (not (ligne[carcour] in chiffre)) and (ligne[carcour]<>'-') then
       begin
       error:=true;
       errortype:=' digit or ) expected';
       exit
       end;
      ch:='';
      if ligne[carcour]='-' then
       begin
       ch:='-';
       avancer;
       end;
      while ((ligne[carcour] in chiffre) or (ligne[carcour]='.')) and (carcour<length(ligne)) do
       begin
        ch:=ch+ligne[carcour];
        carcour:=carcour+1;
       end;
       val(ch,valeur,code);
       if code<>0 then
        begin
        error:=true;
        errortype:='bad number format';
        exit;
        end;
       if ligne[carcour]=' ' then
        avancer;
       facteur:=valeur;
      end;
     end;
 {---------------------------------}
function resulte(l:string):real;
 begin
 ligne:=l;
 chiffre:=['0'..'9'];
 oper_add:=['+','-'];
 oper_mult:=['*','/'];
 carcour:=1;
  errortype:='';
 error:=false;
 resulte:=expression;
 if carcour <length(ligne) then
  begin
  error:=true;
  errortype:='operator expected ';
  end;
 end;
 {---------------------------------}

 begin
 end.





