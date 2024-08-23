unit LoginUnit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls;

type
  TfrmLogin = class(TForm)
    lblUser: TLabel;
    lblPassword: TLabel;
    edtPassword: TEdit;
    btnCancel: TButton;
    btnOk: TButton;
    edtUser: TEdit;
    procedure btnCancelClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edtUserChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnOkClick(Sender: TObject);
  private

  public
  end;

var
  frmLogin: TfrmLogin;

implementation

uses MainUnit, ConstsUnit;

{$R *.DFM}

procedure TfrmLogin.btnCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmLogin.FormShow(Sender: TObject);
begin
  ControlObject.LoginNow := False;
  edtUser.Text := ControlObject.LastUserName;

  if (edtUser.CanFocus) and (edtUser.Text = EmptyStr) then
    edtUser.SetFocus
  else
  if (edtPassword.CanFocus) then
    edtPassword.SetFocus

end;

procedure TfrmLogin.edtUserChange(Sender: TObject);
begin
  if (edtUser.Text <> EmptyStr) and (edtPassword.Text <> EmptyStr) then
    btnOk.Enabled := True
  else
    btnOk.Enabled := False;
end;



procedure TfrmLogin.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfrmLogin.btnOkClick(Sender: TObject);
begin
  ControlObject.LoginNow := True;
  ControlObject.LastUserName := frmLogin.edtUser.Text;
  ControlObject.UserName := frmLogin.edtUser.Text;
  ControlObject.Password := frmLogin.edtPassword.Text;
  frmLogin.Close;
end;

end.
