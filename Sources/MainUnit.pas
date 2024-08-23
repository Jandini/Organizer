unit MainUnit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Menus, ComCtrls, ActnList, StdActns, ToolWin, ImgList, ControlUnit,
  ExtCtrls, AppEvnts;

type
  TfrmMain = class(TForm)
    mnuMainMenu: TMainMenu;
    mnuUzytkownik: TMenuItem;
    barStatus: TStatusBar;
    mnuOrganizer: TMenuItem;
    mnuNarzedzia: TMenuItem;
    mnuOpcje: TMenuItem;
    mnuLogin: TMenuItem;
    mnuLogout: TMenuItem;
    mnuOkno: TMenuItem;
    mnuCascade: TMenuItem;
    mnuTileHoriz: TMenuItem;
    mnuTileVert: TMenuItem;
    mnuNewWindow: TMenuItem;
    actList: TActionList;
    barTools: TToolBar;
    imgImages: TImageList;
    actCascade: TWindowCascade;
    actWinClose: TWindowClose;
    actMinimizeAll: TWindowMinimizeAll;
    actTileHoriz: TWindowTileHorizontal;
    actTileVert: TWindowTileVertical;
    actSettings: TAction;
    mnuMinimizeAll: TMenuItem;
    mnuWinClose: TMenuItem;
    btnLogin: TToolButton;
    btnLogout: TToolButton;
    sep1: TToolButton;
    btnNew: TToolButton;
    btnSettings: TToolButton;
    sep4: TToolButton;
    actLogin: TAction;
    actLogout: TAction;
    timStart: TTimer;
    actOrganizerList: TAction;
    mnu1: TMenuItem;
    mnuCloseProgram: TMenuItem;
    mnuLog: TMenuItem;
    actLog: TAction;
    actAddToList: TAction;
    actDelFromList: TAction;
    actModList: TAction;
    btnAdd: TToolButton;
    btnMod: TToolButton;
    btnDelete: TToolButton;
    sep6: TToolButton;
    mnuAdd: TMenuItem;
    mnuDel: TMenuItem;
    mnuMod: TMenuItem;
    mnu2: TMenuItem;
    btnLog: TToolButton;
    actApply: TAction;
    actCancel: TAction;
    btnApply: TToolButton;
    btnCancel: TToolButton;
    Zapiszwszystkiezmiany1: TMenuItem;
    Anulujwszystkiezmiany1: TMenuItem;
    appEvents: TApplicationEvents;
    procedure actSettingsExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure actLoginExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure actLogoutExecute(Sender: TObject);
    procedure timStartTimer(Sender: TObject);
    procedure actLogExecute(Sender: TObject);
    procedure actOrganizerListExecute(Sender: TObject);
    procedure actAddToListExecute(Sender: TObject);
    procedure actDelFromListExecute(Sender: TObject);
    procedure actModListExecute(Sender: TObject);
    procedure mnuCloseProgramClick(Sender: TObject);
    procedure actApplyExecute(Sender: TObject);
    procedure actCancelExecute(Sender: TObject);
    procedure appEventsException(Sender: TObject; E: Exception);
  private
    procedure Login;
  public
    GlobalClose: Boolean;
    procedure ShowLoggedUser;
    procedure HintStatus(s: String);
  end;

var
  frmMain: TfrmMain;
  ControlObject: TControlObject;

implementation

uses SettingsUnit, DatabaseUnit, ConstsUnit, LoginUnit, LogUnit, OrganizerUnit;

{$R *.DFM}

procedure TfrmMain.actSettingsExecute(Sender: TObject);
begin
  frmSettings := TfrmSettings.Create(Application);
  actSettings.Enabled := False;
end;

procedure TfrmMain.FormCreate(Sender: TObject);
begin
  ControlObject := TControlObject.Create;
  Application.HintPause := 200;
  GlobalClose := False;
end;

procedure TfrmMain.FormDestroy(Sender: TObject);
begin
  ControlObject.Free;
end;

procedure TfrmMain.FormShow(Sender: TObject);
begin
  ControlObject.DataBase := frmData.dbOrganizer;
  ControlObject.Transaction := frmData.traOrganizer;
  ControlObject.LoadFromFile(strConfigFile);
  if ControlObject.FullScreen then
    WindowState := wsMaximized;
end;

procedure TfrmMain.actLoginExecute(Sender: TObject);
begin
  frmLogin := TfrmLogin.Create(Application);
  frmLogin.ShowModal;
  if ControlObject.LoginNow then
    Login;
end;

procedure TfrmMain.FormClose(Sender: TObject; var Action: TCloseAction);
var
  i: Integer;
begin
  GlobalClose := True;
  for i := 0 to MDIChildCount - 1 do
    try
      MDIChildren[i].Close;
    except
      Action := caNone;
      GlobalClose := False;
      Exit;
    end;
  ControlObject.SaveToFile(strConfigFile);
  if ControlObject.DataBase.Connected then
    ControlObject.UserLogout;
  
end;


procedure TfrmMain.ShowLoggedUser;
begin
  if not ControlObject.DataBase.Connected then begin
    barStatus.Panels[0].Text := 'Nie zalogowany';
    actLogout.Enabled := False;
    actLogin.Enabled := True;
    actOrganizerList.Enabled := False;
  end
  else begin
    barStatus.Panels[0].Text := ControlObject.UserName;
    actLogout.Enabled := True;
    actLogin.Enabled := False;
    actOrganizerList.Enabled := True;
  end;
