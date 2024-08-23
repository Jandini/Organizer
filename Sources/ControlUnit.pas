unit ControlUnit;

interface

uses IBDatabase, Classes, IniFiles;

type

  TControlObject = class(TObject)
  private
    FAutoLogin: Boolean;
    FDataBase: TIBDatabase;
    FIniFile: TIniFile;
    FProtocol: Integer;
    FServerName: String;
    FDataBaseName: String;
    FRemote: Boolean;
    FAutoUserName: String;
    FAutoPassword: String;
    FLastUserName: String;
    FLoginNow: Boolean;
    FLog: TStrings;
    FTransaction: TIBTransaction;
    FShowList: Boolean;
    FMaximizeList: Boolean;
    FFullScreen: Boolean;


    function GetParam(ParamName: String): String;
    procedure SetParam(ParamName: String; Value: String);

    function GetPassword: String;
    function GetUserName: String;
    procedure SetPassword(const Value: String);
    procedure SetUserName(const Value: String);
    function GetDataBasePath: String;


  public
    constructor Create;
    destructor Destroy; override;

    procedure UserLogin;
    procedure UserLogout;

    procedure AddToLog(Msg: String);

    property DataBase: TIBDatabase read FDataBase write FDataBase;
    property Transaction: TIBTransaction read FTransaction write FTransaction;

    procedure SaveToFile(FileName: String);
    procedure LoadFromFile(FileName: String);

    property AutoLogin: Boolean read FAutoLogin write FAutoLogin;
    property UserName: String read GetUserName write SetUserName;
    property Password: String read GetPassword write SetPassword;
    property AutoUserName: String read FAutoUserName write FAutoUserName;
    property AutoPassword: String read FAutoPassword write FAutoPassword;
    property LastUserName: String read FLastUserName write FLastUserName;

    property DataBasePath: String read GetDataBasePath;
    property DataBaseName: String read FDataBaseName write FDataBaseName;
    property Protocol: Integer read FProtocol write FProtocol;
    property ServerName: String read FServerName write FServerName;
    property Remote: Boolean read FRemote write FRemote;

    property ShowList: Boolean read FShowList write FShowList;
    property MaximizeList: Boolean read FMaximizeList write FMaximizeList;

    property LoginNow: Boolean read FLoginNow write FLoginNow;
    property Log: TStrings read FLog write FLog;

    property FullScreen: Boolean read FFullScreen write FFullScreen;


  end;




implementation


uses DialogsUnit, Dialogs, ConstsUnit, SysUtils, MainUnit, LogUnit;

{ TControlObject }

procedure TControlObject.AddToLog(Msg: String);
var
  FileStream: TFileStream;
begin
  FLog.Insert(0, Format('%s %s    %s', [TimeToStr(Now), DateToStr(Now), Msg]));
  if not frmMain.actLog.Enabled then
    frmLog.lstErrors.Items.Insert(0, Format('%s %s    %s', [TimeToStr(Now), DateToStr(Now), Msg]));

  try
    FileStream := TFileStream.Create(ExtractFilePath(ParamStr(0)) + '\log.txt', fmOpenWrite);
  except
    try
      FileStream := TFileStream.Create(ExtractFilePath(ParamStr(0)) + '\log.txt', fmCreate);
    except
      Exit;
    end;
  end;

  try
    FileStream.Seek(0, soFromEnd);
    FLog.SaveToStream(FileStream);
    FileStream.Free;
  except
  end;  
end;

constructor TControlObject.Create;
begin
  inherited;
  FLog := TStringList.Create;
end;

destructor TControlObject.Destroy;
begin
  FLog.Free;
  inherited;
end;

function TControlObject.GetDataBasePath: String;
begin
  if not Remote then
    Result := FDataBaseName
  else begin
    case FProtocol of
      0: Result := Format('%s:%s', [FServerName, FDataBaseName]);
      1: Result := Format('%s@%s', [FServerName, FDataBaseName]);
      2: Result := Format('\\%s\%s', [FServerName, FDataBaseName]);
    end;
  end;
end;

