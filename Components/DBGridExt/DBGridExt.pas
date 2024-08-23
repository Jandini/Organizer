unit DBGridExt;

interface

uses
  DBGrids, Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, DB, Menus, Grids;

type
  TDBGridExt = class(TCustomDBGrid)
  private
    FCurrentRow: Integer;

    FFocusFont: TFont;
    FLineFont: TFont;
    FFocusBrush: TBrush;
    FLineBrush: TBrush;
    FDrawFocusRect: Boolean;

    function GetFocusBrush: TBrush;
    function GetFocusFont: TFont;
    function GetLineBrush: TBrush;
    function GetLineFont: TFont;
    procedure SetFocusBrush(const Value: TBrush);
    procedure SetFocusFont(const Value: TFont);
    procedure SetLineBrush(const Value: TBrush);
    procedure SetLineFont(const Value: TFont);
    function GetDrawFocusRect: Boolean;
    procedure SetDrawFocusRect(const Value: Boolean);

{    procedure AlignField;}

  protected
    procedure KeyDown(var Key: Word; Shift: TShiftState); override;
    procedure DrawColumnCell(const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState); override;
    procedure DrawCell(ACol, ARow: Longint; ARect: TRect; AState: TGridDrawState); override;
    procedure DefaultDrawColumnCell(const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure WMSize(var Message: TWMSize); message WM_SIZE;
    procedure WMMouseWheel(var Message: TWMMouseWheel); message WM_MOUSEWHEEL;

  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;

    property SelectedRows;
    property Canvas;

  published

    property FocusRect: Boolean read GetDrawFocusRect write SetDrawFocusRect default False;
    property FocusBrush: TBrush read GetFocusBrush write SetFocusBrush;
    property FocusFont: TFont read GetFocusFont write SetFocusFont;
    property LineBrush: TBrush read GetLineBrush write SetLineBrush;
    property LineFont: TFont read GetLineFont write SetLineFont;
    property Align;
    property Anchors;
    property BiDiMode;
    property BorderStyle;
    property Color;
    property Columns stored False;
    property Constraints;
    property Ctl3D;
    property DataSource;
    property DefaultDrawing;
    property DragCursor;
    property DragKind;
    property DragMode;
    property Enabled;
    property FixedColor;
    property Font;
    property ImeMode;
    property ImeName;
    property Options;
    property ParentBiDiMode;
    property ParentColor;
    property ParentCtl3D;
    property ParentFont;
    property ParentShowHint;
    property PopupMenu;
    property ReadOnly;
    property ShowHint;
    property TabOrder;
    property TabStop;
    property TitleFont;
    property Visible;
    property OnCellClick;
    property OnColEnter;
    property OnColExit;
    property OnColumnMoved;
    property OnDrawDataCell;  { obsolete }
    property OnDrawColumnCell;
    property OnDblClick;
    property OnDragDrop;
    property OnDragOver;
    property OnEditButtonClick;
    property OnEndDock;
    property OnEndDrag;
    property OnEnter;
    property OnExit;
    property OnKeyDown;
    property OnKeyPress;
    property OnKeyUp;
    property OnStartDock;
    property OnStartDrag;
    property OnTitleClick;
  end;

const
  ColumnMinSize = 10;

procedure Register;

implementation



procedure Register;
begin
  RegisterComponents('Data Controls', [TDBGridExt]);
end;

{ TDBGridExt }


{procedure TDBGridExt.AlignField;
var
  i, j: Integer;
begin
  i := 0;
  j := 0;
  while i < Columns.Count - 1 do begin
    inc(j, Columns[i].Width);
    inc(i);
  end;
  Columns[Columns.Count - 1].Width := ClientWidth - j;
end;}

constructor TDBGridExt.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  DefaultDrawing := False;
  FFocusFont := TFont.Create;
  FFocusFont.Color := clHighlightText;

  FFocusBrush := TBrush.Create;
  FFocusBrush.Color := clHighlight;

  FLineFont := TFont.Create;
  FLineBrush := TBrush.Create;
end;


procedure WriteText(ACanvas: TCanvas; ARect: TRect; DX, DY: Integer; const Text: string; Alignment: TAlignment; ARightToLeft: Boolean);
const
  AlignFlags : array [TAlignment] of Integer =
    ( DT_LEFT or DT_WORDBREAK or DT_EXPANDTABS or DT_NOPREFIX,
      DT_RIGHT or DT_WORDBREAK or DT_EXPANDTABS or DT_NOPREFIX,
      DT_CENTER or DT_WORDBREAK or DT_EXPANDTABS or DT_NOPREFIX );
  RTL: array [Boolean] of Integer = (0, DT_RTLREADING);
var
  Left: Integer;
begin
    if (ACanvas.CanvasOrientation = coRightToLeft) and (not ARightToLeft) then
      ChangeBiDiModeAlignment(Alignment);
    case Alignment of
      taLeftJustify:
        Left := ARect.Left + DX;
      taRightJustify:
        Left := ARect.Right - ACanvas.TextWidth(Text) - 3;
    else { taCenter }
      Left := ARect.Left + (ARect.Right - ARect.Left) shr 1
        - (ACanvas.TextWidth(Text) shr 1);
    end;
    ACanvas.TextRect(ARect, Left, ARect.Top + DY, Text);
end;


procedure TDBGridExt.DefaultDrawColumnCell(const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
var
  Value: string;
begin
  Value := '';
  if Assigned(Column.Field) then
    Value := Column.Field.DisplayText;
  WriteText(Canvas, Rect, 2, 2, Value, Column.Alignment,
    UseRightToLeftAlignmentForField(Column.Field, Column.Alignment));
end;

destructor TDBGridExt.Destroy;
begin
  FFocusFont.Free;
  FLineFont.Free;
  FFocusBrush.Free;
  FLineBrush.Free;
  inherited;
end;

procedure TDBGridExt.DrawCell(ACol, ARow: Integer; ARect: TRect;  AState: TGridDrawState);
begin
  FCurrentRow := ARow;
  inherited;
end;

procedure TDBGridExt.DrawColumnCell(const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  if ((State * [gdSelected] <> [gdSelected])) or (not Focused) then begin
    if Row = FCurrentRow then begin
      Canvas.Font := FLineFont;
      Canvas.Brush := FLineBrush;
    end else
      if not Assigned(OnDrawColumnCell) then
        Canvas.Brush.Color := Column.Color;
  end;
  if ((State * [gdSelected] = [gdSelected])) and (Focused) then begin
    Canvas.Font := FFocusFont;
    Canvas.Brush := FFocusBrush;
  end;

  DefaultDrawColumnCell(Rect, DataCol, Column, State);

  if FDrawFocusRect then
    if ((State * [gdSelected] = [gdSelected])) and (Focused) then
      Canvas.DrawFocusRect(Rect);

  if Assigned(OnDrawColumnCell) then
    inherited;
end;


function TDBGridExt.GetDrawFocusRect: Boolean;
begin
  Result := FDrawFocusRect;
end;

function TDBGridExt.GetFocusBrush: TBrush;
begin
  Result := FFocusBrush;
end;

function TDBGridExt.GetFocusFont: TFont;
begin
  Result := FFocusFont;
end;

function TDBGridExt.GetLineBrush: TBrush;
begin
  Result := FLineBrush;
end;

function TDBGridExt.GetLineFont: TFont;
begin
  Result := FLineFont;
end;

procedure TDBGridExt.KeyDown(var Key: Word; Shift: TShiftState);
var
  Incress: Byte;
begin
  if (Shift * [ssCtrl] = [ssCtrl]) then begin
    if Shift * [ssShift] = [ssShift] then
      Incress := 1
    else
      Incress := 10;

    if (Key in [VK_RIGHT])  then begin
      Columns[SelectedIndex].Width := Columns[SelectedIndex].Width + Incress;
{      AlignField;}
      Key := 0;
    end;

    if (Key in [VK_LEFT])  then begin
        if Columns[SelectedIndex].Width - Incress > ColumnMinSize then
          Columns[SelectedIndex].Width := Columns[SelectedIndex].Width - Incress
        else Columns[SelectedIndex].Width := ColumnMinSize;
      Key := 0;
{      AlignField;}
    end;
  end;

  inherited;
  if Assigned(OnKeyDown) then
    OnKeyDown(Self, Key, Shift);
end;



procedure TDBGridExt.SetDrawFocusRect(const Value: Boolean);
begin
  FDrawFocusRect := Value;
end;

procedure TDBGridExt.SetFocusBrush(const Value: TBrush);
begin
  FFocusBrush.Assign(Value);
end;

procedure TDBGridExt.SetFocusFont(const Value: TFont);
begin
  FFocusFont.Assign(Value);
end;

procedure TDBGridExt.SetLineBrush(const Value: TBrush);
begin
  FLineBrush.Assign(Value);
end;

procedure TDBGridExt.SetLineFont(const Value: TFont);
begin
  FLineFont.Assign(Value);
end;

procedure TDBGridExt.WMMouseWheel(var Message: TWMMouseWheel);
begin
  inherited;
  Invalidate;
end;

procedure TDBGridExt.WMSize(var Message: TWMSize);
begin
//  AlignField;
  inherited;
end;

end.
