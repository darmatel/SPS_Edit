program SPSEdit;

uses
  Forms,
  test in 'test.pas' {FormaMain},
  Dialogi in 'Dialogi.pas' {OKBottomDlg},
  Szukaj in 'Szukaj.pas' {FormaSzukaj},
  ParamEksp in 'ParamEksp.pas' {ParametryEksportu},
  Indeksy in 'Indeksy.pas' {ZamianaIndeksow},
  ComboOrazOKCancel in 'ComboOrazOKCancel.pas' {FormaZCombo},
  Otworz in 'Otworz.pas' {FormaOtwarcia},
  Check in 'Check\Check.pas',
  geofizyk in 'Check\geofizyk.pas',
  Procedury in 'Procedury.pas',
  Parametry in 'Parametry.pas' {PagesDlg},
  Scalaj in 'Scalaj.pas' {FormaScalaj},
  pomoc in 'pomoc.pas',
  Skipy in 'Skipy.pas' {FormaSkipow},
  Wskaznik in 'Wskaznik.pas',
  FilterForma in 'Check\FilterForma.pas' {AboutBox};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := 'SPSEdit';
  Application.CreateForm(TFormaMain, FormaMain);
  Application.CreateForm(TOKBottomDlg, OKBottomDlg);
  Application.CreateForm(TFormaSzukaj, FormaSzukaj);
  Application.CreateForm(TParametryEksportu, ParametryEksportu);
  Application.CreateForm(TZamianaIndeksow, ZamianaIndeksow);
  Application.CreateForm(TFormaZCombo, FormaZCombo);
  Application.CreateForm(TFormaOtwarcia, FormaOtwarcia);
  Application.CreateForm(TPagesDlg, PagesDlg);
  Application.CreateForm(TFormaScalaj, FormaScalaj);
  Application.CreateForm(TFormaSkipow, FormaSkipow);
  Application.CreateForm(TAboutBox, AboutBox);
  Application.CreateForm(TAboutBox, AboutBox);
  Application.CreateForm(TAboutBox, AboutBox);
  Application.Run;
end.