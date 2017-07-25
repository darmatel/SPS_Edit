unit probny;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs;

type
  TForm1 = class(TForm)
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

procedure TForm1.FormCreate(Sender: TObject);
var str, losiu   :string;

function pobierz_element(temp_str :string; numer :byte):string;
var pozycja      :byte;
    lokal_str    :String;
    i ,j           :byte;
    elementow    :byte;
begin
  if length(temp_str) = 0 then
  begin
     pobierz_element := '';
     exit;
  end;

  i :=0; j:= 0; pozycja := 0;  elementow := 0;
  lokal_str := ','+temp_str;
  for i := 1 to length(temp_str) do
  begin
    if (lokal_str[i] = ',') then
    begin
     inc(elementow);
     if elementow = numer then
     begin
       lokal_str := '';
       lokal_str := lokal_str +temp_str[i+1] + temp_str[i+2];
       pobierz_element := lokal_str;
       exit;
     end

    end
  end;
end;

begin
   str := 'V1, V2, V3';
   losiu := pobierz_element(str,2);
end;

end.
