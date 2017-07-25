unit Parametry;

interface

uses Windows, SysUtils, Classes, Graphics, Forms, Controls, StdCtrls,
  Buttons, ComCtrls, ExtCtrls, Mask, Dialogs, Pomoc, Messages;

const Mes_Odswierz        =WM_USER + 1;

type
  TPagesDlg = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    OKBtn: TButton;
    CancelBtn: TButton;
    HelpBtn: TButton;
    KrokLiniiEdit: TEdit;
    Label1: TLabel;
    PierwszaLiniaEdit: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    OdlegloscKanalowEdit: TEdit;
    Label4: TLabel;
    TabSheet4: TTabSheet;
    Label5: TLabel;
    Label6: TLabel;
    ZrodloRadioGroup: TRadioGroup;
    AparaturaRadioGroup: TRadioGroup;
    Label7: TLabel;
    DatumCheckCheckBox: TCheckBox;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    MetodykaTestCheckBox: TCheckBox;
    DephTestCheckBox: TCheckBox;
    VSrTestCheckBox: TCheckBox;
    UpholeTestCheckBox: TCheckBox;
    CzasTestCheckBox: TCheckBox;
    GeodezjaTestCheckBox: TCheckBox;
    Label8: TLabel;
    Label9: TLabel;
    NumerGeodTestCheckBox: TCheckBox;
    SkrajneTestCheckBox: TCheckBox;
    Label10: TLabel;
    SkipyTestCheckBox: TCheckBox;
    MaxOffTestCheckBox: TCheckBox;
    SkokRecTestCheckBox: TCheckBox;
    ZrodloTestCheckBox: TCheckBox;
    MaxOffsetEdit: TEdit;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    StepNumChanelEdit: TEdit;
    Label15: TLabel;
    KolejnoscLiniiTestCheckBox: TCheckBox;
    MaxActivChanelEdit: TEdit;
    Label16: TLabel;
    MinActivChanelEdit: TEdit;
    Label17: TLabel;
    SkokTapeTestCheckBox: TCheckBox;
    TabSheet5: TTabSheet;
    IloscLiniiMaskEdit: TMaskEdit;
    MaxDephMaskEdit: TMaskEdit;
    MinDephMaskEdit: TMaskEdit;
    DatumMaskEdit: TMaskEdit;
    MaxStatMaskEdit: TMaskEdit;
    MinStatEdit: TMaskEdit;
    MaxActiveLinesMaskEdit: TMaskEdit;
    MinActiveLinesMaskEdit: TMaskEdit;
    InstrNumMaskEdit: TMaskEdit;
    PunktWiazaniaEdit: TEdit;
    Label18: TLabel;
    AzymutEdit: TEdit;
    Label19: TLabel;
    ZmianaLineEdit: TEdit;
    Label20: TLabel;
    ZmianaOLineEdit: TEdit;
    Label21: TLabel;
    ZmianaStationEdit: TEdit;
    Label22: TLabel;
    ZmianaOStationEdit: TEdit;
    Label23: TLabel;
    MaxElevEdit: TEdit;
    Label24: TLabel;
    MinElevEdit: TEdit;
    Label25: TLabel;
    LegalIndexesEdit: TEdit;
    Label26: TLabel;
    BrakKanalowTestCheckBox: TCheckBox;
    TabSheet6: TTabSheet;
    WczytajTesty: TButton;
    Button1: TButton;
    OpenDialog1: TOpenDialog;
    SaveDialog1: TSaveDialog;
    StatykaTestCheckBox: TCheckBox;
    OdPalikaSEdit: TEdit;
    Label27: TLabel;
    OdPalikaSTestCheckBox: TCheckBox;
    SkipEdit: TEdit;
    ComboBox1: TComboBox;
    Easting: TEdit;
    Northing: TEdit;
    Label28: TLabel;
    Label29: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure ZrodloRadioGroupExit(Sender: TObject);
    procedure DatumCheckCheckBoxExit(Sender: TObject);
    procedure DatumCheckCheckBoxKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure PierwszaLiniaEditExit(Sender: TObject);
    procedure MyOnException(Sender: TObject; E: Exception);
    procedure KrokLiniiEditExit(Sender: TObject);
    procedure IloscLiniiMaskEditExit(Sender: TObject);
    procedure AzymutEditExit(Sender: TObject);
    procedure OdlegloscKanalowEditExit(Sender: TObject);
    procedure PunktWiazaniaEditExit(Sender: TObject);
    procedure ZmianaLineEditExit(Sender: TObject);
    procedure ZmianaOLineEditExit(Sender: TObject);
    procedure ZmianaStationEditExit(Sender: TObject);
    procedure ZmianaOStationEditExit(Sender: TObject);
    procedure ZrodloRadioGroupClick(Sender: TObject);
    procedure AparaturaRadioGroupClick(Sender: TObject);
    procedure MaxDephMaskEditExit(Sender: TObject);
    procedure MinDephMaskEditExit(Sender: TObject);
    procedure DatumMaskEditExit(Sender: TObject);
    procedure DatumCheckCheckBoxClick(Sender: TObject);
    procedure MaxStatMaskEditExit(Sender: TObject);
    procedure MinStatEditExit(Sender: TObject);
    procedure LegalIndexesEditExit(Sender: TObject);
    procedure MaxElevEditExit(Sender: TObject);
    procedure MinElevEditExit(Sender: TObject);
    procedure MaxOffsetEditExit(Sender: TObject);
    procedure MaxActiveLinesMaskEditExit(Sender: TObject);
    procedure MinActivChanelEditExit(Sender: TObject);
    procedure MetodykaTestCheckBoxClick(Sender: TObject);
    procedure NumerGeodTestCheckBoxClick(Sender: TObject);
    procedure DephTestCheckBoxClick(Sender: TObject);
    procedure VSrTestCheckBoxClick(Sender: TObject);
    procedure UpholeTestCheckBoxClick(Sender: TObject);
    procedure CzasTestCheckBoxClick(Sender: TObject);
    procedure GeodezjaTestCheckBoxClick(Sender: TObject);
    procedure ZrodloTestCheckBoxClick(Sender: TObject);
    procedure SkrajneTestCheckBoxClick(Sender: TObject);
    procedure SkipyTestCheckBoxClick(Sender: TObject);
    procedure MaxOffTestCheckBoxClick(Sender: TObject);
    procedure SkokRecTestCheckBoxClick(Sender: TObject);
    procedure SkokTapeTestCheckBoxClick(Sender: TObject);
    procedure KolejnoscLiniiTestCheckBoxClick(Sender: TObject);
    procedure BrakKanalowTestCheckBoxClick(Sender: TObject);
    procedure AparaturaRadioGroupExit(Sender: TObject);
    procedure MinActiveLinesMaskEditExit(Sender: TObject);
    procedure MetodykaTestCheckBoxExit(Sender: TObject);
    procedure MetodykaTestCheckBoxKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure NumerGeodTestCheckBoxExit(Sender: TObject);
    procedure NumerGeodTestCheckBoxKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DephTestCheckBoxKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DephTestCheckBoxExit(Sender: TObject);
    procedure StatykaTestCheckBoxClick(Sender: TObject);
    procedure StatykaTestCheckBoxEnter(Sender: TObject);
    procedure OdPalikaSEditExit(Sender: TObject);
    procedure OdPalikaSTestCheckBoxClick(Sender: TObject);
    procedure OdPalikaSTestCheckBoxExit(Sender: TObject);
    procedure SkipEditExit(Sender: TObject);
    procedure ComboBox1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EastingExit(Sender: TObject);
    procedure NorthingExit(Sender: TObject);


  private
    { Private declarations }

    procedure PrzeliczParametry(KopiaPar :PTestyDoZrobienia); // przelicza pola tekstowe na wartoœci liczbowe;
    procedure UstawOpcjeTestuWgZmienejLokalnej(KopiaPar :PTestyDoZrobienia); //t³umaczy rejestr -> forma
    procedure UspijMinDeph;
    procedure UspijMaxDeph;
    procedure PobudzMinDeph;
    procedure PobudzMaxDeph;
    procedure UspijDephTest;
    procedure PobudzDephTest;
    procedure UspijVSrTest;
    procedure PobudzVSrTest ;
    procedure PobudzUpholeTest  ;
    procedure UspijUpholeTest  ;
    function CzyPomieszaneRodzajeZrodel :boolean;
    procedure UstawOpcjeNaDynamit;
    procedure UstawOpcjeNaWibrator ;
    function JestWibWIndeksach(wiersz :string):boolean;
    function JestDynWIndeksach(wiersz :string):boolean;
    procedure OdswiezForme(var Msg  :TMessage); message Mes_Odswierz;
    function TestElementuSkipu(Tekst :string) :boolean;
  public


    { Public declarations }
  end;



