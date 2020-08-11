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
    function Eco(Value: string): TJSONObject;
    function Soma(Value01: Integer; Value02: Integer): TJSONObject;
    function Usuario: TJSONArray; //Get = Select
    function AcceptUsuario(const Dados: TJSONObject): TJSONObject; //Put = Update
    function UpdateUsuario(const Dados: TJSONObject): TJSONObject; //Post = Insert
    function CancelUsuario(const Nome: string): TJSONObject; //Delete = Delete
  end;
{$METHODINFO OFF}

implementation

uses
  System.StrUtils;

procedure TServerMethods.ConfigurarReader;
begin
  ContentType := 'application/json';
end;

function TServerMethods.Eco(Value: string): TJSONObject;
var
  objeto: TJSONObject;
begin
  ConfigurarReader;
  objeto := TJSONObject.Create;
  objeto.AddPair(TJSONPair.Create('result', Value));
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

function TServerMethods.AcceptUsuario(const Dados: TJSONObject): TJSONObject;
var
  senha: string;
  usuario: string;
  objeto: TJSONObject;
begin
  ConfigurarReader;
  objeto := TJSONObject.Create;

  usuario := '';
  if (not Dados.GetValue('nome').Null) then
    usuario := Dados.GetValue('nome').Value;

  senha := '';
  if (not Dados.GetValue('senha').Null) then
    senha := Dados.GetValue('senha').Value;

  objeto.AddPair(TJSONPair.Create('mensagem', 'Usuário ' + usuario + ' com a senha ' + senha + ', foi atualizado com sucesso'));
  Result := objeto;
end;

function TServerMethods.UpdateUsuario(const Dados: TJSONObject): TJSONObject;
var
  senha: string;
  usuario: string;
  objeto: TJSONObject;
begin
  ConfigurarReader;
  objeto := TJSONObject.Create;

  usuario := '';
  if (not Dados.GetValue('nome').Null) then
    usuario := Dados.GetValue('nome').Value;

  senha := '';
  if (not Dados.GetValue('senha').Null) then
    senha := Dados.GetValue('senha').Value;

  objeto.AddPair(TJSONPair.Create('mensagem', 'Usuário ' + usuario + ' com a senha ' + senha + ', foi criado com sucesso'));
  Result := objeto;
end;

function TServerMethods.CancelUsuario(const Nome: string): TJSONObject;
var
  objeto: TJSONObject;
begin
  ConfigurarReader;
  objeto := TJSONObject.Create;
  objeto.AddPair(TJSONPair.Create('mensagem', 'Usuário ' + Nome + ' excluído com sucesso'));
  Result := objeto;
end;

end.
