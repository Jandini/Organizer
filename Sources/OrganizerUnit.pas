unit OrganizerUnit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ToolWin, ComCtrls, Grids, DBGrids, DBGridExt, ExtCtrls,
  ImgList, StdActns, ActnList, DBCtrls, Menus, Db, IBCustomDataSet, IBTable,
  Mask, ToolEdit, RxLookup;

type
  TfrmOrganizer = class(TForm)
    scbOrganizer: TScrollBox;
    splOrganizer: TSplitter;
    tabOrganizer: TIBTable;
    srcOrganizer: TDataSource;
    dbgOrganizer: TDBGridExt;
    tabOrganizerNAZWISKO: TIBStringField;
    tabOrganizerIMIE: TIBStringField;
    tabOrganizerFIRMA: TIBStringField;
    tabOrganizerADRES: TIBStringField;
    tabOrganizerKOD: TIntegerField;
    tabOrganizerMIASTO: TIntegerField;
    tabOrganizerTEL: TIBStringField;
    tabOrganizerFAX: TIBStringField;
    tabOrganizerKOM: TIBStringField;
    tabOrganizerINFORMACJE: TIBStringField;
    tabOrganizerNM: TIBStringField;
    lblDane: TLabel;
    lblNazwisko: TLabel;
    lblImie: TLabel;
    lblFirma: TLabel;
    lblAdres: TLabel;
    lblUlica: TLabel;
    lblMiasto: TLabel;
    tabOrganizerKM: TStringField;
    tabMiasto: TIBTable;
    srcMiasto: TDataSource;
    lblTelefonyTitle: TLabel;
    lblTelefon: TLabel;
    lblKom: TLabel;
    lblFax: TLabel;
    lblInfoTitle: TLabel;
    dbmInformacje: TDBMemo;
    tabOrganizer_MIASTO: TStringField;
    barTools: TToolBar;
    edtSearch: TEdit;
    sep1: TToolButton;
    lblGrupa: TLabel;
    tabGrupa: TIBTable;
    dbeImie: TDBEdit;
    dbeNazwisko: TDBEdit;
    dbeFirma: TDBEdit;
    dbeUlica: TDBEdit;
    dbeKod: TDBEdit;
    dbeTel: TDBEdit;
    dbeKom: TDBEdit;
    dbeFax: TDBEdit;
    btnCancel: TButton;
    btnSave: TButton;
    ledMiasto: TRxLookupEdit;
    dbeMiasto: TDBEdit;
    actList: TActionList;
    actApply: TAction;
    actCancel: TAction;
    tabOrganizerGRUPA: TIntegerField;
    lblGrupaEdit: TLabel;
    dbeGrupa: TDBEdit;
    srcGrupa: TDataSource;
    tabOrganizer_GRUPA: TStringField;
    dbxGrupa: TDBLookupComboBox;
    cbxGrupa: TComboBox;
    lblSearch: TLabel;
    lblNotatki: TLabel;
    lblEmail: TLabel;
    dbeEmail: TDBEdit;
    tabOrganizerEMAIL: TIBStringField;
    actGrupa: TAction;
    actSzukaj: TAction;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure tabOrganizerNMGetText(Sender: TField; var Text: String; DisplayText: Boolean);
    procedure FormResize(Sender: TObject);
    procedure tabOrganizerKMGetText(Sender: TField; var Text: String; DisplayText: Boolean);
    procedure actApplyExecute(Sender: TObject);
    procedure actCancelExecute(Sender: TObject);
    procedure dbeImieKeyPress(Sender: TObject; var Key: Char);
    procedure cbxGrupaChange(Sender: TObject);
    procedure cbxGrupaKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure tabMiastoBeforeInsert(DataSet: TDataSet);
    procedure tabMiastoAfterInsert(DataSet: TDataSet);
    procedure edtSearchChange(Sender: TObject);
    procedure dbgOrganizerTitleClick(Column: TColumn);
    procedure dbeKodKeyPress(Sender: TObject; var Key: Char);
    procedure dbeUlicaKeyDown(Sender: TObject; var Key: Word;  Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure edtSearchKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure dbgOrganizerKeyDown(Sender: TObject; var Key: Word;  Shift: TShiftState);
    procedure dbgOrganizerKeyPress(Sender: TObject; var Key: Char);
    procedure actGrupaExecute(Sender: TObject);
    procedure actSzukajExecute(Sender: TObject);
    procedure dbxGrupaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure srcOrganizerDataChange(Sender: TObject; Field: TField);
  private
    actCancelEnabled: Boolean;
    actApplyEnabled: Boolean;
    idxMiasto: Integer;
  public
    NewRecord: Boolean;
    EditMode: Boolean;
    DataChanged: Boolean;

    procedure CheckData;
    procedure SetEditMode(Edit: Boolean);
    function UpColor(inColor: TColor; upLevel: Byte): TColor;

  end;

var
  frmOrganizer: TfrmOrganizer;

implementation

uses MainUnit, ControlUnit, DatabaseUnit;

{$R *.DFM}

procedure TfrmOrganizer.FormClose(Sender: TObject;
  var Action: TCloseAction);
var
  Result: TModalResult;
begin
  if EditMode then begin
    MessageDlg('Tabela nie mo¿e zostaæ zamkniêta podczas edycji.', mtInformation, [mbOk], 0);
    if frmMain.GlobalClose then
      raise Exception.Create('');
    Action := caNone;
  end else

  if DataChanged then begin
    Result := MessageDlg('Zawartoœæ tabeli zosta³a zmieniona. Czy chcesz zatwierdziæ wprowadzone zmiany?', mtWarning, [mbYes,mbNo,mbCancel], 0);
    if Result = mrCancel then begin
      if frmMain.GlobalClose then
        raise Exception.Create('Tabela');
      Action := caNone;
    end;

    if Result = mrYes then begin
      frmMain.actApply.Execute;
      Action := caFree;
    end;

    if Result = mrNo then begin
      frmMain.actCancel.Execute;
      Action := caFree;
    end;
  end else
    Action := caFree;
end;

procedure TfrmOrganizer.FormDestroy(Sender: TObject);
begin
  tabOrganizer.Active := False;
  with frmMain do begin
    actOrganizerList.Enabled := True;
    actAddToList.Enabled := False;
    actDelFromList.Enabled := False;
    actModList.Enabled := False;
    actApply.Enabled := False;
    actCancel.Enabled := False;
  end;
  frmMain.ShowLoggedUser;

end;

procedure TfrmOrganizer.FormCreate(Sender: TObject);
var
  Result: Integer;
begin
  try
    DataChanged := False;
    frmMain.HintStatus('Otwieranie tabeli...');
    tabMiasto.Database := ControlObject.DataBase;
    tabMiasto.TableName := 'MIASTO';
    tabMiasto.Active := True;

    tabGrupa.Database := ControlObject.DataBase;
    tabGrupa.TableName := 'GRUPA';
    tabGrupa.Active := True;
    
    tabOrganizer.Database := ControlObject.DataBase;
    tabOrganizer.TableName := 'ORGANIZER';
    tabOrganizer.Active := True;


    tabGrupa.First;
    while not tabGrupa.Eof do begin
      cbxGrupa.Items.Add(tabGrupa.FieldByName('NAZWA').AsString);
      tabGrupa.Next;
    end;
    cbxGrupa.ItemIndex := 0;
    tabGrupa.Filtered := True;


    dbgOrganizer.LineBrush.Color := UpColor(dbgOrganizer.LineBrush.Color, 40);
  except

    on E: Exception do begin
      ControlObject.AddToLog(E.Message);
      Result := MessageDlg('Wyst¹pi³ b³¹d podczas otwierania tabeli. Szczegó³y znajduj¹ siê w dzienniku zdarzeñ.',mtWarning, [mbOk,mbIgnore], 0);
      frmMain.HintStatus('');
      Close;
      if Result = mrIgnore then
        frmMain.actLog.Execute;
     
    end;
  end;
end;

procedure TfrmOrganizer.tabOrganizerNMGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  Text := ' ' + Sender.DataSet.FieldByName('NAZWISKO').AsString + ' ' + Sender.DataSet.FieldByName('IMIE').AsString;
end;

procedure TfrmOrganizer.FormResize(Sender: TObject);
begin
  scbOrganizer.Width := (ClientWidth div 3);
  splOrganizer.MinSize := (ClientWidth div 6);
end;

procedure TfrmOrganizer.tabOrganizerKMGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  Text := tabOrganizerKOD.DisplayText + ' ' + tabOrganizer_MIASTO.DisplayText;
end;

procedure TfrmOrganizer.SetEditMode(Edit: Boolean);
var
  i: Integer;
begin
  EditMode := Edit;
  case Edit of
    True: begin

      frmMain.actAddToList.Enabled := False;
      frmMain.actModList.Enabled := False;
      frmMain.actDelFromList.Enabled := False;

      actApplyEnabled := frmMain.actApply.Enabled;
      actCancelEnabled := frmMain.actCancel.Enabled;
      frmMain.actApply.Enabled := False;
      frmMain.actCancel.Enabled := False;



      edtSearch.Color := clBtnFace;
      edtSearch.Enabled := False;
      cbxGrupa.Color := clBtnFace;
      cbxGrupa.Enabled := False;

      dbgOrganizer.Enabled := False;
      dbeImie.SetFocus;

      scbOrganizer.Color := clBtnFace;

      for i := 0 to scbOrganizer.ControlCount - 1 do begin
        if (scbOrganizer.Controls[i] is TDBEdit) then begin
          TDBEdit(scbOrganizer.Controls[i]).BorderStyle := bsSingle;
          TDBEdit(scbOrganizer.Controls[i]).TabStop := True;
          TDBEdit(scbOrganizer.Controls[i]).ReadOnly := False;
        end;
      end;
      dbmInformacje.BorderStyle := bsSingle;
      dbmInformacje.TabStop := True;
      dbmInformacje.ReadOnly := False;

      actApply.Visible := True;
      actApply.Enabled := True;

      actCancel.Visible := True;
      actCancel.Enabled := True;

      dbeMiasto.Visible := False;
      if not NewRecord then begin
        ledMiasto.Text := tabOrganizer.FieldByName('_MIASTO').AsString;
        frmMain.HintStatus('Edycja wpisu...');

      end
      else begin
        ledMiasto.Text := '';
        frmMain.HintStatus('Nowy wpis...');

      end;

      ledMiasto.Visible := True;
      ledMiasto.TabOrder := dbeMiasto.TabOrder;

      dbxGrupa.Visible := True;
      dbeGrupa.Visible := False;

    end;

    False: begin

      frmMain.actAddToList.Enabled := True;
      frmMain.actModList.Enabled := True;
      frmMain.actDelFromList.Enabled := True;

      frmMain.actApply.Enabled := actApplyEnabled;
      frmMain.actCancel.Enabled := actCancelEnabled;

      scbOrganizer.Color := clWindow;
      edtSearch.Color := clWindow;
      edtSearch.Enabled := True;
      cbxGrupa.Color := clWindow;
      cbxGrupa.Enabled := True;

      dbgOrganizer.Enabled := True;
      dbgOrganizer.SetFocus;

      for i := 0 to scbOrganizer.ControlCount - 1 do begin
        if (scbOrganizer.Controls[i] is TDBEdit) then begin
          TDBEdit(scbOrganizer.Controls[i]).BorderStyle := bsNone;
          TDBEdit(scbOrganizer.Controls[i]).TabStop := False;
          TDBEdit(scbOrganizer.Controls[i]).ReadOnly := True;
        end;
      end;

      dbmInformacje.BorderStyle := bsNone;
      dbmInformacje.TabStop := False;
      dbmInformacje.ReadOnly := True;

      actApply.Visible := False;
      actApply.Enabled := False;

      actCancel.Visible := False;
      actCancel.Enabled := False;

      dbeMiasto.Visible := True;
      ledMiasto.Visible := False;
      dbeMiasto.TabOrder := ledMiasto.TabOrder;

      dbxGrupa.Visible := False;
      dbeGrupa.Visible := True;
      CheckData;
    end;

  end;

end;




procedure TfrmOrganizer.CheckData;
begin
  with frmMain do
    if srcOrganizer.DataSet.RecordCount > 0 then begin
      actModList.Enabled := True;
      actDelFromList.Enabled := True;
    end
    else begin
      actModList.Enabled := False;
      actDelFromList.Enabled := False;
    end;
  frmMain.actApply.Enabled := DataChanged;
  frmMain.actCancel.Enabled := DataChanged;
end;

procedure TfrmOrganizer.actApplyExecute(Sender: TObject);
begin
  if (Trim(ledMiasto.Text) <> EmptyStr) then begin
    if (tabMiasto.FieldByName('NAZWA').AsString <> ledMiasto.Text) then begin
      frmMain.HintStatus('Dodawanie nowego miasta...');
      tabMiasto.IndexFieldNames := '';
      tabMiasto.Append;
      tabMiasto.FieldByName('NAZWA').AsString := ledMiasto.Text;
      tabMiasto.Post;
      tabOrganizer.FieldByName('MIASTO').AsInteger := tabMiasto.FieldByName('INDEKS').AsInteger;
      tabMiasto.IndexFieldNames := 'NAZWA';
      frmMain.HintStatus('');      
    end else
      tabOrganizer.FieldByName('MIASTO').AsInteger := tabMiasto.FieldByName('INDEKS').AsInteger;
  end else
    tabOrganizer.FieldByName('MIASTO').Clear;

  try
    frmOrganizer.tabOrganizer.Post;
  except
    on E: Exception do begin
      MessageDlg('Ten rekord jest aktualnie modyfikowany przez innego u¿ytkownika. Poczekaj na zakoñczenie modyfikacji.', mtInformation, [mbOk], 0);
      Exit;
    end;   
  end;
  DataChanged := True;
  SetEditMode(False);
  CheckData;
end;

procedure TfrmOrganizer.actCancelExecute(Sender: TObject);
begin
  frmOrganizer.tabOrganizer.Cancel;
  SetEditMode(False);
end;

procedure TfrmOrganizer.dbeImieKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then begin
    Key := #0;
    Perform(WM_NEXTDLGCTL, 0, 0);
  end;
end;

procedure TfrmOrganizer.cbxGrupaChange(Sender: TObject);
begin
  frmMain.HintStatus('Trwa zmiana grupy na: ' + cbxGrupa.Text);
  if cbxGrupa.ItemIndex > 0 then begin
    tabOrganizer.Filter := 'GRUPA=' + IntToStr(cbxGrupa.ItemIndex);
    dbgOrganizer.Refresh;
    tabOrganizer.Filtered := True;
  end else
    tabOrganizer.Filtered := False;
  frmMain.HintStatus('');
  CheckData;
end;

procedure TfrmOrganizer.cbxGrupaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key in [VK_UP, VK_DOWN, VK_LEFT, VK_RIGHT]) and (Shift <> [ssAlt]) and (not cbxGrupa.DroppedDown) then begin
    Key := 0;
  end;
