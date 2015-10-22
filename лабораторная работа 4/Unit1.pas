unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Edit1: TEdit;
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  procedure form (Handle:THandle);export;stdcall;

implementation

{$R *.dfm}
procedure form (Handle:THandle);
begin
Application.Handle:=Handle;
Form1:=TForm1.Create(Application);
Form1.ShowModal;
Form1.Free;
end;
procedure TForm1.Button1Click(Sender: TObject);
begin
Form1.Close;
end;

end.
