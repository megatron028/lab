unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm1 = class(TForm)
    Button1: TButton;
    ListBox1: TListBox;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);


  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  function EnumProc (Wd: HWnd; Param: LongInt): Boolean; stdcall;

implementation

uses Math;

{$R *.dfm}



procedure TForm1.Button1Click(Sender: TObject);
begin
    if findwindow(nil, 'Корзина')<>0
     then showmessage('okno ect')
    else showmessage('net okna');
    setwindowtext (findwindow(nil,'Корзина'),'мусор');
    if isIconic(findwindow(nil, 'мусор'))
     then OpenIcon(findwindow(nil,'мусор'))
     else CloseWindow(findwindow(nil,'мусор'));

end;
function EnumProc (Wd: HWnd; Param: LongInt): Boolean; stdcall;
Var
 Nm:Array[0..255] of Char;
Cs: Array[0..255] of Char;
Begin
GetWindowText(Wd,Nm,255);
GetClassName(Wd,Cs,255);
If Wd<>Form1.Handle then
Form1.ListBox1.Items.Add(String(Nm)+'/'+String(Cs));
EnumProc := TRUE;
end;




procedure TForm1.Button2Click(Sender: TObject);
begin
  ListBox1.Items.Clear;
  EnumWindows (@EnumProc, 0);
end;



end.
