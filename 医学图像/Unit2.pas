unit Unit2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls,math;

type
  TForm2 = class(TForm)
    GroupBox1: TGroupBox;
    Image1: TImage;
    Image2: TImage;
    Image3: TImage;
    Image4: TImage;
    Button1: TButton;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation
uses
Unit1 ,Unit3,Unit4;

{$R *.dfm}
var
   bitmap3,bitmap4:Tbitmap;





procedure TForm2.Button1Click(Sender: TObject);
var
i,j,gray,max:integer;
p:pbytearray;
zfarr:array[0..255] of integer;
begin
   bitmap4.Free;
   bitmap4:=Tbitmap.Create;
   bitmap4.width:= form1.Image1.Picture.width;
    bitmap4.height:= form1.Image1.Picture.height;
    bitmap4.pixelFormat:=pf24bit;
   bitmap4.canvas.draw(0,0,form1.image1.Picture.Graphic);
  for i:=0 to 255 do
  begin
      zfarr[i]:=0;
end;
for j:=0 to bitmap4.Height -1  do
begin
p:=bitmap4.ScanLine[j];
for i:=0 to bitmap4.Width -1  do
begin
  gray:=floor(0.3*p[i*3+2]+0.59*p[i*3+1]+0.11*p[i*3]);
   zfarr[gray]:= zfarr[gray]+1;
end;

end;
max:=0;
for i:=0 to 255 do
begin
if zfarr[i]>max then max:=zfarr[i]
end;
 bitmap3.Free;
 bitmap3:=tbitmap.Create;
 bitmap3.Width:=255;
 bitmap3.Height:=100;
 bitmap3.PixelFormat:=pf24bit;
 for i:=0 to 255 do
 begin
 bitmap3.Canvas.MoveTo(i,100);
  bitmap3.Canvas.LineTo(i,100-zfarr[i]*100 div max);
 end;
  image1.Picture.Assign(bitmap3);//黑色的
begin
   bitmap4.Free;
   bitmap4:=Tbitmap.Create;
   bitmap4.width:= form1.Image1.Picture.width;
    bitmap4.height:= form1.Image1.Picture.height;
    bitmap4.pixelFormat:=pf24bit;
   bitmap4.canvas.draw(0,0,form1.image1.Picture.Graphic);
  for i:=0 to 255 do
  begin
      zfarr[i]:=0;
end;
for j:=0 to bitmap4.Height -1  do
begin
p:=bitmap4.ScanLine[j];
for i:=0 to bitmap4.Width -1  do
begin
  gray:=p[i*3+2];
   zfarr[gray]:= zfarr[gray]+1;
end;

end;
max:=0;
for i:=0 to 255 do
begin
if zfarr[i]>max then max:=zfarr[i]
end;
 bitmap3.Free;
 bitmap3:=tbitmap.Create;
 bitmap3.Width:=255;
 bitmap3.Height:=100;
 bitmap3.PixelFormat:=pf24bit;
 bitmap3.Canvas.Pen.Color:=clred;
 for i:=0 to 255 do
 begin
 bitmap3.Canvas.MoveTo(i,100);
  bitmap3.Canvas.LineTo(i,100-zfarr[i]*100 div max);
 end;
 end;
    image2.Picture.Assign(bitmap3); //红色的
   begin
   bitmap4.Free;
   bitmap4:=Tbitmap.Create;
   bitmap4.width:= form1.Image1.Picture.width;
    bitmap4.height:= form1.Image1.Picture.height;
    bitmap4.pixelFormat:=pf24bit;
   bitmap4.canvas.draw(0,0,form1.image1.Picture.Graphic);
  for i:=0 to 255 do
  begin
      zfarr[i]:=0;
end;
for j:=0 to bitmap4.Height -1  do
begin
p:=bitmap4.ScanLine[j];
for i:=0 to bitmap4.Width -1  do
begin
  gray:=p[i*3+1];
   zfarr[gray]:= zfarr[gray]+1;
end;