var
  PagesDlg: TPagesDlg;
  i         :integer;

implementation
uses geofizyk, skipy;
{$R *.DFM}


procedure TPagesDlg.PrzeliczParametry(KopiaPar :PTestyDoZrobienia);
begin
    //  KopiaPar.Ver := Param.Ver;
      KopiaPar.PierwszaLinia := StrToFloat(Trim(PierwszaLiniaEdit.Text));
      KopiaPar.KrokLinii  := StrToFloat(Trim(KrokLiniiEdit.Text));
      KopiaPar.IloscLinii := StrToInt(Trim(IloscLiniiMaskEdit.Text));
      KopiaPar.Azymut := StrToFloat(Trim(AzymutEdit.Text));
      KopiaPar.OdlegloscKanalow := StrToFloat(Trim(OdlegloscKanalowEdit.Text));
      KopiaPar.ZmianaLine := StrToFloat(Trim(ZmianaLineEdit.Text));
      KopiaPar.ZmianaOLine := StrToFloat(Trim(ZmianaOLineEdit.Text));
      KopiaPar.PunktWiazania  :=  Trim(PunktWiazaniaEdit.text);
      KopiaPar.ZmianaStation := StrToFloat(Trim(ZmianaStationEdit.Text))  ;
      KopiaPar.ZmianaOStation := StrToFloat(Trim(ZmianaOStationEdit.Text)) ;
      KopiaPar.Northingowa := StrToFloat(Trim(Northing.Text));
      KopiaPar.Eastingowa := StrToFloat(Trim(Easting.Text));

      if (ZrodloRadioGroup.Items[ZrodloRadioGroup.ItemIndex] = 'Dynamit')
         then KopiaPar.Zrodlo := DYNAMIT
      else
      if (ZrodloRadioGroup.Items[ZrodloRadioGroup.ItemIndex] = 'Wibrator')
         then KopiaPar.Zrodlo := WIBRATOR;

      if (AparaturaRadioGroup.Items[AparaturaRadioGroup.ItemIndex] = 'IO System Two')
         then KopiaPar.Aparatura := IO2
      else
      if (AparaturaRadioGroup.Items[AparaturaRadioGroup.ItemIndex] = 'IO 2000')
         then KopiaPar.Aparatura := IO2000;

