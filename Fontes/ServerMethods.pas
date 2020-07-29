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
    function EchoString(Value: string): string;
    function ReverseString(Value: string): string;
    function Soma(Value01: Integer; Value02: Integer): Integer;
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

function TServerMethods.Soma(Value01, Value02: Integer): Integer;
begin
  ConfigurarReader;
  Result := Value01 + Value02;
end;

function TServerMethods.EchoString(Value: string): string;
begin
  ConfigurarReader;
  Result := Value;
end;

function TServerMethods.ReverseString(Value: string): string;
begin
  ConfigurarReader;
  Result := System.StrUtils.ReverseString(Value);
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
  objeto.AddPair(TJSONPair.Create('mensagem', 'Usuário excluído com sucesso'));
  Result := objeto;
end;

end.
