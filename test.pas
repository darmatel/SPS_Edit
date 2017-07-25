unit test;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, ExtCtrls, StdCtrls, Buttons, Db, DBTables, Grids, DBGrids,
  Menus,Pomoc, ToolWin, DBCtrls,Printers, variants, ImgList;

type

  TFormaMain = class(TForm)
    Panel1: TPanel;
    TabControl1: TTabControl;
    DataSource1: TDataSource;
    DataSource2: TDataSource;
    OpenDialog1: TOpenDialog;
    Panel2: TPanel;
    Baza: TDatabase;
    XPopupMenu: TPopupMenu;
    UsunRec: TMenuItem;
    SortujQuery: TQuery;
    MainMenu1: TMainMenu;
    PlikMenu: TMenuItem;
    OtworzSPSMenu: TMenuItem;
    ZapiszSPSMenu: TMenuItem;
    DolaczSPSMenu: TMenuItem;
    N1: TMenuItem;
    ZakonczMenu: TMenuItem;
    Edycja1: TMenuItem;
    SzukajMenu: TMenuItem;
    ZamienMenu: TMenuItem;                     
    UsunMenu: TMenuItem;
    Narzdzia1: TMenuItem;
    OpcjeProgramu: TMenuItem;
    EdytorSPS: TPageControl;
    SSPS: TTabSheet;
    DBGrid1: TDBGrid;
    XSPS: TTabSheet;
    DBGrid2: TDBGrid;
    TabelaS: TTable;
    TabelaX: TTable;
    EksportSPSMenu: TMenuItem;
    ZamienIndeksyMenu: TMenuItem;
    TestujSPSMenu: TMenuItem;
    N2: TMenuItem;
    WyczyscBazeMenu: TMenuItem;
    N3: TMenuItem;
    EdytorTabSheet: TTabSheet;
    WstawKolumneMenu: TMenuItem;
    SaveDialog1: TSaveDialog;
    SaveDialog2: TSaveDialog;
    SPopupMenu: TPopupMenu;
    Edytor: TRichEdit;
    UsunS: TMenuItem;
    WstawKolumneS: TMenuItem;
    EksportS: TMenuItem;
    EksportX: TMenuItem;
    ToolBar1: TToolBar;
    ToolButtonOtworz: TToolButton;
    ToolButtonSave: TToolButton;
    ImageList1: TImageList;
    RTabsheet: TTabSheet;
    TabelaR: TTable;
    DataSource3: TDataSource;
    DBGrid3: TDBGrid;
    ToolButtonErase: TToolButton;
    TabelaRILE_SZT: TFloatField;
    TabelaRIDENT_S: TStringField;
    TabelaRLINE: TFloatField;
    TabelaRSTATION: TFloatField;
    TabelaRKTORY_RAZ: TStringField;
    TabelaRKOD_ODB: TStringField;
    TabelaRDEPH: TFloatField;
    TabelaRUPHOLE: TFloatField;
    TabelaRDATUM: TFloatField;
    TabelaRSTATYKA: TFloatField;
    TabelaRWATER: TFloatField;
    TabelaREASTING: TFloatField;
    TabelaRNORTHING: TFloatField;
    TabelaRELEW: TFloatField;
    TabelaRDAY: TFloatField;
    TabelaRTIME: TFloatField;
    WczytajMenu: TMenuItem;
    StatusBar1: TStatusBar;
    PopupMenu1: TPopupMenu;
    SzukajRPopup: TMenuItem;
    UsunRPopup: TMenuItem;
    WstawRPopup: TMenuItem;
    FindDialog1: TFindDialog;
    Query1: TQuery;
    TabelaXIND: TFloatField;
    TabelaXILE_SZT: TFloatField;
    TabelaXX: TStringField;
    TabelaXTASMA: TFloatField;
    TabelaXREKORD: TFloatField;
    TabelaXLINE: TFloatField;
    TabelaXSTATION: TFloatField;
    TabelaXOD: TFloatField;
    TabelaXDO: TFloatField;
    TabelaXLINIA: TFloatField;
    TabelaXSKAD: TFloatField;
    TabelaXDOKAD: TFloatField;
    TabelaXNUMERACJA: TSmallintField;
    TabelaXAPARATURA: TStringField;
    TabelaXKTORY_RAZ: TStringField;
    TabelaXINDEKS_ODB: TStringField;
    TabelaXKROK_KAN: TSmallintField;
    ToolButtonNew: TToolButton;
    ToolButtonSearch: TToolButton;
    Scalpliki1: TMenuItem;
    TabelaSIND: TFloatField;
    TabelaSILE_SZT: TFloatField;
    TabelaSIDENT_S: TStringField;
    TabelaSLINE: TFloatField;
    TabelaSSTATION: TFloatField;
    TabelaSKTORY_RAZ: TStringField;
    TabelaSKOD_ZRODLA: TStringField;
    TabelaSDEPH: TFloatField;
    TabelaSUPHOLE: TFloatField;
    TabelaSDATUM: TSmallintField;
    TabelaSSTATYKA: TSmallintField;
    TabelaSWATER: TFloatField;
    TabelaSEASTING: TFloatField;
    TabelaSNORTHING: TFloatField;
    TabelaSELEW: TFloatField;
    TabelaSDAY: TSmallintField;
    TabelaSREZERWA: TFloatField;
    TabelaSTIME: TFloatField;
    N4: TMenuItem;
    Label1: TLabel;
    LOGSheet: TTabSheet;
    LOG: TRichEdit;
    KontrolaEdycjiItem: TMenuItem;
    AktualizujGeodezje: TMenuItem;
    UsunLinieZX: TMenuItem;
    Wstawliniodbioru1: TMenuItem;
    Testuj1: TMenuItem;
    PrinterSetupDialog1: TPrinterSetupDialog;
    PrintDialog1: TPrintDialog;
    Drukuj1: TMenuItem;
    Opcjewydruku1: TMenuItem;
    ZamieLINESTATION1: TMenuItem;
    FiltrBazy: TEdit;
    ZastosujFiltrButton: TButton;
    WyczyscFiltrButton: TButton;
    Button1: TButton;
    CheckBox1: TCheckBox;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure DBGrid2KeyPress(Sender: TObject; var Key: Char);
    procedure DBGrid2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure OtworzSPSMenuClick(Sender: TObject);
    procedure EksportSPSMenuClick(Sender: TObject);
    procedure ZakonczMenuClick(Sender: TObject);
    procedure SzukajMenuClick(Sender: TObject);
    procedure WyczyscBazeMenuClick(Sender: TObject);
    procedure WstawKolumneMenuClick(Sender: TObject);
    procedure UsunMenuClick(Sender: TObject);
    procedure ZamienIndeksyMenuClick(Sender: TObject);
    procedure ZamienMenuClick(Sender: TObject);
    procedure UsunSClick(Sender: TObject);
    procedure UsunRecClick(Sender: TObject);
    procedure EksportSClick(Sender: TObject);
    procedure ToolButtonOtworzClick(Sender: TObject);
    procedure WstawKolumneSClick(Sender: TObject);
    procedure EksportXClick(Sender: TObject);
    procedure DolaczSPSMenuClick(Sender: TObject);
    procedure ToolButtonSaveClick(Sender: TObject);
    procedure ToolButtonEraseClick(Sender: TObject);
    procedure TabelaSAfterScroll(DataSet: TDataSet);
    procedure TabelaSAfterDelete(DataSet: TDataSet);
    procedure TabelaSAfterInsert(DataSet: TDataSet);
    procedure ZapiszSPSMenuClick(Sender: TObject);
    procedure WczytajMenuClick(Sender: TObject);
    procedure SzukajRPopupClick(Sender: TObject);
    procedure MyOnException(Sender: TObject; E: Exception);
    procedure ToolButtonSearchClick(Sender: TObject);
    procedure FindDialog1Find(Sender: TObject);
    procedure Scalpliki1Click(Sender: TObject);
    procedure TestujSPSMenuClick(Sender: TObject);
    procedure TabelaSIDENT_SValidate(Sender: TField);
    procedure TabelaSDAYValidate(Sender: TField);
    procedure TabelaSTIMEValidate(Sender: TField);
    procedure TabelaSKOD_ZRODLAValidate(Sender: TField);
    procedure TabelaSUPHOLEValidate(Sender: TField);
    procedure TabelaSWATERValidate(Sender: TField);
    procedure TabelaSDEPHValidate(Sender: TField);
    procedure TabelaSDATUMValidate(Sender: TField);
    procedure TabelaSSTATYKAValidate(Sender: TField);
    procedure TabelaSEASTINGValidate(Sender: TField);
    procedure TabelaSNORTHINGValidate(Sender: TField);
    procedure TabelaSELEWValidate(Sender: TField);
    procedure KontrolaEdycjiItemClick(Sender: TObject);
    procedure AktualizujGeodezjeClick(Sender: TObject);
    procedure UsunLinieZXClick(Sender: TObject);
    procedure Testuj1Click(Sender: TObject);
    procedure Drukuj1Click(Sender: TObject);
    procedure EdytorSPSChange(Sender: TObject);
    procedure Opcjewydruku1Click(Sender: TObject);
    procedure ZamieLINESTATION1Click(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure WyczyscFiltrButtonClick(Sender: TObject);
    procedure ZastosujFiltrButtonClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);

  private
    INDEKS_ILE_SZT                  :real;
    CanRecNaPanel                   :boolean;  //Mo¿na wyœwietlaæ na panelu
    CanIlRecNaPanel                 :boolean;  //Mo¿na wyœwietlaæ na panelu
  protected
    jest_rozlaczone                      :boolean;

    { Private declarations }
  public

  function TEST_INTEGRALNOSCI_SPS(nazwa_S, nazwa_X, nazwa_R :string) :boolean;

//  procedure ZaladujSPS;  {komplet *.S *.X}

  procedure ZapiszTabeleXDoPlikuTmp(NazwaPliku :string);
  procedure ZapiszTabeleSDoPlikuTmp(NazwaPliku :string);
  procedure ZapiszKopieSDoPlikuTmp(NazwaPliku :string);
  procedure ZapiszKopieRDoPlikuTmp(NazwaPliku :string);
  procedure ZapiszKopieXDoPlikuTmp(NazwaPliku :string);

  procedure LadujSSPS(nazwa_pliku :string);
  procedure LadujXSPS(nazwa_pliku :string);
  procedure LadujRSPS(nazwa_pliku :string);

  procedure ExportXSPS(nazwa_pliku :string);
  procedure ExportSPSS(nazwa_pliku :string);
  procedure ExportRSPS(nazwa_pliku :string);
  Function UstawNaPierwszyWierszRekordu(const Rekord_szukany :real) :boolean;
  function UstawNaIndeksS(Indeks :variant) :boolean; //Ustawia aktywny wiersz S o indeksie Indeks
  function UstawNaIndeksX(Indeks :variant) :boolean; //Ustawia aktywny wiersz X o indeksie Indeks

  function CzyJestPS(const Linia, stacja :real; raz  :string):boolean; //Sprawdza istnienie numeru PS. Gry Raz = '', to nie interesuje go indeks
  function ZnajdzWgPS(linia, stacja :real; ktory_razik:char) :boolean; //przesuwa kursor
  function ZnajdzILE_SZT_WgRec(szukaj_rec :real):boolean; //przesuwa kursor
  function ZnajdzILE_SZT_WgNumeru(const linia, stacja :real; ktory_raz :char):boolean; //przesuwa kursor
  function ZnajdzSWgIndeksu(indeks :real):boolean; //przesuwa kursor maj¹c indeks
  function ZnajdzXWgIndeksu(indeks :real):boolean; //przesuwa kursor maj¹c indeks
  function ZnajdzILE_SZTWgRecX(Rekord :real) :real;//wynikiem jest INDEKS_ILE_SZT nie przesuwa kursora
  procedure SzukWgPS(wiersz :string); //Ustawia na szukany rekord+usawia zm. globaln¹ INDEKS_ILE_SZT
  procedure SzukWgRec(wiersz :string);//Ustawia na szukany rekord+usawia zm. globaln¹ INDEKS_ILE_SZT

  procedure UpdateNumeruPS; //G³ówna procedura
  procedure ZmienNrAktywnego_S(linia, stacja :real; raz :char); //Ju¿ znalezione. Teraz zamiana!!!
  procedure ZmienNrAktywnego_X(linia, stacja :real; raz :char); //Ju¿ znalezione. Teraz zamiana!!!

  function UsunWgPSS(const linia, stacja :real; const indeks :char ) :boolean;
  function UsunWgPSX(const linia, stacja :real; const indeks :char ) :boolean;
  function UsunWgRecX(const Rekord_real :real) :boolean;
  procedure KasujOdIndeksuDoIndeksuS(OD_IND, DO_IND :real); //Kasuje w zakresie indeksow. Pierwszy rekord musi byæ aktywny
  procedure KasujOdIndeksuDoIndeksuX(OD_IND, DO_IND :real); //Kasuje w zakresie indeksow. Pierwszy rekord musi byæ aktywny
  procedure UsunRekordyWZakresieIndeksowSX(pierszy_indeks, ostatni_indeks :real) ;//Nie musz¹ byæ aktywne
  procedure Usun;
  Procedure UsunZnalezionyNrRec(numer :real);  //Usuwa aktywny rekord
  function UsunAktywnaLinieOdbioruNaRozstawie(numer_wiersza :real):boolean;
  Procedure UsunXZnalezionyOdRecDo(numerOd, numerDo :real);


  procedure PodstwGeodezje(const MnoznikL, MnoznikS :string);
  procedure TranslujGeodezjeDoBIN(NazwaPlikuWE, NazwaPlikuWY :string);
  function ZnajdzGeodezjeWBIN(NazwaPliku :string;  Linia, Stacja :real; var wynik_k :Dane5Reali):boolean;
  function TranslateToXYZ(jaki, na_jaki, kolumne :string):boolean;
  // Przekszta³ca plik "jaki" na "na_jaki" do postaci binarnej. Pierwsza i druga kolumna oraz dowolna "kolumna"
  procedure AktualizujGeodezjeR;
  procedure AktualizujGeodezjeS;

  function TestPoprawnosciNumeru(wiersz :string) :boolean;
  function Justuj(linia:string; ile_wszystkiego :byte; wyrownaj:strony;
           wypelnienie: char):string;
  function FormujUlamek(wiersz :string; po_punkcie :byte):string;
  function Pomnoz_znaki(ile :byte; jaki :char):string;

  procedure KasujTabele;
  procedure RozlaczTabele;
  procedure PolaczTabele;

  function  UstalParamEksportu :boolean;
  procedure WeryfikujParametryEksportu;


  procedure KopiujBazeDanych;
  procedure OdzyskajBazeDanych;

  function ExtractFileNameOnly(nazwa_pliku :string) :string;
  procedure BiezacyRecNaPanel;
  procedure IloscRecNaPanel;
  procedure WypelnijLOG(komunikat :string); //Wpisuje wiersz komunikatu do zak³adki LOG
  procedure WypiszTytol(Komunikat :string);  //Wypisuje komunikat na pasku tytu³owym aplikacji
  procedure AktywujDrukowanie(Sender: TObject);   //Analizuje, czy w menu mo¿na wybraæ drukowanie

  procedure TestujX;
  procedure KopiaToWierszX(Kopia  :PKopiaX);              //Przypisuje aktualnemu wierszowi X wartoœci z "Kopia"
  procedure KopiujXDoZmiennej(WierszXToKopia :PKopiaX);  //Kpiuje wiersz X do zmiennej (do obrazu wiersza)
  procedure XLineToXSPSLine(TabelaX :TTable; wskaz : Pxsps_line) ;       //  PTemp_next=^xsps_line. Wiersz tabeliX -> xsps_line
  procedure XSPSLineToXLine(Wskaz :Pxsps_line);  // Przypisuje  xsps_line - wiersza tabeli (indeksy siê nie zmieniaj¹)
  procedure SSPSLineToSLine(Wskaz :Pssps_line);// ssps_line -> wiersz
  procedure SLineToSSPSLine(Wskaz :Pssps_line) ;    //ssps_line -> wiersz S
  function IleNumerowPowtorzonych(linia, stacja :real) :word;
  procedure MaxMinKanaly;
  //okresla, czy istnieje PS, ktory nie jest na miejscu 'ile_szt'. Je¿eli raz = '', ignoruje go

  end;

var
  FormaMain: TFormaMain;
  NazwaPlikuEksportowanegoS :TFileName;
  NazwaPlikuEksportowanegoX :TFileName;
  NazwaPlikuEksportowanegoR :TFileName;

  NazwaPlikuOtwartegoS :TFileName;
  NazwaPlikuOtwartegoX :TFileName;
  NazwaPlikuOtwartegoR :TFileName;

  NazwaPlikuTmp_X      :TFileName;


  LastS_Ext                 :String;
  LastS_Dir                 :String;
  LastS_Name,LastX_Name     :String;

  ApplicationPath,
  LastOpendS,
  LastOpendX,
  LastOpendR,
  LastExportedS,
  LastExportedX,
  LastExportedR             :string;

implementation

uses Dialogi, Szukaj, ParamEksp, Indeksy,Registry, geofizyk,FilterForma,
     ComboOrazOKCancel, Otworz, Check, Scalaj, Parametry ;


var

     t                                 :string;
     parametry_eksportu                :dane_eksportowe;
     Wyprowadz                         :TParametryEksportu;
     PlikS,PlikX, PlikR                :TFileName; //Wykorzystywane w procedurze testowej

const PLIK_SURV_TMP =  'CelSurv.tmp';
      Nazwa_STmp    =  'c:\S1299.tmp';
      Nazwa_XTmp    =  'c:\X1299.tmp';

const TEST_FILE_S        =  'chkS.tmp';
      TEST_FILE_X        =  'chkX.tmp';
      TEST_FILE_R        =  'chkR.tmp';

{$R *.DFM}

procedure TFormaMain.KasujTabele;
begin
 if TabelaS.CanModify and TabelaX.CanModify and TabelaR.CanModify and
    (Application.MessageBox('Wszystkie dane znajduj¹ce siê w bazie zostan¹ utracone!',
   'Kasowanie bazy danych',  mb_ICONHAND or MB_OKCANCEL) = IDOK)
 then
 begin
   RozlaczTabele;
   try
     if TabelaX.Active = false then TabelaX.Active := true;
     if TabelaS.Active =false then TabelaS.Active := true;
     if TabelaR.Active =false then TabelaR.Active := true;

     if TabelaS.RecordCount <> 0 then
     begin
       TabelaS.Active := false;
       tabelaS.EmptyTable;
       tabelaS.Open;
     end;

     if TabelaX.RecordCount <> 0 then
     begin
       TabelaX.Active := false;
       tabelaX.EmptyTable;
       tabelaX.Open;
     end;

     if TabelaR.RecordCount <> 0 then
     begin
       TabelaR.Active := false;
       tabelaR.EmptyTable;
       tabelaR.Open;
     end;

   PolaczTabele;
   except
     if TabelaX.Active = false then tabelaX.Open;
     if TabelaS.Active = false then tabelaS.Open;
     if TabelaR.Active = false then tabelaR.Open;

     PolaczTabele;
     Application.MessageBox('Czyszczenie bazy nie powiod³o siê', 'B³¹d czyszczenia', mb_ICONHAND or mb_OK);
   end; {traja}
 end;

end;


procedure TFormaMain.LadujSSPS(nazwa_pliku :string);
var f: file of ssps_line;
    i: Longint;
    linia_sps :ssps_line;

begin
  kontrola_poprawnosci := false; //test tylko na ¿¹danie + klawiatura.

  DecimalSeparator:='.';
  TabelaS.DisableControls;
  t := nazwa_pliku;

  AssignFile(f,nazwa_pliku);
  Reset(f);
  TabelaS.Open;
  if TabelaS.RecordCount <> 0 then
  begin
    TabelaS.Last;
    i := TabelaS['ile_szt'] + 1;
  end else i:=1;

  while not EOF(f) do
      begin
       LastOpendS := nazwa_pliku; {do rejestru}