//    SPS - S
      KopiaPar.MinDeph := StrToFloat(Trim(MinDephMaskEdit.Text));
      KopiaPar.MaxDeph := StrToFloat(Trim(MaxDephMaskEdit.Text));
      KopiaPar.MaxStat := StrToFloat(Trim(MaxStatMaskEdit.Text));
      KopiaPar.MinStat := StrToFloat(Trim(MinStatEdit.Text));
      KopiaPar.MaxElev := StrToFloat(Trim(MaxElevEdit.Text));
      KopiaPar.MinElev := StrToFloat(Trim(MinElevEdit.Text));
      KopiaPar.Datum := StrToFloat(Trim(DatumMaskEdit.Text));
      KopiaPar.OdPalikaS :=  StrToFloat(Trim(OdPalikaSEdit.Text));

      if DatumCheckCheckBox.Checked then KopiaPar.DatumCheck   := true
      else KopiaPar.DatumCheck   := false;

      KopiaPar.LegalIndexes := LegalIndexesEdit.Text;

//    SPS - X
      KopiaPar.MaxOffset := StrToFloat(Trim(MaxOffsetEdit.Text));
      KopiaPar.MaxActiveLines := StrToInt(Trim(MaxActiveLinesMaskEdit.Text));
      KopiaPar.MinActiveLines := StrToInt(Trim(MinActiveLinesMaskEdit.Text));
      KopiaPar.InstrNum := StrToInt(Trim(InstrNumMaskEdit.Text));
      KopiaPar.StepNumChanel  := StrToInt(Trim(StepNumChanelEdit.Text));
      KopiaPar.MaxActivChanel := StrToInt(Trim(MaxActivChanelEdit.Text));
      KopiaPar.MinActivChanel := StrToInt(Trim(MinActivChanelEdit.Text));
      KopiaPar.Skipy          := SkipEdit.Text;

//    TESTY
      KopiaPar.MetodykaTest := MetodykaTestCheckBox.Checked;
      KopiaPar.NumerGeodTest := NumerGeodTestCheckBox.Checked;
//      KopiaPar.ExternalSPSTest :=ExternalSPSTestCheckBox.Checked ;
      KopiaPar.DephTest := DephTestCheckBox.Checked;
      KopiaPar.VSrTest := VSrTestCheckBox.Checked;
      KopiaPar.UpholeTest := UpholeTestCheckBox.Checked;
      KopiaPar.CzasTest := CzasTestCheckBox.Checked ;
      KopiaPar.StatykaTest := StatykaTestCheckBox.Checked ;
      KopiaPar.GeodezjaTest := GeodezjaTestCheckBox.Checked;
      KopiaPar.ZrodloTest := ZrodloTestCheckBox.Checked ;
      KopiaPar.SkrajneTest := SkrajneTestCheckBox.Checked;
      KopiaPar.SkipyTest := SkipyTestCheckBox.Checked ;
      KopiaPar.MaxOffTest := MaxOffTestCheckBox.Checked;
      KopiaPar.SkokRecTest := SkokRecTestCheckBox.Checked;
      KopiaPar.SkokTapeTest := SkokTapeTestCheckBox.Checked;
      KopiaPar.KolejnoscLiniiTest  := KolejnoscLiniiTestCheckBox.Checked;
      KopiaPar.OdPalikaSTest := OdPalikaSTestCheckBox.Checked;

//    SPS - R
      KopiaPar.BrakKanalowTest := BrakKanalowTestCheckBox.Checked;
end;



procedure TPagesDlg.UstawOpcjeTestuWgZmienejLokalnej(KopiaPar :PTestyDoZrobienia);

begin
   PierwszaLiniaEdit.Text := FloatToStrF(KopiaPar.PierwszaLinia,ffGeneral,8,12);
   KrokLiniiEdit.Text := FloatToStrF(KopiaPar.KrokLinii ,ffGeneral,8,12);
   IloscLiniiMaskEdit.Text := IntToStr(KopiaPar.IloscLinii) ;
   AzymutEdit.Text := FloatToStrF(KopiaPar.Azymut,ffGeneral,8,12);
   OdlegloscKanalowEdit.Text := FloatToStrF(KopiaPar.OdlegloscKanalow,ffGeneral,8,12);
   ZmianaLineEdit.Text := FloatToStrF(KopiaPar.ZmianaLine,ffGeneral,8,12);
   ZmianaOLineEdit.Text := FloatToStrF(KopiaPar.ZmianaOLine,ffGeneral,8,12);
   PunktWiazaniaEdit.Text := KopiaPar.PunktWiazania ;
   ZmianaStationEdit.Text := FloatToStrF(KopiaPar.ZmianaStation,ffGeneral,8,12);
   ZmianaOStationEdit.Text := FloatToStrF(KopiaPar.ZmianaOStation,ffGeneral,8,12);
   Easting.Text := FloatToStrF(KopiaPar.Eastingowa,ffGeneral,8,12);
   Northing.Text := FloatToStrF(KopiaPar.Northingowa,ffGeneral,8,12);

   if (KopiaPar.Zrodlo = DYNAMIT)
         then ZrodloRadioGroup.ItemIndex := DYNAMIT
   else
      if (KopiaPar.Zrodlo = WIBRATOR)
         then ZrodloRadioGroup.ItemIndex := WIBRATOR;

    if (KopiaPar.Aparatura = IO2)
         then AparaturaRadioGroup.ItemIndex := IO2
     else
     if (KopiaPar.Aparatura = IO2000)
         then AparaturaRadioGroup.ItemIndex := IO2000;

