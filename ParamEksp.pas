unit ParamEksp;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ComCtrls;

type
  TParametryEksportu = class(TForm)
    LineUpDown: TUpDown;
    LineEdit: TEdit;
    StationEdit: TEdit;
    LOEdit: TEdit;
    KanalEdit: TEdit;
    StationUpDown: TUpDown;
    LOUpDown: TUpDown;
    KanalUpDown: TUpDown;
    Button1: TButton;
    Button2: TButton;
    DatumCheckBox: TCheckBox;
    StatykaCheckBox: TCheckBox;
    WodaCheckBox: TCheckBox;
    GlebokoscCheckBox: TCheckBox;
    CzasPCheckBox: TCheckBox;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    LabelLine: TLabel;
    Label5: TLabel;
    Label1: TLabel;
    Label2: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ParametryEksportu: TParametryEksportu;

implementation

{$R *.DFM}

end.