//       PominHeader;
       Read(f,linia_sps);
       TabelaS.Insert;
       TabelaS['ind']:=i;
       TabelaS['ile_szt']:=i;
       TabelaS['rezerwa'] := 0;
       TabelaS['ident_s']:= linia_sps.identyfikator;
       TabelaS['line']:= linia_sps.linia;
       TabelaS['station']:=linia_sps.punkt;
       TabelaS['ktory_raz']:=linia_sps.indeks;
       TabelaS['kod_zrodla']:=linia_sps.kod_pkt;
       TabelaS['deph']:=linia_sps.deph;
       TabelaS['uphole']:=linia_sps.uphole;     {Tu}
       TabelaS['datum']:=linia_sps.datum;
       TabelaS['statyka']:=linia_sps.statyka;
       TabelaS['water'] := linia_sps.water;
       TabelaS['easting']:=linia_sps.x;
       TabelaS['northing']:=linia_sps.y;
       TabelaS['elew']:=linia_sps.elewacja;
       TabelaS['day']:=linia_sps.dzien;
       TabelaS['time']:=linia_sps.czas;
       TabelaS.Post;  {wpisuje rzeczywiscie, zatwierdza}
       i:=i+1;
      end;
  CloseFile(f);
  TabelaS.Refresh;
  TabelaS.EnableControls;
  kontrola_poprawnosci := true; //test tylko na ¿¹danie + klawiatura.
end; {S SPS}



procedure TFormaMain.LadujRSPS(nazwa_pliku :string);
var f: file of ssps_line;
    i: Longint;
    linia_sps :ssps_line;

procedure PominHeader;
begin
//  while (s[1] = 'H') do   Readln(f,s);
end;

begin
  DecimalSeparator:='.';
  begin
    TabelaR.DisableControls;
    kontrola_poprawnosci := false; //test tylko na ¿¹danie + klawiatura.
    AssignFile(f,Nazwa_Pliku);
    Reset(f);
    TabelaR.Open;
    i:=1;
    while not EOF(f) do
      begin
       Read(f,linia_sps);
//       PominHeader;
       LastOpendR := nazwa_pliku;
//       translate_rline(s, linia_sps);
       TabelaR.Insert;
       TabelaR['ile_szt']:=i;
       TabelaR['ident_s']:= linia_sps.identyfikator;
       TabelaR['line']:= linia_sps.linia;
       TabelaR['station']:=linia_sps.punkt;
       TabelaR['ktory_raz']:=linia_sps.indeks;
       TabelaR['kod_odb']:=linia_sps.kod_pkt;
       TabelaR['deph']:=linia_sps.deph;
       TabelaR['uphole']:=linia_sps.uphole;     {Tu}
       TabelaR['datum']:=linia_sps.datum;
       TabelaR['statyka']:=linia_sps.statyka;
       TabelaR['water'] := linia_sps.water;
       TabelaR['easting']:=linia_sps.x;
       TabelaR['northing']:=linia_sps.y;
       TabelaR['elew']:=linia_sps.elewacja;
       TabelaR['day']:=linia_sps.dzien;
       TabelaR['time']:=linia_sps.czas;
       TabelaR.Post;  {wpisuje rzeczywiscie, zatwierdza}
       i:=i+1;
      end;
      CloseFile(f);
  end;
  TabelaR.EnableControls;
  kontrola_poprawnosci := true; //test tylko na ¿¹danie + klawiatura.
end; {S SPS}


procedure TFormaMain.LadujXSPS(nazwa_pliku :string);
var f: file of xsps_line;
    i: Longint;
    temp_xsps :xsps_line;
    last_rec  :longint;
    Last_Line,
    Last_stat :real;
    Last_Char :string;
    new_rec   :longint;
    licznikRec:longint;


begin
  DecimalSeparator:='.';
  kontrola_poprawnosci := false; //test tylko na ¿¹danie + klawiatura.
  TabelaX.DisableControls;
  AssignFile(f,nazwa_pliku);
  Reset(f);
  LastOpendX := nazwa_pliku;

  TabelaX.Open;
  if TabelaX.RecordCount <> 0 then
  begin
    TabelaX.Last;
    Last_rec := TabelaX['rekord'];
    Last_Line := TabelaX['Line'];
    Last_Stat := TabelaX['Station'];
    Last_Char := TabelaX['Ktory_raz'];
    LicznikRec := TabelaX['ile_szt'];
    i := TabelaX['ind'];
  end else
  begin
    last_rec := 0;
    Last_Line := 0;
    Last_Stat  := 0;
    Last_Char :=  '';
    licznikRec := 0;
    i:=1;
  end;

  while not EOF(f) do
      begin
        Read(f,temp_xsps);
        TabelaX.Insert;

        new_rec := temp_xsps.rekord;
        if (last_rec <> new_rec) or (Last_Line <> temp_xsps.linia) or
        (Last_Stat <> temp_xsps.punkt) or (Last_char <> temp_xsps.indeks)  then
        begin
          inc(licznikRec) ;
          TabelaX['rekord']:= temp_xsps.rekord;
        end  else
        begin
          licznikRec := licznikRec;
          TabelaX['rekord']:= temp_xsps.rekord;
        end;
        Last_Line := temp_xsps.linia;
        Last_Stat  := temp_xsps.punkt;
        Last_Char :=  temp_xsps.indeks;
        last_rec := new_rec;
        with TabelaX do
        begin
          FieldByName('ile_szt').AsFloat := licznikRec;
          FieldByName('ind').AsFloat      := i;
          FieldByName('X').AsString      := temp_xsps.identyfikator;
          FieldByName('tasma').AsInteger := temp_xsps.tasma;
          FieldByName('rekord').AsFloat := temp_xsps.rekord;
          FieldByName('numeracja').AsInteger := temp_xsps.numeracja;
          FieldByName('aparatura').AsString := temp_xsps.aparatura;
          FieldByName('line').AsFloat := temp_xsps.linia;
          FieldByName('station').AsFloat := temp_xsps.punkt;
          FieldByName('ktory_raz').AsString := temp_xsps.indeks;
          FieldByName('od').AsFloat := temp_xsps.od_kanalu;
          FieldByName('do').AsFloat := temp_xsps.do_kanalu;
          FieldByName('Krok_kan').AsInteger := temp_xsps.step_chan;
          FieldByName('Linia').AsFloat := temp_xsps.linia_odb;
          FieldByName('skad').AsFloat := temp_xsps.od_odbior;
          FieldByName('dokad').AsFloat := temp_xsps.do_odbior;
          FieldByName('indeks_odb').AsString := temp_xsps.indeks_odb;
       end;
       TabelaX.Post;
       i:=i+1;
      end;
  CloseFile(f);
  TabelaX.EnableControls;
  kontrola_poprawnosci := true; //test tylko na ¿¹danie + klawiatura.
end; {£adowanie sps-ów}



procedure TFormaMain.FormClose(Sender: TObject; var Action: TCloseAction);
procedure ZapodajDoRejestru;
var Reg               :TRegistry;
    WynikOtwarcia     :boolean;
var klawisz :integer;

begin
  Reg := TRegistry.Create;
  try
    WynikOtwarcia := Reg.OpenKey('Software\Soft_Era\SPS_Edit',False);
    if WynikOtwarcia
    then
    begin
      Reg.WriteInteger('FormaTop', FormaMain.Top) ;
      Reg.WriteInteger('FormaLeft',FormaMain.Left) ;
      Reg.WriteInteger('FormaWidth',FormaMain.Width);
      Reg.WriteInteger('FormaHigh',FormaMain.Height) ;
      Reg.WriteString('LastSName',LastOpendS);
      Reg.WriteString('LastXName',LastOpendX) ;
      Reg.WriteString('LastRName',LastOpendR) ;
      Reg.WriteString('LastExportedS',LastExportedS) ;
      Reg.WriteString('LastExportedX',LastExportedX)  ;
      Reg.WriteString('LastExportedR',LastExportedR)  ;
    end;
  finally
    Reg.Free;
  end;

  If TabelaS.Modified or TabelaX.Modified then
  if TabelaS.Active = true then TabelaS.close;
  if TabelaX.Active = true then TabelaX.close;

  if Edytor.Modified or (Edytor.Lines.Count > 0) then
  begin
    klawisz := Application.MessageBox('Czy zapisaæ zawartoœæ edytora?',
      'Kasowanie bazy danych',  mb_ICONHAND or MB_YESNOCANCEL);
    if klawisz = IDYES
    then
    begin
      SaveDialog1.Title := 'Zapisz plik';
      if SaveDialog1.Execute then
      begin
        Edytor.Lines.SaveToFile(SaveDialog1.FileName);
        Edytor.Clear;
      end
    end else //Anuluj
    begin
      if klawisz = IDNO   then Edytor.Clear;
      if klawisz = IDCANCEL   then
      begin
        EdytorSPS.ActivePage := EdytorTabSheet;
        Abort;
      end;
    end;
  end;

end;  {Zapodaj}


procedure ZamknijLOG;
var klik  :integer;
begin
  if LOG.Lines.Count <> 0 then
  begin
    klik := Application.MessageBox('Zak³adka LOG posiada tekst. Czy chcesz go wydrukowaæ?', '',
            mb_ICONHAND or MB_YESNOCANCEL);
    if klik = IDOK then
    begin
      Sender := LOGSheet;
      Drukuj1Click(Sender) ;
    end else
    IF klik = IDNO then
    begin
      LOG.Lines.Clear;
    end
    else
    if klik = IDCANCEL then abort;
  end;
end;

begin
  if TabelaS.Modified or TabelaX.Modified then
  begin
    if MessageDlg('W bazie zasz³y zmiany. Czy zachowac je?',
                  mtConfirmation, mbYesNoCancel, 0) = mrYes
    then
    begin
      if TabelaS.Active = true then TabelaS.close;
      if TabelaX.Active = true then TabelaX.close;
    end;
  end;

  ZapodajDoRejestru;
  ZamknijLOG;
  Param.Free;
  //KopiaPar.Free;  Powoduje powa¿ne b³êdy
end;



procedure TFormaMain.FormCreate(Sender: TObject);

procedure InicjujListeZrodel;
var tempek  :integer;
begin
  DBGrid1.Columns[4].PickList.Clear;
  for tempek := 0 to ilosc_znakow(',', Param.LegalIndexes)
  do
  begin
        DBGrid1.Columns[4].PickList.Add(Pobierz_element(Param.LegalIndexes, tempek +1));
  end;
end;


procedure ZapodajZRejestru;
var Reg               :TRegistry;
    WynikOtwarcia     :boolean;
begin
  Reg := TRegistry.Create;
  try
    WynikOtwarcia := Reg.OpenKey('Software\Soft_Era\SPS_Edit',True);
    if Reg.ValueExists('FormaTop') then WynikOtwarcia := true;
    if WynikOtwarcia
    then
    begin
      if Reg.ReadInteger('FormaTop') <> 0 then  FormaMain.Top := Reg.ReadInteger('FormaTop') else Reg.WriteInteger('FormaTop', 500);
      if Reg.ReadInteger('FormaLeft') <> 0 then FormaMain.Left := Reg.ReadInteger('FormaLeft');
      if Reg.ReadInteger('FormaWidth') <> 0 then FormaMain.Width := Reg.ReadInteger('FormaWidth');
      if Reg.ReadInteger('FormaHigh') <> 0 then FormaMain.Height := Reg.ReadInteger('FormaHigh');
      if Reg.ReadString('ApplicationPath') = '' then
      begin
        GetDir(0, ApplicationPath);
        Reg.WriteString('ApplicationPath', ApplicationPath);
      end else ApplicationPath := Reg.ReadString('ApplicationPath');

      LastOpendS       := Reg.ReadString('NazwaPlikuOtwartegoS');
      LastOpendX       := Reg.ReadString('NazwaPlikuOtwartegoX');
      LastOpendR       := Reg.ReadString('NazwaPlikuOtwartegoR');
      LastExportedS    := Reg.ReadString('LastExportedS');
      LastExportedX    := Reg.ReadString('LastExportedX');
      LastExportedR    := Reg.ReadString('LastExportedR');
      NazwaPlikuOtwartegoS := Reg.ReadString('NazwaPlikuOtwartegoS');
      NazwaPlikuOtwartegoS := Reg.ReadString('NazwaPlikuOtwartegoX');
      NazwaPlikuOtwartegoS := Reg.ReadString('NazwaPlikuOtwartegoR');
    end;
  finally
    Reg.Free;
  end;
end;  {Zapodaj}


begin
  Application.OnException := MyOnException;
  ZapodajZRejestru;
  CanRecNaPanel := true;
  CanIlRecNaPanel := true;

  KopiaPar := TTestyDoZrobienia.Create;
  KopiaPar.Init;

  Param := TTestyDoZrobienia.Create;
  Param.WczytajParametryTestuZRejestru;
  InicjujListeZrodel;
  CheckBox1.Checked := false;
  Sender := FormaMain;
  FormaMain.CheckBox1Click(Sender);

  KopiujBazeDanych;

  PlikX := ApplicationPath + '\x.tmp';
  PlikS := ApplicationPath + '\s.tmp';
  PlikR := ApplicationPath + '\r.tmp';

  DecimalSeparator := '.';
  kontrola_poprawnosci := true;
  TabelaX.MasterSource := DataSource1;
  TabelaX.IndexName := 'ILE_SZT';
  TabelaX.MasterFields := 'ILE_SZT';



  if TabelaS.Active = false then TabelaS.Open;
  if TabelaX.Active = false then TabelaX.Open;
  if TabelaR.Active = false then TabelaR.Open;

  if DataSource1.Enabled = false then DataSource1.Enabled := true;
  if DataSource2.Enabled = false then  DataSource2.Enabled := true;

  BiezacyRecNaPanel;
  IloscRecNaPanel;
  if TabelaS.RecordCount <> 0 then
     WypiszTytol(ExtractFileNameOnly(PobierzKluczRejestru('NazwaPlikuOtwartegoS')) )
     else WypiszTytol('');

  EdytorSPS.ActivePage := SSPS;
  AktywujDrukowanie(Sender);
end;


procedure TFormaMain.BiezacyRecNaPanel;
begin
  if not CanRecNaPanel then Exit;
  TabelaX.Open;
  try
  if TabelaX.RecordCount <> 0 then
     StatusBar1.Panels[1].text := 'Bie¿¹cy numer rekordu: ' + FloatToStr(TabelaX['Rekord'])
  else StatusBar1.Panels[1].text := 'Bie¿¹cy numer rekordu: ' ;
  except
     on EDataBaseError do
     begin
       StatusBar1.Panels[1].text := 'Bie¿¹cy numer rekordu: ' ;
     end;
  end;

end;


procedure TFormaMain.IloscRecNaPanel;
begin
  if not CanIlRecNaPanel then Exit;
  TabelaX.Open;
  try
  if TabelaS.RecordCount <> 0 then
  begin
     StatusBar1.Panels[2].text := 'Iloœæ rekordów w bazie: ' + FloatToStr(TabelaS.RecordCount);
     StatusBar1.Panels[0].text := 'Wiersz: ' + FloatToStr(TabelaS.RecNo);
  end
  else
  begin
    StatusBar1.Panels[2].text := 'Iloœæ rekordów w bazie: ';
    StatusBar1.Panels[0].text := 'Wiersz: ';
  end;
  except
     on EDataBaseError do
     begin
       StatusBar1.Panels[2].text := 'Iloœæ rekordów w bazie: ';
       StatusBar1.Panels[0].text := 'Wiersz: ';
     end;
  end;
end;


procedure TFormaMain.KopiujBazeDanych;
var
    komunikat                        :PChar;
begin
//  if  not jest_rozlaczone then RozlaczTabele;
  try
    KopiujPlik(ApplicationPath + '\spss.dbf', ApplicationPath + '\spss.bak');
    KopiujPlik(ApplicationPath + '\spsx.dbf',ApplicationPath + '\spsx.bak');

    KopiujPlik(ApplicationPath +'\spsr.dbf', ApplicationPath +'\spsr.bak');
    KopiujPlik(ApplicationPath +'\spss.mdx', ApplicationPath +'\spss_md.bak');
    KopiujPlik(ApplicationPath +'\spsx.mdx', ApplicationPath +'\spsx_md.bak');
  except
    komunikat := StrPCopy('B³¹d podczas backupu:', ApplicationPath);
    Application.MessageBox(komunikat,
                                 'Kopiowanie bazy danych',mb_ICONHAND or mb_OK);
  end; //excepta
end;

procedure TFormaMain.OdzyskajBazeDanych;
begin
  try
    RozlaczTabele;
    KopiujPlik(ApplicationPath + '\spss.bak', ApplicationPath + '\spss.dbf');
    KopiujPlik(ApplicationPath + '\spsx.bak', ApplicationPath + '\spsx.dbf');
    KopiujPlik(ApplicationPath + '\spsr.bak', ApplicationPath + '\spsr.dbf');
    KopiujPlik(ApplicationPath + '\spss_md.bak', ApplicationPath + '\spss.mdx');
    KopiujPlik(ApplicationPath +'\spsx_md.bak', ApplicationPath + '\spsx.mdx');
    PolaczTabele;
  except
    PolaczTabele;
    Application.MessageBox('B³¹d podczas odzyskiwania backupu:',
                                 'Kopiowanie bazy danych',mb_ICONHAND or mb_OK);
  end;
end;


procedure TFormaMain.SzukWgPS(wiersz :string);
var linia, stacja :string;
    ktory_raz     :char;
    lina, stacyjka :real;
begin
  if TestPoprawnosciNumeru(wiersz) = true then
  begin
    Split_na_lin_stat(wiersz,linia, stacja, ktory_raz);
    lina  := StrToFloat(Trim(linia));
    stacyjka := StrToFloat(Trim(stacja));
    if not ZnajdzWgPS(lina, stacyjka, ktory_raz) then
    Application.MessageBox('Nie znaleziono takiego numeru PS', 'Wyszukiwanie',mb_ICONHAND or mb_OK)
    else    INDEKS_ILE_SZT := TabelaS['ILE_SZT'];
  end;
end;

procedure TFormaMain.SzukWgRec(wiersz :string);
var rekord        :real;

begin
  try
    rekord := StrToFloat(Trim(Wiersz));
    if (ZnajdzILE_SZT_WgRec(rekord) = false) then
       begin
        INDEKS_ILE_SZT := 0;
        Application.MessageBox('Nie znaleziono takiego numeru PS', 'Wyszukiwanie',mb_ICONHAND or mb_OK);
       end
  except
    Application.MessageBox('B³¹d podczas szukania', 'Wyszukiwanie',mb_ICONHAND or mb_OK)
  end
end;

function TFormaMain.ZnajdzWgPS(linia, stacja :real; ktory_razik:char) :boolean;
var macierz   :array[1..3] of variant;
begin
  macierz[1] := linia;
  macierz[2] := stacja;
  macierz[3] := ktory_razik;
  if not TabelaS.Locate('Line;Station;Ktory_raz',VarArrayOf(Macierz),
                        [loCaseInsensitive])
                        then ZnajdzWgPS := false
  else ZnajdzWgPS := true;
end;



procedure TFormaMain.DBGrid2KeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = Chr(VK_PRIOR)) then TabelaS.Prior;
  if (Key = Chr(VK_NEXT)) then TabelaS.Next;
end;



procedure TFormaMain.DBGrid2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    if (Key = VK_PRIOR) then TabelaS.Prior;
    if (Key = VK_NEXT) then TabelaS.Next;
end;

procedure TFormaMain.Button4Click(Sender: TObject);
begin
   DataSource1.DataSet := SortujQuery;
   SortujQuery.Close;
   SortujQuery.SQL.Clear;
   SortujQuery.SQL.Add('SELECT * FROM spss.dbf ORDER BY line');
   SortujQuery.Open;
   SortujQuery.Close;
//   SortujQuery.ExecSQL;
end;

procedure TFormaMain.Button5Click(Sender: TObject);
begin
   DataSource1.DataSet := TabelaS;
end;



function TFormaMain.FormujUlamek(wiersz :string; po_punkcie :byte):string;
var tmp :string;
begin
  if (StrToFloat(wiersz) > 90) and (StrToFloat(wiersz) < 101) then
  begin
    wiersz := wiersz;
  end;


  if Pos('.', wiersz) = 0 then
  begin
    if po_punkcie > 0 then tmp := wiersz + '.' + pomnoz_znaki(po_punkcie,'0')
       else tmp := wiersz;
  end else
  if Length(wiersz) - Pos('.',wiersz) < po_punkcie then //Je¿eli
  begin
    tmp := wiersz +
           pomnoz_znaki(po_punkcie - Length(wiersz) - Pos('.',wiersz),'0');
  end else
  if Length(wiersz) - Pos('.',wiersz) = po_punkcie then
  begin
    tmp := wiersz;
  end else
  if Length(wiersz) - Pos('.',wiersz) > po_punkcie then
  begin //obcina resztê na chama
      tmp := Copy(wiersz,1, Pos('.',wiersz) + po_punkcie -1);
  end;
  FormujUlamek := tmp;
end;


function TFormaMain.pomnoz_znaki(ile :byte; jaki :char):string;
var tpm :string;
    c   :byte;
