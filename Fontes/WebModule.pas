unit WebModule;

interface

uses
  System.Classes, Web.HTTPApp, Datasnap.DSHTTPWebBroker, Datasnap.DSServer,
  IPPeerServer, Datasnap.DSCommonServer, Datasnap.DSHTTP;

type
  TWebModuleServer = class(TWebModule)
    DSHTTPWebDispatcher: TDSHTTPWebDispatcher;
    DSServer: TDSServer;
    DSServerClass: TDSServerClass;
    procedure DSServerClassGetClass(DSServerClass: TDSServerClass; var PersistentClass: TPersistentClass);
    procedure WebModuleServerDefaultHandlerAction(Sender: TObject; Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  WebModuleClass: TComponentClass = TWebModuleServer;

implementation

{$R *.dfm}

uses
  ServerMethods, Web.WebReq;

procedure TWebModuleServer.WebModuleServerDefaultHandlerAction(Sender: TObject; Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
begin
  Response.Content :=
    '<html>' +
    '<head><title>DataSnap Server</title></head>' +
    '<body>DataSnap Server</body>' +
    '</html>';
end;

procedure TWebModuleServer.DSServerClassGetClass(DSServerClass: TDSServerClass; var PersistentClass: TPersistentClass);
begin
  PersistentClass := ServerMethods.TServerMethods;
end;

initialization

finalization
  Web.WebReq.FreeWebModules;

end.