end;

function TfrmOrganizer.UpColor(inColor: TColor; upLevel: Byte): TColor;
var
  RGB: Longint;
  R,G,B: Integer;

begin
  RGB := ColorToRGB(inColor);
  R := RGB and $FF;
  G := (RGB shr 8) and $FF;
  B := (RGB shr 16) and $FF;

  inc(R, upLevel);
  inc(G, upLevel);
  inc(B, upLevel);

  if R > 255 then
    R := 255;
  if G > 255 then
    G := 255;
  if B > 255 then
    B := 255;

  RGB := Byte(B);
  RGB := RGB shl 8;
  RGB := RGB or Byte(G);
  RGB := RGB shl 8;
  RGB := RGB or Byte(R);

  Result := RGB;
end;


procedure TfrmOrganizer.tabMiastoBeforeInsert(DataSet: TDataSet);
begin
  tabMiasto.Last;
  idxMiasto := DataSet.Fields[0].AsInteger + 1;
end;

procedure TfrmOrganizer.tabMiastoAfterInsert(DataSet: TDataSet);
begin
  DataSet.Fields[0].AsInteger := idxMiasto;
end;

procedure TfrmOrganizer.edtSearchChange(Sender: TObject);
var
  SearchStr: Array[0..1] of String[50];
  Space: Integer;
