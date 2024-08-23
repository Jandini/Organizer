object frmData: TfrmData
  OldCreateOrder = False
  Top = 72
  Height = 480
  Width = 696
  object dbOrganizer: TIBDatabase
    DatabaseName = '192.168.1.26:c:\interbase\organizer.gdb'
    Params.Strings = (
      'user_name=sysdba'
      'password=masterkey')
    LoginPrompt = False
    DefaultTransaction = traOrganizer
    IdleTimer = 0
    SQLDialect = 1
    TraceFlags = []
    BeforeConnect = dbOrganizerBeforeConnect
    Left = 24
    Top = 16
  end
  object traOrganizer: TIBTransaction
    Active = False
    DefaultDatabase = dbOrganizer
    Params.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 112
    Top = 16
  end
end