end;
max:=0;
for i:=0 to 255 do
begin
if zfarr[i]>max then max:=zfarr[i]
end;
 bitmap3.Free;
 bitmap3:=tbitmap.Create;
 bitmap3.Width:=255;
 bitmap3.Height:=100;
 bitmap3.PixelFormat:=pf24bit;
  bitmap3.Canvas.Pen.Color:=clgreen;
 for i:=0 to 255 do
 begin
 bitmap3.Canvas.MoveTo(i,100);
  bitmap3.Canvas.LineTo(i,100-zfarr[i]*100 div max);
 end;
 end;
    image3.Picture.Assign(bitmap3); //绿色的
   begin
   bitmap4.Free;
   bitmap4:=Tbitmap.Create;
   bitmap4.width:= form1.Image1.Picture.width;
    bitmap4.height:= form1.Image1.Picture.height;
    bitmap4.pixelFormat:=pf24bit;
   bitmap4.canvas.draw(0,0,form1.image1.Picture.Graphic);
  for i:=0 to 255 do
  begin
      zfarr[i]:=0;
end;
for j:=0 to bitmap4.Height -1  do
begin
p:=bitmap4.ScanLine[j];
for i:=0 to bitmap4.Width -1  do
begin
  gray:=p[i*3];
   zfarr[gray]:= zfarr[gray]+1;
end;

end;
max:=0;
for i:=0 to 255 do
begin
if zfarr[i]>max then max:=zfarr[i]
end;
 bitmap3.Free;
 bitmap3:=tbitmap.Create;
 bitmap3.Width:=255;
 bitmap3.Height:=100;
 bitmap3.PixelFormat:=pf24bit;
  bitmap3.Canvas.Pen.Color:=clblue;
 for i:=0 to 255 do
 begin
 bitmap3.Canvas.MoveTo(i,100);
  bitmap3.Canvas.LineTo(i,100-zfarr[i]*100 div max);
 end;
 end;
    image4.Picture.Assign(bitmap3); //蓝色的
end;

procedure TForm2.Button2Click(Sender: TObject);
var
i,j,gray,max,gray1,r,g,b:integer;
k:real;
p:pbytearray;
zfarr:array[0..255] of integer;
zfarr1:array[0..255] of integer;
begin
   bitmap4.Free;
   bitmap4:=Tbitmap.Create;
   bitmap4.width:= form1.Image1.Picture.width;
    bitmap4.height:= form1.Image1.Picture.height;
    bitmap4.pixelFormat:=pf24bit;
   bitmap4.canvas.draw(0,0,form1.image1.Picture.Graphic);
  for i:=0 to 255 do
  begin
      zfarr[i]:=0;
end;
for j:=0 to bitmap4.Height -1  do
begin
p:=bitmap4.ScanLine[j];
for i:=0 to bitmap4.Width -1  do
begin
  gray:=floor(0.3*p[i*3+2]+0.59*p[i*3+1]+0.11*p[i*3]);
   zfarr[gray]:= zfarr[gray]+1; //直方图初始化
end;

end;
zfarr1[0]:=zfarr[0];
 for i:=1 to 255 do
  begin
      zfarr1[i]:=zfarr[i]+zfarr1[i-1]; //累积分布函数
  end;
  for i:=1 to 255 do
  begin
      zfarr[i]:=0;//各级先置0
  end;
   for i:=1 to 255 do
  begin
       k:= zfarr1[i] /  zfarr1[255];  //累积分布的概率
        gray1:=floor(254*k+0.5); //确定灰度级
      zfarr[gray1]:=zfarr[gray1]+1;//给这个灰度级的值加1
  end;
max:=0;
for i:=0 to 255 do
begin
if zfarr[i]>max then max:=zfarr[i]
end;
 bitmap3.Free;
 bitmap3:=tbitmap.Create;
 bitmap3.Width:=255;
 bitmap3.Height:=100;
 bitmap3.PixelFormat:=pf24bit;
 for i:=0 to 255 do
 begin
 bitmap3.Canvas.MoveTo(i,100);
  bitmap3.Canvas.LineTo(i,100-zfarr[i]*100 div max);
 end;
  image1.Picture.Assign(bitmap3);


 for j:=0 to bitmap4.Height -1  do
begin
p:=bitmap4.ScanLine[j];
for i:=0 to bitmap4.Width -1  do
begin
r:=p[i*3+2];
   p[i*3+2]:= zfarr[r];
g:=p[i*3+1];
   p[i*3+1]:= zfarr[g];
   
b:=p[i*3];
   p[i*3]:= zfarr[b];//通过新的直方图改变初始图像。
end;
end;
form1.Image1.Picture.Assign(bitmap4);
end;

end.