//    SPS - S
   MinDephMaskEdit.Text := FloatToStrF(KopiaPar.MinDeph,ffGeneral,8,12);
   MaxDephMaskEdit.Text := FloatToStrF(KopiaPar.MaxDeph,ffGeneral,8,12);
   MaxStatMaskEdit.Text := FloatToStrF(KopiaPar.MaxStat,ffGeneral,8,12);
   MinStatEdit.Text := FloatToStrF(KopiaPar.MinStat,ffGeneral,8,12);
   MaxElevEdit.Text := FloatToStrF(KopiaPar.MaxElev,ffGeneral,8,12);
   MinElevEdit.Text := FloatToStrF(KopiaPar.MinElev,ffGeneral,8,12);
   DatumMaskEdit.Text := FloatToStrF(KopiaPar.Datum,ffGeneral,8,12);
   OdPalikaSEdit.Text := FloatToStrF(KopiaPar.OdPalikaS,ffGeneral,8,12);

   DatumCheckCheckBox.Checked := KopiaPar.DatumCheck;
   LegalIndexesEdit.Text := KopiaPar.LegalIndexes;

//    SPS - X
   MaxOffsetEdit.Text := FloatToStrF(KopiaPar.MaxOffset,ffGeneral,8,12);
   MaxActiveLinesMaskEdit.Text := FloatToStrF(KopiaPar.MaxActiveLines,ffGeneral,8,12);
   MinActiveLinesMaskEdit.Text := FloatToStrF(KopiaPar.MinActiveLines,ffGeneral,8,12);
   InstrNumMaskEdit.Text := IntToStr(KopiaPar.InstrNum);
   StepNumChanelEdit.Text := IntToStr(KopiaPar.StepNumChanel);
   MaxActivChanelEdit.Text := IntToStr(KopiaPar.MaxActivChanel);
   MinActivChanelEdit.Text := IntToStr(KopiaPar.MinActivChanel);

   SkipEdit.Text := KopiaPar.Skipy;


//    TESTY
   MetodykaTestCheckBox.Checked := KopiaPar.MetodykaTest;
   NumerGeodTestCheckBox.Checked := KopiaPar.NumerGeodTest ;
 //  ExternalSPSTestCheckBox.Checked := KopiaPar.ExternalSPSTest;
   DephTestCheckBox.Checked := KopiaPar.DephTest;
   VSrTestCheckBox.Checked := KopiaPar.VSrTest;
   UpholeTestCheckBox.Checked := KopiaPar.UpholeTest ;
   CzasTestCheckBox.Checked  := KopiaPar.CzasTest;
   GeodezjaTestCheckBox.Checked := KopiaPar.GeodezjaTest;
   ZrodloTestCheckBox.Checked  := KopiaPar.ZrodloTest;
   StatykaTestCheckBox.Checked  := KopiaPar.StatykaTest;
   SkrajneTestCheckBox.Checked := KopiaPar.SkrajneTest ;
   SkipyTestCheckBox.Checked  := KopiaPar.SkipyTest;
   MaxOffTestCheckBox.Checked := KopiaPar.MaxOffTest ;
   SkokRecTestCheckBox.Checked := KopiaPar.SkokRecTest ;
   SkokTapeTestCheckBox.Checked := KopiaPar.SkokTapeTest;
   KolejnoscLiniiTestCheckBox.Checked := KopiaPar.KolejnoscLiniiTest ;

//    SPS - R
   BrakKanalowTestCheckBox.Checked := KopiaPar.BrakKanalowTest;

   if KopiaPar.Zrodlo = DYNAMIT
   then UstawOpcjeNaDynamit else
   if KopiaPar.Zrodlo = WIBRATOR
   then  UstawOpcjeNaWibrator;

   if KopiaPar.DatumCheck then  DatumMaskEdit.Enabled := false
   else DatumMaskEdit.Enabled := true;
end;


procedure TPagesDlg.FormCreate(Sender: TObject);
begin
  PageControl1.ActivePage := TabSheet1;
  KopiaPar.WczytajParametryTestuZRejestru ;
  UstawOpcjeTestuWgZmienejLokalnej(@KopiaPar);
end;

procedure TPagesDlg.FormClose(Sender: TObject; var Action: TCloseAction);

begin
  if ModalResult = mrOK then
  begin
     PrzeliczParametry(@KopiaPar);
     Param := KopiaPar;
     KopiaPar.ZapiszParametryTestuDoRejestru;
  end;

  if  ModalResult = mrCANCEL then
  begin

  end;
end;

procedure TPagesDlg.UspijDephTest;
begin
   DephTestCheckBox.Checked := false;
   DephTestCheckBox.Enabled := false;
end;

procedure TPagesDlg.PobudzDephTest;
begin
   DephTestCheckBox.Checked := true;
   DephTestCheckBox.Enabled := true;
end;

procedure TPagesDlg.UspijVSrTest;
begin
  VSrTestCheckBox.Checked := false;
  VSrTestCheckBox.Enabled := false;
end;

procedure TPagesDlg.PobudzVSrTest ;
begin
  VSrTestCheckBox.Checked := true;
  VSrTestCheckBox.Enabled := true;
end;

procedure TPagesDlg.PobudzUpholeTest  ;
begin
  UpholeTestCheckBox.Checked := true;
  UpholeTestCheckBox.Enabled := true;
end;

procedure TPagesDlg.UspijUpholeTest  ;
begin
  UpholeTestCheckBox.Checked := false;
  UpholeTestCheckBox.Enabled := false;
end;


procedure TPagesDlg.ZrodloRadioGroupExit(Sender: TObject);
begin
  if ZrodloRadioGroup.Items[ZrodloRadioGroup.ItemIndex] = 'Dynamit'
  then
  begin                                  //       DYNAMIT
    UstawOpcjeNaDynamit;
  end else
  begin
    UstawOpcjeNaWibrator;
  end; //end else ShowMessage('Nieznane Ÿród³o');
  if CzyPomieszaneRodzajeZrodel then ShowMessage('Uwaga zdefiniowano ró¿ne indeksy Ÿróde³');
end;

procedure TPagesDlg.UspijMinDeph;
begin
  Label6.Enabled := false;
  MinDephMaskEdit.Enabled := false;
