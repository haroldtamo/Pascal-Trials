program parfait;
var  i,e,s:word;
begin
     for i:=1 to 50 do
     e:=1;
     s:=0;
       while(e<i)do
       begin
         if(i mod e =0)then
         begin
         s:=s+1;
         end;
       e:=e+1;
       end;
     if(s=i)then
      begin
        writeln('le nombre ',i,' est parfait');
      end;
     end;
end.
