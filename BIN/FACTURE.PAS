program essai_nul;
const n=3;
type facture=record
           produit=(pain, lait, oeuf);
           quantite:integer;
           p_unit:integer;
           montant:integer;
           end;
     tab=array[1..3] de facture;