end;

procedure TPagesDlg.UspijMaxDeph;
begin
  Label5.Enabled := false;
  MaxDephMaskEdit.Enabled := false;
end;

procedure TPagesDlg.PobudzMinDeph;
begin
  Label6.Enabled := true;
  MinDephMaskEdit.Enabled := true;
end;

procedure TPagesDlg.PobudzMaxDeph;
begin
  Label5.Enabled := true;
  MaxDephMaskEdit.Enabled := true;
end;


function TPagesDlg.CzyPomieszaneRodzajeZrodel :boolean;
begin
  if ((Pos('E', LegalIndexesEdit.text) <> 0) or (Pos('e', LegalIndexesEdit.text)<>0)) and
     ((Pos('V', LegalIndexesEdit.text)<>0) or (Pos('v', LegalIndexesEdit.text)<>0))
     then  CzyPomieszaneRodzajeZrodel := true
     else CzyPomieszaneRodzajeZrodel := false;
end;

procedure TPagesDlg.UstawOpcjeNaDynamit;
begin
   PobudzMinDeph;
   PobudzMaxDeph;
   PobudzDephTest;
   PobudzVSrTest ;
   PobudzUpholeTest  ;
end;

procedure TPagesDlg.UstawOpcjeNaWibrator ;
begin
  UspijMinDeph;
  UspijMaxDeph;
  UspijDephTest;
  UspijVSrTest;
  UspijUpholeTest  ;
end;

procedure TPagesDlg.DatumCheckCheckBoxExit(Sender: TObject);
begin
  if  DatumCheckCheckBox.Checked then  DatumMaskEdit.Enabled := false
  else  DatumMaskEdit.Enabled := true;
end;

procedure TPagesDlg.DatumCheckCheckBoxKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if  DatumCheckCheckBox.Checked then  DatumMaskEdit.Enabled := false
  else  DatumMaskEdit.Enabled := true;
end;

procedure TPagesDlg.PierwszaLiniaEditExit(Sender: TObject);
begin
  try
  KopiaPar.PierwszaLinia := StrToFloat(Trim(PierwszaLiniaEdit.Text));
  except
    ShowMessage('B³êdna wartoœæ!!!');
    PierwszaLiniaEdit.SetFocus;
  end;
end;

procedure TPagesDlg.MyOnException(Sender: TObject; E: Exception);
begin
  { Catch all unhandled exceptions here. }
  { Display the message that VCL generated. }
  Application.ShowException(E);
end;

procedure TPagesDlg.KrokLiniiEditExit(Sender: TObject);
begin
  try
    KopiaPar.KrokLinii := StrToFloat(Trim(KrokLiniiEdit.Text));
  except
    ShowMessage('B³êdna wartoœæ!!!');
    KrokLiniiEdit.SetFocus;
  end;
end;



procedure TPagesDlg.IloscLiniiMaskEditExit(Sender: TObject);
begin
  try
    KopiaPar.IloscLinii := StrToInt(Trim(IloscLiniiMaskEdit.Text));
  except
    ShowMessage('B³êdna wartoœæ!!!');
    IloscLiniiMaskEdit.SetFocus;
  end;
end;

procedure TPagesDlg.AzymutEditExit(Sender: TObject);
begin
  try
    KopiaPar.Azymut := StrToFloat(Trim(AzymutEdit.Text));
  except
    ShowMessage('B³êdna wartoœæ!!!');
    AzymutEdit.SetFocus;
  end;
end;

procedure TPagesDlg.OdlegloscKanalowEditExit(Sender: TObject);
begin
  try
    KopiaPar.OdlegloscKanalow := StrToFloat(Trim(OdlegloscKanalowEdit.Text));
  except
    ShowMessage('B³êdna wartoœæ!!!');
    OdlegloscKanalowEdit.SetFocus;
  end;
end;

procedure TPagesDlg.PunktWiazaniaEditExit(Sender: TObject);
begin
  ShowMessage(' Brak kontroli parametru -Punkt wi¹zania');
  KopiaPar.PunktWiazania := PunktWiazaniaEdit.Text;
end;    

procedure TPagesDlg.ZmianaLineEditExit(Sender: TObject);
begin
  try
    KopiaPar.ZmianaLine := StrToFloat(Trim(ZmianaLineEdit.Text));
  except
    ShowMessage('B³êdna wartoœæ!!!');
    ZmianaLineEdit.SetFocus;
  end;
end;

procedure TPagesDlg.ZmianaOLineEditExit(Sender: TObject);
begin
  try
    KopiaPar.ZmianaOLine := StrToFloat(Trim(ZmianaOLineEdit.Text));
  except
    ShowMessage('B³êdna wartoœæ!!!');
    ZmianaOLineEdit.SetFocus;
  end;
end;

procedure TPagesDlg.ZmianaStationEditExit(Sender: TObject);
begin
  try
    KopiaPar.ZmianaStation := StrToFloat(Trim(ZmianaStationEdit.Text));
  except
    ShowMessage('B³êdna wartoœæ!!!');
    ZmianaStationEdit.SetFocus;
  end;
end;

procedure TPagesDlg.ZmianaOStationEditExit(Sender: TObject);
begin
  try
    KopiaPar.ZmianaOStation := StrToFloat(Trim(ZmianaOStationEdit.Text));
  except
    ShowMessage('B³êdna wartoœæ!!!');
    ZmianaOStationEdit.SetFocus;
  end;
end;

