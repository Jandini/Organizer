unit DatabaseUnit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, IBDatabase;

type
  TfrmData = class(TDataModule)
    dbOrganizer: TIBDatabase;
    traOrganizer: TIBTransaction;
    procedure dbOrganizerBeforeConnect(Sender: TObject);
  private
  public
  end;

var
  frmData: TfrmData;

implementation

uses MainUnit;

{$R *.DFM}

procedure TfrmData.dbOrganizerBeforeConnect(Sender: TObject);
begin
  frmMain.barStatus.Panels[0].Text := 'Logowanie...';
  frmMain.barStatus.Refresh;
end;

end.
