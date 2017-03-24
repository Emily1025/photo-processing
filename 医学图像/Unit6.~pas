unit Unit6;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls,math;

type
  TForm6 = class(TForm)
    OpenDialog1: TOpenDialog;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    Button7: TButton;
    Button8: TButton;
    Button10: TButton;
    Image1: TImage;
    Image2: TImage;
    Button11: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    function cp(n:integer):integer;
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure Button10Click(Sender: TObject);
    procedure Button11Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form6: TForm6;

implementation
 uses
Unit1,Unit3;
{$R *.dfm}
 var
bitmap2,tmpmap:Tbitmap;
function TForm6.cp(n:integer):integer;
begin
result:=n;
if n>255 then result:=255;
if n<0 then result:=0;
end;
procedure TForm6.Button1Click(Sender: TObject);
var
 filename:string;
begin
   with openDialog1 do
   if execute then
   begin
   filename:=openDialog1.FileName;
   form1.image1.Picture.LoadFromFile(filename);
   bitmap2.Free ;
   bitmap2:=Tbitmap.Create ;
   bitmap2.Width:=form1.image1.Width ;
   bitmap2.Height :=form1.image1.Height ;
   bitmap2.PixelFormat:=pf24bit;
   bitmap2.Canvas.Draw(0,0,form1.image1.Picture.graphic);
   image2.Picture.Assign(bitmap2);
   end;
end;


procedure TForm6.Button2Click(Sender: TObject);
var
  i,j:integer;
  p,p1,p2:PByteArray;
begin
   tmpmap.Free;
   tmpmap:=Tbitmap.Create;
   tmpmap.Width:=min(bitmap1.Width,bitmap2.Width);
   tmpmap.Height:=min(bitmap1.Height,bitmap2.Height);
   tmpmap.PixelFormat:=pf24bit;

   for j:=0 to tmpmap.Height-1 do
   begin
      p:=tmpmap.ScanLine[j];
      p1:=bitmap1.ScanLine[j];
      p2:=bitmap2.ScanLine[j];
      for i:=0 to tmpmap.Width-1 do
      begin
        p[i*3]:=cp(p1[i*3]+p2[i*3]);
        p[i*3+1]:=cp(p1[i*3+1]+p2[i*3+1]);
        p[i*3+2]:=cp(p1[i*3+2]+p2[i*3+2]);
     end;
  end;
  form1.image1.Picture.Assign(tmpmap);

end;


procedure TForm6.Button3Click(Sender: TObject);
var
  i,j:integer;
  p,p1,p2:PByteArray;
begin
   tmpmap.Free;
   tmpmap:=Tbitmap.Create;
   tmpmap.Width:=min(bitmap1.Width,bitmap2.Width);
   tmpmap.Height:=min(bitmap1.Height,bitmap2.Height);
   tmpmap.PixelFormat:=pf24bit;

   for j:=0 to tmpmap.Height-1 do
   begin
      p:=tmpmap.ScanLine[j];
      p1:=bitmap1.ScanLine[j];
      p2:=bitmap2.ScanLine[j];
      for i:=0 to tmpmap.Width-1 do
      begin
        p[i*3]:=cp(floor((p1[i*3]+p2[i*3]) div 2));
        p[i*3+1]:=cp(floor((p1[i*3+1]+p2[i*3+1]) div 2));
        p[i*3+2]:=cp(floor((p1[i*3+2]+p2[i*3]+2) div 2));

     end;
  end;
  form1.image1.Picture.Assign(tmpmap);

end;


procedure TForm6.Button4Click(Sender: TObject);
var
  i,j:integer;
  p,p1,p2:PByteArray;
begin
   tmpmap.Free;
   tmpmap:=Tbitmap.Create;
   tmpmap.Width:=min(bitmap1.Width,bitmap2.Width);
   tmpmap.Height:=min(bitmap1.Height,bitmap2.Height);
   tmpmap.PixelFormat:=pf24bit;

   for j:=0 to tmpmap.Height-1 do
   begin
      p:=tmpmap.ScanLine[j];
      p1:=bitmap1.ScanLine[j];
      p2:=bitmap2.ScanLine[j];
      for i:=0 to tmpmap.Width-1 do
      begin
         p[i*3]:=cp(p1[i*3]-p2[i*3]);
        p[i*3+1]:=cp(p1[i*3+1]-p2[i*3+1]);
        p[i*3+2]:=cp(p1[i*3+2]-p2[i*3+2]);


     end;
  end;
  form1.image1.Picture.Assign(tmpmap);

end;

procedure TForm6.Button5Click(Sender: TObject);
var
  i,j:integer;
  p,p1,p2:PByteArray;
begin
   tmpmap.Free;
   tmpmap:=Tbitmap.Create;
   tmpmap.Width:=min(bitmap1.Width,bitmap2.Width);
   tmpmap.Height:=min(bitmap1.Height,bitmap2.Height);
   tmpmap.PixelFormat:=pf24bit;

   for j:=0 to tmpmap.Height-1 do
   begin
      p:=tmpmap.ScanLine[j];
      p1:=bitmap1.ScanLine[j];
      p2:=bitmap2.ScanLine[j];
      for i:=0 to tmpmap.Width-1 do
      begin
        p[i*3]:=cp(p2[i*3]-p1[i*3]);
        p[i*3+1]:=cp(p2[i*3+1]-p1[i*3+1]);
        p[i*3+2]:=cp(p2[i*3+2]-p1[i*3+2]);

      end;
  end;
  form1.image1.Picture.Assign(tmpmap);