procedure TPagesDlg.ZrodloRadioGroupClick(Sender: TObject);
begin
  if ZrodloRadioGroup.Items[ZrodloRadioGroup.ItemIndex] = 'Dynamit'
  then
  begin                                  //       DYNAMIT
    KopiaPar.Zrodlo :=  DYNAMIT;
    UstawOpcjeNaDynamit;
  end else
  if ZrodloRadioGroup.ItemIndex = WIBRATOR  then
  begin
    KopiaPar.Zrodlo :=  WIBRATOR;
    UstawOpcjeNaWibrator;
  end else ShowMessage('Nieznane Ÿród³o');
  if CzyPomieszaneRodzajeZrodel then ShowMessage('Uwaga zdefiniowano ró¿ne indeksy Ÿróde³');

end;

procedure TPagesDlg.AparaturaRadioGroupClick(Sender: TObject);
begin
  if AparaturaRadioGroup.ItemIndex = IO2 then
  begin
    KopiaPar.Aparatura := IO2;
  end
  else
  if AparaturaRadioGroup.ItemIndex = IO2000 then
  begin
    KopiaPar.Aparatura := IO2000;
  end
  else ShowMessage('Niezdefiniowana aparatura');
end;


procedure TPagesDlg.MaxDephMaskEditExit(Sender: TObject);
begin
  try
    KopiaPar.MaxDeph := StrToFloat(Trim(MaxDephMaskEdit.Text));
  except
    ShowMessage('B³êdna wartoœæ!!!');
    MaxDephMaskEdit.SetFocus;
  end;
end;

procedure TPagesDlg.MinDephMaskEditExit(Sender: TObject);
begin
  try
    KopiaPar.MinDeph := StrToFloat(Trim(MinDephMaskEdit.Text));
  except
    ShowMessage('B³êdna wartoœæ!!!');
    MinDephMaskEdit.SetFocus;
  end;
end;

procedure TPagesDlg.DatumMaskEditExit(Sender: TObject);
begin
  try
    KopiaPar.Datum := StrToFloat(Trim(DatumMaskEdit.Text));
  except
    ShowMessage('B³êdna wartoœæ!!!');
    DatumMaskEdit.SetFocus;
  end;
end;

procedure TPagesDlg.DatumCheckCheckBoxClick(Sender: TObject);
begin
  if  DatumCheckCheckBox.Checked then
  begin
  DatumMaskEdit.Enabled := false ;
  KopiaPar.DatumCheck := false;
  end
  else
  begin
    DatumMaskEdit.Enabled := true;
    KopiaPar.DatumCheck := true;
  end;
end;



procedure TPagesDlg.MaxStatMaskEditExit(Sender: TObject);
begin
  try
    KopiaPar.MaxStat := StrToFloat(Trim(MaxStatMaskEdit.Text));
  except
    ShowMessage('B³êdna wartoœæ!!!');
    MaxStatMaskEdit.SetFocus;
  end;
end;



procedure TPagesDlg.MinStatEditExit(Sender: TObject);
begin
  try
    KopiaPar.MinStat := StrToFloat(Trim(MinStatEdit.Text));
  except
    ShowMessage('B³êdna wartoœæ!!!');
    MinStatEdit.SetFocus;
  end;
end;

function TPagesDlg.JestDynWIndeksach(wiersz :string):boolean;
begin
  if (Pos('E', wiersz) <> 0) or (Pos('e', wiersz) <> 0)
      then JestDynWIndeksach := true
      else JestDynWIndeksach := false;
end;

function TPagesDlg.JestWibWIndeksach(wiersz :string):boolean;
begin
  if (Pos('V', wiersz) <> 0) or (Pos('v', wiersz) <> 0)
      then JestWibWIndeksach := true
      else JestWibWIndeksach := false;
end;

procedure TPagesDlg.LegalIndexesEditExit(Sender: TObject);
begin
  if KopiaPar.MetodykaTest then
  begin
    if KopiaPar.Zrodlo = DYNAMIT then
    begin
      if not JestDynWIndeksach(LegalIndexesEdit.text) then
      ShowMessage('Brak indeksu "E" w dopuszczalnych indeksach');
    end
    else if  KopiaPar.Zrodlo = WIBRATOR then
    begin
      if not JestWibWIndeksach(LegalIndexesEdit.text) then
      begin
        ShowMessage('Brak indeksu "V" w dopuszczalnych indeksach')
      end;
    end else ShowMessage('Nieznane Ÿród³o!!!');
  end;
end;

procedure TPagesDlg.MaxElevEditExit(Sender: TObject);
begin
  try
    KopiaPar.MaxElev := StrToFloat(Trim(MaxElevEdit.Text));
  except
    ShowMessage('B³êdna wartoœæ!!!');
    MaxElevEdit.SetFocus;
  end;
end;

procedure TPagesDlg.MinElevEditExit(Sender: TObject);
begin
  try
    KopiaPar.MinElev := StrToFloat(Trim(MinElevEdit.Text));
  except
    ShowMessage('B³êdna wartoœæ!!!');
    MinElevEdit.SetFocus;
  end;
end;

procedure TPagesDlg.MaxOffsetEditExit(Sender: TObject);
begin
  try
    KopiaPar.MaxOffset := StrToFloat(Trim(MaxOffsetEdit.Text));
  except
    ShowMessage('B³êdna wartoœæ!!!');
    MaxOffsetEdit.SetFocus;
  end;
end;

procedure TPagesDlg.MaxActiveLinesMaskEditExit(Sender: TObject);
begin
  try
    KopiaPar.MaxActiveLines := StrToInt(Trim(MaxActiveLinesMaskEdit.Text));
  except
    ShowMessage('B³êdna wartoœæ!!!');
    MaxActiveLinesMaskEdit.SetFocus;
  end;
end;

procedure TPagesDlg.MinActivChanelEditExit(Sender: TObject);
begin
  try
    KopiaPar.MinActivChanel := StrToInt(Trim(MinActivChanelEdit.Text));
  except
    ShowMessage('B³êdna wartoœæ!!!');
    MinActivChanelEdit.SetFocus;
  end;
