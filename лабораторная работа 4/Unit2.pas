unit Unit2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;
  procedure form (Handle: THandle)stdcall;
type
  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Edit1: TEdit;
    Label1: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;
  type My=function(k:integer):integer;
var
  Form1: TForm1;
procedure form; external 'Project2.dll' index 10 name 'form';
implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin
form(Handle);
end;

procedure TForm1.Button2Click(Sender: TObject);
var Handle  :  THandle; fuc  :  My ;
begin
 Handle:=LoadLibrary('Project3.dll');
 @fuc:=GetProcAddress(Handle,'fuc');
 Edit1.Text:=IntToStr(fuc(StrToInt(Edit1.Text)));
 FreeLibrary(Handle);
end;

end.
