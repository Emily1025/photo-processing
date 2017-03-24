unit Unit5;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls,math;

type
  TForm5 = class(TForm)
    GroupBox1: TGroupBox;
    Edit1: TEdit;
    Edit2: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Button1: TButton;
    GroupBox2: TGroupBox;
    Label3: TLabel;
    Edit3: TEdit;
    Button2: TButton;
    GroupBox3: TGroupBox;
    Button3: TButton;
    Button4: TButton;
    GroupBox4: TGroupBox;
    Label4: TLabel;
    Edit4: TEdit;
    Button5: TButton;
    CheckBox1: TCheckBox;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form5: TForm5;

implementation
uses
Unit1,Unit3;
{$R *.dfm}

procedure TForm5.Button1Click(Sender: TObject);
var
  i,j:integer;
  p,p1:pByteArray;
  tx,ty:integer;
  x0,y0:integer;
begin
   tx:=strtoint(edit1.Text);
   ty:=strtoint(edit2.Text);
   tmpmap.Free ;
   tmpmap:=Tbitmap.Create ;
   tmpmap.Width:=bitmap1.Width ;
   tmpmap.Height :=bitmap1.Height ;
   tmpmap.PixelFormat:=pf24bit;
if checkbox1.Checked then
begin
  for j:=0 to tmpmap.Height-1 do
 begin
   p:=tmpmap.ScanLine[j];
   y0:=floor(j-ty+tmpmap.Height) mod tmpmap.Height;

    p1:=bitmap1.ScanLine[y0];
   for i:=0 to tmpmap.Width-1 do
     begin
        x0:=floor(i-tx+bitmap1.Width) mod bitmap1.Width;
        p[i*3+2]:=p1[x0*3+2];
        p[i*3+1]:=p1[x0*3+1];
        p[i*3]:=p1[x0*3];
     end;
 end;
end
else
begin
 for j:=0 to tmpmap.Height-1 do
 begin
   p:=tmpmap.ScanLine[j];
   if((j-ty)>=0) and ((j-ty)<tmpmap.Height) then
   begin //注意这也有begin
    p1:=bitmap1.ScanLine[j-ty];
   for i:=0 to tmpmap.Width-1 do
   begin
    if((i-tx)>=0) and ((i-tx)<tmpmap.Width) then
      begin
        p[i*3+2]:=p1[(i-tx)*3+2];
        p[i*3+1]:=p1[(i-tx)*3+1];
        p[i*3]:=p1[(i-tx)*3];
      end;
   end;
 end;
end;
end;
     Form1.Image1.Picture.Assign(tmpmap);
end;


procedure TForm5.Button2Click(Sender: TObject);
var
  i,j:integer;
  p,p1:pByteArray;
  k:double;
  x1,y1:integer;
begin
   k:=strtofloat(edit3.Text);
   tmpmap.Free ;
   tmpmap:=Tbitmap.Create ;
   tmpmap.Width:=floor(k*bitmap1.Width);
   tmpmap.Height:=floor(k*bitmap1.Height) ;
   tmpmap.PixelFormat:=pf24bit;
 for j:=0 to tmpmap.Height-1 do
 begin
   p:=tmpmap.ScanLine[j];
   y1:=floor(j/k);
   p1:=bitmap1.ScanLine[y1];
   for i:=0 to tmpmap.Width-1 do
   begin
     x1:=floor(i/k);
     p[i*3+2]:=p1[x1*3+2];
     p[i*3+1]:=p1[x1*3+1];
     p[i*3]:=p1[x1*3];
   end;
end;
   Form1.Image1.Picture.Assign(tmpmap);
end;
procedure TForm5.Button3Click(Sender: TObject);
var
  i,j:integer;
  p,p1:pByteArray;
  x1,y1:integer;
begin
   tmpmap.Free ;
   tmpmap:=Tbitmap.Create ;
   tmpmap.Width:=bitmap1.Width;
   tmpmap.Height:=bitmap1.Height;
   tmpmap.PixelFormat:=pf24bit;
 for j:=0 to tmpmap.Height-1 do
 begin
   p:=tmpmap.ScanLine[j];
   y1:=j;
   p1:=bitmap1.ScanLine[y1];
   for i:=0 to tmpmap.Width-1 do
   begin
     x1:=tmpmap.Width-1-i;
     p[i*3+2]:=p1[x1*3+2];
     p[i*3+1]:=p1[x1*3+1];
     p[i*3]:=p1[x1*3];
   end;
end;
   Form1.Image1.Picture.Assign(tmpmap);
end;

procedure TForm5.Button4Click(Sender: TObject);
var
  i,j:integer;
  p,p1:pByteArray;
  x1,y1:integer;
begin
   tmpmap.Free ;
   tmpmap:=Tbitmap.Create ;
   tmpmap.Width:=bitmap1.Width;
   tmpmap.Height:=bitmap1.Height;
   tmpmap.PixelFormat:=pf24bit;
 for j:=0 to tmpmap.Height-1 do
 begin
   p:=tmpmap.ScanLine[j];
   y1:=tmpmap.Height-1-j;
   p1:=bitmap1.ScanLine[y1];
   for i:=0 to tmpmap.Width-1 do
   begin
     x1:=i;
     p[i*3+2]:=p1[x1*3+2];
     p[i*3+1]:=p1[x1*3+1];
     p[i*3]:=p1[x1*3];
   end;
end;
  Form1.Image1.Picture.Assign(tmpmap);
end;

procedure TForm5.Button5Click(Sender: TObject);
var
  x0,y0:integer;
  i,j,w1,w2,h1,h2:integer;
  p,p0:PByteArray;
  angle,sina,cosa:double;
begin

   angle:=strtofloat(edit4.Text);
   angle:=(angle/180)*PI;
   sina:=sin(angle);
   cosa:=cos(angle);

   tmpmap.Free;
   tmpmap:=Tbitmap.Create;
   tmpmap.Width:=bitmap1.Width;
   tmpmap.Height:=bitmap1.Height;
   tmpmap.PixelFormat:=pf24bit;

   w1:=bitmap1.Width div 2;
   h1:=bitmap1.Height div 2;
   w2:=tmpmap.Width div 2;
   h2:=tmpmap.Height div 2;

   for j:=0 to tmpmap.Height-1 do
   begin
       p:=tmpmap.ScanLine[j];
       for i:=0 to tmpmap.Width-1 do
       begin
          y0:=floor((i-w1)*sina+(j-h1)*cosa+h2);
          if (y0>=0) and (y0<bitmap1.Height)  then
           begin
           x0:=floor((i-w1)*cosa-(j-h1)*sina+w2);
           if (x0>=0) and (x0<bitmap1.Width) then
           begin
                p0:=bitmap1.ScanLine[y0];
                p[i*3+2]:=p0[x0*3+2];
                p[i*3+1]:=p0[x0*3+1];
                p[i*3]:=p0[x0*3];
           end;
       end;//i
       end;//y0>=0
   end;
   form1.Image1.Picture.Assign(tmpmap);
end;


end.
