program Organizer;

uses
  Forms,
  MainUnit in 'MainUnit.pas' {frmMain},
  SettingsUnit in 'SettingsUnit.pas' {frmSettings},
  ConstsUnit in 'ConstsUnit.pas',
  ControlUnit in 'ControlUnit.pas',
  DialogsUnit in 'DialogsUnit.pas',
  DataBaseUnit in 'DataBaseUnit.pas' {frmData: TDataModule},
  LoginUnit in 'LoginUnit.pas' {frmLogin},
  LogUnit in 'LogUnit.pas' {frmLog},
  OrganizerUnit in 'OrganizerUnit.pas' {frmOrganizer};

{$R *.RES}
{$R ICONS.RES}

begin
  Application.Initialize;
  Application.Title := 'Organizer';
  Application.CreateForm(TfrmData, frmData);
  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;
end.
