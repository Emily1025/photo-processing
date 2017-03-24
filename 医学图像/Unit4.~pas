unit Unit4;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls,jpeg,math;

type
  TForm4 = class(TForm)
    GroupBox1: TGroupBox;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    Edit1: TEdit;
    Edit2: TEdit;
    Button1: TButton;
    GroupBox2: TGroupBox;
    Button2: TButton;
    Edit3: TEdit;
    Edit4: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    GroupBox3: TGroupBox;
    Edit5: TEdit;
    Edit6: TEdit;
    Edit7: TEdit;
    Button3: TButton;
    GroupBox4: TGroupBox;
    Edit8: TEdit;
    Edit9: TEdit;
    Edit10: TEdit;
    Button4: TButton;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    function cp(n:integer):integer;
    function funkc(c,w,x:integer):integer;
    function funln(x:integer;a,b,c:double):double;
    function funpower(x:integer;a,b,c:Extended):Extended;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form4: TForm4;

implementation

{$R *.dfm}
uses
Unit1,Unit2,Unit3;


function TForm4.cp(n:integer):integer;
begin
result:=n;
if n>255 then result:=255;
if n<0 then result:=0;
end;
function TForm4.funkc(c,w,x:integer):integer;
var
 a1:integer;
begin
a1:=c-(w div 2);
x:=cp((255*(x-a1)) div w);
result:=x;
end;
function TForm4.funln(x:integer;a,b,c:double):double;
begin
if (c<=0)or(c=1)or(b=0) then exit;
result:=a+ln(x+1)/(b*ln(c));
if result>255 then result:=255;
end;
function TForm4.funpower(x:integer;a,b,c:Extended):Extended;
begin
if b=0 then exit;
result:=power(b,c*(x-a))-1;
if result>255 then result:=255;
end;

procedure TForm4.Button1Click(Sender: TObject);
 var
  i,j:integer;
  p:pByteArray;
  k,b:double;
begin
   k:=strtofloat(Form4.edit1.Text);
   b:=strtofloat(Form4.edit2.Text);
    tmpmap.Free ;
    tmpmap:=Tbitmap.Create ;
    tmpmap.Width:=bitmap1.Width ;
    tmpmap.Height :=bitmap1.Height ;
    tmpmap.PixelFormat:=pf24bit;
    tmpmap.Assign(bitmap1);
   for j:=0 to tmpmap.Height -1 do
   begin
     p:=tmpmap.ScanLine [j];
     for i:=0 to tmpmap.Width -1 do
     begin
     if Form4.checkbox1.Checked then  p[i*3+2]:=cp(floor(k*p[i*3+2]+b));
     if Form4.checkbox2.Checked then  p[i*3+1]:=cp(floor(k*p[i*3+1]+b));
     if Form4.checkbox3.Checked then p[i*3]:=cp(floor(k*p[i*3]+b));
     end;
   end;
   Form1.Image1.Picture.Assign(tmpmap);
   Form2.Image1.Picture.Assign(tmpmap1);
   Form2.Image2.Picture.Assign(tmpmap1);
   Form2.Image3.Picture.Assign(tmpmap1);
   Form2.Image4.Picture.Assign(tmpmap1);

end;

procedure TForm4.Button2Click(Sender: TObject);
var
  i,j:integer;
  p:pByteArray;
  c,w:integer;
begin
   c:=strtoint(Form4.edit3.Text);
   w:=strtoint(Form4.edit4.Text);
    tmpmap.Free ;
    tmpmap:=Tbitmap.Create ;
    tmpmap.Width:=bitmap1.Width ;
    tmpmap.Height :=bitmap1.Height;
    tmpmap.PixelFormat:=pf24bit;
    tmpmap.Assign(bitmap1);
   for j:=0 to tmpmap.Height -1 do
   begin
     p:=tmpmap.ScanLine [j];
     for i:=0 to tmpmap.Width -1 do
     begin
     p[i*3+2]:=funkc(c,w,p[i*3+2]);
     p[i*3+1]:=funkc(c,w,p[i*3+1]);
     p[i*3]:=funkc(c,w,p[i*3]);
     end;
   end;
   Form1.Image1.Picture.Assign(tmpmap);
   Form2.Image1.Picture.Assign(tmpmap1);
   Form2.Image2.Picture.Assign(tmpmap1);
   Form2.Image3.Picture.Assign(tmpmap1);
   Form2.Image4.Picture.Assign(tmpmap1);
   end;

procedure TForm4.Button3Click(Sender: TObject);
var
  i,j:integer;
  p:pByteArray;
  a,b,c:double;
begin
   a:=strtofloat(Form4.edit5.Text);
   b:=strtofloat(Form4.edit6.Text);
   c:=strtofloat(Form4.edit7.Text);
    tmpmap.Free ;
    tmpmap:=Tbitmap.Create ;
    tmpmap.Width:=bitmap1.Width ;
    tmpmap.Height :=bitmap1.Height ;
    tmpmap.PixelFormat:=pf24bit;
    tmpmap.Assign(bitmap1);
   for j:=0 to tmpmap.Height -1 do
   begin
     p:=tmpmap.ScanLine [j];
     for i:=0 to tmpmap.Width -1 do
     begin
     p[i*3+2]:=cp(floor(funln(p[i*3+2],a,b,c)));
     p[i*3+1]:=cp(floor(funln(p[i*3+1],a,b,c)));
     p[i*3]:=cp(floor(funln(p[i*3],a,b,c)));
     end;
   end;
   Form1.Image1.Picture.Assign(tmpmap);
   Form2.Image1.Picture.Assign(tmpmap1);
   Form2.Image2.Picture.Assign(tmpmap1);
   Form2.Image3.Picture.Assign(tmpmap1);
   Form2.Image4.Picture.Assign(tmpmap1);
   end;

procedure TForm4.Button4Click(Sender: TObject);
var
  i,j:integer;
  p:pByteArray;
  a,b,c:Extended;
begin
   a:=strtofloat(Form4.edit8.Text);
   b:=strtofloat(Form4.edit9.Text);
   c:=strtofloat(Form4.edit10.Text);
    tmpmap.Free ;
    tmpmap:=Tbitmap.Create ;
    tmpmap.Width:=bitmap1.Width ;
    tmpmap.Height :=bitmap1.Height ;
    tmpmap.PixelFormat:=pf24bit;
    tmpmap.Assign(bitmap1);
   for j:=0 to tmpmap.Height -1 do
   begin
     p:=tmpmap.ScanLine [j];
     for i:=0 to tmpmap.Width -1 do
     begin
     p[i*3+2]:=cp(floor(funpower(p[i*3+2],a,b,c)));
     p[i*3+1]:=cp(floor(funpower(p[i*3+1],a,b,c)));
     p[i*3]:=cp(floor(funpower(p[i*3],a,b,c)));
     end;
   end;
   Form1.Image1.Picture.Assign(tmpmap);
   Form2.Image1.Picture.Assign(tmpmap1);
   Form2.Image2.Picture.Assign(tmpmap1);
   Form2.Image3.Picture.Assign(tmpmap1);
   Form2.Image4.Picture.Assign(tmpmap1);
   end;


end.