begin
  tpm := '';
  for c:= 1 to ile do
      tpm := tpm + jaki;
  pomnoz_znaki := tpm;
end;   {************************************************************}


function TFormaMain.justuj(linia:string; ile_wszystkiego :byte; wyrownaj :strony;
                                     wypelnienie: char):string;

var dlugosc :byte;
    temp    :string;



begin
  if linia <> '' then
  begin
    dlugosc := Length(linia);
    if ile_wszystkiego > dlugosc then
    begin  // g³owny fragment funkcji
      case wyrownaj of
        sLewo:   begin
                    temp := linia;
                    temp := temp + pomnoz_znaki(ile_wszystkiego - dlugosc,
                         wypelnienie);
                 end;

        sSrodek: begin

                 end;
        sPrawo:  begin
                    temp := linia;
                    temp := pomnoz_znaki(ile_wszystkiego  - dlugosc,
                        wypelnienie) + temp ;
                 end;
      end

    end else {gdy nie ma co justowaæ}
    begin
      if dlugosc = ile_wszystkiego then
      begin
        justuj := linia;
        exit; //z procedury
      end else
      if dlugosc > ile_wszystkiego then
      begin
        ShowMessage('Zbyt wiele cyfr znacz¹cych - skontaktuj siê z Autorem');
        Close;
      end;
    end;

  end else justuj := '';

  justuj := temp;
end;   {*****************************JUSTUJ*************}



procedure TFormaMain.ExportSPSS(nazwa_pliku :string);

var
    i         :integer;
    temp_str  :string;
    wynik_str :string;
    f         :TextFile;

begin
  TabelaS.DisableControls;

  TabelaS.First;
  wynik_str := '';

  AssignFile(f,nazwa_pliku);
  Rewrite(f);
  for i := 0 to TabelaS.RecordCount - 1 do
  begin
    LastExportedS := nazwa_pliku;

    wynik_str := TabelaS['Ident_S'];

    temp_str := FormujUlamek(FloatToStr(TabelaS['Line']),parametry_eksportu.precyzja_line );
    wynik_str  := wynik_str + justuj(temp_str,SLINE_NUM_MANY, sLewo, ' ');

    temp_str := FormujUlamek(FloatToStr(TabelaS['STATION']), parametry_eksportu.precyzja_station);
    wynik_str := wynik_str + justuj(temp_str, SSHOT_NUM_MANY, sPrawo, ' ');

    temp_str := TabelaS['KTORY_RAZ'];   //TU JEST cHAR!!!
    wynik_str := wynik_str + temp_str ;

    temp_str := TabelaS['KOD_ZRODLA'];
    wynik_str := wynik_str + temp_str ;

    if parametry_eksportu.statyka then
    begin
      temp_str := FormujUlamek(FloatToStr(TabelaS['STATYKA']), 0);
      wynik_str := wynik_str + justuj(temp_str, SSTATIC_MANY, sPrawo, ' ');
    end else wynik_str := wynik_str + Pomnoz_znaki(SSTATIC_MANY, ' ');


    if parametry_eksportu.glebokosc_strzelania then
    begin
      temp_str := FormujUlamek(FloatToStr(TabelaS['DEPH']), 1);
      wynik_str := wynik_str + justuj(temp_str, SDEPH_MANY, sPrawo, ' ');
    end else wynik_str := wynik_str + Pomnoz_znaki(SDEPH_MANY, ' ');

    if parametry_eksportu.datum then
    begin
      temp_str := FormujUlamek(FloatToStr(TabelaS['DATUM']), 1);
      wynik_str := wynik_str + justuj(temp_str, SDATUM_MANY, sPrawo, ' ');
    end else wynik_str := wynik_str + Pomnoz_znaki(SDATUM_MANY, ' ');

    if parametry_eksportu.czas_pionowy then
    begin
      temp_str := FormujUlamek(FloatToStr(TabelaS['UPHOLE']), 0);
      wynik_str := wynik_str + justuj(temp_str, SUPHOLE_MANY, sPrawo, ' ');
    end else wynik_str := wynik_str + Pomnoz_znaki(SUPHOLE_MANY, ' ');


    if parametry_eksportu.woda then
    begin
      temp_str := FormujUlamek(FloatToStr(TabelaS['WATER']), 1);
      wynik_str := wynik_str + justuj(temp_str, SWATER_MANY, sPrawo, ' ');
    end else wynik_str := wynik_str + Pomnoz_znaki(SWATER_MANY, ' ');

    temp_str := FormujUlamek(FloatToStr(TabelaS['EASTING']), 1);
    wynik_str := wynik_str + justuj(temp_str, S_X_MANY, sPrawo, ' ');

    temp_str := FormujUlamek(FloatToStr(TabelaS['NORTHING']), 1);
    wynik_str := wynik_str + justuj(temp_str, S_Y_MANY, sPrawo, ' ');

    temp_str := FormujUlamek(FloatToStr(TabelaS['ELEW']), 1);
    wynik_str := wynik_str + justuj(temp_str, S_ELEV_MANY, sPrawo, ' ');

    temp_str := FloatToStr(TabelaS['DAY']);
    wynik_str := wynik_str + justuj(temp_str, S_DAY_MANY, sPrawo, '0');

    temp_str := FloatToStr(TabelaS['TIME']);
    wynik_str := wynik_str + justuj(temp_str, S_TIME_MANY, sPrawo, '0');

    writeln(f, wynik_str);

    TabelaS.Next;
    temp_str := '';
    wynik_str := '';


  end;{for}
  TabelaS.First;
  TabelaS.EnableControls;
//  PageControl1.Enabled := true;
  CloseFile(f);
end;          {************* EXPORT S **************}



procedure TFormaMain.ExportXSPS(nazwa_pliku :string);
var
    i         :integer;
    temp_str  :string;
    wynik_str :string;
    f         :TextFile;

begin
  TabelaX.DisableControls;


  TabelaX.MasterSource := nil;
  TabelaX.IndexName := '';
  TabelaX.MasterFields := '';


  TabelaX.First;
  wynik_str := '';

  AssignFile(f,nazwa_pliku);
  Rewrite(f);
  for i := 0 to TabelaX.RecordCount - 1 do
  begin
    LastExportedX := nazwa_pliku;
    wynik_str := TabelaX['X'];

    temp_str := FormujUlamek(FloatToStr(TabelaX['Tasma']), 0);
    wynik_str  := wynik_str + justuj(temp_str,X_TAPE_MANY, sLewo, ' ');

    temp_str := FormujUlamek(FloatToStr(TabelaX['Rekord']), 0);
    wynik_str  := wynik_str + justuj(temp_str,X_RECORD_MANY, sPrawo, ' ');

    temp_str := FormujUlamek(FloatToStr(TabelaX['Numeracja']), 0);
    wynik_str  := wynik_str + justuj(temp_str, X_REC_STEP_MANY, sPrawo, ' ');

    wynik_str  := wynik_str + TabelaX['Aparatura'];

    temp_str := FormujUlamek(FloatToStr(TabelaX['Line']),parametry_eksportu.precyzja_line );
    wynik_str  := wynik_str + justuj(temp_str, X_SLINE_MANY, sLewo, ' ');

    temp_str := FormujUlamek(FloatToStr(TabelaX['Station']), parametry_eksportu.precyzja_station);
    wynik_str  := wynik_str + justuj(temp_str, X_SSTATION_MANY, sPrawo, ' ');

    wynik_str  := wynik_str + TabelaX['Ktory_raz']; {który raz strzelono}

    temp_str := FormujUlamek(FloatToStr(TabelaX['Od']), 0);
    wynik_str  := wynik_str + justuj(temp_str, X_FROM_CHANEL_MANY, sPrawo, ' ');


    temp_str := FormujUlamek(FloatToStr(TabelaX['Do']), 0);
    wynik_str  := wynik_str + justuj(temp_str, X_TO_CHANEL_MANY, sPrawo, ' ');

    temp_str := FormujUlamek(FloatToStr(TabelaX['Krok_kan']), 0);
    wynik_str  := wynik_str + justuj(temp_str, X_STEP_CHANEL_MANY, sPrawo, ' ');

    temp_str := FormujUlamek(FloatToStr(TabelaX['Linia']), parametry_eksportu.precyzja_LO);
    wynik_str  := wynik_str + justuj(temp_str, X_RLINE_MANY , sLewo, ' ');

    temp_str := FormujUlamek(FloatToStr(TabelaX['Skad']), parametry_eksportu.precyzja_kanal);
    wynik_str  := wynik_str + justuj(temp_str, X_FROM_STAT_MANY, sPrawo, ' ');

    temp_str := FormujUlamek(FloatToStr(TabelaX['Dokad']), parametry_eksportu.precyzja_kanal);
    wynik_str  := wynik_str + justuj(temp_str, X_TO_STAT_MANY, sPrawo, ' ');

    wynik_str  := wynik_str +  TabelaX['Indeks_odb'];

    TabelaX.Next;

    Writeln(f, wynik_str);
  end;  {end for}

  TabelaX.MasterSource := DataSource1;
  TabelaX.IndexName := 'ILE_SZT';
  TabelaX.MasterFields := 'ILE_SZT';

  TabelaX.EnableControls;
//  PageControl1.Enabled := true;
  CloseFile(f);

end;          {************* EXPORT X **************}





