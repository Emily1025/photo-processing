unit Unit8;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls,math;

type
  TForm8 = class(TForm)
    GroupBox1: TGroupBox;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    RadioButton3: TRadioButton;
    RadioButton4: TRadioButton;
    Edit1: TEdit;
    ScrollBar1: TScrollBar;
    GroupBox2: TGroupBox;
    Label1: TLabel;
    Edit2: TEdit;
    Button1: TButton;
    GroupBox3: TGroupBox;
    Label2: TLabel;
    Edit3: TEdit;
    ScrollBar2: TScrollBar;
    Label3: TLabel;
    Edit4: TEdit;
    ScrollBar3: TScrollBar;
    Label4: TLabel;
    Edit5: TEdit;
    ScrollBar4: TScrollBar;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Memo1: TMemo;
    Edit6: TEdit;
    Edit7: TEdit;
    Memo2: TMemo;
    Button5: TButton;
    function fg(yz:integer):Tbitmap;
    procedure ScrollBar1Change(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    function diedai(yz:integer):integer;
    procedure Button3Click(Sender: TObject);
    function  shang(yz:integer):integer;
    function stj(yz:integer):double;
    procedure Button2Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    function ostu(yz:integer):double;
    procedure Button5Click(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form8: TForm8;

implementation

{$R *.dfm}
uses
Unit1,Unit3;
var
tmap3:Tbitmap;
zftr:Array[0..255] of integer;

function TForm8.fg(yz:integer):Tbitmap;
var
i,j:integer;
p,p1:PByteArray;
gray:integer;
begin
   tmap3.Free;
   tmap3:=Tbitmap.Create;
   tmap3.Width:=bitmap1.Width;
   tmap3.Height:=bitmap1.Height;
   tmap3.PixelFormat:=pf24bit;

   for j:=0 to tmap3.Height-1 do
   begin
    p:=tmap3.ScanLine[j];
    p1:=bitmap1.ScanLine[j];
    for i:=0 to tmap3.Width-1 do
    begin
    gray:=(p1[i*3+2]+p1[i*3+1]+p1[i*3]) div 3;
    if Form8.RadioButton1.Checked then gray:=(p1[i*3+2]+p1[i*3+1]+p1[i*3]) div 3;
    if Form8.RadioButton2.Checked then gray:=p1[i*3+2];
    if Form8.RadioButton3.Checked then gray:=p1[i*3+1];
    if Form8.RadioButton4.Checked then gray:=p1[i*3];
    if gray>=yz then
     begin
       p[i*3+2]:=255;
       p[i*3+1]:=255;
       p[i*3]:=255;
     end
     else
     begin
       p[i*3+2]:=0;
       p[i*3+1]:=0;
       p[i*3]:=0;
     end;
    end;
   end;
   Form1.Image1.Picture.Assign(tmap3);
end;

procedure TForm8.ScrollBar1Change(Sender: TObject);
begin
  Form8.Edit1.Text:=inttostr(Form8.ScrollBar1.Position);
  fg(Form8.ScrollBar1.Position);
end;

function TForm8.diedai(yz:integer):integer;
var
i,j:integer;
p:PByteArray;
m1,m0:Extended;
sum,count,gray:integer;
begin
  //直方图数组初始化
  for i:=0 to 255 do
   zftr[i]:=0;
  //求直方图
  for j:= 0 to bitmap1.Height-1 do
  begin
   p:=bitmap1.ScanLine[j];
   for i:=0 to bitmap1.Width-1 do
   begin
     gray:=(p[i*3+2]+p[i*3+1]+p[i*3]) div 3;
     zftr[gray]:=zftr[gray]+1;
   end;
  end;
  //求0-yz平均灰度值
  sum:=0;
  count:=0;
  for i:=0 to yz do
   begin
     sum:=sum+zftr[i]*i;
     count:=count+zftr[i];
   end;
  m0:=sum/count;
   //求yz-255平均灰度值
  sum:=0;
  count:=0;
  for i:=yz+1 to 255 do
   begin
     sum:=sum+zftr[i]*i;
     count:=count+zftr[i];
   end;
   m1:=sum/count;
   result:=floor((m0+m1)/2);
end;

procedure TForm8.Button1Click(Sender: TObject);
var
 yz:integer;
begin
 yz:=strtoint(Form8.Edit2.Text);
 yz:=diedai(yz);
 Form8.Edit2.Text:=inttostr(yz);
 fg(yz);
end;
function  TForm8.shang(yz:integer):integer;
var
 h0,h1:double;
 m0,m1:integer;
 i,j:integer;
 p:PByteArray;
 gray:integer;
 max:double;
 a:double;
 fcarr: Array[0..255] of double;
 begin
     //直方图数组初始化
  for i:=0 to 255 do
   zftr[i]:=0;
   fcarr[i]:=0;
  //求直方图
  for j:= 0 to bitmap1.Height-1 do
  begin
   p:=bitmap1.ScanLine[j];
   for i:=0 to bitmap1.Width-1 do
   begin
     gray:=(p[i*3+2]+p[i*3+1]+p[i*3]) div 3;
     zftr[gray]:=zftr[gray]+1;
   end;
  end;
  memo1.Clear;
  for i:=0 to 255 do
  begin
    fcarr[i]:=stj(i);
    memo1.Lines.Add(inttostr(i)+':'+floattostr(fcarr[i]));
  end;
   max:=fcarr[0];
   yz:=0;
   for i:=1 to 255 do
   begin
    if fcarr[i]>max then
     begin
      max:=fcarr[i];
      yz:=i;
     end;
   end;
   result:=yz;
 end;
function TForm8.stj(yz:integer):double;
var
pt,h1,h2:double;
i:integer;
begin
  //0-yz的熵
  pt:=0;
  for i:=0 to yz do
   begin
     pt:=pt+zftr[i];//统计0到阈值yz的像素点的个数
   end;
  if pt=0 then pt:=1;
  h1:=0;
  for i:=0 to yz do
   begin
    if zftr[i]>0 then h1:=h1+(zftr[i]*log10(zftr[i]/pt))/pt;
   end;
     //yz-255的熵
  pt:=0;
  for i:=yz+1 to 255 do
   begin
     pt:=pt+zftr[i]; // 统计yz+1到阈值255的像素点的个数
   end;
  h2:=0;
  for i:=yz+1 to 255 do
   begin
    if zftr[i]>0 then  h2:=h2+(zftr[i]*log10(zftr[i]/pt))/pt;
   end;
  result:=-(h1+h2);
end;

procedure TForm8.Button3Click(Sender: TObject);
var
yz:integer;
begin
  yz:=strtoint(Form8.Edit6.Text);
  yz:=shang(yz);
  Form8.Edit6.Text:=inttostr(yz);
  fg(yz);
end;

procedure TForm8.Button2Click(Sender: TObject);
var
i,j:integer;
p,p1:PByteArray;
gray,m:integer;
begin
  Form8.Edit3.Text:=inttostr(Form8.ScrollBar2.Position);
  Form8.Edit4.Text:=inttostr(Form8.ScrollBar3.Position);
  Form8.Edit5.Text:=inttostr(Form8.ScrollBar4.Position);

   tmap3.Free;
   tmap3:=Tbitmap.Create;
   tmap3.Width:=bitmap1.Width;
   tmap3.Height:=bitmap1.Height;
   tmap3.PixelFormat:=pf24bit;

   for j:=0 to tmap3.Height-1 do
   begin
    p:=tmap3.ScanLine[j];
    p1:=bitmap1.ScanLine[j];
    for i:=0 to tmap3.Width-1 do
    begin
    gray:=p1[i*3+2]+p1[i*3+1]+p1[i*3];
    m:=(Form8.ScrollBar2.Position+Form8.ScrollBar3.Position+Form8.ScrollBar4.Position) div 3;
    if gray>=m then
     begin
       p[i*3+2]:=255;
       p[i*3+1]:=255;
       p[i*3]:=255;
     end
     else
     begin
       p[i*3+2]:=0;
       p[i*3+1]:=0;
       p[i*3]:=0;
     end;
    end;
   end;
   Form1.Image1.Picture.Assign(tmap3);
end;
function TForm8.ostu(yz:integer):double;       //Ostu
var
  i,j,gray:integer;
  p:PByteArray;
  w0,w1,pt,n1,u0,u1,a0,a1,aw,ab,at:double;
  zfarr:Array[0..255] of integer;
   p1:Array[0..255] of double;
  begin
    //直方图数组初始化
    for i:=0 to 255 do
      zfarr[i]:=0;
     //求直方图
    for j:=0 to bitmap1.Height -1 do
    begin
      p:=bitmap1.ScanLine[j];
      for i:=0 to bitmap1.Width -1 do
      begin
        gray:=(p[i*3+2]+p[i*3+1]+p[i*3]) div 3;
        zfarr[gray]:=zfarr[gray]+1;
      end;
    end;//求得了每级灰度的像素数
   n1:=0;
    for i:=0 to 255 do
    begin
      n1:=n1+zfarr[i];
    end;
    for i:=0 to 255 do
    begin
      p1[i]:=zfarr[i]/n1;
    end;
     //求每个灰度级的概率p1[i]，总的像素数n1.
    w0:=0;
    for i:=0 to yz do
    begin
      w0:=p1[i]+w0;
    end;
    //c0分布概率w0;
    w1:=0;
    for i:=yz+1 to 255 do
    begin
      w1:=p1[i]+w1;
    end;
    //c1分布概率w1;
    if w0=0 then w0:=1;
    if w1=0 then w1:=1;//防止除0错误
    u0:=0;
    for i:=0 to yz do
    begin
      u0:=i*p1[i]+u0;
    end;
    u0:=u0/w0;
    //c0均值u0
    u1:=0;
    for i:=yz+1 to 255 do
    begin
      u1:=i*p1[i]+u1;
    end;
    u1:=u1/w1; //c1类的类均值
    //c1均值u1
     a0:=0;
    for i:=0 to yz do
    begin
      a0:=(i-u0)*(i-u0)*p1[i]+a0;
    end;
    a0:=a0/w0; //co方差
    a1:=0;
    for i:=yz+1 to 255 do
    begin
       a1:=(i-u1)*(i-u1)*p1[i]+a1;
    end;
    a1:=a1/w1; //c1方差
    //求a0,a1;
    aw:=w0*a0+w1*a1; //类内方差
    ab:=w0*w1*(u0-u1)*(u0-u1); //类间方差
    at:=aw+ab;//总体方差
    pt:=ab/at;
    result:=pt;
  end;


procedure TForm8.Button4Click(Sender: TObject);
var
  i,yz:integer;
  max:double;
  fcarr:Array[0..255] of double;
begin
 memo2.Clear;
 for i:=0 to 255 do
     begin
       fcarr[i]:=ostu(i);
       memo2.Lines.Add(inttostr(i)+':  '+floattostr(fcarr[i]));
      end;
 for i:=0 to 255 do
    begin
      fcarr[i]:=ostu(i);
    end;
 max:=fcarr[0];
  yz:=0;
 for i:=0 to 255 do
    begin
       if fcarr[i]>max then
         begin
             max:=fcarr[i];
             yz:=i;
        end;
    end;
    edit7.Text:=inttostr(yz);
    fg(yz);
   end;
procedure TForm8.Button5Click(Sender: TObject);
var
  i,j,gray,yz:integer;
  p:PByteArray;
  pt,n1,c0,c1,m0,m1,m2,m3,min,cha:double;
  d:double;
  zfarr:Array[0..255] of integer;
  p1:Array[0..255] of double;
  begin
  //为图像的0,1,2,3阶矩阵赋初值
    m0:=1;
    m1:=0;
    m2:=0;
    m3:=0;

    //直方图数组初始化
    for i:=0 to 255 do
      zfarr[i]:=0;
     //求直方图
    for j:=0 to bitmap1.Height -1 do
    begin
      p:=bitmap1.ScanLine[j];
      for i:=0 to bitmap1.Width -1 do
      begin
        gray:=(p[i*3+2]+p[i*3+1]+p[i*3]) div 3;
        zfarr[gray]:=zfarr[gray]+1;
      end;
    end;//求得了每级灰度的像素数
   n1:=0;
    for i:=0 to 255 do
    begin
      n1:=n1+zfarr[i];
    end;
    for i:=0 to 255 do
    begin
      p1[i]:=zfarr[i]/n1;
    end;
     for i:=0 to 255 do
    begin
    ////求出图像的0,1,2,3阶矩阵
      m1:=m1+ p1[i]*i;
      m2:=m2+p1[i]*i*i;
      m3:=m3+p1[i]*i*i*i;
    end;
    c0:=(m1*m3-m2)/(m2-m1*m1);
    c1:=(m1*m2-m3)/(m2-m1*m1);
    d:=(sqrt(abs(c1*c1-4*c0*c0))-c1)/2;
    pt:=(d-m1)/sqrt(abs(c1*c1-4*c0)); //二值化后的灰度值的分布概率pt
    min:=abs(p1[0]-pt); //假设p1[0]与pt之间的差值最小
    for i:=0 to 255 do  //将与pt最接近的p1[i]设为先验概率
    begin
      cha:=abs(p1[i]-pt);
      if(cha<=min) then
      begin
        min:=cha;
        yz:=i;
      end;
    end;
     fg(yz);
end;

end.
