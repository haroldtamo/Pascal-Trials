program parfait;
type kibongue=array[1..50] of word;
var  vec:kibongue;
      s,i,e:word;
begin
   writeln('entre les 50 entiers positifs dans le tableau');
   for i:=1 to 50 do
   begin
   readln(vec[i]);
     e:=1;
     s:=0;
     while(e < vec[i])do
     begin
         if (vec[i] mod e=0)then
         begin
         s:=s+e;
         end;
     e:=e+1;
     end;
       if(s=vec[i]) then
       begin
        writeln('le nombre:' ,   vec[i]    ,'est parfait');
       end;
   end;
   readln;
end.