procedure TFormaMain.OtworzSPSMenuClick(Sender: TObject);
var ForemkaOtwarcia :TFormaOtwarcia;
begin
  if ((TabelaX.RecordCount <> 0) or (TabelaS.RecordCount <> 0) or (TabelaR.RecordCount <> 0)) and
     (Sender <> DolaczSPSMenu) then
     Application.MessageBox('Dane nie mog¹ byæ wczytane. Baza nie jest pusta. PrzejdŸ do menu "Edycja" i wyczyœæ bazê.',
                                  'Otwieranie SPS', mb_OK)

  else
  begin
    ForemkaOtwarcia := TFormaOtwarcia.Create(Self);
    ForemkaOtwarcia.ShowModal;
    try
    if ForemkaOtwarcia.ModalResult = mrOK then
    begin
      if  (FileExists(ForemkaOtwarcia.Edit1.Text) and FileExists(ForemkaOtwarcia.Edit2.Text)
         and (FileExists(ForemkaOtwarcia.Edit3.Text) or (ForemkaOtwarcia.Edit3.Text = ''))   )
         or
         ((ForemkaOtwarcia.Edit1.Text = '') and  (ForemkaOtwarcia.Edit2.Text = '')
         and FileExists(ForemkaOtwarcia.Edit3.Text) )
      then
      begin
        // za³aduj niezbêdne pliki
        if TEST_INTEGRALNOSCI_SPS(ForemkaOtwarcia.Edit1.Text,
                                  ForemkaOtwarcia.Edit2.Text,
                                  ForemkaOtwarcia.Edit3.Text) then
        begin
          Screen.Cursor := crHourGlass;
          RozlaczTabele;

          NazwaPlikuOtwartegoS := Trim(ForemkaOtwarcia.Edit1.Text);
          LastS_Name:= ExtractFileName(NazwaPlikuOtwartegoS);
          LadujSSPS(ApplicationPath + '\' + TEST_FILE_S);
          ZapiszKluczRejestru('NazwaPlikuOtwartegoS', NazwaPlikuOtwartegoS);

          NazwaPlikuOtwartegoX := Trim(ForemkaOtwarcia.Edit2.Text);
          LastX_Name:= ExtractFileName(NazwaPlikuOtwartegoX);
          LadujXSPS(ApplicationPath + '\' + TEST_FILE_X);
          ZapiszKluczRejestru('NazwaPlikuOtwartegoX', NazwaPlikuOtwartegoX);

          NazwaPlikuOtwartegoR := Trim(ForemkaOtwarcia.Edit3.Text);
          if (NazwaPlikuOtwartegoR <> '') then
          begin
             LadujRSPS(ApplicationPath + '\' + TEST_FILE_R);
             ZapiszKluczRejestru('NazwaPlikuOtwartegoR', NazwaPlikuOtwartegoR);
          end;
          WypiszTytol(ExtractFileNameOnly(ForemkaOtwarcia.Edit1.Text));
          TabelaS.First;
          Screen.Cursor := crDefault;
        end;
      end;
    end;
    finally
      ForemkaOtwarcia.Free;
      PolaczTabele;
    end;
  end;
end;


procedure TFormaMain.EksportSPSMenuClick(Sender: TObject);
begin
  if UstalParamEksportu then

  begin

  try
  SaveDialog1.InitialDir := ExtractFileDir(NazwaPlikuOtwartegoS);
  SaveDialog1.FileName := ExtractFileNameOnly(NazwaPlikuOtwartegoS);
  SaveDialog1.Title := 'Zachowaj SPS-S';
  if NazwaPlikuOtwartegoS <> '' then
  begin
    SaveDialog1.FileName := ExtractFileName(NazwaPlikuOtwartegoS);
  end;

  if SaveDialog1.Execute then
  begin
    if SaveDialog1.FileName <> '' then
    begin
      NazwaPlikuEksportowanegoS := SaveDialog1.FileName;

      LastS_Dir := ExtractFileDir(NazwaPlikuEksportowanegoS);
      LastS_Name:= ExtractFileName(NazwaPlikuEksportowanegoS);

      SaveDialog2.Title := 'Zachowaj SPS-X';
      SaveDialog2.InitialDir := ExtractFileDir(NazwaPlikuOtwartegoX);
      SaveDialog2.FileName := ExtractFileName(NazwaPlikuOtwartegoX)   ;
      if SaveDialog2.Execute then
      begin
      if SaveDialog2.FileName <> '' then
      begin
        NazwaPlikuEksportowanegoX := SaveDialog2.FileName;

        SaveDialog2.Title := 'Zachowaj SPS-R';
        SaveDialog2.InitialDir := LastS_Dir;
        SaveDialog2.FileName := LastS_Name ;
        If TabelaR.RecordCount <> 0 then
        begin
          SaveDialog2.InitialDir := LastS_Dir;
          if SaveDialog2.Execute then  NazwaPlikuEksportowanegoR := SaveDialog2.FileName
             else NazwaPlikuEksportowanegoR := '';
        end;

        ExportSPSS(NazwaPlikuEksportowanegoS);
        ExportXSPS(NazwaPlikuEksportowanegoX);
        WypiszTytol(ExtractFileNameOnly(NazwaPlikuEksportowanegoS));
        if NazwaPlikuEksportowanegoR <> ''
           then ExportRSPS(NazwaPlikuEksportowanegoR);


      end;{Dialog 2}
    end;  {Dialog 1}

    end;

  end;

  except
   Application.MessageBox('Wyst¹pi³ b³¹d podczas zapisywania SPS-R',
                                  'Eksport do tekstu', mb_OK);
   Exit;
  end;
  Application.MessageBox('Eksport do plików tekstowych zakoñczony pomyœlnie',
                                  'Eksport do tekstu', mb_OK);
  end;

end;

procedure TFormaMain.ZakonczMenuClick(Sender: TObject);
begin
  Close; {powoduje stack overflow}
end;


procedure TFormaMain.SzukajMenuClick(Sender: TObject);
var SzukBox :TFormaSzukaj;
    Numer, rekord :string;

begin
  if (EdytorSPS.ActivePage = SSPS) or (EdytorSPS.ActivePage = XSPS)
  then
  begin
    SzukBox := TFormaSzukaj.Create(self);
    SzukBox.ShowModal;
    if SzukBox.ModalResult = mrOK then
    begin
      Numer := SzukBox.EditPS.Text;
      Rekord := SzukBox.EditRec.Text   ;
      if Numer <> '' then  SzukWgPS(Numer)
      else if Rekord <> '' Then
         begin
           RozlaczTabele;
           SzukWgRec(rekord);
           if ZnajdzSWgIndeksu(INDEKS_ILE_SZT) = NULL then
              Application.MessageBox('Nie znaleziono rekordu',
                                  'Szukaj', mb_ICONHAND or mb_OK);
           PolaczTabele;
         end
    else Application.MessageBox('Nie ma nic do szukania ',
                                  'Szukaj', mb_ICONHAND or mb_OK);
    end;
  end else
  begin
    if (EdytorSPS.ActivePage = EdytorTabSheet) then
       ToolButtonSearchClick(Sender);
  end;
end;


procedure TFormaMain.PolaczTabele;
begin
  TabelaX.MasterSource := DataSource1;
  TabelaX.IndexName := 'ILE_SZT';
  TabelaX.MasterFields := 'ILE_SZT';
  jest_rozlaczone := false;
end;

procedure TFormaMain.RozlaczTabele;
begin
  TabelaX.MasterSource := nil;
  TabelaX.IndexName := '';
  TabelaX.MasterFields := '';
  jest_rozlaczone := true;
end;

procedure TFormaMain.WyczyscBazeMenuClick(Sender: TObject);
begin
  KopiujBazeDanych;
  KasujTabele;
  BiezacyRecNaPanel;
  IloscRecNaPanel;
  WypiszTytol('');
end;

function TFormaMain.TranslateToXYZ(jaki, na_jaki, kolumne :string):boolean;
//procedura zamienia plik tekstowy
var f_str        :TextFile;
    f            :file of dane_real;
    temp_real    :dane_real;
    str          :string;

begin
  try
    AssignFile(f_str, jaki);
    Reset(f_str);
    AssignFile(f, na_jaki);
    Rewrite(f);

    while not eof(f_str) do
    begin
      readln(f_str, str);
      temp_real.x := StrToFloat(Trim(kolumna(str,1)));
      temp_real.y := StrToFloat(Trim(kolumna(str,2)));
      temp_real.z := StrToFloat(Trim(kolumna(str, StrToInt(kolumne))));
      write(f, temp_real);
    end;
    except
      TranslateToXYZ := false;
      CloseFile(f_str);
      CloseFile(f);
      Exit;
    end;
  CloseFile(f_str);
  CloseFile(f);
  TranslateToXYZ := true;
end;


procedure TFormaMain.WstawKolumneMenuClick(Sender: TObject);
var Foremka     :TFormaZCombo;

procedure WstawKolumne(nazwa_plikuXYZ :string; kolumna, kolumna_zrodla :string);
var
    PlikTempXYZ       :file of Dane_Real;
    wstawiana_liczba  :real;


function WyszukajWartoscXYZ(szukane_X, szukane_Y :extended; var wynik :real) :boolean;
var odczytaneXYZ        :Dane_Real;
    odczytaneX,
    odczytaneY          :extended;
begin
   AssignFile(PlikTempXYZ, ApplicationPath + '\' + 'tempXYZ.tmp');
   Reset(PlikTempXYZ);
   Seek(PlikTempXYZ,0);
   while not eof(PlikTempXYZ) do
   begin
     read(PlikTempXYZ, odczytaneXYZ);
     odczytaneX := odczytaneXYZ.x;
     odczytaneY := odczytaneXYZ.y;

     if (szukane_X = odczytaneX) and (szukane_Y = odczytaneY)
     then
     begin
       wynik := odczytaneXYZ.z;
       WyszukajWartoscXYZ := true;
       Exit;
     end;
   end;
   CloseFile(PlikTempXYZ);
WyszukajWartoscXYZ := false;
end;



var    i                    :longint;
       linia, stacja       :real  ;
begin
  if kolumna = 'kod_zrodla' then // znakowe pole
  begin
    ShowMessage('Nie zaimplementowano tej opcji');
    Exit;
  end else // rzeczywiste
  begin
    TabelaS.DisableControls;
    if not TranslateToXYZ(nazwa_plikuXYZ, ApplicationPath + '\'+ 'tempXYZ.tmp', kolumna_zrodla)
    then
    begin
      TabelaS.EnableControls;
      PolaczTabele;
      Application.MessageBox('B£¥D podczas konwersji. SprawdŸ format pliku.',
            'Konwersja do postaci binarnej',  mb_ICONHAND or MB_OKCANCEL);

      Exit;
    end;
    // Pocz¹tek wpisywania do tabeli S
    RozlaczTabele;


  SortujQuery.SQL.Clear;
  SortujQuery.DataSource := DataSource1;
  SortujQuery.SQL.Add('select * from spss.dbf where line=:war1 and station=:war2');
  SortujQuery.ParamByName('war1').ASFloat :=  linia;
  SortujQuery.ParamByName('war2').ASFloat :=  stacja;
  SortujQuery.Open;
  for i := 1  to SortujQuery.RecordCount do
  begin
//    SortujQuery.FieldByName(kolumna) := wstawiana_liczba;     ************
  end;

  SortujQuery.Close;


    TabelaS.First;
    for i := 0 to TabelaS.RecordCount - 1 do
    begin
    if WyszukajWartoscXYZ(TabelaS['Line'], TabelaS['Station'],wstawiana_liczba)
    then begin
            TabelaS.Edit;
            TabelaS.FieldByName(kolumna).AsFloat := wstawiana_liczba;
            TabelaS.POst;
            TabelaS.Next;
         end
    else begin
            TabelaS.Edit;
            TabelaS.FieldByName(kolumna).AsFloat := -9999;
            TabelaS.POst;
            TabelaS.Next;
         end;
    end; {Pêtli for}
  end;

  Erase(PlikTempXYZ);
  TabelaS.EnableControls;
  PolaczTabele;
end;


begin
  Foremka := TFormaZCombo.Create(Self);
  Foremka.ShowModal;
  if Foremka.ModalResult = mrOK then
  begin
    try
      try
      if (Foremka.ComboBox1.Text <> '') and (Foremka.Edit1.text <> '') then
         begin
           KopiujBazeDanych;
           kontrola_poprawnosci := false;
           WstawKolumne(Trim(Foremka.Edit1.text),Trim(Foremka.ComboBox1.Text),Foremka.Edit2.text);
           kontrola_poprawnosci := true;
         end;
      except
      end;

    finally
      Foremka.Free;
      kontrola_poprawnosci := true;
    end;
  end;
{Tu mamy do wyboru: wstaw wg kolumny do wyboru}
end;

procedure TFormaMain.UsunMenuClick(Sender: TObject);
begin
  kontrola_poprawnosci := false;
  Usun;
  kontrola_poprawnosci := true;
end;

function TFormaMain.UstawNaIndeksS(Indeks :variant) :boolean;
begin
  if TabelaS.Locate('ILE_SZT', Indeks  ,[loCaseInsensitive])
  then  UstawNaIndeksS := true else UstawNaIndeksS := false;
end;
function TFormaMain.UstawNaIndeksX(Indeks :variant) :boolean;
begin
  if TabelaX.Locate('ILE_SZT', Indeks  ,[loCaseInsensitive])
  then  UstawNaIndeksX := true else UstawNaIndeksX := false;
end;
procedure TFormaMain.KasujOdIndeksuDoIndeksuS(OD_IND, DO_IND :real);// Pierszy musi byæ aktywny
begin
  If (TabelaS['ILE_SZT'] = OD_IND) then
  begin
  repeat
    TabelaS.Delete;
  until (TabelaS['ILE_SZT'] > DO_IND) or  TabelaS.EOF
        or (TabelaS['ILE_SZT'] < OD_IND);
        //na koñcu tabeli nie przechodzi do EOF, lecz ustawia siê na poczêtku
        //przedzia³u kasowania (tzn OD_IND-1)
  end else
  Exception.Create('Nieodpowiedni indeks jest aktywny');
end;

procedure TFormaMain.KasujOdIndeksuDoIndeksuX(OD_IND, DO_IND :real);// Pierszy musi byæ aktywny
begin
  If (TabelaX['ILE_SZT'] = OD_IND) then
  begin
  repeat
    TabelaX.Delete;
  until (TabelaX['ILE_SZT'] > DO_IND) or TabelaX.EOF or (TabelaX['ILE_SZT'] < OD_IND);
  end else
  Exception.Create('Nieodpowiedni indeks jest aktywny');
end;

procedure TFormaMain.UsunRekordyWZakresieIndeksowSX(pierszy_indeks, ostatni_indeks :real) ;
begin      //UsunRekordyWZakresieIndeksowSX
  if UstawNaIndeksS(pierszy_indeks) and UstawNaIndeksX(pierszy_indeks)
  then
  begin
    KasujOdIndeksuDoIndeksuS(pierszy_indeks, ostatni_indeks);
    KasujOdIndeksuDoIndeksuX(pierszy_indeks, ostatni_indeks);
  end
  else Exception.Create('Nieprawid³owe indeksy kasowania');
end;


procedure TFormaMain.Usun;
var SzukBox :TFormaSzukaj;
    Numer, rekord,
    linia_str, stacja_str :string;
    linia, stacja         :real;
    indeks                :char;
    Rekord_real, Last_rek :real;
    First_ind, Last_ind   :real;



begin
  SzukBox := TFormaSzukaj.Create(self);
  SzukBox.PSLabel.Caption := 'Podaj numer PS do usuniêcia';
  SzukBox.RekordLabel.Caption := 'Podaj numer rekordu do usuniêcia';

  if EdytorSPS.ActivePage = SSPS then
  begin
    SzukBox.EditPS.Text := FloatToStr(TabelaS['Line'])+
      '/' + FloatToStr(TabelaS['Station']) + TabelaS['Ktory_raz'];
    SzukBox.EditPS.TabOrder := 0;
    SzukBox.EditRec.TabOrder := 1;
  end ;
  if EdytorSPS.ActivePage = XSPS then
  begin
    SzukBox.EditRec.Text := FloatToStr(TabelaX['Rekord']);
    SzukBox.EditPS.TabOrder := 1;
    SzukBox.EditRec.TabOrder := 0;
  end ;

  SzukBox.Caption := 'Usuñ';
  SzukBox.ShowModal;

  if SzukBox.ModalResult = mrOK then
  begin
    if TabelaS.Active = false then TabelaS.Open;
    if TabelaX.Active = false then TabelaX.Open;

    Numer := SzukBox.EditPS.Text;
    Rekord := SzukBox.EditRec.Text   ;
    if( Numer <> '') and TestPoprawnosciNumeru(numer) then
    begin
      // Szukaj i ustaw kursor
      Split_na_lin_stat(Numer,linia_str, stacja_str, indeks);
      linia := StrToFloat(Trim(linia_str));
      stacja := StrToFloat(Trim(stacja_str));
      if ZnajdzILE_SZT_WgNumeru(linia, stacja, indeks) then
      begin
        if ZnajdzXWgIndeksu(INDEKS_ILE_SZT) then
        begin
          RozlaczTabele;
          KopiujBazeDanych;
          TabelaS.Delete;
          UsunZnalezionyNrRec(TabelaX['Rekord']);
          PolaczTabele;
        end else
        Application.MessageBox('Nie znaleziono rekordu',
               'Kasowanie rekordu', mb_ICONHAND or mb_OK);
      end
      else  //operacja UsunWgPSS nie powiod³a siê
        Application.MessageBox('Nie znaleziono rekordu',
               'Kasowanie rekordu', mb_ICONHAND or mb_OK);
    end



    // Wybra³ kasowanie wg Rekordu
    else if Rekord <> ''  Then  //wybrano usuwanie wg rec.
    begin
      {Wed³ug numeru rec.}
      try
    //*******WED£UG PRZEDZIA£U REKORDÓW
        if Pos('-',Rekord) <> 0 then
        begin
        if Pos('-',Rekord) > 1 then
        begin                    // Teraz szukam  pierszego rekordu
          Rekord_real := StrToFloat(Trim(Copy(Rekord,1,Pos('-',Rekord)-1)) );
          Last_Rek :=  StrToFloat(Trim(Copy(Rekord,Pos('-',Rekord)+1,Length(Rekord)-1) ));

          First_ind := ZnajdzILE_SZTWgRecX(Rekord_real) ;
          Last_ind := ZnajdzILE_SZTWgRecX(Last_Rek) ;
          if  (First_ind = 0) or  (Last_ind = 0) or (First_ind >= Last_ind) then
          begin
            ShowMessage('     Brak rekordu lub nieprawid³owa kolejnoœæ rekordów     ');
            PolaczTabele;
            Abort;
          end;
          if not jest_rozlaczone then RozlaczTabele;
          TabelaS.DisableControls;
          TabelaX.DisableControls; 
          UsunRekordyWZakresieIndeksowSX(First_ind, Last_ind);
          TabelaS.Refresh;
          TabelaX.Refresh;
          TabelaS.EnableControls;
          TabelaX.EnableControls;
          PolaczTabele;
          Exit;
      //*******WED£UG PRZEDZIA£U REKORDÓW
           
        end else
            begin
              ShowMessage('Nieprawid³owa pozycja separatora');
              PolaczTabele;
              Abort;
            end;
        end;                            {*******WED£UG PRZEDZIA£U REKORDÓW}

        Rekord_real := StrToFloat(Trim(Rekord));
        RozlaczTabele;
        if ZnajdzILE_SZT_WgRec(Rekord_real) then
        begin
          if ZnajdzSWgIndeksu(INDEKS_ILE_SZT) then
          begin
            UsunZnalezionyNrRec(TabelaX['Rekord']);
            if (TabelaS['ile_szt'] = INDEKS_ILE_SZT) then TabelaS.Delete;
          end;
        end;
      except
        PolaczTabele;
        TabelaS.EnableControls;
        TabelaX.EnableControls;
        Application.MessageBox('Operacja usuwania wed³ug numeru rekordu nie powiod³a siê',
        'Usuwanie rekordu', mb_ICONHAND or mb_OK);
      end;
    end;
  end;
PolaczTabele;
end; {Procedury}




  function TFormaMain.UsunWgPSS(const linia, stacja :real; const indeks :char ) :boolean;
  var tmp  :variant;
  begin
    tmp := ZnajdzILE_SZT_WgNumeru(linia, stacja, indeks);
    if tmp  <> null
    then
    begin
      INDEKS_ILE_SZT := tmp;
      TabelaS.Delete;
      UsunWgPSS := true; //Poprawnie
    end else
        begin
          INDEKS_ILE_SZT := 0;
          UsunWgPSS := false;
        end;
  end;


  function TFormaMain.UsunWgPSX(const linia, stacja :real; const indeks :char ) :boolean;
  var tmp  :variant;
  begin
    TMP := ZnajdzXWgIndeksu(INDEKS_ILE_SZT);
    if tmp <> null then
    begin
       while TabelaX['ile_szt'] = INDEKS_ILE_SZT do
       begin
         TabelaX.Delete;
       end;
      UsunWgPSX := true;
    end else
        begin
          INDEKS_ILE_SZT := 0;
          UsunWgPSX := false;
        end;
  end;


  function TFormaMain.UsunWgRecX(const Rekord_real :real):boolean;
  var tmp  :boolean;
  begin
    tmp := ZnajdzILE_SZT_WgRec(Rekord_real);
    if tmp  <> false then
    begin
      while TabelaX['Ile_szt'] = INDEKS_ILE_SZT do
      begin
        TabelaX.Delete;
      end;
      UsunWgRecX := true;
    end else
        begin
          INDEKS_ILE_SZT := 0;
          UsunWgRecX := false;
        end;
  end;

function TFormaMain.TestPoprawnosciNumeru(wiersz :string) :boolean;   //Funkcja nieu¿ywana
var linia, stacja  :string;
    ktory_raz      :char;
    lina,
    stacyjka       :real;
    zawartosc      :string;
    poprawny       :boolean ;

begin
   poprawny := true ;
   zawartosc := Trim(wiersz);
   if zawartosc <> '' then
   begin
      if Pos('/', zawartosc) <> 0 then
      begin
        try
          Split_na_lin_stat(Zawartosc, linia, stacja, ktory_raz);
          lina      := StrToFloat(Trim(linia));
          stacyjka  := StrToFloat(Trim(stacja));
        except
          poprawny := false;
          Application.MessageBox('Nieprwid³owy format numeru', 'B³¹d konwersji',mb_ICONHAND or mb_OK);
        end; {Excepta}
      end else
      begin
        poprawny := false;
        Application.MessageBox('Brak znaku "/"', 'B³¹d konwersji', mb_ICONHAND or mb_OK);
      end;

   end;

 if (poprawny = true) then TestPoprawnosciNumeru := true
 else TestPoprawnosciNumeru := false;

end; {procedury}


Function TFormaMain.UstawNaPierwszyWierszRekordu(const Rekord_szukany :real) :boolean;
begin
  if TabelaX.CanModify then
  begin
    if TabelaX.Active = false then TabelaX.Open;
    TabelaX.First;
    if TabelaX.Locate('Rekord',Rekord_szukany,[loCaseInsensitive])
    then  UstawNaPierwszyWierszRekordu := true else
            UstawNaPierwszyWierszRekordu := false;

  end else UstawNaPierwszyWierszRekordu := false

end;

function TFormaMain.UsunAktywnaLinieOdbioruNaRozstawie(numer_wiersza :real):boolean;
begin
  try
  TabelaX.Delete;
  except
    UsunAktywnaLinieOdbioruNaRozstawie := False;
    Exit;
  end;
  UsunAktywnaLinieOdbioruNaRozstawie := true;
end;


Procedure TFormaMain.UsunZnalezionyNrRec(numer :real);
begin
  try
  while TabelaX['Rekord'] = numer do
  begin
    TabelaX.Delete;
  end;
  except
    Application.MessageBox('Nie mo¿na usun¹æ rekordu X','B³¹d podczas usuwania',mb_ICONHAND or mb_OK);
  end;
end;

Procedure TFormaMain.UsunXZnalezionyOdRecDo(numerOd, numerDo :real);
var jest_startowy     :boolean;
begin

  if  TabelaX['Rekord']= numerOd then jest_startowy := true
  else jest_startowy := false;

  try
  repeat
    TabelaX.Delete;
    TabelaX.Next;
  until  (TabelaX['Rekord']< numerDo) or TabelaX.EOF;

  except
    Application.MessageBox('Nie mo¿na usun¹æ rekordu X','B³¹d podczas usuwania',mb_ICONHAND or mb_OK);
  end;
end;

function TFormaMain.ZnajdzILE_SZT_WgRec(szukaj_rec :real):boolean;
// Przesuwa kursor
var
  lokalny     :variant;
begin
  lokalny := szukaj_rec;
  if TabelaX.Active = false then TabelaX.Open;
  TabelaX.First;
  if TabelaX.Locate('REKORD',Lokalny , [loCaseInsensitive]) then
  begin
    indeks_ile_szt := TabelaX['ile_szt'];
    ZnajdzILE_SZT_WgRec := true;
  end else ZnajdzILE_SZT_WgRec := false;
end;


function TFormaMain.ZnajdzILE_SZT_WgNumeru(const linia, stacja :real;
                                           ktory_raz :char):boolean;
//przesuwa kursor i przekazuje jaki indeks ILE_SZT posiada rekord
// mamy numer PS, szukamy w S, uzyskujemy ILE_SZT
var
    macierz   :array[1..3] of variant;
begin
  macierz[1] := linia;
  macierz[2] := stacja;
  macierz[3] := ktory_raz;

  if TabelaS.Active = false then TabelaS.Open;
  TabelaS.First;
  if TabelaS.Locate('Line;Station;Ktory_raz',
                         VarArrayOf(Macierz),[loCaseInsensitive]) then
  begin
    INDEKS_ILE_SZT :=  TabelaS['ile_szt'];
    ZnajdzILE_SZT_WgNumeru := true;
  end else ZnajdzILE_SZT_WgNumeru := false;
end;


function TFormaMain.ZnajdzSWgIndeksu(indeks :real):boolean;
begin
  if TabelaS.Active = false then TabelaS.Open;
  TabelaS.First;
  if TabelaS.Locate('ile_szt', indeks, [loCaseInsensitive]) then
  ZnajdzSWgIndeksu := true else ZnajdzSWgIndeksu := false;
end;

function TFormaMain.ZnajdzXWgIndeksu(indeks :real):boolean;
begin
  if TabelaX.Active = false then TabelaX.Open;
  TabelaX.First;
  if TabelaX.Locate('ile_szt', indeks, [loCaseInsensitive]) then
  ZnajdzXWgIndeksu := true else ZnajdzXWgIndeksu := false;
end;

function TFormaMain.ZnajdzILE_SZTWgRecX(Rekord :real) :real;
var tempol :real;
begin
   try
   tempol := TabelaX.Lookup('Rekord', Rekord, 'ILE_SZT');
   except
     tempol := 0;
     ZnajdzILE_SZTWgRecX := tempol;
     exit;
   end;
    ZnajdzILE_SZTWgRecX := tempol;
end;


function TFormaMain.UstalParamEksportu :boolean;
begin
  Wyprowadz := TParametryEksportu.Create(Self);
  WeryfikujParametryEksportu;
  Wyprowadz.ShowModal;

  if Wyprowadz.ModalResult = mrOK then
  begin
    parametry_eksportu.precyzja_line := StrToInt(Wyprowadz.LineEdit.Text);
    parametry_eksportu.precyzja_station := StrToInt(Wyprowadz.StationEdit.Text);
    parametry_eksportu.precyzja_LO := StrToInt(Wyprowadz.LOEdit.Text);
    parametry_eksportu.precyzja_Kanal := StrToInt(Wyprowadz.KanalEdit.Text);

    parametry_eksportu.datum    := Wyprowadz.DatumCheckBox.Checked;
    parametry_eksportu.woda := Wyprowadz.WodaCheckBox.Checked;
    parametry_eksportu.czas_pionowy  := Wyprowadz.CzasPCheckBox.Checked;
    parametry_eksportu.statyka := Wyprowadz.StatykaCheckBox.Checked;
    parametry_eksportu.glebokosc_strzelania := Wyprowadz.GlebokoscCheckBox.Checked;
    UstalParamEksportu := true;
  end else UstalParamEksportu := false;
end;


procedure TFormaMain.WeryfikujParametryEksportu;
// procedura sprawdza, czy któraœ kolumna ma wartoœci niezerowe i proponuje stan
// pola "check box"
var licznik_s  :longint;
    SavePlace: TBookmark;

begin
  if not TabelaS.Active then TabelaS.Active := true;

  SavePlace  := TabelaS.GetBookmark;

  RozlaczTabele;
  TabelaS.DisableControls;
  TabelaR.DisableControls;

  if parametry_eksportu.datum = false then
  begin
    SortujQuery.Close;
    SortujQuery.DataSource := DataSource1;
    SortujQuery.SQL.Clear;
    SortujQuery.SQL.Add('select DATUM from spss.dbf where Datum <> 0');
    SortujQuery.Open;
    if SortujQuery.RecordCount <> 0  then parametry_eksportu.datum := true
    else
    begin
      SortujQuery.Close;
      SortujQuery.DataSource := DataSource3;
      SortujQuery.SQL.Clear;
      SortujQuery.SQL.Add('select DATUM from spsr.dbf where Datum <> 0');
      SortujQuery.Open;
      if SortujQuery.RecordCount <> 0  then parametry_eksportu.datum := true;
      SortujQuery.Close;
    end;

    SortujQuery.Close;
  end;

  if parametry_eksportu.statyka = false then
  begin
    SortujQuery.Close;
    SortujQuery.DataSource := DataSource1;
    SortujQuery.SQL.Clear;
    SortujQuery.SQL.Add('select STATYKA from spss.dbf where STATYKA <> 0');
    SortujQuery.Open;
    if SortujQuery.RecordCount <> 0  then parametry_eksportu.statyka := true
    else
    begin
      SortujQuery.Close;
      SortujQuery.DataSource := DataSource3;
      SortujQuery.SQL.Clear;
      SortujQuery.SQL.Add('select STATYKA from spsr.dbf where STATYKA <> 0');
      SortujQuery.Open;
      if SortujQuery.RecordCount <> 0  then parametry_eksportu.statyka := true;
      SortujQuery.Close;
    end;
  end;


  if parametry_eksportu.woda = false then
  begin
    SortujQuery.Close;
    SortujQuery.DataSource := DataSource1;
    SortujQuery.SQL.Clear;
    SortujQuery.SQL.Add('select WATER from spss.dbf where WATER <> 0');
    SortujQuery.Open;
    if SortujQuery.RecordCount <> 0  then parametry_eksportu.woda := true
    else
    begin
      SortujQuery.Close;
      SortujQuery.DataSource := DataSource3;
      SortujQuery.SQL.Clear;
      SortujQuery.SQL.Add('select WATER from spsr.dbf where WATER <> 0');
      SortujQuery.Open;
      if SortujQuery.RecordCount <> 0  then parametry_eksportu.woda := true;
      SortujQuery.Close;
    end;
  end;


  if parametry_eksportu.czas_pionowy = false then
  begin
    SortujQuery.Close;
    SortujQuery.DataSource := DataSource1;
    SortujQuery.SQL.Clear;
    SortujQuery.SQL.Add('select uphole from spss.dbf where uphole <> 0');
    SortujQuery.Open;
    if SortujQuery.RecordCount <> 0  then parametry_eksportu.czas_pionowy := true
    else
    begin
      SortujQuery.Close;
      SortujQuery.DataSource := DataSource3;
      SortujQuery.SQL.Clear;
      SortujQuery.SQL.Add('select uphole from spsr.dbf where uphole <> 0');
      SortujQuery.Open;
      if SortujQuery.RecordCount <> 0  then parametry_eksportu.czas_pionowy := true;
      SortujQuery.Close;
    end;
  end;

  if parametry_eksportu.glebokosc_strzelania = false then
  begin
    SortujQuery.Close;
    SortujQuery.DataSource := DataSource1;
    SortujQuery.SQL.Clear;
    SortujQuery.SQL.Add('select uphole from spss.dbf where uphole <> 0');
    SortujQuery.Open;
    if SortujQuery.RecordCount <> 0  then parametry_eksportu.glebokosc_strzelania := true
    else
    begin
      SortujQuery.Close;
      SortujQuery.DataSource := DataSource3;
      SortujQuery.SQL.Clear;
      SortujQuery.SQL.Add('select uphole from spsr.dbf where uphole <> 0');
      SortujQuery.Open;
      if SortujQuery.RecordCount <> 0  then parametry_eksportu.glebokosc_strzelania := true;
      SortujQuery.Close;
    end;
  end;

  PolaczTabele;
  TabelaS.EnableControls;
  TabelaR.EnableControls;

  TabelaS.GotoBookmark(SavePlace);
  TabelaS.FreeBookmark(SavePlace);


  if parametry_eksportu.datum = true then Wyprowadz.DatumCheckBox.Checked := true
     else Wyprowadz.DatumCheckBox.Checked := false;

  if parametry_eksportu.statyka = true then Wyprowadz.StatykaCheckBox.Checked := true
     else Wyprowadz.StatykaCheckBox.Checked := false;

  if parametry_eksportu.woda = true then Wyprowadz.WodaCheckBox.Checked := true
     else Wyprowadz.WodaCheckBox.Checked := false;

  if parametry_eksportu.czas_pionowy = true then Wyprowadz.CzasPCheckBox.Checked := true
     else Wyprowadz.CzasPCheckBox.Checked := false;

  if parametry_eksportu.glebokosc_strzelania = true then Wyprowadz.GlebokoscCheckBox.Checked := true
   else Wyprowadz.GlebokoscCheckBox.Checked := false;

    Wyprowadz.LineUpDown.Position :=  parametry_eksportu.precyzja_line;
    Wyprowadz.StationUpDown.Position := parametry_eksportu.precyzja_station;
    Wyprowadz.LOUpDown.Position := parametry_eksportu.precyzja_LO;
    Wyprowadz.KanalUpDown.Position := parametry_eksportu.precyzja_Kanal;

end;




procedure TFormaMain.ZamienIndeksyMenuClick(Sender: TObject);
var  indeksiki :TZamianaIndeksow;
begin
    indeksiki := TZamianaIndeksow.Create(Self);
  try
    indeksiki.ShowModal;
  except
    Application.MessageBox('Operacja nie powiod³a siê','B³¹d podczas zamiany indeksow',mb_ICONHAND or mb_OK);
    indeksiki.Free;
  end;
  indeksiki.Free;
end;




procedure TFormaMain.PodstwGeodezje(const MnoznikL, MnoznikS :string);
var i     :longInt;
    skad  :file of format_geodezji;
    REKORD:format_geodezji;

function GetSurvRecord(var tmp:format_geodezji): boolean;
var tmp_tmp :format_geodezji;
    ext1, ext2, ext3, ext4    :extended;

begin
  Seek(skad,1);
  while not eof(skad) do
  begin
    read(skad, tmp_tmp);
    ext1 := TabelaS['line'];
    ext2 := tmp_tmp.num_line_to ;
    ext3 := TabelaS['station'];
    ext4 := tmp_tmp.num_station_to ;
    if IsEqualNear(ext1, ext2) and IsEqualNear(ext3, ext4)
       then
       begin
         tmp := tmp_tmp;
         GetSurvRecord := true;
         exit;
       end;
  //   inc(licznik);
  end;
 GetSurvRecord := false;
end;

begin
  TabelaS.Open;
//  Cursor := crHourGlass;

  AssignFile(skad, PLIK_SURV_TMP);
  Reset(skad);
  for i:= 0 to TabelaS.RecordCount - 1 do
  begin
    TabelaS.Edit;
    TabelaS['Northing'] := 0;
    TabelaS['Easting'] := 0;
    TabelaS['Elew'] := 0;  //Najpierw zerujemy
    if GetSurvRecord(REKORD) then
    begin
      if TabelaS.CanModify then
      begin
        TabelaS.Edit;
        TabelaS.FieldByName('Northing').AsFloat := Rekord.x;
        TabelaS.FieldByName('Easting').AsFloat := Rekord.y;
        TabelaS.FieldByName('Elew').AsFloat := Rekord.z;
        TabelaS.Post;
      end;
    end else
        begin
         TabelaS.Edit;
         TabelaS.FieldByName('Northing').AsFloat := 0;
         TabelaS.FieldByName('Easting').AsFloat := 0;
         TabelaS.FieldByName('Elew').AsFloat := 0;
         TabelaS.Post;
        end;
  TabelaS.Next;
  end;
  CloseFile(skad);
  Erase(skad);
  Cursor := crDefault;
end;




procedure TFormaMain.ZamienMenuClick(Sender: TObject);
begin
  KopiujBazeDanych;
  kontrola_poprawnosci := false;
  UpdateNumeruPS;
  kontrola_poprawnosci := true;
end;



procedure TFormaMain.UpdateNumeruPS;
var SzukBox :TFormaSzukaj;
    Szukaj, ZamienNa   :string;

    linia_s, stacja_s  :string;
    linia_z, stacja_z  :string;
    Raz_S              :char;
    Raz_Z              :char;
    RealLinia_S, RealStacja_S,
    RealLinia_Z, RealStacja_Z :real;

begin
  SzukBox := TFormaSzukaj.Create(self);
  SzukBox.EnableKasowanie := false;
  SzukBox.Caption := 'Zamiana';
  SzukBox.RekordLabel.Caption := 'Szukaj numer PS';
  SzukBox.PSLabel.Caption := 'Zamieñ na';
  SzukBox.EditRec.Text := FloatToStr(TabelaS['line']) + '/'
                       + FloatToStr(TabelaS['station']) + TabelaS['ktory_raz'];
  SzukBox.ShowModal;
  if SzukBox.ModalResult = mrOK then
  begin
    Szukaj := SzukBox.EditRec.Text;
    ZamienNa :=  SzukBox.EditPS.Text   ;
    if (Szukaj <> '') and (ZamienNa <> '') then
    begin
       if TestPoprawnosciNumeru(Szukaj) and TestPoprawnosciNumeru(ZamienNa) then
       begin
         try
           Split_na_lin_stat(Szukaj,linia_s,stacja_s, Raz_S);
           RealLinia_S := StrToFloat(linia_s);
           RealStacja_S := StrToFloat(stacja_s);

           Split_na_lin_stat(ZamienNa,linia_z,stacja_z, Raz_z);
           RealLinia_z := StrToFloat(linia_z);
           RealStacja_z := StrToFloat(stacja_z);

           if CzyJestPS(RealLinia_z, RealStacja_z, '') then
           begin
             If Application.MessageBox('Próbujesz zamieniæ numer PS na taki, który ju¿ istnieje. Naciœnij OK, aby kontynuowaæ, ANULUJ aby przerwaæ',
                'Zmiana numeru PS',mb_ICONHAND or MB_OKCANCEL) = IDCANCEL
                then  Exit;
           end;

           RozlaczTabele;
           if ZnajdzILE_SZT_WgNumeru(RealLinia_S, RealStacja_S, Raz_S) and
              ZnajdzXWgIndeksu(INDEKS_ILE_SZT)  then
           begin
             ZmienNrAktywnego_S(RealLinia_Z, RealStacja_Z, Raz_Z);
             ZmienNrAktywnego_X(RealLinia_Z, RealStacja_Z, Raz_Z);
             PolaczTabele;
           end else
           begin
             PolaczTabele;
             Application.MessageBox('Nie znaleziono wzorca szukania','Szukanie',mb_ICONHAND or mb_OK);
           end;
         except
           PolaczTabele;
           SzukBox.Free;
         end {try}
       end
       else
       Application.MessageBox('Numer PS jest nieprawid³owy','B³¹d konwersji',mb_ICONHAND or mb_OK);
    end;
  end;
  SzukBox.Free;
end;


procedure TFormaMain.ZmienNrAktywnego_S(linia, stacja :real; raz :char);
begin
  TabelaS.Edit;
  TabelaS['line'] := linia;
  TabelaS['station'] := stacja;
  TabelaS['ktory_raz'] := raz;
  TabelaS.Post;
end;

procedure TFormaMain.ZmienNrAktywnego_X(linia, stacja :real; raz :char);
var ILE    :real;
begin
  ILE := TabelaX['ile_szt'];
  while (TabelaX['ile_szt'] = ILE) and (not TabelaX.EOF) do
  begin
    TabelaX.Edit;
    TabelaX['line'] := linia;
    TabelaX['station'] := stacja;
    TabelaX['ktory_raz'] := raz;
    TabelaX.Next;
  end;
end;



procedure TFormaMain.UsunSClick(Sender: TObject);
begin
  UsunMenuClick(Sender);
end;


procedure TFormaMain.UsunRecClick(Sender: TObject);
begin
  UsunMenuClick(Sender);
end;

procedure TFormaMain.EksportSClick(Sender: TObject);
begin
  EksportSPSMenuClick(Sender);
end;

procedure TFormaMain.ToolButtonOtworzClick(Sender: TObject);
begin
  OpenDialog1.Title := 'Otwórz plik';
  If OpenDialog1.Execute then
  begin
    if FileExists(OpenDialog1.FileName) then
        Edytor.Lines.LoadFromFile(OpenDialog1.FileName);
  end;
end;



procedure TFormaMain.WstawKolumneSClick(Sender: TObject);
begin
  WstawKolumneMenuClick(Sender);
end;

procedure TFormaMain.EksportXClick(Sender: TObject);
begin
  EksportSPSMenuClick(Sender);
end;

procedure TFormaMain.ExportRSPS(nazwa_pliku :string );
var
    temp_str  :string;
    wynik_str :string;
    f         :TextFile;
begin
  TabelaR.DisableControls;

  TabelaR.First;
  wynik_str := '';

  AssignFile(f,nazwa_pliku);
  Rewrite(f);
  while not TabelaR.EOF do
  begin
    wynik_str := 'R';

    temp_str := FormujUlamek(FloatToStr(TabelaR['Line']),parametry_eksportu.precyzja_line );
    wynik_str  := wynik_str + justuj(temp_str,SLINE_NUM_MANY, sLewo, ' ');

    temp_str := FormujUlamek(FloatToStr(TabelaR['STATION']), parametry_eksportu.precyzja_station);
    wynik_str := wynik_str + justuj(temp_str, SSHOT_NUM_MANY, sPrawo, ' ');

    temp_str := TabelaR['KTORY_RAZ'];   //TU JEST cHAR!!!
    wynik_str := wynik_str + temp_str ;

    temp_str := TabelaR['KOD_ODB'];
    wynik_str := wynik_str + temp_str ;

    if parametry_eksportu.statyka then
    begin
      temp_str := FormujUlamek(FloatToStr(TabelaR['STATYKA']), 0);
      wynik_str := wynik_str + justuj(temp_str, SSTATIC_MANY, sPrawo, ' ');
    end else wynik_str := wynik_str + Pomnoz_znaki(SSTATIC_MANY, ' ');


    if parametry_eksportu.glebokosc_strzelania then
    begin
      temp_str := FormujUlamek(FloatToStr(TabelaR['DEPH']), 1);
      wynik_str := wynik_str + justuj(temp_str, SDEPH_MANY, sPrawo, ' ');
    end else wynik_str := wynik_str + Pomnoz_znaki(SDEPH_MANY, ' ');

    if parametry_eksportu.datum then
    begin
      temp_str := FormujUlamek(FloatToStr(TabelaR['DATUM']), 1);
      wynik_str := wynik_str + justuj(temp_str, SDATUM_MANY, sPrawo, ' ');
    end else wynik_str := wynik_str + Pomnoz_znaki(SDATUM_MANY, ' ');

    if parametry_eksportu.czas_pionowy then
    begin
      temp_str := FormujUlamek(FloatToStr(TabelaR['UPHOLE']), 0);
      wynik_str := wynik_str + justuj(temp_str, SUPHOLE_MANY, sPrawo, ' ');
    end else wynik_str := wynik_str + Pomnoz_znaki(SUPHOLE_MANY, ' ');


    if parametry_eksportu.woda then
    begin
      temp_str := FormujUlamek(FloatToStr(TabelaR['WATER']), 1);
      wynik_str := wynik_str + justuj(temp_str, SWATER_MANY, sPrawo, ' ');
    end else wynik_str := wynik_str + Pomnoz_znaki(SWATER_MANY, ' ');

    temp_str := FormujUlamek(FloatToStr(TabelaR['EASTING']), 1);
    wynik_str := wynik_str + justuj(temp_str, S_X_MANY, sPrawo, ' ');

    temp_str := FormujUlamek(FloatToStr(TabelaR['NORTHING']), 1);
    wynik_str := wynik_str + justuj(temp_str, S_Y_MANY, sPrawo, ' ');

    temp_str := FormujUlamek(FloatToStr(TabelaR['ELEW']), 1);
    wynik_str := wynik_str + justuj(temp_str, S_ELEV_MANY, sPrawo, ' ');

    temp_str := FloatToStr(TabelaR['DAY']);
    wynik_str := wynik_str + justuj(temp_str, S_DAY_MANY, sPrawo, '0');

    temp_str := FloatToStr(TabelaR['TIME']);
    wynik_str := wynik_str + justuj(temp_str, S_TIME_MANY, sPrawo, ' ');

    writeln(f, wynik_str);

    TabelaR.Next;
    temp_str := '';
    wynik_str := '';
  end;

  TabelaR.First;
  TabelaR.EnableControls;
  CloseFile(f);
end;          {************* EXPORT R **************}




procedure TFormaMain.DolaczSPSMenuClick(Sender: TObject);
var ForemkaOtwarcia :TFormaOtwarcia;
begin
  begin
    ForemkaOtwarcia := TFormaOtwarcia.Create(Self);
    try
    ForemkaOtwarcia.ShowModal;
    if ForemkaOtwarcia.ModalResult = mrOK then
    begin
      if  (   FileExists(ForemkaOtwarcia.Edit1.Text) and FileExists(ForemkaOtwarcia.Edit2.Text)
         and (FileExists(ForemkaOtwarcia.Edit3.Text) or (ForemkaOtwarcia.Edit3.Text = ''))   )
         or
         ((ForemkaOtwarcia.Edit1.Text = '') and  (ForemkaOtwarcia.Edit2.Text = '')
         and FileExists(ForemkaOtwarcia.Edit3.Text) )
      then
      begin
        // za³aduj niezbêdne pliki
        if TEST_INTEGRALNOSCI_SPS(ForemkaOtwarcia.Edit1.Text,
                                  ForemkaOtwarcia.Edit2.Text,
                                  ForemkaOtwarcia.Edit3.Text) then
        begin
          RozlaczTabele;
          Screen.Cursor := crHourGlass;
          NazwaPlikuOtwartegoS := ForemkaOtwarcia.Edit1.Text;
          if NazwaPlikuOtwartegoS <> '' then
          begin
            TabelaS.Last;
            LadujSSPS(ApplicationPath + '\' + TEST_FILE_S);
          end;

          NazwaPlikuOtwartegoX := ForemkaOtwarcia.Edit2.Text;
          if NazwaPlikuOtwartegoX <> '' then
          begin
            TabelaX.Last;
            LadujXSPS(ApplicationPath + '\' + TEST_FILE_X);
          end;

          NazwaPlikuOtwartegoR := ForemkaOtwarcia.Edit3.Text;
          if (NazwaPlikuOtwartegoR <> '') then
          begin
             TabelaR.Last;
             LadujRSPS(ApplicationPath + '\' + TEST_FILE_R);
          end;
          WypiszTytol(ExtractFileNameOnly(ForemkaOtwarcia.Edit1.Text));
          TabelaS.First;
          Screen.Cursor := crDefault;
        end;
      end;
    end;
    finally
      ForemkaOtwarcia.Free;
      PolaczTabele;
      Screen.Cursor := crDefault;
    end;
  end;

end;

procedure TFormaMain.ToolButtonSaveClick(Sender: TObject);
begin
  if Edytor.Lines.Count <> 0 then
  begin
    if SaveDialog1.Execute then
    begin
      Edytor.Lines.SaveToFile(SaveDialog1.FileName);
    end;
  end;
end;

procedure TFormaMain.ToolButtonEraseClick(Sender: TObject);
begin
  if Application.MessageBox('Czy skasowaæ zawaroœæ edytora?',
      'Kasowanie',  mb_ICONHAND or MB_OKCANCEL) = IDOK
  then    Edytor.Lines.Clear;
end;


procedure TFormaMain.TabelaSAfterScroll(DataSet: TDataSet);
begin
 try
   BiezacyRecNaPanel;
   IloscRecNaPanel;
 except
   BiezacyRecNaPanel;
 end;
end;

procedure TFormaMain.TabelaSAfterDelete(DataSet: TDataSet);
begin
  try
    BiezacyRecNaPanel;
    IloscRecNaPanel;
  except
    BiezacyRecNaPanel;
    IloscRecNaPanel;
  end;
end;

procedure TFormaMain.TabelaSAfterInsert(DataSet: TDataSet);
begin
  try
    BiezacyRecNaPanel;
    IloscRecNaPanel;
  except
    BiezacyRecNaPanel;
    IloscRecNaPanel;
  end;
end;


function TFormaMain.TEST_INTEGRALNOSCI_SPS(nazwa_S, nazwa_X, nazwa_R :string) :boolean;
//Na pocz¹tek testuje wewnêtrzn¹ spójnoœæ SPS, bez uwzglêdniania parametrów konkretnego tematu;
// Przt³umaczone pliki binarne SPS powinny byæ wczytane do bazy.

var
    Tmp_S              :ssps_line;
    Tmp_X,Tmp_XNext    :xsps_line;
    ilosc_PS_X,
    ilosc_PS_S         :longint;
    licznik_s          :longint;
    Tmp_R              :ssps_line;
    jest               :boolean;
    tmp_str            :string;
    S,R,X              :TextFile;

    TMP_FILE_S        :  file of  ssps_line;
    TMP_FILE_X        :  file of  xsps_line;
    TMP_FILE_R        :  file of  ssps_line;


procedure Pozamykaj_pliki;
begin
  if FileExists(Nazwa_S) then CloseFile(S);
  if FileExists(Nazwa_X) then CloseFile(X);
  if FileExists(Nazwa_R) then CloseFile(R);

  CloseFile(TMP_FILE_S);
  CloseFile(TMP_FILE_X);
  CloseFile(TMP_FILE_R);
end;


begin
  AssignFile(TMP_FILE_R, ApplicationPath + '\' + TEST_FILE_R);
  Rewrite(TMP_FILE_R);

  AssignFile(TMP_FILE_X, ApplicationPath + '\' + TEST_FILE_X);
  Rewrite(TMP_FILE_X);

  AssignFile(TMP_FILE_S, ApplicationPath + '\' + TEST_FILE_S);
  Rewrite(TMP_FILE_S);

  If (FileExists(Nazwa_S) and FileExists(Nazwa_X))
  then
  begin
    try
      AssignFile(S, Nazwa_S);
      AssignFile(X, Nazwa_X);
      Reset(S);
      Reset(X);
    Except
      Application.MessageBox('B³¹d WE/WY', 'Wczytaj SPS',  mb_ICONHAND or MB_OKCANCEL) ;
      Pozamykaj_pliki;
      TEST_INTEGRALNOSCI_SPS := false;
      Exit;
    end;  //Except

    if FileExists(Nazwa_R) then
    begin
      AssignFile(R, Nazwa_R);
      Reset(R);

      while not eof(r) do
      begin
        Readln(r, tmp_str);
        while tmp_str[1] = 'H' do  Readln(r, tmp_str);      //Obcinam headre je¿eli jest

        try
          if TestPoprawnosciWierszaR(tmp_str)  then  Translate_rline(tmp_str, Tmp_R);
          WRITE(TMP_FILE_R, tmp_R);
        except
        on E:  ETranslatR do
               begin
                 WypelnijLOG('B£¥D w wierszu R ->' + E.Message);
                 WypelnijLOG(tmp_str);
                 Application.MessageBox('B£¥D podczas translacji wiersza R. Szczegó³y znajdziesz w zak³adce LOG.', 'Translacja SPS-R',  mb_ICONHAND or MB_OKCANCEL) ;
                 Pozamykaj_pliki;
                 TEST_INTEGRALNOSCI_SPS := false;
                 Exit;
               end;
        on E:  ECorrectR do
               begin
                 WypelnijLOG('B£¥D w wierszu R ->' + E.Message);
                 WypelnijLOG(tmp_str);
                 Application.MessageBox('B£¥D podczas translacji wiersza R. Szczegó³y znajdziesz w zak³adce LOG.', 'Translacja SPS-R',  mb_ICONHAND or MB_OKCANCEL) ;
                 Pozamykaj_pliki;
                 TEST_INTEGRALNOSCI_SPS := false;
                 Exit;
               end;
        end;
      end; {Pêtli while}
    end; {FileExists}


    while not eof(s) do
    begin
      Readln(s, tmp_str);
      while tmp_str[1] = 'H' do  Readln(s, tmp_str);

      try
      if   TestPoprawnosciWierszaS(tmp_str)   then  translate_sline(tmp_str, Tmp_S);
      WRITE(TMP_FILE_S, tmp_S);
      except
        on E:  ETranslatS do
               begin
                 WypelnijLOG('B£¥D w wierszu S -> ' + E.Message);
                 WypelnijLOG(tmp_str);
                 Application.MessageBox('B£¥D podczas translacji wiersza S. Szczegó³y znajdziesz w zak³adce LOG.', 'Translacja SPS-S',  mb_ICONHAND or MB_OKCANCEL) ;
                 Pozamykaj_pliki;
                 TEST_INTEGRALNOSCI_SPS := false;
                 Exit;
               end;
        on E:  ECorrectS do
               begin
                 WypelnijLOG('B£¥D w wierszu S -> ' + E.Message);
                 WypelnijLOG(tmp_str);
                 Application.MessageBox('B£¥D podczas translacji wiersza S. Szczegó³y znajdziesz w zak³adce LOG.', 'Translacja SPS-S',  mb_ICONHAND or MB_OKCANCEL) ;
                 Pozamykaj_pliki;
                 TEST_INTEGRALNOSCI_SPS := false;
                 Exit;
               end;
      end
    end ;{PÊTLI WHILE}


    while not eof(x) do
    begin
    Readln(x, tmp_str);
    while tmp_str[1] = 'H' do  Readln(x, tmp_str);     //HEADER

      try
      if  TestPoprawnosciWierszaX(tmp_str)   then Translate_xline(tmp_str, Tmp_X);
      WRITE(TMP_FILE_X, tmp_X);
      except
        on E:  ETranslatX do
               begin
                 WypelnijLOG('B£¥D w wierszu X -> ' + E.Message);
                 WypelnijLOG(tmp_str);
                 Application.MessageBox('B£¥D podczas translacji wiersza X. Szczegó³y znajdziesz w zak³adce LOG.', 'Translacja SPS-X',  mb_ICONHAND or MB_OKCANCEL) ;
                 Pozamykaj_pliki;
                 TEST_INTEGRALNOSCI_SPS := false;
                 Exit;
               end;
        on E:  ECorrectX do
               begin
                 WypelnijLOG('B£¥D w wierszu X -> ' + E.Message);
                 WypelnijLOG(tmp_str);
                 Application.MessageBox('B£¥D podczas translacji wiersza X. Szczegó³y znajdziesz w zak³adce LOG.', 'Translacja SPS-X',  mb_ICONHAND or MB_OKCANCEL) ;
                 Pozamykaj_pliki;
                 TEST_INTEGRALNOSCI_SPS := false;
                 Exit;
               end;
      end;
    end; {PÊTLI WHILE}
  end;


 ilosc_PS_S := FileSize(TMP_FILE_S);
 ilosc_PS_X := 1;

 Seek(TMP_FILE_X, 0);
 Seek(TMP_FILE_S, 0);

 if not eof(TMP_FILE_X) then
 begin
   Read(TMP_FILE_X, tmp_X);
   while not eof(TMP_FILE_X) do
   begin
     Read(TMP_FILE_X, tmp_XNext);
     if (tmp_XNext.linia <> tmp_X.linia) or (tmp_XNext.punkt <> tmp_X.punkt) or
        (tmp_XNext.indeks <> tmp_X.indeks) or (tmp_XNext.rekord <> tmp_X.rekord) then
        begin
          inc(ilosc_PS_X);
          tmp_X := tmp_XNext;
        end;
   end
 end else
 begin
   WypelnijLOG('B£¥D! Pusty zbiór X' );
   Application.MessageBox('B£¥D podczas porównania X i S. Szczegó³y znajdziesz w zak³adce LOG.', 'Porównanie S i X',  mb_ICONHAND or MB_OKCANCEL) ;
   Pozamykaj_pliki;
   TEST_INTEGRALNOSCI_SPS := false;
   Exit;
 end;

 if (ilosc_PS_S <> ilosc_PS_X) then
 begin
   WypelnijLOG('B£¥D! Ró¿na iloœæ rekordów w S i X.' );
   Application.MessageBox('B£¥D podczas porównania X i S. Test bêdzie kontynuowany. Szczegó³y znajdziesz w zak³adce LOG.', 'Porównanie S i X',  mb_ICONHAND or MB_OKCANCEL) ;
 end;


   Seek(TMP_FILE_X, 0);
   Seek(TMP_FILE_S, 0);
   licznik_s := 0;

   jest := true;
   if not eof(TMP_FILE_S) then
   begin
     read(TMP_FILE_S, tmp_S);
     inc(licznik_s);
   end
   else
   begin
     WypelnijLOG('B£¥D! Pusty zbiór S' );
     Application.MessageBox('B£¥D podczas porównania X i S. Szczegó³y znajdziesz w zak³adce LOG.', 'Porównanie S i X',  mb_ICONHAND or MB_OKCANCEL) ;
     Pozamykaj_pliki;
     TEST_INTEGRALNOSCI_SPS := false;
     Exit;
   end;


   while not eof(TMP_FILE_X) and (jest = true) do
   begin
     Read(TMP_FILE_X, tmp_X);
     if (tmp_S.linia = tmp_X.linia) and (tmp_S.punkt = tmp_X.punkt) and
         (tmp_S.indeks = tmp_X.indeks)
     then
     begin
       jest := true;
     end else
     begin
       read(TMP_FILE_S, tmp_S);
       if (tmp_S.linia = tmp_X.linia) and (tmp_S.punkt = tmp_X.punkt) and
          (tmp_S.indeks = tmp_X.indeks) then
       begin
          jest := true ;
          inc(licznik_s);
       end
       else
       begin
         jest := false
       end;
     end;
   end;

   if jest = false then
   begin
     WypelnijLOG('B£¥D! Kolejnoœæ punktów w S i X nie jest identyczna. SprawdŸ indeksy i numery punktów!' );
     WypelnijLOG('Rozbie¿noœæ dla PS:' + FloatToStr(tmp_S.linia) + ' ' + FloatToStr(tmp_S.punkt)
     + ' ' + tmp_S.indeks +  ' wiersz:' + FloatToStr(licznik_s+1) + ' oraz REKORD:' + FloatToStr(tmp_X.Rekord)+' ('+FloatToStr(tmp_X.Linia)+'/'+FloatToStr(tmp_X.punkt)+ tmp_X.indeks+')');
     Application.MessageBox('B£¥D podczas porównania X i S. Szczegó³y znajdziesz w zak³adce LOG.', 'Porównanie S i X',  mb_ICONHAND or MB_OKCANCEL) ;
     Pozamykaj_pliki;
     TEST_INTEGRALNOSCI_SPS := false;
     Exit;
   end;

 Pozamykaj_pliki;
 TEST_INTEGRALNOSCI_SPS := true;
end;                          {TFormaMain.TEST_INTEGRALNOSCI_SPS}





procedure TFormaMain.ZapiszSPSMenuClick(Sender: TObject);
begin
  TabelaS.Close; TabelaX.Close;TabelaR.Close;
  KopiujBazeDanych;
  RozlaczTabele;
  TabelaS.OPen; TabelaX.OPen;TabelaR.OPen;
  PolaczTabele;
end;

procedure TFormaMain.WczytajMenuClick(Sender: TObject);
begin
  TabelaS.Close; TabelaX.Close;TabelaR.Close;
  RozlaczTabele;
  OdzyskajBazeDanych;
  TabelaS.OPen; TabelaX.OPen;TabelaR.OPen;
  PolaczTabele;
end;

function TFormaMain.ExtractFileNameOnly(nazwa_pliku :string) :string;
var i    :byte;
    tmp  :string;

function pozycja(liczba :string) :byte;
begin
  if Pos('.', liczba) <> 0 then pozycja := Pos('.', liczba) - 1
  else pozycja := Length(liczba);
end;

function pozycja_znaku(liczba :string):byte;
var I:byte;
    tmp :byte;
begin
  tmp := 0;
  for i:= 1 to Length(Liczba) do
  if liczba[i] = '\' then tmp := i;
  pozycja_znaku := tmp;
end;

begin
  if nazwa_pliku <>'' then
  begin
    tmp := '';
    i := pozycja_znaku(nazwa_pliku) + 1;

    while (nazwa_pliku[i] <>'.') and (i <> length(nazwa_pliku)) do
    begin
         tmp := tmp + nazwa_pliku[i];
         inc(i);
    end;
  ExtractFileNameOnly := tmp;
  end else ExtractFileNameOnly := '';
end;

//GetEnvironmentVariable, GetEnvironmentStrings
// To pobiera zmienne œrodowiskowe.
procedure TFormaMain.SzukajRPopupClick(Sender: TObject);
begin
  if FindDialog1.Execute then
  begin
    if FindDialog1.FindText <> '' then
    begin
    end;
  end;

end;

procedure TFormaMain.MyOnException(Sender: TObject; E: Exception);
begin
  { Catch all unhandled exceptions here. }
  { Display the message that VCL generated. }
  Application.ShowException(E);
end;



procedure TFormaMain.ToolButtonSearchClick(Sender: TObject);
begin
  FindDialog1.Position := Point(Edytor.Left, Edytor.Top);
  FindDialog1.Execute;
end;


procedure TFormaMain.FindDialog1Find(Sender: TObject);
var FoundAt: LongInt;
    StartPos, ToEnd: integer;

begin
  with edytor do
  begin
  if SelLength <> 0 then    StartPos := SelStart + SelLength
  else     StartPos := 0;
  ToEnd := Length(Text) - StartPos;

  FoundAt := FindText(FindDialog1.FindText, StartPos, ToEnd, [stMatchCase]);
  if FoundAt <> -1 then
  begin
    SetFocus;
    SelStart := FoundAt;
    SelLength := Length(FindDialog1.FindText);
  end;
  end; //with
end;

procedure TFormaMain.Scalpliki1Click(Sender: TObject);
var ScalForma :TFormaScalaj;
begin
    ScalForma := TFormaScalaj.Create(Self);
  try
    ScalForma.ShowModal;
  finally
    ScalForma.Free;
  end;

end;




procedure TFormaMain.TestujSPSMenuClick(Sender: TObject);
var OpcjeTestow :TPagesDlg;

procedure InicjujListeZrodel;
var tempek  :integer;
begin
  DBGrid1.Columns[4].PickList.Clear;
  for tempek := 0 to ilosc_znakow(',', Param.LegalIndexes)
  do
  begin
        DBGrid1.Columns[4].PickList.Add(Pobierz_element(Param.LegalIndexes, tempek +1));
  end;
end;

begin
    OpcjeTestow := TPagesDlg.Create(Self);
    try
      OpcjeTestow.ShowModal;
    finally
      OpcjeTestow.Free;
      // wstawiam indeksy do PickListy
      InicjujListeZrodel;
    end;

end;


procedure TFormaMain.TabelaSIDENT_SValidate(Sender: TField);
begin
  if kontrola_poprawnosci then
  begin
  if TabelaS.FieldByName('IDENT_S').Value <> 'S' then
     raise Exception.Create('Znak musi byæ "S"');
  end;
end;

procedure TFormaMain.TabelaSDAYValidate(Sender: TField);
begin
  if kontrola_poprawnosci then
  begin
  if TabelaS.FieldByName('DAY').Value = null then
     raise Exception.Create('Wartoœæ nie mo¿e byæ ³añcuchem pustym')
  else

  if not TestDaty(TabelaS['DAY']) then
     raise Exception.Create('Nieprawid³owy numer dnia w roku');
  end;
end;      

procedure TFormaMain.TabelaSTIMEValidate(Sender: TField);
begin
  if kontrola_poprawnosci then
  begin
  if TabelaS.FieldByName('TIME').Value = null then
     raise Exception.Create('Wartoœæ nie mo¿e byæ ³añcuchem pustym')
  else
  if not TestGodziny(TabelaS['TIME']) then
     raise Exception.Create('Nieprawid³owa wartoœæ godziny');
  end;
end;

procedure TFormaMain.TabelaSKOD_ZRODLAValidate(Sender: TField);
begin
  if kontrola_poprawnosci then
  begin
  if TabelaS.FieldByName('KOD_ZRODLA').Value = null then
     raise Exception.Create('Wartoœæ nie mo¿e byæ ³añcuchem pustym')
  else
  if not TestKoduLadunku(TabelaS['KOD_ZRODLA']) then
     raise Exception.Create('Nie zdefiniowano kodu ³adunku');
  end;
end;

procedure TFormaMain.TabelaSUPHOLEValidate(Sender: TField);
begin
  if kontrola_poprawnosci then
  begin
  if TabelaS.FieldByName('UPHOLE').Value = null then
     raise Exception.Create('Wartoœæ nie mo¿e byæ ³añcuchem pustym')
  end;
end;

procedure TFormaMain.TabelaSWATERValidate(Sender: TField);
begin
  if kontrola_poprawnosci then
  begin
  if TabelaS.FieldByName('WATER').Value = null then
       raise Exception.Create('Wartoœæ nie mo¿e byæ ³añcuchem pustym')
  end;
end;

procedure TFormaMain.TabelaSDEPHValidate(Sender: TField);
begin
  if kontrola_poprawnosci then
  begin
  if TabelaS.FieldByName('DEPH').Value = null then
     raise Exception.Create('Wartoœæ nie mo¿e byæ ³añcuchem pustym');
  if (TabelaS.FieldByName('DEPH').Value < Param.MinDeph) or
     (TabelaS.FieldByName('DEPH').Value > Param.MaxDeph)
  then
      raise Exception.Create('Wartoœæ spoza zakresu');
  end;
end;

procedure TFormaMain.TabelaSDATUMValidate(Sender: TField);
begin
  if kontrola_poprawnosci then
  begin
  if TabelaS.FieldByName('DATUM').Value = null then
     raise Exception.Create('Wartoœæ nie mo¿e byæ ³añcuchem pustym')
  else
  if Param.DatumCheck = false then
     raise Exception.Create('Zadeklarowno sta³y poziom odniesienia');
  end;
end;

procedure TFormaMain.TabelaSSTATYKAValidate(Sender: TField);
begin
  if kontrola_poprawnosci then
  begin
  if TabelaS.FieldByName('STATYKA').Value = null then
     raise Exception.Create('Wartoœæ nie mo¿e byæ ³añcuchem pustym');

  if (TabelaS.FieldByName('STATYKA').Value < Param.MinStat) or
     (TabelaS.FieldByName('STATYKA').Value > Param.MaxStat)
  then raise Exception.Create('Wartoœæ spoza zakresu')
  end;
end;

procedure TFormaMain.TabelaSEASTINGValidate(Sender: TField);
begin
  if kontrola_poprawnosci then
  begin
  if TabelaS.FieldByName('EASTING').Value = null then
     raise Exception.Create('Wartoœæ nie mo¿e byæ ³añcuchem pustym')
  end;
end;

procedure TFormaMain.TabelaSNORTHINGValidate(Sender: TField);
begin
  if kontrola_poprawnosci then
  begin
  if TabelaS.FieldByName('NORTHING').Value = null then
     raise Exception.Create('Wartoœæ nie mo¿e byæ ³añcuchem pustym')
  end;
end;

procedure TFormaMain.TabelaSELEWValidate(Sender: TField);
begin
  if kontrola_poprawnosci and Param.GeodezjaTest then
  begin
  if TabelaS.FieldByName('ELEW').Value = null then
     raise Exception.Create('Wartoœæ nie mo¿e byæ ³añcuchem pustym');
  if (TabelaS.FieldByName('ELEW').Value > Param.MaxElev) or
     (TabelaS.FieldByName('ELEW').Value < Param.MinElev) then
     raise Exception.Create('Wartoœæ spoza zakresu');
  end;
end;

procedure TFormaMain.KontrolaEdycjiItemClick(Sender: TObject);
begin
  if KontrolaEdycjiItem.Checked = true then
  begin
    kontrola_poprawnosci := false ;
    KontrolaEdycjiItem.Checked := false;
  end
  else
  begin
    kontrola_poprawnosci := true;
    KontrolaEdycjiItem.Checked := true;
  end;
  if kontrola_poprawnosci = false then StatusBar1.Panels[3].text := 'Brak kontroli poprawnoœci'
  else StatusBar1.Panels[3].text := '';
end;

procedure TFormaMain.WypelnijLOG(komunikat :string);
begin
  LOG.Lines.Add(komunikat);
end;




procedure TFormaMain.TranslujGeodezjeDoBIN(NazwaPlikuWE, NazwaPlikuWY :string);
var
    Wejsciowy  :textFile;
    Filek      :file of Dane5Reali;
    TempReal   :Dane5Reali;
    TempStr    :String;

begin
   try
     AssignFile(Wejsciowy, NazwaPlikuWE);
     Reset(Wejsciowy);
   except
     ShowMessage('B³¹d podczas otwierania pliku!');
     Exit;
   end;

  try
    AssignFile(Filek, NazwaPlikuWY);
    Rewrite(Filek);
  except
    ShowMessage('B³¹d podczas otwierania pliku!');
    Exit;
  end;

   while not eof(wejsciowy) do
   begin
     readln(wejsciowy, TempStr);
     try
       TempReal.Linia := StrToFloat(Trim(Kolumna(TempStr,1)));
       TempReal.stacja := StrToFloat(Trim(Kolumna(TempStr,2)));
       TempReal.x := StrToFloat(Trim(Kolumna(TempStr,3)));
       TempReal.y := StrToFloat(Trim(Kolumna(TempStr,4)));
       TempReal.z := StrToFloat(Trim(Kolumna(TempStr,5)));
       write(Filek, TempReal);
     except
       ShowMessage('B³¹d podczas translacji pliku geodezyjnego');
       CloseFile(Wejsciowy);
       CloseFile(Filek);
       Exit;
     end;
   end;

   CloseFile(Wejsciowy);
   CloseFile(Filek);

end;

function TFormaMain.ZnajdzGeodezjeWBIN(NazwaPliku :string;  Linia, Stacja :real;
         var wynik_k :Dane5Reali):boolean;
var TempBin    :Dane5Reali;
    Filek      :file of Dane5Reali;
    Jest       :boolean;

begin
   jest := false;
   AssignFile(Filek, NazwaPliku);
   Reset(Filek);
   while (not Eof(Filek)) and (jest = false) do
   begin
     read(Filek, TempBin);
     if (TempBin.Linia = Linia) and (TempBin.stacja = Stacja)
     then
     begin
       wynik_k := TempBin;
       ZnajdzGeodezjeWBIN := true;
       closeFile(Filek);
       exit;
     end;
   end;
   ZnajdzGeodezjeWBIN := false;
   CloseFile(Filek);
end;

procedure TFormaMain.AktualizujGeodezjeClick(Sender: TObject);
begin
  kontrola_poprawnosci := false;
  IF EdytorSPS.ActivePage = RTabSheet then AktualizujGeodezjeR;
  IF EdytorSPS.ActivePage = SSPS then AktualizujGeodezjeS;
  kontrola_poprawnosci := true;
end;



procedure TFormaMain.AktualizujGeodezjeS;
var
    TempReal           :Dane5Reali ;
    SavePlace          : TBookmark;
begin
  if TabelaS.RecordCount = 0 then
  begin
    ShowMessage('Brak rekordów!');
    Exit;
  end;
  OpenDialog1.Title := 'Otwórz plik z geodezj¹ w formacie LINE STATION Easting Northing Elev';
  OpenDialog1.InitialDir := ExtractFileDir(NazwaPlikuOtwartegoS);
  if OpenDialog1.Execute then
  begin
    if FileExists(OpenDialog1.FileName) then
    begin
      TranslujGeodezjeDoBIN(OpenDialog1.FileName, ApplicationPath + '\' + 'Geod.tmp');
      RozlaczTabele;
      SavePlace  := TabelaS.GetBookmark;
      TabelaS.DisableControls;
      TabelaS.First;
      Screen.Cursor := crHourGlass;
      while not TabelaS.EOF do
      begin
        TabelaS.Edit;
        TabelaS['Easting'] := 0.0;
        TabelaS['Northing'] := 0.0;
        TabelaS['Elew'] := 0.0;
        if ZnajdzGeodezjeWBIN( ApplicationPath + '\' + 'Geod.tmp',
           TabelaS['line'],TabelaS['Station'], TempReal)
        then
        begin
          TabelaS['Easting'] := TempReal.x;
          TabelaS['Northing'] := TempReal.y;
          TabelaS['Elew'] := TempReal.z;
          TabelaS.Post;
        end;
        TabelaS.Next;
      end;
    TabelaS.GotoBookmark(SavePlace);
    TabelaS.FreeBookmark(SavePlace);
    end;
  end;
  Screen.Cursor := crDefault;
  TabelaS.EnableControls;
  PolaczTabele;
end;

procedure TFormaMain.AktualizujGeodezjeR;
var
    TempReal           :Dane5Reali ;
    SavePlace          : TBookmark;
begin
  if TabelaR.RecordCount = 0 then
  begin
    ShowMessage('Brak rekordów!');
    Exit;
  end;
  OpenDialog1.Title := 'Otwórz plik z geodezj¹ w formacie LINE STATION Easting Northing Elev';
  OpenDialog1.InitialDir := ExtractFileDir(NazwaPlikuOtwartegoS);
  if OpenDialog1.Execute then
  begin
    if FileExists(OpenDialog1.FileName) then
    begin
      TranslujGeodezjeDoBIN(OpenDialog1.FileName, ApplicationPath + '\' + 'Geod.tmp');
      SavePlace  := TabelaR.GetBookmark;
      TabelaR.DisableControls;
      TabelaR.First;
      Screen.Cursor := crHourGlass;
      while not TabelaR.EOF do
      begin
        TabelaR.Edit;
        TabelaR['Easting'] := 0.0;
        TabelaR['Northing'] := 0.0;
        TabelaR['Elew'] := 0.0;
        if ZnajdzGeodezjeWBIN( ApplicationPath + '\' + 'Geod.tmp',
           TabelaR['line'],TabelaR['Station'], TempReal)
        then
        begin
          TabelaR['Easting'] := TempReal.x;
          TabelaR['Northing'] := TempReal.y;
          TabelaR['Elew'] := TempReal.z;
          TabelaR.Post;
        end;
        TabelaR.Next;
      end;
    TabelaR.GotoBookmark(SavePlace);
    TabelaR.FreeBookmark(SavePlace);
    end;
  end;
  Screen.Cursor := crDefault;
  TabelaR.EnableControls;
end;

procedure TFormaMain.WypiszTytol(Komunikat :string);
begin
  FormaMain.Caption := 'Edycja SPS (' + Komunikat + ')';
end;

procedure TFormaMain.UsunLinieZXClick(Sender: TObject);
begin
  UsunAktywnaLinieOdbioruNaRozstawie(12);
end;




procedure TFormaMain.KopiaToWierszX(Kopia  :PKopiaX);
begin
  TabelaX['ind'] := Kopia.ind              ;
  TabelaX['ile_szt'] := Kopia.ile_szt            ;
  TabelaX['X']     := Kopia.X              ;
  TabelaX['tasma']   := Kopia.tasma             ;
  TabelaX['rekord']  := Kopia.rekord              ;
  TabelaX['numeracja']  := Kopia.numeracja           ;
  TabelaX['aparatura'] := Kopia.aparatura            ;
  TabelaX['line']       := Kopia.line           ;
  TabelaX['station' ]  := Kopia.station             ;
  TabelaX['ktory_raz']  := Kopia.ktory_raz            ;
  TabelaX['od']       := Kopia.od_kanalu              ;
  TabelaX['do']       := Kopia.do_kanalu              ;
  TabelaX['Krok_kan']  := Kopia.Krok_kan             ;
  TabelaX['Linia' ]   := Kopia.Linia               ;
  TabelaX['skad']      := Kopia.skad                ;
  TabelaX['dokad']      := Kopia.dokad                ;
  TabelaX['indeks_odb']  := Kopia.indeks_odb                ;
end;

procedure TFormaMain.KopiujXDoZmiennej(WierszXToKopia :PKopiaX);
var s     :string;
begin
  WierszXToKopia^.ind           :=  TabelaX['ind'];
  WierszXToKopia^.ile_szt       :=  TabelaX['ile_szt'] ;
  s :=  TabelaX['X'      ];
  WierszXToKopia^.X             :=  s[1] ;
  WierszXToKopia^.tasma         :=  TabelaX['tasma'  ] ;
  WierszXToKopia^.rekord        :=  TabelaX['rekord' ] ;
  WierszXToKopia^.numeracja     :=  TabelaX['numeracja'] ;
  s :=    TabelaX['aparatura'];
  WierszXToKopia^.aparatura     :=  s[1];
  WierszXToKopia^.line          :=  TabelaX['line'    ]  ;
  WierszXToKopia^.station       :=  TabelaX['station' ]  ;
  s :=   TabelaX['ktory_raz'];
  WierszXToKopia^.ktory_raz     := s[1] ;
  WierszXToKopia^.od_kanalu     :=  TabelaX['od'     ]   ;
  WierszXToKopia^.do_kanalu     :=  TabelaX['do'     ]   ;
  WierszXToKopia^.Krok_kan      :=  TabelaX['Krok_kan']  ;
  WierszXToKopia^.Linia         :=  TabelaX['Linia'   ]  ;
  WierszXToKopia^.skad          :=  TabelaX['skad'    ]   ;
  WierszXToKopia^.dokad         :=  TabelaX['dokad'   ]  ;
  s :=  TabelaX['indeks_odb'] ;
  WierszXToKopia^.indeks_odb    :=  s[1];
end;



procedure TFormaMain.XLineToXSPSLine(TabelaX :TTable; wskaz : Pxsps_line) ;
var   s                    :string;
begin
  s :=  TabelaX['X'];
  wskaz^.identyfikator := s[1];
  wskaz^.tasma         := TabelaX['tasma'];
  wskaz^.rekord        := TabelaX['rekord'];
  wskaz^.numeracja     := TabelaX['numeracja'];
  s :=  TabelaX['aparatura'];
  wskaz^.aparatura     := s[1];
  wskaz^.linia         := TabelaX['line'];
  wskaz^.punkt         := TabelaX['station'];
  s :=  TabelaX['ktory_raz'];
  wskaz^.indeks        := s[1];
  wskaz^.od_kanalu     := TabelaX['od'];
  wskaz^.do_kanalu     := TabelaX['do'];
  wskaz^.step_chan     := TabelaX['Krok_kan'];
  wskaz^.linia_odb     := TabelaX['Linia'];
  wskaz^.od_odbior     := TabelaX['skad'];
  wskaz^.do_odbior     := TabelaX['dokad'];
   s :=  TabelaX['indeks_odb'];
  wskaz^.indeks_odb    := s[1];
end;





procedure TFormaMain.XSPSLineToXLine(Wskaz :Pxsps_line);
var s:string;
begin
  with TabelaX do
  begin
  Edit;
  FieldByName('X').AsString      := Wskaz.identyfikator;
  FieldByName('tasma').AsInteger := Wskaz.tasma;
  FieldByName('rekord').AsFloat := Wskaz.rekord;
  FieldByName('numeracja').AsInteger := Wskaz.numeracja;
  FieldByName('aparatura').AsString := Wskaz.aparatura;
  FieldByName('line').AsFloat := Wskaz.linia;
  FieldByName('station').AsFloat := Wskaz.punkt;
  FieldByName('ktory_raz').AsString := Wskaz.indeks;
  FieldByName('od').AsFloat := Wskaz.od_kanalu;
  FieldByName('do').AsFloat := Wskaz.do_kanalu;
  FieldByName('Krok_kan').AsInteger := Wskaz.step_chan;
  FieldByName('Linia').AsFloat := Wskaz.linia_odb;
  FieldByName('skad').AsFloat := Wskaz.od_odbior;
  FieldByName('dokad').AsFloat := Wskaz.do_odbior;
  s := Wskaz.indeks_odb;
  FieldByName('indeks_odb').AsString := s[1];
  end;
end;

procedure TFormaMain.SLineToSSPSLine(wskaz : Pssps_line) ;    //ssps_line -> wiersz S
var   s                    :string;
begin
  s :=  TabelaS['ident_s'];
  wskaz^.identyfikator      := s[1] ;
  wskaz^.linia              := TabelaS['line'];
  wskaz^.punkt              := TabelaS['station'];
  s :=  TabelaS['ktory_raz'];
  wskaz^.indeks             := s[1];
  wskaz^.kod_pkt            := TabelaS['kod_zrodla'];
  wskaz^.statyka            := TabelaS['deph'];
  wskaz^.deph               := TabelaS['uphole'];
  wskaz^.datum              := TabelaS['datum'];
  wskaz^.uphole             := TabelaS['statyka'];
  wskaz^.water              := TabelaS['water'];
  wskaz^.x                  := TabelaS['easting'];
  wskaz^.y                  := TabelaS['northing'];
  wskaz^.elewacja           := TabelaS['elew'];
  wskaz^.dzien              := TabelaS['day'];
  wskaz^.czas               := TabelaS['time'];
end;

procedure TFormaMain.SSPSLineToSLine(Wskaz :Pssps_line);// ssps_line -> wiersz
begin
  with TabelaS do
  begin
    FieldByName('ident_s').AsString        := Wskaz.identyfikator;
    FieldByName('line').AsFloat            := Wskaz.linia;
    FieldByName('station').AsFloat         := Wskaz.punkt;
    FieldByName('ktory_raz').AsString      := Wskaz.indeks;
    FieldByName('kod_zrodla').AsString     := Wskaz.kod_pkt;
    FieldByName('deph').AsFloat            := Wskaz.deph;
    FieldByName('uphole').AsFloat          := Wskaz.uphole;
    FieldByName('datum').AsFloat           := Wskaz.datum;
    FieldByName('statyka').AsInteger       := Wskaz.statyka;
    FieldByName('water').AsFloat           := Wskaz.water;
    FieldByName('easting').AsFloat         := Wskaz.x;
    FieldByName('northing').AsFloat        := Wskaz.y;
    FieldByName('elew').AsFloat            := Wskaz.elewacja;
    FieldByName('day').AsInteger           := Wskaz.dzien;
    FieldByName('time').AsFloat            := Wskaz.czas;
  end;
end;




procedure TFormaMain.AktywujDrukowanie(Sender: TObject);
begin
  if (EdytorSPS.ActivePage = LOGSheet) or (EdytorSPS.ActivePage = EdytorTabSheet)
  then  Drukuj1.Enabled := true
         else  Drukuj1.Enabled := false;
end;

procedure TFormaMain.Drukuj1Click(Sender: TObject);
begin
  if PrintDialog1.Execute then
  begin
   if (EdytorSPS.ActivePage = LOGSheet) or (Sender = LOGSheet) then
   begin
     LOG.Print('Drukowanie zawartoœci zak³adki LOG');
   end else
   if (EdytorSPS.ActivePage = EdytorTabSheet)  or (Sender =EdytorTabSheet) then
   begin
     LOG.Print('Drukowanie zawartoœci zak³adki Edytor');
   end;
  end;
end;

procedure TFormaMain.EdytorSPSChange(Sender: TObject);
begin
  AktywujDrukowanie(Sender);
end;

procedure TFormaMain.Opcjewydruku1Click(Sender: TObject);
begin
  PrinterSetupDialog1.Execute;
end;


function TFormaMain.CzyJestPS(const Linia, stacja :real; raz  :STRING):boolean;
//Sprawdza istnienie numeru PS. Gry Raz = '', to nie interesuje go indeks
var wynik  :variant;
    macierz :variant;
begin
  wynik := 0;
  macierz := VarArrayCreate([0,2], varVariant);
  macierz[0] := Linia;
  macierz[1] := Stacja;
  macierz[2] := raz;
  if raz <> '' then
  begin
    wynik := TabelaS.Lookup('Line;Station;Ktory_raz', Macierz, 'Ile_szt');
  end else
  begin
    wynik := TabelaS.Lookup('Line;Station',VarArrayOf([Linia,Stacja]), 'Ile_szt');
  end;

  if wynik <> null then CzyJestPS := true else CzyJestPS := false;
end;


function TFormaMain.IleNumerowPowtorzonych(linia, stacja :real) :word;
//okresla, czy istnieje PS, ktory nie jest na miejscu 'ile_szt'. Je¿eli raz = '', ignoruje go
begin
  SortujQuery.SQL.Clear;
  if SortujQuery.DataSource = DataSource1
  then SortujQuery.SQL.Add('select * from spss.dbf where line=:war1 and station=:war2')
  else
  if SortujQuery.DataSource = DataSource2
  then SortujQuery.SQL.Add('select * from spsx.dbf where line=:war1 and station=:war2')
  else
  if SortujQuery.DataSource = DataSource3
  then SortujQuery.SQL.Add('select * from spsr.dbf where line=:war1 and station=:war2');
  SortujQuery.ParamByName('war1').ASFloat :=  linia;
  SortujQuery.ParamByName('war2').ASFloat :=  stacja;

  SortujQuery.Open;
  IleNumerowPowtorzonych := SortujQuery.RecordCount;
  SortujQuery.Close;
end;


procedure TFormaMain.Testuj1Click(Sender: TObject);
{var  PierwszaLiniaWX,
     PierwszaLiniaWR,
     PierwszyKanalWX ;

}
procedure WypiszTestyNieRobione;    //do LOG zaraz za nag³ówkiem
begin
end;

procedure  TestujSWierszS(Param :PTestyDoZrobienia); //Zawsze aktualny
var //c   :string[2];
    c   :char;
    int :integer;
    znaczek      :string[1];
    PierwszaLinia, PierwszyKanal, X0, Y0, DeltaX, DeltaY, Azymut_LO :real;
    x_wynik, y_wynik :real;
    temp_str         :string;


begin
//TestGeodezjiXY(wartoscX, wartoscY :real) :boolean;
  X0 := Param.Eastingowa;
  Y0 := Param.Northingowa;
  DeltaX := Param.ZmianaLine/Param.ZmianaOLine;
  DeltaY := Param.ZmianaStation/Param.ZmianaOStation;;
  Azymut_LO  := Param.Azymut;
  temp_str := Param.PunktWiazania;
  PierwszaLinia := StrToFloat(Trim(copy(temp_str, 1, Pos('/',temp_str)-1)));
  PierwszyKanal := StrToFloat(Trim(copy(temp_str, Pos('/',temp_str)+1,Length(temp_str))));


  if Param.GeodezjaTest then
     if not TestElewacji(TabelaS['ELEW'], Param.MinElev, Param.MaxElev)
     then WypelnijLOG('UWAGA! nieprawid³owa elewacja dla SPS-S: ' + IntToStr(TabelaS.RecNo));

  if Param.NumerGeodTest then
  begin
     NumerNaWspolrzedna(TabelaS['LINE'], TabelaS['STATION'],
                           PierwszaLinia, PierwszyKanal, X0, Y0, DeltaX, DeltaY, Azymut_LO,
                           x_wynik, y_wynik);
     if Odleglosc(x_wynik, y_wynik, TabelaS['Easting'],TabelaS['Northing']) > Param.OdPalikaS
     then
     begin
       X0 :=  TabelaS['LINE']   ;
       Y0 :=  TabelaS['STATION'];
       WypelnijLOG('UWAGA! Zbyt du¿a odleg³oœæ od palika: Wiersz ' + FloatToStr(TabelaS['Ind'])+
                      ' PS:' + FloatToStr(X0) + '/' + FloatToStr(Y0));
     end;
  end;

  SortujQuery.DataSource := DataSource1;
  int := IleNumerowPowtorzonych(TabelaS['LINE'], TabelaS['STATION']);
  if int <> 1 then
     WypelnijLOG('B£¥D: powtórzony numer punktu z wiersza: ' + IntToStr(TabelaS.RecNo) +
                    '   (' + IntToStr(int)+') razy');

  znaczek := TabelaS['KTORY_RAZ'];

  if not TestKrotnosci(znaczek) then        WypelnijLOG('B£¥D: nieprawid³owy znak krotnoœci w SPS-S: ' + znaczek + ' wiersz:' + IntToStr(TabelaS.RecNo));

  if Param.ZrodloTest then
  begin
    c :=  OneCharakterStrToChar(TabelaS['ident_s'], 1);

    if not TestujPierszyZnakS(c) then
       WypelnijLOG('B£¥D: nieprawid³owy znak dla SPS-S: ' + IntToStr(TabelaS.RecNo));
       if not TestKoduLadunku(TabelaS['KOD_ZRODLA'])
       then WypelnijLOG('B£¥D: nie zdefiniowane Ÿród³o w wierszu: ' + IntToStr(TabelaS.RecNo));

    if not CzyDobryTypZrodla(TabelaS['KOD_ZRODLA'], Param.Zrodlo)
       then WypelnijLOG('B£¥D: nieprawid³owe Ÿród³o w wierszu: ' + IntToStr(TabelaS.RecNo));


    if ((UpCase(c) = 'V') or (Param.Zrodlo = WIBRATOR)) and (TabelaS['UPHOLE'] > 0)
       then WypelnijLOG('UWAGA! Podano czas pionowy dla Ÿród³a powierzchniowego w wierszu : ' + FloatToStr(TabelaS.RecNo));
  end;

//UWAGA ! Do ISW nale¿y dodaæ klucz STATYKA TEST

  if Param.MetodykaTest then
     begin
       if not CzyDobryTypZrodla(TabelaS['KOD_ZRODLA'], Param.Zrodlo)
       then WypelnijLOG('B£¥D: nieprawid³owy typ Ÿród³a w wierszu: '
                                         + IntToStr(TabelaS.RecNo) );
       end;

  if Param.CzasTest then
     if not TestDaty(TabelaS['DAY']) then WypelnijLOG('B£¥D: nieprawid³owa data w wierszu: ' +
                                          IntToStr(TabelaS.RecNo));

  if Param.CzasTest then
     if not TestGodziny(TabelaS['TIME']) then WypelnijLOG('B£¥D: nieprawid³owa godzina w wierszu: '
                                         + IntToStr(TabelaS.RecNo) );

end;//TestujWierszS


procedure  TestujS;
var SavePlace     :TBookmark;
    PrevS,
    NextS         :TKopiaS;
begin
  if TabelaS.RecordCount <> 0 then
  begin
    SavePlace  := TabelaS.GetBookmark;


  if Param.StatykaTest then
  begin //---------------------
    SortujQuery.Close;
    SortujQuery.SQL.Clear;

    SortujQuery.DataSource := DataSource1;

    SortujQuery.SQL.Add('select Line,  Station, Statyka from spss.dbf where Statyka < :war1 or statyka >:war2');
    SortujQuery.ParamByName('war1').ASFloat :=  Param.MinStat;
    SortujQuery.ParamByName('war2').ASFloat :=  Param.MaxStat;

    SortujQuery.Open;

    if SortujQuery.RecordCount <> 0 then
       WypelnijLOG('Nieprawidlowe wartosci  poprawek statycznych (SPS-S):');
    while not SortujQuery.EOF do
       begin
       WypelnijLOG( FloatToStr(SortujQuery.FieldbyName('LINE').AsFloat) + ':' +
                 FloatToStr(SortujQuery.FieldbyName('STATION').AsFloat) + '-'+
                 FloatToStr(SortujQuery.FieldbyName('STATYKA').AsFloat));
       SortujQuery.Next;
       end;
    SortujQuery.Close;
  end;// ----------------------



    TabelaS.First;
    while (TabelaS.RecNo < TabelaS.RecordCount)  do
     begin
       TestujSWierszS(@Param);
       PrevS.TabelaDoKopia(TabelaS);
       TabelaS.Next;
       NextS.TabelaDoKopia(Tabelas);

       if not TestujPrzyrostCzasu(PrevS.day, NextS.day, NextS.time, PrevS.time)
          then WypelnijLOG('B£¥D: nieprawid³owy przyrost czasu w wierszu: '
                                         + IntToStr(TabelaS.RecNo) );
       if not (Param.DatumCheck = false) and (PrevS.datum <> NextS.datum)
          then WypelnijLOG('B£¥D: zadeklarowano sta³y poziom odniesienia wiersz: '
                                         + IntToStr(TabelaS.RecNo -1) );
     end;
    TabelaS.GotoBookmark(SavePlace);
    TabelaS.FreeBookmark(SavePlace);
  end     // RecordCount
  else raise Exception.Create('    Baza SPS-S jest pusta!!!   ');
end;




procedure  TestujRWierszR(Param :PTestyDoZrobienia); //Zawsze aktualny
var c   :char;
    int :integer;
begin
//TestGeodezjiXY(wartoscX, wartoscY :real) :boolean;

  if Param.GeodezjaTest then
     if not TestElewacji(TabelaR['ELEW'], Param.MinElev, Param.MaxElev)
     then WypelnijLOG('B£¥D: nieprawid³owa elewacja dla SPS-R: ' + IntToStr(TabelaR.RecNo));

  SortujQuery.DataSource := DataSource3;
  int := IleNumerowPowtorzonych(TabelaR['LINE'], TabelaR['STATION']);
  if int <> 1 then
     WypelnijLOG('B£¥D: powtórzony numer punktu z wiersza SPS-R: ' + IntToStr(TabelaR.RecNo) +
                    '   (' + IntToStr(int)+') razy');

  if Param.ZrodloTest then
  begin
    c :=  OneCharakterStrToChar(TabelaR['ident_s'],1);
    if not TestujPierszyZnakR(c) then
       WypelnijLOG('B£¥D: nieprawid³owy znak identyfikuj¹cy SPS-R w wierszu: ' + IntToStr(TabelaR.RecNo));

  end;

//UWAGA ! Do ISW nale¿y dodaæ klucz STATYKA TEST

  if Param.StatykaTest then
     if not TestPoprawkiStatycznej(TabelaR['STATYKA'], Param.MinStat,Param.MaxStat) then
     WypelnijLOG('UWAGA: nieprawid³owy wartoœæ poprawki statycznej SPS-R: ' + IntToStr(TabelaR.RecNo));


END;


procedure  TestujR;
var SavePlace     :TBookmark;
    PrevR,
    NextR         :TKopiaR;
begin
  if TabelaR.RecordCount <> 0 then
  begin


  if Param.StatykaTest then
  begin //---------------------
    SortujQuery.Close;
    SortujQuery.SQL.Clear;

    SortujQuery.DataSource := DataSource3;

    SortujQuery.SQL.Add('select Line,  Station, Statyka from spsr.dbf where Statyka < :war1 or statyka >:war2');
    SortujQuery.ParamByName('war1').ASFloat :=  Param.MinStat;
    SortujQuery.ParamByName('war2').ASFloat :=  Param.MaxStat;

    SortujQuery.Open;

    if SortujQuery.RecordCount <> 0 then
       WypelnijLOG('Nieprawidlowe wartosci  poprawek statycznych (SPS-R):') ;

    while not SortujQuery.EOF do
       begin
       WypelnijLOG( FloatToStr(SortujQuery.FieldbyName('LINE').AsFloat) + ':' +
                 FloatToStr(SortujQuery.FieldbyName('STATION').AsFloat) + '-'+
                 FloatToStr(SortujQuery.FieldbyName('STATYKA').AsFloat));
       SortujQuery.Next;
       end;
    SortujQuery.Close;
    end;// ----------------------



    SavePlace  := TabelaR.GetBookmark;
    TabelaR.First;
    while (TabelaR.RecNo < TabelaR.RecordCount)  do
     begin
       TestujRWierszR(@Param);
       Prevr.TabelaDoKopia(TabelaR);
       TabelaR.Next;
       NextR.TabelaDoKopia(TabelaR);

       if Param.BrakKanalowTest then
       begin
         if (PrevR.line = NextR.Line) and ((NextR.station - PrevR.station) <> Param.StepNumChanel)
            then WypelnijLOG('UWAGA: Brak ' + IntToStr(trunc((NextR.station - PrevR.station)) div Param.StepNumChanel-1) +
             ' kana³ów');
         // Sprawdzam czy zadeklarowane kana³y w skipie s¹ rzeczywiœcie usuniête
       end
       //Indeksy G1, G2
     end;
    TabelaR.GotoBookmark(SavePlace);
    TabelaR.FreeBookmark(SavePlace);
  end     // RecordCount

  else ShowMessage('    Baza SPS-R jest pusta!!!   ');

end;

procedure  TestujSX;
begin
// W zasadzie jest ten test zbedny, bo baza jest zbudowana.
end;

procedure  TestujXR;
begin
  MaxMinKanaly; //Sprawdza SPS-X minim i max kanaly
end;

procedure  DolaczNaglowekTestu;
begin
end;



begin                                     //******************************
  if kontrola_poprawnosci then
  begin
    try
      DolaczNaglowekTestu;

      RozlaczTabele;
      Screen.Cursor := crHourGlass;
      TabelaS.DisableControls;
      TabelaX.DisableControls;
      TabelaR.DisableControls;
      CanRecNaPanel := false;
      CanIlRecNaPanel := false;
      ZapiszKopieSDoPlikuTmp(PlikS);
      TestujS;
//      ZapiszTabeleXDoPlikuTmp(ApplicationPath+'\x.tmp');
      ZapiszKopieXDoPlikuTmp(PlikX);
      TestujX;
      ZapiszKopieRDoPlikuTmp(PlikR);
      TestujR;
      TestujS;
      TestujSX;
      TestujXR;

      Screen.Cursor := crDefault;
      TabelaS.EnableControls;
      TabelaX.EnableControls;
      TabelaR.EnableControls;
      PolaczTabele;
      ShowMessage('     Wynik testów znajduje siê w zak³adce LOG     ');
      EdytorSPS.ActivePage := LOGSheet;
      CanRecNaPanel := true;
      CanIlRecNaPanel := true;
    except
      TabelaS.EnableControls;
      TabelaX.EnableControls;
      CanRecNaPanel := true;
      CanIlRecNaPanel := true;
      PolaczTabele;
      Screen.Cursor := crDefault;
      ShowMessage('     B³¹d podczas testów     ');
    end;
  end else ShowMessage('     Nie wykonano testu SPS     ');
end;
{
  procedure SSPSLineToSLine(Wskaz :Pssps_line);// ssps_line -> wiersz
  procedure SLineToSSPSLine(wskaz : Pssps_line) ;    //ssps_line -> wiersz S
}


procedure TFormaMain.ZapiszTabeleXDoPlikuTmp(NazwaPliku :string);
var plik   :file of xsps_line;
    linia  :xsps_line;
begin
  AssignFile(Plik, NazwaPliku);
  Rewrite(Plik);
  TabelaX.First;
  while not TabelaX.EOF do
  begin
    XLineToXSPSLine(TabelaX, @linia);
    write(Plik, linia);
    TabelaX.Next;
  end;
  CloseFile(Plik);
end;

procedure TFormaMain.ZapiszTabeleSDoPlikuTmp(NazwaPliku :string);
var plik   :file of ssps_line;
    linia  :ssps_line;
begin
  AssignFile(Plik, NazwaPliku);
  Rewrite(Plik);
  TabelaS.First;
  while not TabelaS.EOF do
  begin
    SLineToSSPSLine(@linia);
    write(Plik, linia);
    TabelaS.Next;
  end;
  CloseFile(Plik);
end;


procedure TFormaMain.ZapiszKopieXDoPlikuTmp(NazwaPliku :string);
var plik   :file of TKopiaX;
    linia  :TKopiaX;
begin
  AssignFile(Plik, NazwaPliku);
  Rewrite(Plik);
  TabelaX.First;
  while not TabelaX.EOF do
  begin
    KopiujXDoZmiennej(@linia);
    write(Plik, linia);
    TabelaX.Next;
  end;
  CloseFile(Plik);
end;

procedure TFormaMain.ZapiszKopieSDoPlikuTmp(NazwaPliku :string);
var plik   :file of TKopiaS;
    linia  :TKopiaS;
begin
  AssignFile(Plik, NazwaPliku);
  Rewrite(Plik);
  TabelaS.First;
  while not TabelaS.EOF do
  begin
    linia.TabelaDoKopia(TabelaS);
    write(Plik, linia);
    TabelaS.Next;
  end;
  CloseFile(Plik);
end;


procedure TFormaMain.ZapiszKopieRDoPlikuTmp(NazwaPliku :string);
var plik   :file of TKopiaR;
    linia  :TKopiaR;
begin
  AssignFile(Plik, NazwaPliku);
  Rewrite(Plik);
  TabelaR.First;
  while not TabelaR.EOF do
  begin
    linia.TabelaDoKopia(TabelaR);
    write(Plik, linia);
    TabelaR.Next;
  end;
  CloseFile(Plik);
end;


procedure  TFormaMain.TestujX;
var kopia, wiersz :TKopiaX;
    s             :string;
    IloscLinii    :integer;
    Plik          :file of TKopiaX;
    Zakres        :Tskip;
    StosZakresowLinii  :TStosSkipow;

procedure TestujWierszXTabeli(wiersz :PKopiaX);
begin
  if Param.SkokTapeTest then
     if not TestNumeruTasmy(wiersz.tasma)
     then WypelnijLOG('B£¥D: nieprawid³owy numer taœmy: ' + FloatToStr(wiersz.tasma));

  if Param.SkokRecTest then
     if not TestNumeruRekordu(wiersz.rekord)
     then WypelnijLOG('B£¥D: nieprawid³owy numer rekordu: ' + FloatToStr(wiersz.rekord));

  if not TestOdDoSkadDokad(wiersz.od_kanalu, wiersz.do_kanalu, wiersz.skad, wiersz.dokad, Param.StepNumChanel) then
     WypelnijLOG('B£¥D: nieprawid³owy rozstaw dla rekordu: ' + FloatToStr(wiersz.rekord) +
           ' Linia odb: ' + FloatToStr(wiersz.Linia));

  if wiersz.Krok_kan <> 1 then
     WypelnijLOG('UWAGA!: Krok kana³u ró¿ny od 1. Rekord: ' + FloatToStr(wiersz.rekord));

  if (wiersz.indeks_odb <> '1') and (wiersz.indeks_odb <> '0') then
     WypelnijLOG('UWAGA!: Indeks odbiornika ró¿ny od 1 lub 0. Rekord: ' + FloatToStr(wiersz.rekord));

end;



begin
//  TabelaX.First;
  IloscLinii := 0;
  StosZakresowLinii.Init;

  AssignFile(Plik, PlikX);
  Reset(plik);

  Read(Plik, wiersz);

  while  (FilePos(Plik)  <= FileSize(Plik)-1)  do
  begin
    Kopia := Wiersz;
    Read(Plik, wiersz);

 {   Zakres.Linia := wiersz.Linia;
    Zakres.OstatniPrzed := Trunc(wiersz.skad);
    Zakres.PierwszyZa := Trunc(wiersz.dokad);
    StosZakresowLinii.DodajSkip(Zakres);

    if StosZakresowLinii.CzyJestJuzSkip(1232, 101, 172) <> 0 then ShowMessage('Uda³o siê') else
       ShowMessage('Nie uda³o siê');
    if StosZakresowLinii.CzyJestJuzSkip(1231, 101, 172) <> 0 then ShowMessage('Uda³o siê');
 }

    inc(IloscLinii);
    TestujWierszXTabeli(@wiersz);

    if wiersz.ile_szt = kopia.ile_szt then  //************** TESTY WEWN¥TRZ REKORDU **********************
    begin
      if CzySkokTasmy(kopia.tasma, wiersz.tasma) then
      WypelnijLOG('B£¥D!: Skok numeru taœmy wewn¹trz rekordu: ' + FloatToStr(wiersz.rekord));

      if CzySkokRekordu(kopia.rekord, wiersz.rekord) then
      WypelnijLOG('B£¥D!: Skok numeru rekordu wewn¹trz rekordu: ' + FloatToStr(wiersz.rekord));


      s:= wiersz.aparatura + kopia.aparatura;
      if CzySkokAparatury(s[1], s[2]) then
      WypelnijLOG('B£¥D!: Skok numeru aparatury wewn¹trz rekordu: ' + FloatToStr(wiersz.rekord));

      if CzySkokKrokKan(wiersz.Krok_kan, kopia.Krok_kan) then
      WypelnijLOG('B£¥D!: Skok przyrostu kana³u wewn¹trz rekordu: ' + FloatToStr(wiersz.rekord));

      if Param.SkrajneTest then
         if CzySkokOdKan(wiersz.skad, kopia.skad) or CzySkokDoKan(wiersz.dokad, kopia.dokad)
         then
         WypelnijLOG('UWAGA!: Ró¿na d³ugoœæ s¹siednich linii odbioru, rekord: ' +
             FloatToStr(wiersz.rekord)+ ' na linii odbioru ' + FloatToStr(wiersz.Linia));

      if Trunc(wiersz.od_kanalu - kopia.do_kanalu)   <> 1 then
         WypelnijLOG('B£¥D!: Nieprawid³owy rozstaw w rekordzie: ' + FloatToStr(wiersz.rekord)+
          ' na linii odbioru ' + FloatToStr(wiersz.Linia));

      if Param.KolejnoscLiniiTest then
         if not CzyKolenoscLiniiOK(kopia.Linia, wiersz.Linia, Param.KrokLinii) then
         WypelnijLOG('B£¥D!: Nieprawid³owa kolejnoœæ linii odbioru w rekordzie: ' + FloatToStr(wiersz.rekord)+
          ' na linii odbioru ' + FloatToStr(wiersz.Linia));

    end else     //************** TESTY NA STYKU REKORDÓW **********************
    begin
      if Param.SkokRecTest then
         if (wiersz.rekord - Kopia.rekord) <> 1 then
         WypelnijLOG('UWAGA!: Skok numeru rekordu (rek. od: ' + FloatToStr(kopia.rekord)+ ' rek. do: ' + FloatToStr(wiersz.rekord)
          + ' (Brak: ' + FloatToStr(wiersz.rekord - kopia.rekord - 1) + ' rekordów).' );

      if Param.SkokTapeTest then
         if ((wiersz.tasma - Kopia.tasma) <> 1) and ((wiersz.tasma - Kopia.tasma) <> 0)then
         WypelnijLOG('UWAGA!: Skok numeru taœmy (rek. od: ' + FloatToStr(kopia.rekord)+ ' rek. do: ' + FloatToStr(wiersz.rekord)
          + ' (Brak: ' + FloatToStr(wiersz.rekord - kopia.rekord - 1) + ' rekordów).' );

      if  wiersz.od_kanalu <> 1 then
         WypelnijLOG('B£¥D!: Nieprawid³owa pierwsza linia odbioru dla rekordu: ' + FloatToStr(wiersz.rekord));

      if Param.KolejnoscLiniiTest then if (IloscLinii-1) < Param.MinActiveLines then
         WypelnijLOG('UWAGA!: Zbyt ma³a iloœæ aktywnych linii odbioru dla rekordu: ' + FloatToStr(kopia.rekord));

      if Param.KolejnoscLiniiTest then if (IloscLinii-1) > Param.MaxActiveLines then
         WypelnijLOG('UWAGA!: Zbyt du¿a iloœæ aktywnych linii odbioru dla rekordu: ' + FloatToStr(kopia.rekord));

      if kopia.do_kanalu > Param.MaxActivChanel then
         WypelnijLOG('B£¥D!: Zbyt du¿a iloœæ aktywnych kana³ów dla rekordu: ' + FloatToStr(kopia.rekord));

      if kopia.do_kanalu < Param.MinActivChanel then
         WypelnijLOG('B£¥D!: Zbyt ma³a iloœæ aktywnych kana³ów dla rekordu: ' + FloatToStr(kopia.rekord));

      IloscLinii := 1;
    end;

  end;

  CloseFile(Plik);
end;                    // TESTUJ X



procedure TFormaMain.ZamieLINESTATION1Click(Sender: TObject);
var t :real;
    SavePlace: TBookmark;
begin
  RozlaczTabele;
  TabelaS.DisableControls;
  TabelaX.DisableControls;
  SavePlace  := TabelaS.GetBookmark;

  TabelaS.First;
  CanIlRecNaPanel := false;
  Screen.Cursor := crHourGlass;
  StatusBar1.Panels[3].text := 'Trwa przenumerowanie SPS...';

  while not TabelaS.EOF do
  begin
    t := TabelaS['Line'];
    TabelaS.Edit;
    TabelaS['Line'] := TabelaS['Station'];
    TabelaS['Station'] := t;
    TabelaS.Next;
  end;

  TabelaX.First;
  while not TabelaX.EOF do
  begin
    t := TabelaX['Line'];
    TabelaX.Edit;
    TabelaX['Line'] := TabelaX['Station'];
    TabelaX['Station'] := t;
    TabelaX.Next;
  end;
  TabelaS.EnableControls;
  TabelaX.EnableControls;

  TabelaS.GotoBookmark(SavePlace);
  TabelaS.FreeBookmark(SavePlace);
  StatusBar1.Panels[3].text := '';
  CanIlRecNaPanel := true;
  Screen.Cursor := crDefault;
end;



procedure TFormaMain.MaxMinKanaly;
//okresla zakres odbiornkow SPS-X
var t :real;
    SavePlace: TBookmark;

begin
  RozlaczTabele;
  TabelaS.DisableControls;
  TabelaX.DisableControls;
  TabelaR.DisableControls;
  SavePlace  := TabelaX.GetBookmark;
  CanIlRecNaPanel := false;
  Screen.Cursor := crHourGlass;
  StatusBar1.Panels[3].text := 'Test SPS-X...';


  SortujQuery.Close;
  SortujQuery.SQL.Clear;
 // DataSource2.DataSet := SortujQuery;
  SortujQuery.SQL.Add('select distinct Linia, Min(Skad), Max(Dokad)  from spsx.dbf group by Linia');
  SortujQuery.Open;


  WypelnijLOG('Zakresy linii odbioru w SPS-X:');
  while not SortujQuery.EOF do
  begin
    WypelnijLOG( FloatToStr(SortujQuery.FieldbyName('LINIA').AsFloat) + ':' +
                 FloatToStr(SortujQuery.FieldbyName('MIN OF SKAD').AsFloat) + '-'+
                 FloatToStr(SortujQuery.FieldbyName('MAX OF DOKAD').AsFloat));
    SortujQuery.Next;
  end;
  SortujQuery.Close;

  If TabelaR.RecordCount <> 0
  then
  begin
    SortujQuery.Close;
    SortujQuery.SQL.Clear;
    SortujQuery.SQL.Add('select distinct Line, Min(Station), Max(Station)  from spsr.dbf group by Line');
    SortujQuery.Open;

    WypelnijLOG('Zakresy linii odbioru w SPS-R:');
    while not SortujQuery.EOF do
    begin
      WypelnijLOG( FloatToStr(SortujQuery.FieldbyName('LINE').AsFloat) + ':' +
                 FloatToStr(SortujQuery.FieldbyName('MIN OF STATION').AsFloat) + '-'+
                 FloatToStr(SortujQuery.FieldbyName('MAX OF STATION').AsFloat));
      SortujQuery.Next;
    end;
    SortujQuery.Close;

  end;

  TabelaS.EnableControls;
  TabelaX.EnableControls;

  TabelaX.GotoBookmark(SavePlace);
  TabelaX.FreeBookmark(SavePlace);
  StatusBar1.Panels[3].text := '';
  CanIlRecNaPanel := true;
  Screen.Cursor := crDefault;
  PolaczTabele;

end;
//  IleNumerowPowtorzonych := SortujQuery.RecordCount;

procedure TFormaMain.CheckBox1Click(Sender: TObject);
begin
  // Wywoluje "WyczyscButton, unieruchamia FiltrButton, Zmienia stan Filtra na Baza
  if Sender = FormaMain then
  begin
    CheckBox1.Checked := false
  end;

  if CheckBox1.Checked = false then
  begin //znosi filtr
//    FiltrBazy.Clear;
    FiltrBazy.Enabled := false;
    TabelaS.Filter := '';
    TabelaS.Filtered := false;
    ZastosujFiltrButton.Enabled := False;
    WyczyscFiltrButton.Enabled := false;
  end else
  begin //uaktywnia filtr
    FiltrBazy.Enabled := true;
    TabelaS.Filter := FiltrBazy.Text;
    TabelaS.Filtered := true;
    ZastosujFiltrButton.Enabled := True;
    WyczyscFiltrButton.Enabled := true;;
  end;
end;

procedure TFormaMain.WyczyscFiltrButtonClick(Sender: TObject);
begin
  FiltrBazy.Clear;
  TabelaS.Filter := '';
end;

procedure TFormaMain.ZastosujFiltrButtonClick(Sender: TObject);
begin
  if TabelaS.Filtered = true then
            TabelaS.Filter := FiltrBazy.Text;
end;

procedure TFormaMain.Button1Click(Sender: TObject);
begin
  AboutBox.Show;
end;

end.


