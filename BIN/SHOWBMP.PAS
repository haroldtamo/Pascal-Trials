unit showbmp;
{affiche un bitmap 256 couleur}

interface

procedure pbmp(ch:string;i,j:integer);

implementation

uses graph,crt;

 type uint=integer;
      dword=longint;
      bitmapfileheader=record
                        bftype:uint;
                        bfsize:dword;
                        bfreserved1:uint;
                        bfreserved2:uint;
                        bfoffbit:dword;
                      end;
      bitmapinfoheader=record
                        bisize:dword;
                        biwidth:longint;
                        biheight:longint;
                        biplanes:word;
                        bibitcount:word;
                        bicompression:dword;
                        bisizeimage:dword;
                        bixpelpermeters:longint;
                        biypelpermeters:longint;
                        biclrused:dword;
                        biclrimportant:dword;
                      end;
      tcolor=record
              b,g,r,i:byte;
             end;

 var
     bmp:file;
     fileheader:bitmapfileheader;
     infoheader:bitmapinfoheader;
     color:tcolor;
     pixel:byte;
     index:longint;
     x,y,i,j,q,v,p:integer;


procedure restorepalette;
{on remet la palette … sa place}
type
  RGBRec = record
    RedVal, GreenVal, BlueVal : Integer;
     { Valeurs d'intensit‚ (entre 0 et 63) }
    Name: String;
    ColorNum: Integer;
     { Les num‚ros de couleurs VGA associ‚s aux 16 entr‚es de palette }
  end;
const
  { Table des couleurs VGA en 16 couleurs }
  Colors : array[0..15] of RGBRec = (
   ( RedVal:0;GreenVal:0;BlueVal:0;Name:'Black';ColorNum: 0),
   ( RedVal:0;GreenVal:0;BlueVal:40;Name:'Blue';ColorNum: 1),
   ( RedVal:0;GreenVal:40;BlueVal:0;Name:'Green';ColorNum: 2),
   ( RedVal:0;GreenVal:40;BlueVal:40;Name:'Cyan';ColorNum: 3),
   ( RedVal:40;GreenVal:7;BlueVal:7;Name:'Red';ColorNum: 4),
   ( RedVal:40;GreenVal:0;BlueVal:40;Name:'Magenta';ColorNum: 5),
   ( RedVal:40;GreenVal:30; BlueVal:0;Name:'Brown';ColorNum: 20),
   ( RedVal:49;GreenVal:49;BlueVal:49;Name:'Light Gray';ColorNum: 7),
   ( RedVal:26;GreenVal:26;BlueVal:26;Name:'Dark Gray';ColorNum: 56),
   ( RedVal:0;GreenVal:0;BlueVal:63;Name:'Light Blue';ColorNum: 57),
   ( RedVal:9;GreenVal:63;BlueVal:9;Name:'Light Green';ColorNum: 58),
   ( RedVal:0;GreenVal:63;BlueVal:63;Name:'Light Cyan';ColorNum: 59),
   ( RedVal:63;GreenVal:10;BlueVal:10;Name:'Light Red';ColorNum: 60),
   ( RedVal:44;GreenVal:0;BlueVal:63;Name:'Light Magenta';
          ColorNum: 61),
   ( RedVal:63;GreenVal:63;BlueVal:18;Name:'Yellow';ColorNum: 62),
   ( RedVal:63; GreenVal:63; BlueVal:63; Name: 'White'; ColorNum: 63)
  );
var
  Driver, Mode, I, Error: Integer;
begin
  for i := 0 to 15 do
    with Colors[i] do
      SetRGBPalette(ColorNum, RedVal, GreenVal, BlueVal);

end;


procedure pbmp(ch:string;i,j:integer) ;
begin
{$I-}
assign(bmp,ch);
reset(bmp,1);
if ioresult<>0 then
 halt;
{$I+}
{position du point superieur gauche}
blockread(bmp,fileheader,sizeof(fileheader));
blockread(bmp,infoheader,sizeof(infoheader));
if infoheader.bibitcount<>8 then
 begin
 close(bmp);
 halt;
 end;
{on sauvegarde l' ancienne palette}
{lecture de la palette}
for index:=0 to 255 do
 begin
 blockread(bmp,color,sizeof(color));
 setrgbpalette(index,color.r shr 2,color.g shr 2,color.b shr 2);
 end;
{affichage de l'image}
y:=0; index:=0;
while index<(infoheader.bisizeimage-infoheader.biwidth) do
 begin
 x:=0; q:=0;
 while (q<infoheader.biwidth) do
  begin
  blockread(bmp,pixel,sizeof(pixel));
  putpixel(x+i,y+j+infoheader.biheight,pixel);
{on ignore les octets de fin pour les bitmap non multiples de 4}
inc(q); inc(x);
end;
for v:=3 downto (infoheader.biwidth mod 4) do
 blockread(bmp,pixel,sizeof(pixel));
dec(y);
inc(index,infoheader.biwidth+1);
end;
close(bmp);
restorepalette;
end;
begin
end.










