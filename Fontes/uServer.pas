unit uServer;

interface

uses
  Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.AppEvnts, Vcl.StdCtrls, IdHTTPWebBrokerBridge, Web.HTTPApp,
  Vcl.Imaging.pngimage, Vcl.ExtCtrls, dxGDIPlusClasses;

type
  TfrmServer = class(TForm)
    btnStartStop: TButton;
    imgLogo: TImage;
    lbVersao: TLabel;
    lbStatus: TLabel;
    lbPorta: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure btnStartStopClick(Sender: TObject);
  private
    FServer: TIdHTTPWebBrokerBridge;
    procedure StartServer;
    procedure StopServer;
  public
    { Public declarations }
  end;

var
  frmServer: TfrmServer;

implementation

{$R *.dfm}

uses
  WinApi.Windows, Winapi.ShellApi, Datasnap.DSSession;

procedure TfrmServer.btnStartStopClick(Sender: TObject);
begin
  if (not FServer.Active) then
    StartServer
  else
    StopServer;
end;

procedure TerminateThreads;
begin
  if (TDSSessionManager.Instance <> nil) then
    TDSSessionManager.Instance.TerminateAllSessions;
end;

procedure TfrmServer.FormCreate(Sender: TObject);
begin
  FServer := TIdHTTPWebBrokerBridge.Create(Self);
end;

procedure TfrmServer.StartServer;
begin
  FServer.Bindings.Clear;
  FServer.DefaultPort := 8082;
  FServer.Active := True;
  btnStartStop.Caption := 'Stop';
  lbStatus.Caption := 'Status: Online';
  lbPorta.Caption := 'Port: ' + IntToStr(FServer.DefaultPort);
end;

procedure TfrmServer.StopServer;
begin
  TerminateThreads;
  FServer.Active := False;
  FServer.Bindings.Clear;
  btnStartStop.Caption := 'Start';
  lbStatus.Caption := 'Status: Offline';
  lbPorta.Caption := 'Port: ';
end;

end.
