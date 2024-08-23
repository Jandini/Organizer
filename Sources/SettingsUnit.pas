unit SettingsUnit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, StdCtrls, Buttons, ActnList, ControlUnit, ExtCtrls;

type
  TfrmSettings = class(TForm)
    pgcSettings: TPageControl;
    tabGeneral: TTabSheet;
    tabLogin: TTabSheet;
    chkAutoLogin: TCheckBox;
    grpUserInfo: TGroupBox;
    edtUser: TEdit;
    edtPasswd: TEdit;
    tabDatabase: TTabSheet;
    lblUser: TLabel;
    lblPasswd: TLabel;
    rbtLocal: TRadioButton;
    rbtRemote: TRadioButton;
    grpDatabase: TGroupBox;
    lblDatabase: TLabel;
    lblServer: TLabel;
    edtDataBase: TEdit;
    edtServer: TEdit;
    btnBrowse: TSpeedButton;
    lblProtocol: TLabel;
    cbxProtocol: TComboBox;
    dlgOpen: TOpenDialog;
    grpGeneral: TGroupBox;
    chkShowList: TCheckBox;
    chkMaximizeList: TCheckBox;
    chkFullScreen: TCheckBox;
    btnSetUser: TButton;
    btnOk: TButton;
    btnCancel: TButton;
    btnApply: TButton;
    bevTop: TBevel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure chkAutoLoginClick(Sender: TObject);
    procedure rbtLocalClick(Sender: TObject);
    procedure edtDataBaseChange(Sender: TObject);
    procedure btnBrowseClick(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnApplyClick(Sender: TObject);
    procedure edtUserChange(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure chkShowListClick(Sender: TObject);
    procedure btnSetUserClick(Sender: TObject);
  private

    procedure SetControlState(Control: TControl; State: Boolean);
    procedure SetSettings;
    procedure GetSettings;

  protected
    procedure WMSize(var Message: TWMSize); message WM_SIZE;


  public

    { Public declarations }
  end;

var
  frmSettings: TfrmSettings;

implementation

uses MainUnit, ConstsUnit;

{$R *.DFM}

procedure TfrmSettings.WMSize(var Message: TWMSize);
begin
  inherited;

  if WindowState = wsMaximized then
    bevTop.Shape := bsTopLine
  else
    bevTop.Shape := bsSpacer;
  
end;

procedure TfrmSettings.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfrmSettings.chkAutoLoginClick(Sender: TObject);
var
  i: Integer;
begin
  for i := 0 to 4 do
    SetControlState(grpUserInfo.Controls[i], chkAutoLogin.Checked);
  btnApply.Enabled := True;

 if chkAutoLogin.Checked then
   SetControlState(grpUserInfo.Controls[4], ControlObject.DataBase.Connected);

end;

procedure TfrmSettings.rbtLocalClick(Sender: TObject);
begin
  if (rbtLocal.Checked) or (rbtRemote.Checked) then begin
    SetControlState(lblDatabase, True);
    SetControlState(edtDatabase, True);
  end;
  SetControlState(btnBrowse, rbtLocal.Checked);
  SetControlState(lblServer, not rbtLocal.Checked);
  SetControlState(edtServer, not rbtLocal.Checked);
  SetControlState(lblProtocol, not rbtLocal.Checked);
  SetControlState(cbxProtocol, not rbtLocal.Checked);

  btnApply.Enabled := True;
end;



procedure TfrmSettings.SetControlState(Control: TControl; State: Boolean);
begin
  Control.Enabled := State;

  if Control is TEdit then
    if State then
      TEdit(Control).Color := clWindow
    else
      TEdit(Control).Color := clBtnFace;

  if Control is TComboBox then
    if State then
      TComboBox(Control).Color := clWindow
    else
      TComboBox(Control).Color := clBtnFace;

end;

procedure TfrmSettings.edtDataBaseChange(Sender: TObject);
begin
  btnApply.Enabled := True;
end;

procedure TfrmSettings.btnBrowseClick(Sender: TObject);
begin
  if dlgOpen.Execute then begin
    dlgOpen.InitialDir := ExtractFilePath(edtDataBase.Text);
    edtDataBase.Text := dlgOpen.FileName;
  end;  
end;

procedure TfrmSettings.btnOkClick(Sender: TObject);
begin
  SetSettings;
  Close;
end;

procedure TfrmSettings.btnCancelClick(Sender: TObject);
begin
  ControlObject.LoadFromFile(strTempConfig);
  Close;
end;

procedure TfrmSettings.SetSettings;
begin
  ControlObject.AutoLogin := chkAutoLogin.Checked;
  ControlObject.AutoUserName := edtUser.Text;
  ControlObject.AutoPassword := edtPasswd.Text;

  ControlObject.Remote := rbtRemote.Checked;
  ControlObject.DataBaseName := edtDataBase.Text;
  ControlObject.ServerName := edtServer.Text;
  ControlObject.Protocol := cbxProtocol.ItemIndex;

  ControlObject.MaximizeList := chkMaximizeList.Checked;
  ControlObject.ShowList := chkShowList.Checked;

  ControlObject.FullScreen := chkFullScreen.Checked;


  ControlObject.SaveToFile(strConfigFile);
  btnApply.Enabled := False;
end;

procedure TfrmSettings.GetSettings;
begin
  chkAutoLogin.Checked := ControlObject.AutoLogin;
  edtUser.Text := ControlObject.AutoUserName;
  edtPasswd.Text := ControlObject.AutoPassword;

  rbtRemote.Checked := ControlObject.Remote;
  rbtLocal.Checked := not ControlObject.Remote;
  edtDataBase.Text := ControlObject.DataBaseName;
  edtServer.Text := ControlObject.ServerName;
  cbxProtocol.ItemIndex := ControlObject.Protocol;

  chkMaximizeList.Checked := ControlObject.MaximizeList;
  chkShowList.Checked := ControlObject.ShowList;

  chkFullScreen.Checked := ControlObject.FullScreen;

end;

procedure TfrmSettings.FormCreate(Sender: TObject);
begin
  ControlObject.SaveToFile(strTempConfig);
  GetSettings;
  btnApply.Enabled := False;
end;

procedure TfrmSettings.btnApplyClick(Sender: TObject);
begin
  SetSettings;
end;

procedure TfrmSettings.edtUserChange(Sender: TObject);
begin
  btnApply.Enabled := True;
end;

procedure TfrmSettings.FormDestroy(Sender: TObject);
begin
  frmMain.actSettings.Enabled := True;
end;

procedure TfrmSettings.chkShowListClick(Sender: TObject);
begin
  btnApply.Enabled := True;
end;

procedure TfrmSettings.btnSetUserClick(Sender: TObject);
begin
  edtUser.Text := ControlObject.UserName;
  edtPasswd.Text := ControlObject.Password;
end;

end.
