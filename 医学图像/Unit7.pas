unit Unit7;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm7 = class(TForm)
    GroupBox1: TGroupBox;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    function paixu(a0,a1,a2,a3,a4,a5,a6,a7,a8:integer):integer;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form7: TForm7;

implementation
  uses
Unit1,Unit3;
{$R *.dfm}
 var
bitmap2:Tbitmap;
procedure TForm7.Button1Click(Sender: TObject);
var
  i,j:integer;
  p,p1,p2,p3:PByteArray;
begin
   bitmap2.Free ;
   bitmap2:=Tbitmap.Create ;
   bitmap2.Width:=bitmap1.Width ;
   bitmap2.Height :=bitmap1.Height ;
   bitmap2.PixelFormat:=pf24bit;
   for j:=1 to bitmap2.Height-2 do
   begin
     p:=bitmap2.ScanLine[j];
     p1:=bitmap1.ScanLine[j-1];
     p2:=bitmap1.ScanLine[j];
     p3:=bitmap1.ScanLine[j+1];
     for i:=1 to bitmap2.Width-2 do
     begin
       p[i*3+2]:=(p1[(i-1)*3+2]+p1[i*3+2]+p1[(i+1)*3+2]+
                  p2[(i-1)*3+2]+p2[i*3+2]+p2[(i+1)*3+2]+
                  p3[(i-1)*3+2]+p3[i*3+2]+p3[(i+1)*3+2]) div 9;
       p[i*3+1]:=(p1[(i-1)*3+1]+p1[i*3+1]+p1[(i+1)*3+1]+
                  p2[(i-1)*3+1]+p2[i*3+1]+p2[(i+1)*3+1]+
                  p3[(i-1)*3+1]+p3[i*3+1]+p3[(i+1)*3+1]) div 9;
       p[i*3]:=(p1[(i-1)*3]+p1[i*3]+p1[(i+1)*3]+
                  p2[(i-1)*3]+p2[i*3]+p2[(i+1)*3]+
                  p3[(i-1)*3]+p3[i*3]+p3[(i+1)*3]) div 9;

     end;
   end;
  form1.image1.Picture.Assign(bitmap2);
end;

procedure TForm7.Button2Click(Sender: TObject);
var
  i,j:integer;
  p,p1,p2,p3:PByteArray;
begin
   bitmap2.Free ;
   bitmap2:=Tbitmap.Create ;
   bitmap2.Width:=bitmap1.Width ;
   bitmap2.Height :=bitmap1.Height ;
   bitmap2.PixelFormat:=pf24bit;
   for j:=1 to bitmap2.Height-2 do
   begin
     p:=bitmap2.ScanLine[j];
     p1:=bitmap1.ScanLine[j-1];
     p2:=bitmap1.ScanLine[j];
     p3:=bitmap1.ScanLine[j+1];
     for i:=1 to bitmap2.Width-2 do
     begin
       p[i*3+2]:=(p1[(i-1)*3+2]+2*p1[i*3+2]+p1[(i+1)*3+2]+
                  2*p2[(i-1)*3+2]+4*p2[i*3+2]+2*p2[(i+1)*3+2]+
                  p3[(i-1)*3+2]+2*p3[i*3+2]+p3[(i+1)*3+2]) div 16;
       p[i*3+1]:=(p1[(i-1)*3+1]+2*p1[i*3+1]+p1[(i+1)*3+1]+
                  2*p2[(i-1)*3+1]+4*p2[i*3+1]+2*p2[(i+1)*3+1]+
                  p3[(i-1)*3+1]+2*p3[i*3+1]+p3[(i+1)*3+1]) div 16;
       p[i*3]:=(p1[(i-1)*3]+2*p1[i*3]+p1[(i+1)*3]+
                  2*p2[(i-1)*3]+4*p2[i*3]+2*p2[(i+1)*3]+
                  p3[(i-1)*3]+2*p3[i*3]+p3[(i+1)*3]) div 16;

     end;
   end;
  form1.image1.Picture.Assign(bitmap2);
 end;
function TForm7.paixu(a0,a1,a2,a3,a4,a5,a6,a7,a8:integer):integer;
var
 b:Array[0..8] of integer;
 t,i,j:integer;
begin
   b[0]:=a0;
   b[1]:=a1;
   b[2]:=a2;
   b[3]:=a3;
   b[4]:=a4;
   b[5]:=a5;
   b[6]:=a6;
   b[7]:=a7;
   b[8]:=a8;
  for i:=0 to 7 do
  begin
    for j:=i+1 to 8 do
    begin
      t:=b[i];
      b[i]:=b[j];
      b[j]:=t;
    end;
  end;
  result:=b[4];
end;
procedure TForm7.Button3Click(Sender: TObject);
var
  i,j:integer;
  p,p1,p2,p3:PByteArray;
begin
   bitmap2.Free ;
   bitmap2:=Tbitmap.Create ;
   bitmap2.Width:=bitmap1.Width ;
   bitmap2.Height :=bitmap1.Height ;
   bitmap2.PixelFormat:=pf24bit;
   for j:=1 to bitmap2.Height-2 do
   begin
     p:=bitmap2.ScanLine[j];
     p1:=bitmap1.ScanLine[j-1];
     p2:=bitmap1.ScanLine[j];
     p3:=bitmap1.ScanLine[j+1];
     for i:=1 to bitmap2.Width-2 do
     begin
       p[i*3+2]:=paixu(p1[(i-1)*3+2],p1[i*3+2],p1[(i+1)*3+2],
                  p2[(i-1)*3+2],p2[i*3+2],p2[(i+1)*3+2],
                  p3[(i-1)*3+2],p3[i*3+2],p3[(i+1)*3+2]);
       p[i*3+1]:=paixu(p1[(i-1)*3+1],p1[i*3+1],p1[(i+1)*3+1],
                  p2[(i-1)*3+1],p2[i*3+1],p2[(i+1)*3+1],
                  p3[(i-1)*3+1],p3[i*3+1],p3[(i+1)*3+1]);
         p[i*3]:=paixu(p1[(i-1)*3],p1[i*3],p1[(i+1)*3],
                    p2[(i-1)*3],p2[i*3],p2[(i+1)*3],
                    p3[(i-1)*3],p3[i*3],p3[(i+1)*3]);

     end;
   end;
  form1.image1.Picture.Assign(bitmap2);
 end;
end.
