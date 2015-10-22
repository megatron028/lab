unit Unit2;

interface

uses
  Classes,Windows,Unit1;

type
  potok = class(TThread)
  private
    index: integer;
  protected
    procedure Execute; override;
    procedure UpdateLabel;
  end;

implementation
uses SysUtils;

{ Important: Methods and properties of objects in visual components can only be
  used in a method called using Synchronize, for example,

     Synchronize(UpdateCaption);

    procedure potok.UpdateCaption;
    begin
      Form1.Caption := 'Updated in a thread';
    end; }

{ potok }


procedure potok.Execute;

begin
  index:=1;
while index>0 do
begin
sleep(33);
Synchronize(UpdateLabel);
Inc(index);
if index>100000 then
index:=0;
if terminated then exit;
end;
end;

procedure potok.UpdateLabel;
begin
Form1.Label1.Caption:=IntToStr(index);
end;

end.
 