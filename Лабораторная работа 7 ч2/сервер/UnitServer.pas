unit UnitServer;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ScktComp, Spin, ExtCtrls;

type
  TForm1 = class(TForm)
    ServerSocket: TServerSocket;
    pnl1: TPanel;
    mmo1: TMemo;
    mmo2: TMemo;
    se1: TSpinEdit;
    lbl1: TLabel;
    btn1: TButton;
    procedure btn1Click(Sender: TObject);
    procedure ServerSocketClientConnect(Sender: TObject;
      Socket: TCustomWinSocket);
    procedure ServerSocketClientDisconnect(Sender: TObject;
      Socket: TCustomWinSocket);
    procedure ServerSocketClientRead(Sender: TObject;
      Socket: TCustomWinSocket);
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
   if  ServerSocket.Active then     //���� ������ �������
   begin
      ServerSocket.Close;   // stop
      btn1.Caption:='start';
      mmo1.Lines.Add(TimeToStr(Time)+'server stop');
   end
   else
   begin
      ServerSocket.Port:=se1.Value; // add port
      ServerSocket.Open; //start
      btn1.Caption:='stop';
      mmo1.Lines.Add(TimeToStr(Time)+ 'server'+
         ServerSocket.Socket.LocalHost+'['+
         ServerSocket.Socket.LocalAddress+':'  +
         IntToStr(ServerSocket.Socket.LocalPort)+
         '] start');
   end;
end;

procedure TForm1.ServerSocketClientConnect(Sender: TObject;
  Socket: TCustomWinSocket);
begin
 // socket - ��������������  ����������� ������ ������������
 mmo1.Lines.Add('['+TimeToStr(Time)+'] connect'+Socket.RemoteHost+
 ':'+inttostr(Socket.RemotePort));

end;

procedure TForm1.ServerSocketClientDisconnect(Sender: TObject;
  Socket: TCustomWinSocket);
begin
  // socket - ����������� ��������������  �����������
   mmo1.Lines.Add('['+TimeToStr(Time)+'] disconnect'+Socket.RemoteHost
 +':'+inttostr(Socket.RemotePort));
end;

procedure TForm1.ServerSocketClientRead(Sender: TObject;
  Socket: TCustomWinSocket);
var mess:string; // message
    i:Integer;
begin
    // socket - �������������� ����������� �������, �� �������� ������ ���������
   mess:=Socket.ReceiveText; //read message
   mmo2.Lines.Add(mess);   // add to chat
   // �������� ������ �������� ���������
   for i:= 0 to ServerSocket.Socket.ActiveConnections-1 do
    if ServerSocket.Socket.Connections[i] <> Socket then // ����� ������ �������
     ServerSocket.Socket.Connections[i].SendText(mess);
end;

end.
