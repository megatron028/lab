unit UnitClient;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Spin, ScktComp, ExtCtrls;

type
  TForm1 = class(TForm)
    grp1: TGroupBox;
    pnl1: TPanel;
    ClientSocket: TClientSocket;
    edt1: TEdit;
    lbl1: TLabel;
    lbl2: TLabel;
    se1: TSpinEdit;
    lbl3: TLabel;
    edt2: TEdit;
    btn1: TButton;
    mmo1: TMemo;
    btn2: TButton;
    mmo2: TMemo;
    procedure btn1Click(Sender: TObject);
    procedure ClientSocketConnect(Sender: TObject;
      Socket: TCustomWinSocket);
    procedure ClientSocketDisconnect(Sender: TObject;
      Socket: TCustomWinSocket);
    procedure ClientSocketError(Sender: TObject; Socket: TCustomWinSocket;
      ErrorEvent: TErrorEvent; var ErrorCode: Integer);
    procedure btn2Click(Sender: TObject);
    procedure ClientSocketRead(Sender: TObject; Socket: TCustomWinSocket);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}


procedure TForm1.btn1Click(Sender: TObject);
begin
  if  ClientSocket.Active then
      ClientSocket.Close     //stop
  else
  begin
    ClientSocket.Host:=edt1.Text;
    ClientSocket.Port:=se1.Value;
    ClientSocket.Open;    //start 
  end;
end;



procedure TForm1.ClientSocketConnect(Sender: TObject;
  Socket: TCustomWinSocket);
begin
   // socket - подключение к серверу
   edt1.Enabled:=False;
   edt2.Enabled:=False;
   se1.Enabled:=False;
   btn1.Caption:='stop';
   btn2.Enabled:=True;
   mmo2.Lines.Add('---------------------');
   mmo2.Lines.Add(TimeToStr(Time)+'server start'
   +ClientSocket.Socket.LocalHost +' ['
   + ClientSocket.Socket.LocalAddress+ ' :'
   + IntToStr(ClientSocket.Socket.LocalPort)+' ]');
   mmo2.Lines.Add('');
end;

procedure TForm1.ClientSocketDisconnect(Sender: TObject;
  Socket: TCustomWinSocket);
begin
   edt1.Enabled:=True;
   edt2.Enabled:=True;
   se1.Enabled:=True;
   btn1.Caption:='start';
   btn2.Enabled:=False;
   mmo2.Lines.Add('');
   mmo2.Lines.Add(TimeToStr(Time)+' Disconnect') ;
end;

procedure TForm1.ClientSocketError(Sender: TObject;
  Socket: TCustomWinSocket; ErrorEvent: TErrorEvent;
  var ErrorCode: Integer);
begin
     edt1.Enabled:=True;
   edt2.Enabled:=True;
   se1.Enabled:=True;
   btn1.Caption:='start';
   btn2.Enabled:=False;
   mmo2.Lines.Add('');
   mmo2.Lines.Add(TimeToStr(Time)+' Error') ;
end;

procedure TForm1.btn2Click(Sender: TObject);
var mess:string;
begin
   mess:=TimeToStr(Time)+' '+edt2.Text+': '+mmo1.Text; //message
   mmo2.Lines.Add(mess); //for chat
   ClientSocket.Socket.SendText(mess); // to server
   mmo1.Lines.Clear;
end;

procedure TForm1.ClientSocketRead(Sender: TObject;
  Socket: TCustomWinSocket);
var mess:string;
begin
   mess:=ClientSocket.Socket.ReceiveText; // get message
   mmo2.Lines.Add(mess);
end;

end.
