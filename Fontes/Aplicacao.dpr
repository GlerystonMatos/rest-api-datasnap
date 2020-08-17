program Aplicacao;
{$APPTYPE GUI}

{$R *.dres}

uses
  Vcl.Forms,
  Web.WebReq,
  IdHTTPWebBrokerBridge,
  uServer in 'uServer.pas' {frmServer},
  WebModule in 'WebModule.pas' {WebModuleServer: TWebModule},
  ServerMethods in 'ServerMethods.pas';

{$R *.res}

begin
  if (WebRequestHandler <> nil) then
    WebRequestHandler.WebModuleClass := WebModuleClass;
  Application.Initialize;
  Application.CreateForm(TfrmServer, frmServer);
  Application.Run;
end.