end;

procedure TPagesDlg.MetodykaTestCheckBoxClick(Sender: TObject);
begin
     KopiaPar.MetodykaTest := MetodykaTestCheckBox.Checked;
end;

procedure TPagesDlg.NumerGeodTestCheckBoxClick(Sender: TObject);
begin
     KopiaPar.NumerGeodTest := NumerGeodTestCheckBox.Checked;
end;


procedure TPagesDlg.DephTestCheckBoxClick(Sender: TObject);
begin
     KopiaPar.DephTest := DephTestCheckBox.Checked;
end;

procedure TPagesDlg.VSrTestCheckBoxClick(Sender: TObject);
begin
  KopiaPar.VSrTest := VSrTestCheckBox.Checked;
end;

procedure TPagesDlg.UpholeTestCheckBoxClick(Sender: TObject);
begin
     KopiaPar.UpholeTest := UpholeTestCheckBox.Checked;
end;

procedure TPagesDlg.CzasTestCheckBoxClick(Sender: TObject);
begin
     KopiaPar.CzasTest := CzasTestCheckBox.Checked;
end;

procedure TPagesDlg.GeodezjaTestCheckBoxClick(Sender: TObject);
begin
     KopiaPar.GeodezjaTest := GeodezjaTestCheckBox.Checked;
end;

procedure TPagesDlg.ZrodloTestCheckBoxClick(Sender: TObject);
begin
     KopiaPar.ZrodloTest := ZrodloTestCheckBox.Checked;
end;

procedure TPagesDlg.SkrajneTestCheckBoxClick(Sender: TObject);
begin
     KopiaPar.SkrajneTest := SkrajneTestCheckBox.Checked;
end;

procedure TPagesDlg.SkipyTestCheckBoxClick(Sender: TObject);
begin
     KopiaPar.SkipyTest := SkipyTestCheckBox.Checked;
end;

procedure TPagesDlg.MaxOffTestCheckBoxClick(Sender: TObject);
begin
     KopiaPar.MaxOffTest := MaxOffTestCheckBox.Checked;
end;

procedure TPagesDlg.SkokRecTestCheckBoxClick(Sender: TObject);
begin
     KopiaPar.SkokRecTest := SkokRecTestCheckBox.Checked;
end;

procedure TPagesDlg.SkokTapeTestCheckBoxClick(Sender: TObject);
begin
     KopiaPar.SkokTapeTest := SkokTapeTestCheckBox.Checked;
end;

procedure TPagesDlg.KolejnoscLiniiTestCheckBoxClick(Sender: TObject);
begin
     KopiaPar.KolejnoscLiniiTest := KolejnoscLiniiTestCheckBox.Checked;
end;

procedure TPagesDlg.BrakKanalowTestCheckBoxClick(Sender: TObject);
begin
     KopiaPar.BrakKanalowTest := BrakKanalowTestCheckBox.Checked;
     Perform(Mes_Odswierz,124, 1);
end;

procedure TPagesDlg.OdswiezForme(var Msg  :TMessage) ;
begin
  UstawOpcjeTestuWgZmienejLokalnej(@KopiaPar);
end;

procedure TPagesDlg.AparaturaRadioGroupExit(Sender: TObject);
begin
  AparaturaRadioGroupClick(Sender);
end;

procedure TPagesDlg.MinActiveLinesMaskEditExit(Sender: TObject);
begin
  try
    KopiaPar.MinActiveLines := StrToInt(Trim(MinActiveLinesMaskEdit.Text));
  except
    ShowMessage('B³êdna wartoœæ!!!');
    MinActiveLinesMaskEdit.SetFocus;
  end;
end;

procedure TPagesDlg.MetodykaTestCheckBoxExit(Sender: TObject);
begin
  MetodykaTestCheckBoxClick(Sender);
end;

procedure TPagesDlg.MetodykaTestCheckBoxKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  MetodykaTestCheckBoxClick(Sender);
end;

procedure TPagesDlg.NumerGeodTestCheckBoxExit(Sender: TObject);
begin
  NumerGeodTestCheckBoxClick(Sender);
end;

procedure TPagesDlg.NumerGeodTestCheckBoxKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
   NumerGeodTestCheckBoxClick(Sender);
end;

procedure TPagesDlg.DephTestCheckBoxKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  DephTestCheckBoxClick(Sender);
end;

procedure TPagesDlg.DephTestCheckBoxExit(Sender: TObject);
begin
  DephTestCheckBoxClick(Sender);
end;

procedure TPagesDlg.StatykaTestCheckBoxClick(Sender: TObject);
begin
  KopiaPar.MetodykaTest := MetodykaTestCheckBox.Checked;
end;

procedure TPagesDlg.StatykaTestCheckBoxEnter(Sender: TObject);
begin
  StatykaTestCheckBoxClick(Sender);
end;

procedure TPagesDlg.OdPalikaSEditExit(Sender: TObject);
begin
  try
    KopiaPar.OdPalikaS := StrToFloat(Trim(OdPalikaSEdit.Text));
  except
    ShowMessage('B³êdna wartoœæ!!!');
    OdPalikaSEdit.SetFocus;
  end;
end;

procedure TPagesDlg.OdPalikaSTestCheckBoxClick(Sender: TObject);
begin
  KopiaPar.OdPalikaSTest := OdPalikaSTestCheckBox.Checked;
end;

procedure TPagesDlg.OdPalikaSTestCheckBoxExit(Sender: TObject);
begin
  OdPalikaSTestCheckBoxClick(Sender);
end;