begin
  if edtSearch.Text = '' then
    Exit;
  FillChar(SearchStr, SizeOf(SearchStr), 0);
  Space := Pos(#32, TEdit(Sender).Text);
  if Space > 0 then begin
    SearchStr[0] := Copy(TEdit(Sender).Text, 1, Space - 1);
    SearchStr[1] := Copy(TEdit(Sender).Text, Space + 1, Length(TEdit(Sender).Text));
  end else
    SearchStr[0] := edtSearch.Text;

  if SearchStr[1] <> EmptyStr then begin
    if not tabOrganizer.locate('NAZWISKO;IMIE', VarArrayOf([SearchStr[0], SearchStr[1]]), [loCaseInsensitive, loPartialKey]) then
      tabOrganizer.Locate('IMIE;NAZWISKO', VarArrayOf([SearchStr[0], SearchStr[1]]), [loCaseInsensitive, loPartialKey])
  end
  else begin
    if not tabOrganizer.locate('FIRMA', SearchStr[0], [loCaseInsensitive, loPartialKey]) then
     if not tabOrganizer.locate('NAZWISKO', SearchStr[0], [loCaseInsensitive, loPartialKey]) then
      tabOrganizer.Locate('IMIE', SearchStr[0], [loCaseInsensitive, loPartialKey])
  end;
end;

procedure TfrmOrganizer.dbgOrganizerTitleClick(Column: TColumn);
var
  i: Integer;
begin
  for i := 0 to dbgOrganizer.Columns.Count - 1 do
    dbgOrganizer.Columns[i].Title.Font.Style := [];

  Column.Title.Font.Style := [fsBold];
  frmMain.HintStatus('Sortowanie tabeli wed³ug pola: '+ Column.FieldName+'...');
  if Column.Index = 5 then
    tabOrganizer.IndexFieldNames := 'MIASTO'
  else
    tabOrganizer.IndexFieldNames := Column.FieldName;
  frmMain.HintStatus('');
end;

procedure TfrmOrganizer.dbeKodKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then begin
    Key := #0;
    Perform(WM_NEXTDLGCTL, 0, 0);
  end;
  if Key in ['-','+'] then
    Key := #0;
end;

procedure TfrmOrganizer.dbeUlicaKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);

