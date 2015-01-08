type tpile=^pilec;
       pilec= record
         elt:integer;
         esuiv:tpile;
              end;
        procedure  creerpile(p:tpile);
        begin
           p:=nil;
        end;
        procedure empiler(p:tpile; e:integer);
        begin
           var i:tpile;
           i:=p;
           i^.elt:=e;
           i^.esuiv:=nil;
           c:=p;
           while c<> nil do
              begin
                c:=c^.esuiv;
              end