function TPagesDlg.TestElementuSkipu(Tekst :string) :boolean;
//Testuje, czy zapis jak poni¿ej jest prawid³owy
//1001,150,155; 1002,150,151
var     str1, str2, str3 :string;

begin
  if IleZnakow(',',Tekst) = 2 then
  begin
    str1 := Copy(Tekst, 1, Pos(',', Tekst) - 1); //Linia
    str3 := Copy(Tekst, Pos(',', Tekst) + 1, Length(Tekst));//Od pierwszego przecinka

    str2 := Copy(Str3, 1, Pos(',', str3)- 1); //Kana³ "Od"
    str3 := Copy(Str3, Pos(',', str3) + 1, Length(str3) - Pos(',', str3)); //Kana³ "Od"

    str3 := Trim(str3);
    str2 := Trim(str2);
    str1 := Trim(str1);

    if (str1 = '') or (str2 = '') or (str3 = '') then
    begin
      TestElementuSkipu := false;
      ShowMessage('Z³y format skipu');
      Exit;
    end   ;

    if (cyfr(str1) <> Length(str1)) or (cyfr(str2) <> Length(str2)) or (cyfr(str3) <> Length(str3))
    then
    begin
      TestElementuSkipu := false;
      ShowMessage('Z³y format skipu');
      Exit;
    end;

    try
      if StrToFloat(str2) >= StrToFloat(str3) then
      begin
        TestElementuSkipu := false;
        ShowMessage('Nieprawid³owo zdefiniowany skip');
        Exit;
      end
    except
      TestElementuSkipu := false;
      ShowMessage('Nieprawid³owe zapis liczby');
      Exit;
    end

  end else
  begin
    TestElementuSkipu := false;
    ShowMessage('Z³y format skipu');
    Exit;
  end;
  TestElementuSkipu := True;
end;



procedure TPagesDlg.SkipEditExit(Sender: TObject);
var Licznik :integer;

function TestPoprawnosciWierszaSkipu(Tekst :string):boolean;
begin
  if Length(Tekst) = 0 then
  begin
    TestPoprawnosciWierszaSkipu := false;
    Exit;
  end;

  if Pos(';',Trim(Tekst)) = Length(Tekst) then
  begin
    TestPoprawnosciWierszaSkipu := false ;
    Exit;
  end;


  TestPoprawnosciWierszaSkipu := true;
end;


function IleElementowSkipu(Tekst :string) :integer;
begin
  if ileZnakow(';', Tekst) = 0 then //1 element lub zero
     begin
       if ileZnakow(',', Tekst) = 2 then
       begin
         IleElementowSkipu := 1;
       end else IleElementowSkipu := -1;
     end
     else IleElementowSkipu := ileZnakow(';', Tekst) + 1;
end;


function DajElementSkipu(Tekst :string; Numer :byte) :string;
var i    :byte;
    licz :byte;
    tmp  :string;

begin
  tmp := '';

  if not TestPoprawnosciWierszaSkipu(Tekst) then
  begin
    ShowMessage('Nieprawid³owy format skipu');
    Tekst := '';
    Exit;
  end;

  if IleElementowSkipu(tekst) = 0
  then
  begin
    ShowMessage('Nie zadeklarowano skipów');
    Tekst := '';
    Exit;
  end;

  licz := 0; i := 1;

  if Length(tekst) <= 255 then
  begin
    while (licz <> Numer) and (i <= Length(tekst)) do
    begin
      tmp := '';
      while Tekst[i] <> ';' do      //1001,101,103;1001,120,131
      begin
        tmp := tmp + tekst[i];
        inc(i);  // ***************
      end;
      inc(licz);
    end;
  end
  else
  begin
    Exception.Create('Wiersz opisuj¹cy skipy nie powinien zawieraæ wiêcej ni¿ 255 znaków');
  end;

  DajElementSkipu := tmp;
end;

begin
  if Trim(SkipEdit.Text) <> '' then
  begin
  if TestPoprawnosciWierszaSkipu(SkipEdit.Text) then
  begin
    if IleElementowSkipu( SkipEdit.Text) <> 0 then
    begin
      for Licznik := 1 to  IleElementowSkipu( SkipEdit.Text) do
      begin
        if not TestElementuSkipu(DajElementSkipu(SkipEdit.Text, Licznik)) then
        begin
          SkipEdit.SetFocus;
        end;
      end;
    end;
  end else
  begin
    ShowMessage('Nieprawid³owa struktura wiersza');
    SkipEdit.SetFocus;
  end;

  end; //Trima
end;


procedure TPagesDlg.ComboBox1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);

var str    :string;
begin

  if Key = 45 then
  begin
    FormaSkipow.ShowModal;   //ComboBox1.Items.Add(ComboBox1.Text)
    FormaSkipow.Caption := 'Dodaj skip';

    if FormaSkipow.ModalResult = mrOK then
       begin
         Str := Trim(FormaSkipow.Edit1.Text) + ',' +
                             Trim(FormaSkipow.Edit2.Text) + ',' +
                             Trim(FormaSkipow.Edit3.Text);

         if Str <> '' then ComboBox1.Items.Add(str);
       end
    else    
  end
  else ComboBox1.Items.Add(ComboBox1.Text);


  //45-Insert, 46-Delete
end;

procedure TPagesDlg.EastingExit(Sender: TObject);
begin
  try
  KopiaPar.Eastingowa := StrToFloat(Trim(Easting.Text));
  except
    ShowMessage('B³êdna wartoœæ!!!');
    Easting.SetFocus;
  end;
end;

procedure TPagesDlg.NorthingExit(Sender: TObject);
begin
  try
  KopiaPar.Northingowa := StrToFloat(Trim(Northing.Text));
  except
    ShowMessage('B³êdna wartoœæ!!!');
    Easting.SetFocus;
  end;
end;

end.