function GetComponentByTabOrder(TabOrder: Integer): TComponent;
var
  i: Integer;
begin
  i := 0;
  Result := nil;
  while (i < ComponentCount) and (Result = nil) do begin
    if (Components[i] is TControl) and (TControl(Components[i]).Tag = TabOrder) then
      Result := Components[i];
    inc(i);
  end;
end;

begin
  if (Sender <> dbxGrupa) and (EditMode) and (Key in [VK_DOWN, VK_UP]) then begin
    case Key of
      VK_DOWN: TWinControl(GetComponentByTabOrder(TControl(Sender).Tag + 1)).SetFocus;
      VK_UP: if TControl(Sender).Tag > 1 then
        TWinControl(GetComponentByTabOrder(TControl(Sender).Tag - 1)).SetFocus;
    end;
    Key := 0;
  end;    
    
end;

procedure TfrmOrganizer.FormShow(Sender: TObject);
begin
  tabOrganizer.Refresh;
  edtSearch.SetFocus;
  Resize;
end;

procedure TfrmOrganizer.edtSearchKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key in [VK_DOWN, VK_UP] then begin
    SendMessage(dbgOrganizer.Handle, WM_KEYDOWN, Key,0);
    dbgOrganizer.SetFocus;
    Key := 0;
  end;