end;
procedure TForm6.Button6Click(Sender: TObject);
var
  i,j:integer;
  p,p1,p2:PByteArray;
begin
   tmpmap.Free;
   tmpmap:=Tbitmap.Create;
   tmpmap.Width:=min(bitmap1.Width,bitmap2.Width);
   tmpmap.Height:=min(bitmap1.Height,bitmap2.Height);
   tmpmap.PixelFormat:=pf24bit;

   for j:=0 to tmpmap.Height-1 do
   begin
      p:=tmpmap.ScanLine[j];
      p1:=bitmap1.ScanLine[j];
      p2:=bitmap2.ScanLine[j];
      for i:=0 to tmpmap.Width-1 do
      begin
       p[i*3]:=cp(abs(p1[i*3]-p2[i*3]));
        p[i*3+1]:=cp(abs(p1[i*3+1]-p2[i*3+1]));
        p[i*3+2]:=cp(abs(p1[i*3+2]-p2[i*3+2]));


      end;
  end;
  form1.image1.Picture.Assign(tmpmap);

end;

procedure TForm6.Button7Click(Sender: TObject);
var
  i,j:integer;
  p,p1,p2:PByteArray;
begin
   tmpmap.Free;
   tmpmap:=Tbitmap.Create;
   tmpmap.Width:=min(bitmap1.Width,bitmap2.Width);
   tmpmap.Height:=min(bitmap1.Height,bitmap2.Height);
   tmpmap.PixelFormat:=pf24bit;

   for j:=0 to tmpmap.Height-1 do
   begin
      p:=tmpmap.ScanLine[j];
      p1:=bitmap1.ScanLine[j];
      p2:=bitmap2.ScanLine[j];
      for i:=0 to tmpmap.Width-1 do
      begin
        p[i*3]:=cp(floor(sqrt(p1[i*3]*p2[i*3])));
        p[i*3+1]:=cp(floor(sqrt(p1[i*3+1]*p2[i*3+1])));
        p[i*3+2]:=cp(floor(sqrt(p1[i*3+2]*p2[i*3+2])));

      end;
  end;
  form1.image1.Picture.Assign(tmpmap);

end;
procedure TForm6.Button8Click(Sender: TObject);
var
  i,j:integer;
  p,p1,p2:PByteArray;
begin
   tmpmap.Free;
   tmpmap:=Tbitmap.Create;
   tmpmap.Width:=min(bitmap1.Width,bitmap2.Width);
   tmpmap.Height:=min(bitmap1.Height,bitmap2.Height);
   tmpmap.PixelFormat:=pf24bit;

   for j:=0 to tmpmap.Height-1 do
   begin
      p:=tmpmap.ScanLine[j];
      p1:=bitmap1.ScanLine[j];
      p2:=bitmap2.ScanLine[j];
      for i:=0 to tmpmap.Width-1 do
      begin
       p[i*3]:=cp(floor((p1[i*3]*p2[i*3]) div 255));
        p[i*3+1]:=cp(floor((p1[i*3+1]*p2[i*3+1]) div 255));
        p[i*3+2]:=cp(floor((p1[i*3+2]*p2[i*3+2]) div 255));


      end;
  end;
  form1.image1.Picture.Assign(tmpmap);

end;

procedure TForm6.Button10Click(Sender: TObject);
var
  i,j:integer;
  p,p1,p2:PByteArray;
begin
   tmpmap.Free;
   tmpmap:=Tbitmap.Create;
   tmpmap.Width:=min(bitmap1.Width,bitmap2.Width);
   tmpmap.Height:=min(bitmap1.Height,bitmap2.Height);
   tmpmap.PixelFormat:=pf24bit;

   for j:=0 to tmpmap.Height-1 do
   begin
      p:=tmpmap.ScanLine[j];
      p1:=bitmap1.ScanLine[j];
      p2:=bitmap2.ScanLine[j];
      for i:=0 to tmpmap.Width-1 do
      begin
        p[i*3]:=cp(floor((p1[i*3]*p2[i*3]) div (p1[i*3]+1)));
        p[i*3+1]:=cp(floor((p1[i*3+1]*p2[i*3+1]) div (p1[i*3+1]+1)));
        p[i*3+2]:=cp(floor((p1[i*3+2]*p2[i*3+2]) div (p1[i*3+2]+1)));



      end;
  end;
  form1.image1.Picture.Assign(tmpmap);

end;
procedure TForm6.Button11Click(Sender: TObject);
var
  i,j:integer;
  p,p1,p2:PByteArray;
begin
   tmpmap.Free;
   tmpmap:=Tbitmap.Create;
   tmpmap.Width:=min(bitmap1.Width,bitmap2.Width);
   tmpmap.Height:=min(bitmap1.Height,bitmap2.Height);
   tmpmap.PixelFormat:=pf24bit;

   for j:=0 to tmpmap.Height-1 do
   begin
      p:=tmpmap.ScanLine[j];
      p1:=bitmap1.ScanLine[j];
      p2:=bitmap2.ScanLine[j];
      for i:=0 to tmpmap.Width-1 do
      begin
        p[i*3]:=cp(floor((p1[i*3]*p2[i*3]) div (p2[i*3]+1)));
        p[i*3+1]:=cp(floor((p1[i*3+1]*p2[i*3+1]) div (p2[i*3+1]+1)));
        p[i*3+2]:=cp(floor((p1[i*3+2]*p2[i*3+2]) div (p2[i*3+2]+1)));


      end;
  end;
  form1.image1.Picture.Assign(tmpmap);

end;

end.