end;

procedure TfrmMain.actLogoutExecute(Sender: TObject);
var
  Result: TModalResult;
  i: Integer;
begin
  Result := MessageDlg(MsgStrLogout ,mtConfirmation, [mbYes, mbNo], 0);
  if Result = mrYes then
    if MDIChildCount > 0 then begin
      Result := MessageDlg(MsgStrCloseAllWindow ,mtWarning, [mbYes, mbNo], 0);
      if Result in [mrNo, mrCancel] then
        Exit;
      GlobalClose := True;
      for i := 0 to MDIChildCount - 1 do
       try
         MDIChildren[i].Close;
       except
         GlobalClose := False;
         Exit;
       end;

    try
      ControlObject.DataBase.Connected := False;
    except
    end;
    ShowLoggedUser;
  end;
end;

procedure TfrmMain.timStartTimer(Sender: TObject);
begin
  timStart.Enabled := False;
  if ControlObject.AutoLogin then begin
    ControlObject.UserName := ControlObject.AutoUserName;
    ControlObject.Password := ControlObject.AutoPassword;
    Login;
  end else
    actLogin.Execute;
end;

procedure TfrmMain.Login;
var
  Result: TModalResult;
begin
  try
    ControlObject.UserLogin;
  except
    on E: Exception do begin
      ControlObject.AddToLog(E.Message);
      Result := MessageDlg('Wyst¹pi³ b³¹d podczas logowania. SprawdŸ czy wprowadzone dane s¹ poprawne.',mtWarning, [mbOk,mbIgnore], 0);
      if Result = mrIgnore then
        actLog.Execute;
    end;
  end;
  ShowLoggedUser;
  if (ControlObject.DataBase.Connected) and (ControlObject.ShowList) then
    actOrganizerListExecute(Self);
end;

procedure TfrmMain.actLogExecute(Sender: TObject);
begin
  actLog.Enabled := False;
  frmLog := TfrmLog.Create(Application);
  frmLog.lstErrors.Items.Assign(ControlObject.Log);
end;

procedure TfrmMain.actOrganizerListExecute(Sender: TObject);
begin

  frmOrganizer := TfrmOrganizer.Create(Application);
  if ControlObject.MaximizeList then
   frmOrganizer.WindowState := wsMaximized;

  actOrganizerList.Enabled := False;
  actAddToList.Enabled := True;
  actDelFromList.Enabled := True;
  actModList.Enabled := True;
  frmOrganizer.CheckData;
  
end;

procedure TfrmMain.actAddToListExecute(Sender: TObject);
begin
  frmOrganizer.NewRecord := True;
  frmOrganizer.SetEditMode(True);
  frmOrganizer.tabOrganizer.Append;

  if frmOrganizer.cbxGrupa.ItemIndex > 0 then
    frmOrganizer.tabOrganizer.FieldByName('GRUPA').AsInteger := frmOrganizer.cbxGrupa.ItemIndex;

  frmOrganizer.actApply.Caption := '&Dodaj';
end;

procedure TfrmMain.actDelFromListExecute(Sender: TObject);
var
  Result: TModalResult;
begin
  Result := MessageDlg('Czy chcesz usun¹æ ten wpis z tabeli?', mtConfirmation, [mbYes, mbNo], 0);
  if Result = mrYes then begin
    frmOrganizer.tabOrganizer.Delete;
    frmOrganizer.DataChanged := True;
  end;
  frmOrganizer.CheckData;
end;

procedure TfrmMain.actModListExecute(Sender: TObject);
begin
  frmOrganizer.NewRecord := False;
  frmOrganizer.SetEditMode(True);
  frmOrganizer.tabOrganizer.Edit;
  frmOrganizer.actApply.Caption := '&Modyfikuj';
end;

procedure TfrmMain.mnuCloseProgramClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmMain.HintStatus(s: String);
begin
  barStatus.Panels[1].Text := s;
  barStatus.Refresh; 
end;

procedure TfrmMain.actApplyExecute(Sender: TObject);
begin
  frmMain.HintStatus('Zapisywanie zmian dokonanych w tabeli...');
  frmOrganizer.DataChanged := False;
  frmData.traOrganizer.Commit;
  frmOrganizer.tabOrganizer.Active := True;
  frmOrganizer.CheckData;
  frmMain.HintStatus('');
end;

procedure TfrmMain.actCancelExecute(Sender: TObject);
begin
  frmMain.HintStatus('Anulowanie zmian dokonanych w tabeli...');
  frmOrganizer.DataChanged := False;
  frmData.traOrganizer.Rollback;
  frmOrganizer.tabOrganizer.Active := True;
  frmOrganizer.CheckData;
  frmMain.HintStatus('');
end;

procedure TfrmMain.appEventsException(Sender: TObject; E: Exception);
var
  Result: TModalResult;
begin
  ControlObject.AddToLog(E.Message);
  Result := MessageDlg('Wyst¹pi³ b³¹d w programie. Szczegó³y znajduj¹ siê w dzienniku zdarzeñ.',mtWarning, [mbOk,mbIgnore], 0);
    if Result = mrIgnore then
      actLog.Execute;
end;

end.
