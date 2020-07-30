unit ServerMethods;

interface

uses
  System.SysUtils, System.Classes, Datasnap.DSServer, WebModule, JSON;

type
{$METHODINFO ON}
  TServerMethods = class(TComponent)
  private
    procedure ConfigurarReader;
  public
    function HelloWorld: TJSONObject;
    function ServerTime: TJSONObject;
    function EchoString(Value: string): TJSONObject;
    function ReverseString(Value: string): TJSONObject;
    function Soma(Value01: Integer; Value02: Integer): TJSONObject;
    function Usuario: TJSONArray; //Get = Select
    function AcceptUsuario(const aNome, aSenha: string): TJSONObject; //Put = Update
    function UpdateUsuario(const aNome, aSenha: string): TJSONObject; //Post = Insert
    function CancelUsuario(const aNome: string): TJSONObject; //Delete = Delete
  end;
{$METHODINFO OFF}

implementation

uses
  System.StrUtils;

procedure TServerMethods.ConfigurarReader;
begin
  ContentType := 'application/json';
end;

function TServerMethods.HelloWorld: TJSONObject;
var
  objeto: TJSONObject;
begin
  ConfigurarReader;
  objeto := TJSONObject.Create;
  objeto.AddPair(TJSONPair.Create('result', 'Hello World'));
  Result := objeto;
end;

function TServerMethods.ServerTime: TJSONObject;
var
  objeto: TJSONObject;
begin
  ConfigurarReader;
  objeto := TJSONObject.Create;
  objeto.AddPair(TJSONPair.Create('result', FormatDateTime('dd-mm-yyyy hh:mm:ss', Now)));
  Result := objeto;
end;

function TServerMethods.EchoString(Value: string): TJSONObject;
var
  objeto: TJSONObject;
begin
  ConfigurarReader;
  objeto := TJSONObject.Create;
  objeto.AddPair(TJSONPair.Create('result', Value));
  Result := objeto;
end;

function TServerMethods.ReverseString(Value: string): TJSONObject;
var
  objeto: TJSONObject;
begin
  ConfigurarReader;
  objeto := TJSONObject.Create;
  objeto.AddPair(TJSONPair.Create('result', System.StrUtils.ReverseString(Value)));
  Result := objeto;
end;

function TServerMethods.Soma(Value01, Value02: Integer): TJSONObject;
var
  objeto: TJSONObject;
begin
  ConfigurarReader;
  objeto := TJSONObject.Create;
  objeto.AddPair(TJSONPair.Create('result', IntToStr((Value01 + Value02))));
  Result := objeto;
end;

function TServerMethods.Usuario: TJSONArray;
var
  lista: TJSONArray;
  objeto01: TJSONObject;
  objeto02: TJSONObject;
  objeto03: TJSONObject;
begin
  ConfigurarReader;
  lista := TJSONArray.Create;

  objeto01 := TJSONObject.Create;
  objeto01.AddPair(TJSONPair.Create('nome', 'Snoopy'));
  objeto01.AddPair(TJSONPair.Create('senha', '123465'));
  lista.AddElement(objeto01);

  objeto02 := TJSONObject.Create;
  objeto02.AddPair(TJSONPair.Create('nome', 'Lola'));
  objeto02.AddPair(TJSONPair.Create('senha', '654321'));
  lista.AddElement(objeto02);

  objeto03 := TJSONObject.Create;
  objeto03.AddPair(TJSONPair.Create('nome', 'Tobias'));
  objeto03.AddPair(TJSONPair.Create('senha', '456123'));
  lista.AddElement(objeto03);

  Result := lista;
end;

function TServerMethods.AcceptUsuario(const aNome, aSenha: string): TJSONObject;
var
  objeto: TJSONObject;
begin
  ConfigurarReader;
  objeto := TJSONObject.Create;
  objeto.AddPair(TJSONPair.Create('nome', aNome));
  objeto.AddPair(TJSONPair.Create('senha', aSenha));
  objeto.AddPair(TJSONPair.Create('mensagem', 'Usuário atualizado com sucesso'));
  Result := objeto;
end;

function TServerMethods.UpdateUsuario(const aNome, aSenha: string): TJSONObject;
var
  objeto: TJSONObject;
begin
  ConfigurarReader;
  objeto := TJSONObject.Create;
  objeto.AddPair(TJSONPair.Create('nome', aNome));
  objeto.AddPair(TJSONPair.Create('senha', aSenha));
  objeto.AddPair(TJSONPair.Create('mensagem', 'Usuário criado com sucesso'));
  Result := objeto;
end;

function TServerMethods.CancelUsuario(const aNome: string): TJSONObject;
var
  objeto: TJSONObject;
begin
  ConfigurarReader;
  objeto := TJSONObject.Create;
  objeto.AddPair(TJSONPair.Create('mensagem', 'Usuário ' + aNome + ' excluído com sucesso'));
  Result := objeto;
end;

end.