function TControlObject.GetParam(ParamName: String): String;
var
  i: Integer;
begin
  i := 0;
  Result := '';
  while (i < FDataBase.Params.Count) and (Result = '') do begin
    if StrLComp(PChar(FDataBase.Params[i]), PChar(ParamName), Length(ParamName)) = 0 then
      Result := Copy(FDataBase.Params[i], Pos('=', FDataBase.Params[i]) + 1, 255);
    inc(i);
  end;
  Result := UpperCase(Result);
end;

function TControlObject.GetPassword: String;
begin
  Result := GetParam(parPassword);
end;


function TControlObject.GetUserName: String;
begin
  Result := GetParam(parUserName);
end;


procedure TControlObject.LoadFromFile(FileName: String);
begin
  try
    FIniFile := TIniFile.Create(FileName);
    try
      with FIniFile do begin
        AutoLogin := Boolean(ReadInteger(secLogowanie, iniAutoLogin, 0));
        FLastUserName := ReadString(secLogowanie, iniLastUserName, '');
        FAutoUserName := ReadString(secLogowanie, iniAutoUserName, '');
        FAutoPassword := ReadString(secLogowanie, iniAutoPassword, '');

        Remote := Boolean(ReadInteger(secBazaDanych, iniRemote, 0));
        Protocol := ReadInteger(secBazaDanych, iniProtocol, proTCP);
        DataBaseName := ReadString(secBazaDanych, iniDatabaseName, '');
        ServerName := ReadString(secBazaDanych, iniServerName, '');

        ShowList := Boolean(ReadInteger(secLista, iniShow, 0));
        MaximizeList := Boolean(ReadInteger(secLista, iniMaximizeList, 0));

        FullScreen := Boolean(ReadInteger(secGeneral, iniFullScreen, 0));
      end;
    finally
      FIniFile.Free;
    end;
  except
    on E: Exception do
      ControlObject.AddToLog(E.Message);
  end;
end;

procedure TControlObject.SaveToFile(FileName: String);
begin
  try
    FIniFile := TIniFile.Create(FileName);
    try
      with FIniFile do begin
        WriteInteger(secLogowanie, iniAutoLogin, Integer(AutoLogin));
        WriteString(secLogowanie, iniAutoUserName, FAutoUserName);
        WriteString(secLogowanie, iniAutoPassword, FAutoPassword);
        WriteString(secLogowanie, iniLastUserName, FLastUserName);

        WriteInteger(secBazaDanych, iniProtocol, Protocol);
        WriteString(secBazaDanych, iniDatabaseName, DataBaseName);
        WriteString(secBazaDanych, iniServerName, ServerName);
        WriteInteger(secBazaDanych, iniRemote, Integer(Remote));

        WriteInteger(secLista, iniShow, Integer(ShowList));
        WriteInteger(secLista, iniMaximizeList, Integer(MaximizeList));

        WriteInteger(secGeneral, iniFullScreen, Integer(FullScreen));

      end;
    finally
      FIniFile.Free;
    end;
  except
    on E: Exception do
      ControlObject.AddToLog(E.Message);
  end;
end;

procedure TControlObject.SetParam(ParamName, Value: String);
var
  i: Integer;
begin
  i := 0;
  while (i < FDataBase.Params.Count) do begin
    if StrLComp(PChar(FDataBase.Params[i]), PChar(ParamName), Length(ParamName)) = 0 then begin
      FDataBase.Params[i] := ParamName + Value;
      Exit;
    end;
    inc(i);
  end;
  FDataBase.Params.Add(ParamName + Value);
end;

procedure TControlObject.SetPassword(const Value: String);
begin
  SetParam(parPassword, Value);
end;


procedure TControlObject.SetUserName(const Value: String);
begin
  SetParam(parUserName, Value);
end;

procedure TControlObject.UserLogin;
begin
  FDataBase.DatabaseName := DataBasePath;
  FDataBase.Connected := True;
  FTransaction.DefaultDatabase := FDataBase;
end;

procedure TControlObject.UserLogout;
begin
  FDataBase.Connected := False;
end;

end.
