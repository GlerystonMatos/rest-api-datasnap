unit ServerMethods;

interface

uses
  System.SysUtils, System.Classes, Datasnap.DSServer;

type
{$METHODINFO ON}
  TServerMethods = class(TComponent)
  private
    { Private declarations }
  public
    { Public declarations }
    function EchoString(Value: string): string;
    function ReverseString(Value: string): string;
    function Add(Value01: Integer; Value02: Integer): Integer;
  end;
{$METHODINFO OFF}

implementation

uses
  System.StrUtils;

function TServerMethods.Add(Value01, Value02: Integer): Integer;
begin
  Result := Value01 + Value02;
end;

function TServerMethods.EchoString(Value: string): string;
begin
  Result := Value;
end;

function TServerMethods.ReverseString(Value: string): string;
begin
  Result := System.StrUtils.ReverseString(Value);
end;

end.
