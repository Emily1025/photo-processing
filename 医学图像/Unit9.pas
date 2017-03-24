unit Unit9;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm9 = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Edit1: TEdit;
    Label2: TLabel;
    Edit2: TEdit;
    Label3: TLabel;
    Label4: TLabel;
    Edit3: TEdit;
    GroupBox2: TGroupBox;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Edit4: TEdit;
    Edit5: TEdit;
    Edit6: TEdit;
    Edit7: TEdit;
    Edit8: TEdit;
    Edit9: TEdit;
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
    function chepix(r,g,b,r1,g1,b1,r2,g2,b2:Integer):boolean;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form9: TForm9;

implementation
uses
Unit1,Unit3;
var
bitmap2:Tbitmap;

{$R *.dfm}


function TForm9.chepix(r,g,b,r1,g1,b1,r2,g2,b2:Integer):boolean;
 begin
   result:=(r>=r1) and (r<=r2)and (g>=g1)and (g<=g2)and (b>=b1)and (b<=b2);
 end;

procedure TForm9.Button1Click(Sender: TObject);
var
  
  i,j:integer;
  p:PByteArray;
  r1,g1,b1,r2,g2,b2:integer;
begin
       bitmap2.Free;
       bitmap2:=Tbitmap.Create;
       bitmap2.Width:=bitmap1.Width;
       bitmap2.Height:=bitmap1.Height;
       bitmap2.PixelFormat:=pf24bit;
       bitmap2.Assign(bitmap1);

       r1:=strtoint(Form9.Edit4.Text);
       g1:=strtoint(Form9.Edit6.Text);
       b1:=strtoint(Form9.Edit8.Text);
       r2:=strtoint(Form9.Edit5.Text);
       g2:=strtoint(Form9.Edit7.Text);
       b2:=strtoint(Form9.Edit9.Text);


           
 for j:=0 to bitmap2.Height-1 do
  begin
      p:=bitmap2.ScanLine[j];
      for i:=0 to bitmap2.Width-1 do
      begin
       if chepix(p[i*3+2],p[i*3+1],p[i*3],r1,g1,b1,r2,g2,b2)=false then
       begin
        p[i*3+2]:=0;
        p[i*3+1]:=0;
        p[i*3]:=0;

        end;
       end;
   end;
    Form1.Image1.Picture.Assign(bitmap2);
   
end;
end.