end;

procedure TfrmOrganizer.dbgOrganizerKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key in [VK_DOWN, VK_UP] then begin
    edtSearch.Text := '';
  end;

end;

procedure TfrmOrganizer.dbgOrganizerKeyPress(Sender: TObject;
  var Key: Char);
begin
  SendMessage(edtSearch.Handle, WM_CHAR, Integer(Key), 0);
  edtSearch.SetFocus;
end;

procedure TfrmOrganizer.actGrupaExecute(Sender: TObject);
begin
  cbxGrupa.SetFocus;
end;

procedure TfrmOrganizer.actSzukajExecute(Sender: TObject);
begin
  edtSearch.SetFocus;
end;

procedure TfrmOrganizer.dbxGrupaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key in [VK_UP, VK_DOWN]) then begin
    case Key of
      VK_UP: dbeEmail.SetFocus;
      VK_DOWN: dbmInformacje.SetFocus;      
    end;

    Key := 0;
  end;

  if (Key in [VK_LEFT, VK_RIGHT]) then begin
    case Key of
      VK_LEFT: Key := VK_UP;
      VK_RIGHT: Key := VK_DOWN;
    end;
  end;
end;

procedure TfrmOrganizer.srcOrganizerDataChange(Sender: TObject;
  Field: TField);
begin
  frmMain.HintStatus('Iloœæ wpisów w tabeli: ' + IntToStr(tabOrganizer.RecordCount));
end;

end.
