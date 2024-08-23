unit DialogsUnit;

interface

uses Forms, Dialogs, Windows, Classes;

type
  TDlgOption = (doBeepON, doNoCancel);
  TDlgOptions = set of TDlgOption;


  
  (* klasy do bezpoœredniego przekazania najwa¿niejszych parametrów dla dialogów TSaveDialog, TOpenDialog *)
  TSaveDlg = class(TSaveDialog)
    constructor Create(Title, DefaultExt, Filter, InitDir: String; Options: TOpenOptions); reintroduce;
  end;

  TOpenDlg = class(TOpenDialog)
    constructor Create(Title, DefaultExt, Filter, InitDir: String; Options: TOpenOptions); reintroduce;
  end;


const
  mrNone     = 0;
  mrOk       = idOk;
  mrCancel   = idCancel;
  mrAbort    = idAbort;
  mrRetry    = idRetry;
  mrIgnore   = idIgnore;
  mrYes      = idYes;
  mrNo       = idNo;
  mrAll      = mrNo + 1;
  mrNoToAll  = mrAll + 1;
  mrYesToAll = mrNoToAll + 1;

  mbYesNo = [mbYes, mbNo];

(* Msg - treœæ dialogu;
   Caption - tytu³ dialogu (je¿eli jest pusty do wstawiany jest domyœlny tytu³
   Buttons - to co zwykle
   Options - (doBeepON, doNoCancel)
   DefaultResult - domyœlny rezultat dialogu (zaznacza domyœlny klawisz)
   HelpCtx - help
*)
function MsgDlg(const Msg: String; const Caption: String; AType: TMsgDlgType; Buttons: TMsgDlgButtons; DefaultResult: TModalResult; Options: TDlgOptions; HelpCtx: Longint): TModalResult;

(* dzia³a tak samo jak MsgDlg, ale mo¿na jeszcze podaæ po³o¿enie dialogu *)
function MsgDlgPos(const Msg: String; const Caption: String; AType: TMsgDlgType;  Buttons: TMsgDlgButtons; DefaultResult: TModalResult; Options: TDlgOptions;  X, Y: Integer; HelpCtx: Longint): TModalResult;

function SaveDialog(Title, DefaultExt, Filter: String; Options: TOpenOptions): string;


implementation

uses StdCtrls, WinProcs, SysUtils;


type
  TKeyDownHandler = class (TComponent)
  private
    FBeepON: Boolean;
  public
    procedure KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  end;

(* dynamicznie tworzy dialog *)
function CreateMsgDlg(const Msg: String; const Caption: String; AType: TMsgDlgType; Buttons: TMsgDlgButtons; Options: TDlgOptions; HelpCtx: Longint; X, Y: Integer): TForm;
begin
  (* utworzenie dialogu *)
  Result := CreateMessageDialog(Msg, TMsgDlgType(AType), TMsgDlgButtons(Buttons));
  Result.Font.Name := 'System';

  if Caption <> EmptyStr then begin  // czy zmienic tytul dialogu
    Result.Caption := Caption;
  end;

  if X > -1 then begin  // czy ustawiæ na odpowiedniej pozycji
    Result.Left := X;
  end;
  if Y > -1 then begin
    Result.Top := Y;
  end;

  Result.HelpContext := HelpCtx;  // ustawienie helpu kontekstowego
  Result.ScaleBy(Screen.PixelsPerInch, 84);  // dopasowanie do rozdzielczoœci

  if doBeepON in Options then  // je¿eli podana jest opcja BeepON
  case AType of
    mtWarning:      MessageBeep(MB_ICONEXCLAMATION);
    mtError:        MessageBeep(MB_ICONSTOP);
    mtInformation:  MessageBeep(MB_ICONINFORMATION);
    mtConfirmation: MessageBeep(MB_ICONQUESTION);
  end;
end;

procedure TKeyDownHandler.KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = VK_ESCAPE then begin // prze³apanie klawisza ESC 
    if FBeepON then
      MessageBeep(MB_ICONEXCLAMATION);
    Key := 0;
  end;
end;

{$WARNINGS OFF}
function MsgDlgPos(const Msg: String; const Caption: String; AType: TMsgDlgType;  Buttons: TMsgDlgButtons; DefaultResult: TModalResult; Options: TDlgOptions;  X, Y: Integer; HelpCtx: Longint): TModalResult;
var
  Dlg: TForm;
  i: Integer;
  KeyDownHandler: TKeyDownHandler;
begin
  try
    Dlg := CreateMsgDlg(Msg, Caption, AType, Buttons, Options, HelpCtx,  X, Y);
    (* ustawienie domyslnego klawisza *)
    Dlg.Font.Name := 'System';
    for i := 0 to (Dlg.ControlCount - 1) do
      if (Dlg.Controls[i] is TButton) then begin
        if doNoCancel in Options then
          TButton(Dlg.Controls[i]).Cancel := false; // wy³¹cza domyœlny esc dla wszytkik buttonów
        if (TButton(Dlg.Controls[i]).ModalResult = DefaultResult) then
          TButton(Dlg.Controls[i]).TabOrder := 0
        else
          TButton(Dlg.Controls[i]).default := false;
      end;

    if doNoCancel in Options then begin  // obs³uga opcji doNoCancel
      KeyDownHandler := TKeyDownHandler.Create(Dlg);
      KeyDownHandler.FBeepON := doBeepON in Options;
      Dlg.KeyPreview := True;
      Dlg.OnKeyDown := KeyDownHandler.KeyDown;
      Dlg.BorderIcons := [];
    end;  

    (* wyswietlenie dialogu *)
    Result := Dlg.ShowModal;
  finally
    Dlg.Free;
  end;
end;
{$WARNINGS ON}


function MsgDlg(const Msg: String; const Caption: String; AType: TMsgDlgType; Buttons: TMsgDlgButtons; DefaultResult: TModalResult; Options: TDlgOptions; HelpCtx: Longint): TModalResult;
begin
  Result := MsgDlgPos(Msg, Caption, AType, Buttons, DefaultResult,Options,  -1, -1, HelpCtx);
end;


{$WARNINGS OFF}
function SaveDialog(Title, DefaultExt, Filter: String; Options: TOpenOptions): string;
var
  SaveDialog: TSaveDialog;
begin
  try
    SaveDialog := TSaveDialog.Create(nil);
    SaveDialog.DefaultExt := DefaultExt;
    SaveDialog.Title := Title;
    SaveDialog.Filter := Filter;
    SaveDialog.Execute;
    Result := SaveDialog.FileName;
  finally
    SaveDialog.Free;
  end;
end;
{$WARNINGS ON}

{ TSaveDlg }

constructor TSaveDlg.Create(Title, DefaultExt, Filter, InitDir: String; Options: TOpenOptions);
begin
  inherited Create(nil);
  Self.Title := Title;
  Self.DefaultExt := DefaultExt;
  Self.Filter := Filter;
  Self.Options := Options;
  Self.InitialDir := InitDir;
end;


{ TOpenDlg }

constructor TOpenDlg.Create(Title, DefaultExt, Filter, InitDir: String;  Options: TOpenOptions);
begin
  inherited Create(nil);
  Self.Title := Title;
  Self.DefaultExt := DefaultExt;
  Self.Filter := Filter;
  Self.Options := Options;
  Self.InitialDir := InitDir;
end;

end.
