unit LogUnit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls;

type
  TfrmLog = class(TForm)
    lstErrors: TListBox;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
  private

  public

  end;

var
  frmLog: TfrmLog;

implementation

uses MainUnit;

{$R *.DFM}

procedure TfrmLog.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfrmLog.FormDestroy(Sender: TObject);
begin
  frmMain.actLog.Enabled := True;
end;

end.
