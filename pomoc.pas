Unit pomoc;
INTERFACE

uses sysutils, DIALOGS, registry, dbtables, variants;

const      DYNAMIT       = 0;
           WIBRATOR      = 1;
           DYN_WIB       = 2;
           INNE_ZRODLO   = 3;

           IO2           = 0;
           IO2000        = 1;
           INNA_APAR     = 2;


type       Strony  = (sLewo, sSrodek, SPrawo);
           typ_danych =(realna, integralna);

type       OpisLinii   = object
                           Linia           :real;
                           Kanal_1,
                           Kanal_2         :integer;
                         end;


           wskaznik_stosu =^TSkip;
           TSkip       = object
                           Linia           :real;
                           OstatniPrzed,
                           PierwszyZa      :integer;
                           wskaznik        :wskaznik_stosu;
                         end;


type       TStosSkipow = object(TSkip)
                           wierzcholek  :wskaznik_stosu;
                           temp_skip    :TSkip;
                           Elementow    :longint;
                           AktualnyNr   :longint;
                           AktualnyWskaznik :Wskaznik_Stosu;
                           constructor Init;

                           function DodajSkip(Skipek :TSkip) :boolean;
                           function CzyJestJuzSkip(LiniaOdb :real;  Ostatni, Pierwszy :integer) :integer;
                           function CzyJestLinia(const LiniaOdb :real) :boolean;
                           procedure UsunSkip(Numer :integer);
                           function DajElementNr(Pozycja :longint) :OpisLinii;
                           procedure Updatuj(Skipek, NaSkipek :TSkip);
                           destructor SkasujStos;
                         end;


type  TTestyDoZrobienia = class
      Public
      Ver                 :real;                          //1
//  PROJEKT
      PierwszaLinia ,                                     //1
      KrokLinii           :real;                          //2
      IloscLinii          :integer;                       //3
      Azymut ,                                            //4
      OdlegloscKanalow,                                   //5
      ZmianaLine    ,                                     //6
      ZmianaOLine         :real;                          //7
      PunktWiazania ,                                     //8
      LegalIndexes        :string;                        //9
      ZmianaStation  ,                                    //10
      ZmianaOStation      :real;                          //11
      Eastingowa,                                         //DODATKOWE
      Northingowa         :real;
      Zrodlo              :byte;                          //12
      Aparatura           :byte;                          //13
      MinDeph ,                                           //14
      MaxDeph ,                                           //15
      MaxStat ,                                           //16
      MinStat             :real;                          //17
      MaxElev ,                                           //18
      MinElev             :real;                          //19
      Datum               :real;                          //20
      DatumCheck          :boolean;                       //21
      OdPalikaS           :real;                          //22

//    SPS - X
      MaxOffset         :real;                            //1
      MaxActiveLines    :integer;                         //2
      MinActiveLines    :integer;                         //3
      InstrNum          :byte;                            //4
      StepNumChanel     :integer;                         //5
      MaxActivChanel    :integer;                         //6
      MinActivChanel    :integer;                         //7
      Skipy             :string;

//    SPS - R
      BrakKanalowTest :boolean;                           //1

//    TESTY
      MetodykaTest,                                       //1
      NumerGeodTest,                                      //2
      ExternalSPSTest,                                    //3
      DephTest,                                           //4
      VSrTest ,                                           //5
      UpholeTest,                                         //6
      CzasTest  ,                                         //7
      GeodezjaTest,                                       //8
      ZrodloTest  ,                                       //9
      StatykaTest,                                         //9-1    Musi byÊ dodane
      OdPalikaSTest,


      SkrajneTest ,                                       //10
      SkipyTest   ,                                       //11
      MaxOffTest  ,                                       //12
      SkokRecTest ,                                       //13
      SkokTapeTest,                                       //14
      KolejnoscLiniiTest   :boolean;                      //15
      constructor Init ;
      procedure WczytajParametryTestuZRejestru ;
      procedure ZapiszParametryTestuDoRejestru ;
      function TestIntegralnosciParametrow              :boolean;

      protected
       // function
     end;

type PTestyDoZrobienia =^TTestyDoZrobienia;

var Param, KopiaPar              :TTestyDoZrobienia;

    kontrola_poprawnosci                 :boolean;
    //czy wykonywac wogÛle testy (np przy wczytywaniu)

type Dane5Reali      =record
                        Linia, stacja,
                        x,y,z         :real;
                      end;

type dane_real =      record
                      x,y,z :real;
                      end;

type ETranslatS = class(Exception);
     ETranslatX = class(Exception);
     ETranslatR = class(Exception);

type       ssps_line          = object
                                  identyfikator :char;
                                  linia         :real;
                                  punkt         :real;
                                  indeks        :char;     {zmie‰ typ}
                                  kod_pkt       :string[2];
                                  statyka       :byte;
                                  deph          :real;
                                  datum         :integer;
                                  uphole        :real;
                                  water         :real;
                                  x,y           :double;
                                  elewacja      :real;
                                  dzien         :word;
                                  czas          :longint;
                                end;
           Pssps_line    = ^ssps_line;

           Pxsps_line  =^xsps_line;
           xsps_line          = object
                                  identyfikator :string[1];    {1}
                                  tasma         :integer;    {2}
                                  rekord        :longint; {3}
                                  numeracja     :byte;    {4}
                                  aparatura     :string[1];    {5}
                                  linia,                  {6}
                                  punkt         :real;    {7}
                                  indeks        :string[1];    {8}
                                  od_kanalu,              {9}
                                  do_kanalu     :word;    {10}
                                  step_chan     :byte;     {11}
                                  linia_odb     :real;    {12}
                                  od_odbior     :real;    {13}
                                  do_odbior     :real;    {14}
                                  indeks_odb    :string[2];    {15}
                                  procedure TabelaDoKopia(TabelaX :TTable);
                                  procedure KopiaDoTabela(TabelaX :TTable);
                                end;


 type
      PKopiaX =^TKopiaX;
      TKopiaX     = object      // Kopia wiersza X
                    ind,
                    ile_szt   :real;
                    X         :Char;
                    tasma     :integer;
                    rekord    :real;
                    numeracja :integer;
                    aparatura :Char;
                    line,
                    station   :real;
                    ktory_raz :Char;
                    od_kanalu,
                    do_kanalu :real;
                    Krok_kan  :integer;
                    Linia,
                    skad,
                    dokad     :real;
                    indeks_odb :Char;
                  end;

      PKopiaS                     =^TKopiaS;
      TKopiaS     = object      // Kopia wiersza S
                      ind,
                      ile_szt             :real;
                      IDENT_S             :Char;
                      line ,
                      station             :real;
                      ktory_raz           :char;
                      kod_zrodla          :string[2];
                      deph,
                      uphole              :real;
                      datum ,
                      statyka             :integer;
                      water,
                      easting  ,
                      northing,
                      elew                :real;
                      day                 :integer;
                      time,
                      rezerwa             :real;
                      procedure TabelaDoKopia(TabelaS  :TTable);//Kopiuje aktualny wiersz S do kopii wiersza
                      procedure KopiaToWierszS(TabelaS  :TTable);//Kopiuje kopie do aktualnego wiersza S
                    end;


      PKopiaR                     =^TKopiaR;
      TKopiaR     = object      // Kopia wiersza S
                      ile_szt             :real;
                      IDENT_R             :Char;
                      line ,
                      station             :real;
                      ktory_raz           :char;
                      kod_odb             :string[2];
                      deph,
                      uphole              :real;
                      datum ,
                      statyka             :integer;
                      water,
                      easting  ,
                      northing,
                      elew                :real;
                      day                 :integer;
                      time                :real;
                      procedure TabelaDoKopia(TabelaR  :TTable);//Kopiuje aktualny wiersz R do kopii wiersza
                      procedure KopiaToWierszR(TabelaR  :TTable);//Kopiuje kopie do aktualnego wiersza R
                    end;


type dane_eksportowe = object
                         wypelnienie_tape,
                         wypelnienie_record :char;
                         precyzja_line,
                         precyzja_station,
                         precyzja_kanal,
                         precyzja_LO        :byte;
                         datum,
                         woda,
                         czas_pionowy,
                         statyka,
                         glebokosc_strzelania :boolean
                       end;

  const     SIDENT            = 1;

            SLINE_NUM_FIRST   = 2;
            SLINE_NUM_LAST    = 17;
            SLINE_NUM_MANY    = SLINE_NUM_LAST - SLINE_NUM_FIRST + 1;

            SSHOT_NUM_FIRST   = 18;
            SSHOT_NUM_LAST    = 25;
            SSHOT_NUM_MANY    = SSHOT_NUM_LAST - SSHOT_NUM_FIRST +1;

            SPOINT_INDEX      = 26;
            SPOINT_INDEX_MANY = 1;

            SPOINT_CODE_FIRST = 27;
            SPOINT_CODE_LAST  = 28;
            SPOINT_CODE_MANY  = SPOINT_CODE_LAST - SPOINT_CODE_FIRST +1;

            SSTATIC_START     = 29;
            SSTATIC_LAST      = 32;
            SSTATIC_MANY      = SSTATIC_LAST - SSTATIC_START + 1;

            SDEPH_START       = 33;
            SDEPH_LAST        = 36;
            SDEPH_MANY        = SDEPH_LAST - SDEPH_START +1 ;

            SDATUM_START      = 37;
            SDATUM_LAST       = 40;
            SDATUM_MANY       = SDATUM_LAST - SDATUM_START +1 ;

            SUPHOLE_START     = 41;
            SUPHOLE_LAST      = 42;
            SUPHOLE_MANY      = SUPHOLE_LAST - SUPHOLE_START + 1;

            SWATER_START      = 43;
            SWATER_LAST       = 46;
            SWATER_MANY       = SWATER_LAST - SWATER_START +1;

            S_X_START         = 47;
            S_X_LAST          = 55;
            S_X_MANY          = S_X_LAST - S_X_START + 1;


            S_Y_START         = 56;
            S_Y_LAST          = 65;
            S_Y_MANY          = S_Y_LAST - S_Y_START + 1;

            S_ELEV_START      = 66;
            S_ELEV_LAST       = 71;
            S_ELEV_MANY       = S_ELEV_LAST - S_ELEV_START + 1;

            S_DAY_START       = 72;
            S_DAY_LAST        = 74;
            S_DAY_MANY        = S_DAY_LAST - S_DAY_START + 1;

            S_TIME_START      = 75;
            S_TIME_LAST       = 80;
            S_TIME_MANY       = S_TIME_LAST - S_TIME_START + 1;


          {***** DEFINICJA XSPS *****}
           X_IDENT            = 1;
           X_TAPE_START       = 2;
           X_TAPE_LAST        = 7;
           X_TAPE_MANY        = X_TAPE_LAST - X_TAPE_START + 1;

           X_RECORD_START     = 8;
           X_RECORD_LAST      = 11;{OPUóCIùEM}
           X_RECORD_MANY      = X_RECORD_LAST - X_RECORD_START + 1;

           X_REC_STEP         = 12;
           X_REC_STEP_MANY    = 1;

           X_APAR_NO          = 13;
           X_APAR_NO_MANY     = 1;

           X_SLINE_START      = 14;
           X_SLINE_LAST       = 29;
           X_SLINE_MANY       = X_SLINE_LAST - X_SLINE_START + 1;

           X_SSTATION_START   = 30;
           X_SSTATION_LAST    = 37;
           X_SSTATION_MANY    = X_SSTATION_LAST - X_SSTATION_START + 1;

           X_POINT_INDEX      = 38;

           X_FROM_CHANEL_START = 39;
           X_FROM_CHANEL_LAST = 42;
           X_FROM_CHANEL_MANY  = X_FROM_CHANEL_LAST  - X_FROM_CHANEL_START + 1;

           X_TO_CHANEL_START  = 43;
           X_TO_CHANEL_LAST   = 46; {OPUóCIùEM}
           X_TO_CHANEL_MANY   = X_TO_CHANEL_LAST - X_TO_CHANEL_START + 1;

           X_STEP_CHANEL      = 47;
           X_STEP_CHANEL_MANY = 1;


           X_RLINE_START      = 48;
           X_RLINE_LAST       = 63;
           X_RLINE_MANY       = X_RLINE_LAST - X_RLINE_START + 1;

           X_FROM_STAT_START  = 64;
           X_FROM_STAT_LAST   = 71;
           X_FROM_STAT_MANY   = X_FROM_STAT_LAST - X_FROM_STAT_START + 1;

           X_TO_STAT_START    = 72;
           X_TO_STAT_LAST     = 79; {OPUóCIùEM}
           X_TO_STAT_MANY     = X_TO_STAT_LAST - X_TO_STAT_START +1 ;

           X_IDENT_RECIV      = 80;
           X_IDENT_MANY       = 1;




           {**************************************************************}


const      FIRST_X_SURV = 10;   {Dok•d zostaà przeniesiony}
           LAST_X_SURV  = 13;
           X_SURV_MANY  = LAST_X_SURV - FIRST_X_SURV + 1;


           FIRST_Y_SURV = 14;
           LAST_Y_SURV  = 17;
           Y_SURV_MANY  = LAST_Y_SURV - FIRST_Y_SURV +1;

           FIRST_X_FROM_SURV = 1;  {sk•d zostaà przeniesiony}
           LAST_X_FROM_SURV  = 4;
           X_FROM_SURV_MANY    = LAST_X_FROM_SURV - FIRST_X_FROM_SURV + 1;


           FIRST_Y_FROM_SURV = 5;
           LAST_Y_FROM_SURV  = 8;
           Y_FROM_SURV_MANY  = LAST_Y_FROM_SURV - FIRST_Y_FROM_SURV + 1;

           FIRST_X_NUM_SURV = 19;  {NUM - oznacza wsp. geograficzn•}
           LAST_X_NUM_SURV  = 28;
           X_NUM_SURV_MANY  = LAST_X_NUM_SURV - FIRST_X_NUM_SURV + 1;


           FIRST_Y_NUM_SURV = 30;  {Plik geodezyjny ze ´r¢dàami}
           LAST_Y_NUM_SURV  = 39;
           Y_NUM_SURV_MANY  = LAST_Y_NUM_SURV - FIRST_Y_NUM_SURV;

           FIRST_ELEV_SURV  = 41;
           LAST_ELEV_SURV   = 46;
           MANY_ELEV_SURV   = LAST_ELEV_SURV - FIRST_ELEV_SURV + 1;

const      EPSILON = 0.0001;


type format_geodezji = record
                         num_line_from, num_stat_from,
                         num_line_to, num_station_to,
                         x, y, z                      :real
                       end;


procedure translate_xline(wiersz_x :string; var record_x :xsps_line);
procedure translate_sline(wiersz_s :string; var record_s :ssps_line);
procedure translate_rline(wiersz_s :string; var record_s :ssps_line);
procedure Split_na_lin_stat(tekst: string; var linia, stacja :string;
                                         var ktory_raz :char);

procedure ExtractFromFile(nazwa_wzorca, nazwa_zrodla, nazwa_wyniku :string;
                                        pozycja :byte);
function kolumna(linia:string; n :byte) :string; {funkcja zwraca wartsc zawarta w n-tej kolumnie}
procedure KopiujPlik(co_skopiowac, naco_skopiowac :string);   {uøywane do backUpu}
function IsEqualNear(var x, y :extended) :boolean;  //porÛwnuje dwie liczby rzeczywiste w otoczeniu EPSILON
function IsEqualNearReal(var x, y :real) :boolean; //porÛwnuje dwie liczby rzeczywiste w otoczeniu EPSILON
function PobierzKluczRejestru(nazwa_klucza :string):variant;
procedure ZapiszKluczRejestru(nazwa_klucza :string; wartosc :variant);
function ElementListy(linia :string; Nr :integer) :string;
Function IleZnakow(znak, wiersz :String) :integer;
Function OneCharakterStrToChar(czarek :string; Numer:integer):char; //funkcja konwertuje jeden wyszczegolniony znak stringa na typ char
//zak≥adam, øe SOFTWARE/SOFT_ERA/SPS_EDIT/

IMPLEMENTATION

              {************NOWE PROCEDURE**************}

procedure Translate_xline(wiersz_x :string; var record_x :xsps_line);
var tmp_str  :string;
    tmp_int  :integer;
    tmp_real :real;
    tmp_long :longint;
    tmp_word :word;
    kod      :integer;  {bà©du}



begin
  {1}
  record_x.identyfikator := wiersz_x[X_IDENT];

  {2}
  tmp_str := copy(wiersz_x, X_TAPE_START, X_TAPE_LAST - X_TAPE_START + 1);
  tmp_str := trim(tmp_str);
  if tmp_str = '' then tmp_str := '0';
  val(tmp_str,tmp_int, kod);
  if kod <> 0 then
  begin
    raise  ETranslatX.Create('B£•D konwersji TAPE w SPS-X');
    Exit;
  end;
  record_x.tasma := tmp_int ;

  {3}
  tmp_str := copy(wiersz_x, X_REC_STEP, X_REC_STEP_MANY);
  tmp_str := trim(tmp_str);
  if tmp_str = '' then tmp_str := '0';
  val(tmp_str,tmp_word, kod);
  if kod <> 0 then
  begin
    raise  ETranslatX.Create('B£•D konwersji RECORD_STEP w SPS-X');
    Exit;
  end;
  record_x.numeracja := tmp_word ; {SKOK REKORD”W}


  {4}
  record_x.aparatura := wiersz_x[X_APAR_NO] ;

  {5}
  tmp_str := copy(wiersz_x, X_RECORD_START, X_RECORD_LAST - X_RECORD_START + 1);
  tmp_str := trim(tmp_str);
  if tmp_str = '' then tmp_str := '0';
  val(tmp_str,tmp_long, kod);
  if kod <> 0 then
  begin
    raise  ETranslatX.Create('B£•D konwersji RECORD w SPS-X');
    Exit;
  end;
  record_x.rekord := tmp_long ;

  {6}
  tmp_str := copy(wiersz_x, X_SLINE_START, X_SLINE_LAST - X_SLINE_START + 1);
  tmp_str := trim(tmp_str);
  if tmp_str = '' then tmp_str := '0';
  val(tmp_str,tmp_real, kod);
  if kod <> 0 then
  begin
    raise  ETranslatX.Create('B£•D konwersji LINE w SPS-X');
    Exit;
  end;
  record_x.linia := tmp_real ;


  {7}
  tmp_str := copy(wiersz_x, X_SSTATION_START, X_SSTATION_LAST - X_SSTATION_START + 1);
  tmp_str := trim(tmp_str);
  if tmp_str = '' then tmp_str := '0';
  val(tmp_str,tmp_real, kod);
  if kod <> 0 then
  begin
    raise  ETranslatX.Create('B£•D konwersji STATION w SPS-X');
    Exit;
  end;
  record_x.punkt := tmp_real ;


  {8}
  record_x.indeks := wiersz_x[X_POINT_INDEX] ;
  {9}
  tmp_str := copy(wiersz_x,X_FROM_CHANEL_START,
                  X_FROM_CHANEL_LAST-X_FROM_CHANEL_START + 1);
  tmp_str := trim(tmp_str);
  if tmp_str = '' then tmp_str := '0';
  val(tmp_str,tmp_int, kod);
  if kod <> 0 then
  begin
    raise  ETranslatX.Create('B£•D konwersji FROM_CHANEL w SPS-X');
    Exit;
  end;
  record_x.od_kanalu := tmp_int ;

  {10}
  tmp_str := copy(wiersz_x, X_TO_CHANEL_START,
                  X_TO_CHANEL_LAST - X_TO_CHANEL_START + 1);
  tmp_str := trim(tmp_str);
  if tmp_str = '' then tmp_str := '0';
  val(tmp_str,tmp_int, kod);
  if kod <> 0 then
  begin
    raise  ETranslatX.Create('B£•D konwersji TO_CHANEL w SPS-X');
    Exit;
  end;
  record_x.do_kanalu := tmp_int ;

  {11}
  tmp_str := copy(wiersz_x, X_STEP_CHANEL, X_STEP_CHANEL_MANY);
  tmp_str := trim(tmp_str);
  if tmp_str = '' then tmp_str := '0';
  val(tmp_str,tmp_int, kod);
  if kod <> 0 then
  begin
    raise  ETranslatX.Create('B£•D konwersji STEP_CHANEL w SPS-X');
    Exit;
  end;
  record_x.step_chan :=  tmp_int;

  {12}
  tmp_str := copy(wiersz_x, X_RLINE_START,
                  X_RLINE_LAST - X_RLINE_START + 1);
  tmp_str := trim(tmp_str);
  if tmp_str = '' then tmp_str := '0';
  val(tmp_str,tmp_real, kod);
  if kod <> 0 then
  begin
    raise  ETranslatX.Create('B£•D konwersji RLINE w SPS-X');
    Exit;
  end;
  record_x.linia_odb := tmp_real ;

  {13}
  tmp_str := copy(wiersz_x, X_FROM_STAT_START,
                  X_FROM_STAT_LAST - X_FROM_STAT_START + 1);
  tmp_str := trim(tmp_str);
  if tmp_str = '' then tmp_str := '0';
  val(tmp_str,tmp_real, kod);
  if kod <> 0 then
  begin
    raise  ETranslatX.Create('B£•D konwersji OD w SPS-X');
    Exit;
  end;

  record_x.od_odbior := tmp_real ;
  {14}
  tmp_str := copy(wiersz_x, X_TO_STAT_START,
                  X_TO_STAT_LAST - X_TO_STAT_START + 1);
  tmp_str := trim(tmp_str);
  if tmp_str = '' then tmp_str := '0';
  val(tmp_str,tmp_real, kod);
  if kod <> 0 then
  begin
    raise  ETranslatX.Create('B£•D konwersji DO w SPS-X');
    Exit;
  end;
  record_x.do_odbior := tmp_real ;
  {15}
  record_x.indeks_odb := wiersz_X[X_IDENT_RECIV];
end;




procedure translate_sline(wiersz_s :string; var record_s :ssps_line);
var tmp_str  :string;
    tmp_int  :integer;
    tmp_real :real;
    tmp_byte :byte;
    tmp_long :longint;
    tmp_word :word;
    kod      :integer;  {bà©du}

begin
  {1}
  record_s.identyfikator := wiersz_s[SIDENT];

  {2}
  tmp_str := copy(wiersz_S, SLINE_NUM_FIRST,
                  SLINE_NUM_LAST - SLINE_NUM_FIRST + 1);
  tmp_str := trim(tmp_str);
  if tmp_str = '' then tmp_str := '0';
  val(tmp_str,tmp_real, kod);
  if kod <> 0 then
  begin
    raise  ETranslatS.Create('B£•D konwersji LINE w SPS-S');
    Exit;
  end;
  record_S.linia := tmp_real ;

  {3}
  tmp_str := copy(wiersz_S, SSHOT_NUM_FIRST,
                  SSHOT_NUM_LAST - SSHOT_NUM_FIRST + 1);
  tmp_str := trim(tmp_str);
  if tmp_str = '' then tmp_str := '0';
  val(tmp_str,tmp_real, kod);
  if kod <> 0 then
  begin
    raise  ETranslatS.Create('B£•D konwersji STATION w SPS-S');
    Exit;
  end;
  record_S.punkt := tmp_real ;

  {4}
  record_S.indeks := wiersz_s[SPOINT_INDEX] ;{INDEKS} {kt¢ry raz strzelony}
  {5}
  record_S.kod_pkt := copy(wiersz_s, SPOINT_CODE_FIRST,2);

  {6}
  tmp_str := copy(wiersz_S, SSTATIC_START,
                  SSTATIC_LAST - SSTATIC_START + 1);
  tmp_str := trim(tmp_str);
  if tmp_str = '' then tmp_str := '0';
  val(tmp_str,tmp_byte, kod);
  if kod <> 0 then
  begin
    raise  ETranslatS.Create('B£•D konwersji STATIC w SPS-S');
    Exit;
  end;
  record_s.statyka := tmp_byte ;

  {7}
  tmp_str := copy(wiersz_S, SDEPH_START,
                  SDEPH_LAST - SDEPH_START + 1);
  tmp_str := trim(tmp_str);
  if tmp_str = '' then tmp_str := '0';
  val(tmp_str,tmp_real, kod);
  if kod <> 0 then
  begin
    raise  ETranslatS.Create('B£•D konwersji DEPH w SPS-S');
    Exit;
  end;

  record_s.deph := tmp_real;
  {8}
  tmp_str := copy(wiersz_S, SDATUM_START,
                  SDATUM_LAST - SDATUM_START + 1);
  tmp_str := trim(tmp_str);
  if tmp_str = '' then tmp_str := '0';
  val(tmp_str,tmp_int, kod);
  if kod <> 0 then
  begin
    raise  ETranslatS.Create('B£•D konwersji DATUM w SPS-S');
    Exit;
  end;
   record_s.datum := tmp_int;
  {9}
  tmp_str := copy(wiersz_S, SUPHOLE_START,
                  SUPHOLE_LAST - SUPHOLE_START + 1);
  tmp_str := trim(tmp_str);
  if tmp_str = '' then tmp_str := '0';
  val(tmp_str,tmp_real, kod);
  if kod <> 0 then
  begin
    raise  ETranslatS.Create('B£•D konwersji UPHOLE w SPS-S');
    Exit;
  end;
  record_s.uphole := tmp_real;

  {10}
  tmp_str := copy(wiersz_S, S_X_START,
                  S_X_LAST - S_X_START + 1);
  tmp_str := trim(tmp_str);
  if tmp_str = '' then tmp_str := '0';
  val(tmp_str,tmp_real, kod);
  if kod <> 0 then
  begin
    raise  ETranslatS.Create('B£•D konwersji EASTING w SPS-S');
    Exit;
  end;
  record_s.x := tmp_real;

  {11}
  tmp_str := copy(wiersz_S, S_Y_START,
                  S_Y_LAST - S_Y_START + 1);
  tmp_str := trim(tmp_str);
  if tmp_str = '' then tmp_str := '0';
  val(tmp_str,tmp_real, kod);
  if kod <> 0 then
  begin
    raise  ETranslatS.Create('B£•D konwersji NORTHING w SPS-S');
    Exit;
  end;
  record_s.y := tmp_real;

  {12}
  tmp_str := copy(wiersz_S, S_ELEV_START,
                  S_ELEV_LAST - S_ELEV_START + 1);
  tmp_str := trim(tmp_str);
  if tmp_str = '' then tmp_str := '0';
  val(tmp_str,tmp_real, kod);
  if kod <> 0 then
  begin
    raise  ETranslatS.Create('B£•D konwersji ELEVATION w SPS-S');
    Exit;
  end;
  record_s.elewacja := tmp_real;

  {13}
  tmp_str := copy(wiersz_S, S_DAY_START,
                  S_DAY_LAST - S_DAY_START + 1);
  tmp_str := trim(tmp_str);
  if tmp_str = '' then tmp_str := '0';
  val(tmp_str, tmp_word, kod);
  if kod <> 0 then
  begin
    raise  ETranslatS.Create('B£•D konwersji DAY w SPS-S');
    Exit;
  end;
  record_s.dzien := tmp_word;

  {14}
  tmp_str := copy(wiersz_S, S_TIME_START,
                  S_TIME_LAST - S_TIME_START + 1);
  tmp_str := trim(tmp_str);
  if tmp_str = '' then tmp_str := '0';
  val(tmp_str, tmp_long, kod);
  if kod <> 0 then
  begin
    raise  ETranslatS.Create('B£•D konwersji TIME w SPS-S');
    Exit;
  end;
  record_s.czas := tmp_long;

  tmp_str := copy(wiersz_S, SWATER_START,
                  SWATER_LAST - SWATER_START + 1);
  tmp_str := trim(tmp_str);
  if tmp_str = '' then tmp_str := '0';
  val(tmp_str,tmp_real, kod);
  if kod <> 0 then
  begin
    raise  ETranslatS.Create('B£•D konwersji WATER w SPS-S');
    Exit;
  end;
  record_s.WATER := tmp_real;

end;



procedure translate_rline(wiersz_s :string; var record_s :ssps_line);
var tmp_str  :string;
    tmp_int  :integer;
    tmp_real :real;
    tmp_byte :byte;
    tmp_long :longint;
    tmp_word :word;
    kod      :integer;  {bà©du}

begin
  {1}
  record_s.identyfikator := wiersz_s[SIDENT];

  {2}
  tmp_str := copy(wiersz_S, SLINE_NUM_FIRST,
                  SLINE_NUM_LAST - SLINE_NUM_FIRST + 1);
  tmp_str := trim(tmp_str);
  if tmp_str = '' then tmp_str := '0';
  val(tmp_str,tmp_real, kod);
  if kod <> 0 then
  begin
    raise  ETranslatR.Create('B£•D konwersji LINE w SPS-R');
    Exit;
  end;
  record_S.linia := tmp_real ;
  {3}
  tmp_str := copy(wiersz_S, SSHOT_NUM_FIRST,
                  SSHOT_NUM_LAST - SSHOT_NUM_FIRST + 1);
  tmp_str := trim(tmp_str);
  if tmp_str = '' then tmp_str := '0';
  val(tmp_str,tmp_real, kod);
  if kod <> 0 then
  begin
    raise  ETranslatR.Create('B£•D konwersji STATION w SPS-R');
    Exit;
  end;
  record_S.punkt := tmp_real ;
  {4}
  if  wiersz_s[SPOINT_INDEX] = ' ' then  record_S.indeks := '0' else
  record_S.indeks := wiersz_s[SPOINT_INDEX] ;{INDEKS} {kt¢ry raz strzelony}
  {5}
  if  copy(wiersz_s, SPOINT_CODE_FIRST,2) = '  ' then  record_S.kod_pkt := '00' else
      record_S.kod_pkt := copy(wiersz_s, SPOINT_CODE_FIRST,2);

  {6}
  tmp_str := copy(wiersz_S, SSTATIC_START,
                  SSTATIC_LAST - SSTATIC_START + 1);
  tmp_str := trim(tmp_str);
  if tmp_str = '' then tmp_str := '0';
  val(tmp_str,tmp_byte, kod);
  if kod <> 0 then
  begin
    raise  ETranslatR.Create('B£•D konwersji STATIC w SPS-R');
    Exit;
  end;
  record_s.statyka := tmp_byte ;

  {7}
  tmp_str := copy(wiersz_S, SDEPH_START,
                  SDEPH_LAST - SDEPH_START + 1);
  tmp_str := trim(tmp_str);
  if tmp_str = '' then tmp_str := '0';
  val(tmp_str,tmp_real, kod);
  if kod <> 0 then
  begin
    raise  ETranslatR.Create('B£•D konwersji DEPH w SPS-R');
    Exit;
  end;

  record_s.deph := tmp_real;
  {8}
  tmp_str := copy(wiersz_S, SDATUM_START,
                  SDATUM_LAST - SDATUM_START + 1);
  tmp_str := trim(tmp_str);
  if tmp_str = '' then tmp_str := '0';
  val(tmp_str,tmp_int, kod);
  if kod <> 0 then
  begin
    raise  ETranslatR.Create('B£•D konwersji DATUM w SPS-R');
    Exit;
  end;
  record_s.datum := tmp_int;

  {9}
  tmp_str := copy(wiersz_S, SUPHOLE_START,
                  SUPHOLE_LAST - SUPHOLE_START + 1);
  tmp_str := trim(tmp_str);
  if tmp_str = '' then tmp_str := '0';
  val(tmp_str,tmp_real, kod);
  if kod <> 0 then
  begin
    raise  ETranslatR.Create('B£•D konwersji UPHOLE w SPS-R');
    Exit;
  end;
  record_s.uphole := tmp_real;

  {10}
  tmp_str := copy(wiersz_S, S_X_START,
                  S_X_LAST - S_X_START + 1);
  tmp_str := trim(tmp_str);
  if tmp_str = '' then tmp_str := '0';
  val(tmp_str,tmp_real, kod);
  if kod <> 0 then
  begin
    raise  ETranslatR.Create('B£•D konwersji EASTING w SPS-R');
    Exit;
  end;
  record_s.x := tmp_real;

  {11}
  tmp_str := copy(wiersz_S, S_Y_START,
                  S_Y_LAST - S_Y_START + 1);
  tmp_str := trim(tmp_str);
  if tmp_str = '' then tmp_str := '0';
  val(tmp_str,tmp_real, kod);
  if kod <> 0 then
  begin
    raise  ETranslatR.Create('B£•D konwersji NORTHING w SPS-R');
    Exit;
  end;
  record_s.y := tmp_real;

  {12}
  tmp_str := copy(wiersz_S, S_ELEV_START,
                  S_ELEV_LAST - S_ELEV_START + 1);
  tmp_str := trim(tmp_str);
  if tmp_str = '' then tmp_str := '0';
  val(tmp_str,tmp_real, kod);
  if kod <> 0 then
  begin
    raise  ETranslatR.Create('B£•D konwersji ELEV w SPS-R');
    Exit;
  end;
  record_s.elewacja := tmp_real;

  {13}
  tmp_str := copy(wiersz_S, S_DAY_START,
                  S_DAY_LAST - S_DAY_START + 1);
  tmp_str := trim(tmp_str);
  if tmp_str = '' then tmp_str := '0';
  val(tmp_str, tmp_word, kod);
  if kod <> 0 then
  begin
    raise  ETranslatR.Create('B£•D konwersji DAY w SPS-R');
    Exit;
  end;
  record_s.dzien := tmp_word;

  {14}
  tmp_str := copy(wiersz_S, S_TIME_START,
                  S_TIME_LAST - S_TIME_START + 1);
  tmp_str := trim(tmp_str);
  if tmp_str = '' then tmp_str := '0';
  val(tmp_str, tmp_long, kod);
  if kod <> 0 then
  begin
    raise  ETranslatR.Create('B£•D konwersji TIME w SPS-R');
    Exit;
  end;
  record_s.czas := tmp_long;

  tmp_str := copy(wiersz_S, SWATER_START,
                  SWATER_LAST - SWATER_START + 1);
  tmp_str := trim(tmp_str);
  if tmp_str = '' then tmp_str := '0';
  val(tmp_str,tmp_real, kod);
  if kod <> 0 then
  begin
    raise  ETranslatR.Create('B£•D konwersji WATER w SPS-R');
    Exit;
  end;
  record_s.WATER := tmp_real;
end;



procedure Split_na_lin_stat(tekst: string; var linia, stacja :string;
                                         var ktory_raz :char);
var little :string;
    pozyc  :integer;
{Ostani znak powinien zawieraÊ indeks opisujπcy ktÛry raz zosta≥o strzelone }
begin
  little := trim(tekst);
  if Length(little) <> 0 then
  begin
    if Pos('/',little) > 1 then
    begin
      pozyc  := Pos('/',little);
      linia := trim(copy(little, 1, Pozyc - 1));
      stacja := trim(copy(little, Pozyc+1, Length(little)- Pozyc - 1));
      ktory_raz := little[Length(little)];
    end else ShowMessage('Brak separatora');
  end else ShowMessage('Nie wpisano wartoúci');
end;

{program wynajduje dane wzorcowe zawarte w danym pliku i umieszcza je w innym}
procedure ExtractFromFile(nazwa_wzorca, nazwa_zrodla, nazwa_wyniku :string;
                                        pozycja :byte);
type nazwa_pliku   =string[11];
var
  plik_wzorc,                  {tego szukamy}
  plik_wynik          :text;   {wynik szukania}
  nazwa_wzorcowego,
  nazwa_smieci,
  nazwa_wynikowego      :nazwa_pliku;
  skad_wzorzec          :byte;         {sk•d por¢wnywaÜ (z pliku *.ini)}
  wiersz_wzorc          :string;


 procedure  dolacz_kom(nazwa :string; komunikat :string);
 {Procedura dalacza do pliku tekstowego "nazwa" wiersz o tresci "nazwa"}
 var
     plik  :textfile;

 begin
   assign(plik, nazwa);
   {$I-}
   append(plik);
   {$I+}
   if (ioresult <> 0) then
      begin
        rewrite(plik);
        closeFile(plik);
        assignFile(plik, nazwa);
        append(plik);
      end;

   writeln(plik, komunikat);
   closeFile(plik);
 end;


procedure Zamykaj_pliki;
begin
  closeFile(plik_wzorc);
  closeFile(plik_wynik);
end;

procedure szukaj_w_smieciach(czego_szukac :string; gdzie :byte);
{gdzie - od kt¢rego znaku zaczyna sie}
var linia_nieznana :string;
    jest           :boolean;
    plik_smieci    :Text;
begin
  jest := false;
  AssignFile(plik_smieci,nazwa_smieci);
  if FileExists(nazwa_smieci) then reset(plik_smieci) else
  begin
    Zamykaj_pliki;
    ShowMessage('Brak pliku');
    Halt;
  end;
  {odt•d co nas interesuje do ko‰ca}
  while not eof(plik_smieci) do
  begin
  Readln(Plik_smieci, linia_nieznana);
  if (Pos(czego_szukac, linia_nieznana) = gdzie)
     then
     begin
       writeln(plik_wynik, linia_nieznana);
       jest := true;
     end else
     begin

     end;

  end;
  CloseFile(plik_smieci);
  if (jest = false) then dolacz_kom('exclus.err', 'Brak wzorca '
                         + czego_szukac);
end;


procedure nadaj_nazwy;
begin

  nazwa_wzorcowego := nazwa_wzorca;
  nazwa_smieci     := nazwa_zrodla; {w tym pliku szukamy}
  nazwa_wynikowego := nazwa_wyniku;

  AssignFile(plik_wzorc, nazwa_wzorcowego);
  assignFile(plik_wynik, nazwa_wynikowego);

  if FileExists(nazwa_wzorcowego) then reset(plik_wzorc) else
  begin
    Zamykaj_pliki;
    ShowMessage('Brak pliku');
    Halt;
  end;

  rewrite(plik_wynik);

end;


begin
  skad_wzorzec := pozycja;
  Nadaj_nazwy;
  while not eof(plik_wzorc) do
  begin
    readln(plik_wzorc, wiersz_wzorc);
    szukaj_w_smieciach(wiersz_wzorc, skad_wzorzec);
  end;
  Zamykaj_pliki;
end; {g≥Ûwnej procedury}


function kolumna(linia:string; n :byte) :string;
 {funkcja zwraca wartsc zawarta w n-tej kolumnie}
var kol,znakow,i  :byte;
     sumka         :string;
     znak          : char;

 procedure spacje;
 begin
   while (linia[i] = ' ') and (i < znakow) do   inc(i);
   sumka := '';
 end;

 procedure znaczki;
 begin
   while (linia[i] <> ' ') and (i <= znakow)   do
   begin
     sumka := sumka + linia[i];
     inc(i);
   end;
 end; {znaczki}

 begin
 kol := 0; sumka := '';
 i := 1;     znakow := length(linia);
 spacje;   {pocz•tkowe}
 while (kol < n) and (i <= znakow) and (znak <> ' ') do
 begin
   spacje;
   inc(kol);
   znaczki;
 end;
 kolumna := sumka;
 end;          { function kolumna }


procedure KopiujPlik(co_skopiowac, naco_skopiowac :string);
var
  FromF, ToF: file;
  NumRead, NumWritten: Integer;
  Buf: array[1..2048] of Char;

begin
  AssignFile(FromF, co_skopiowac);
  Reset(FromF, 1);
  AssignFile(ToF, naco_skopiowac);
  Rewrite(ToF, 1);
  repeat
    BlockRead(FromF, Buf, SizeOf(Buf), NumRead);
    BlockWrite(ToF, Buf, NumRead, NumWritten);
  until (NumRead = 0) or (NumWritten <> NumRead);
  CloseFile(FromF);
  CloseFile(ToF);
end;

function IsEqualNear(var x, y :extended) :boolean;
begin
  if FloatToStrF(x,ffGeneral,8,12) = FloatToStrF(y,ffGeneral,8,12) then  IsEqualNear := false
  else IsEqualNear := true;
end;

function IsEqualNearReal(var x, y :real) :boolean;
begin
  if FloatToStrF(x,ffGeneral,8,12) = FloatToStrF(y,ffGeneral,8,12) then  IsEqualNearReal := false
  else IsEqualNearReal := true;
end;



function PobierzKluczRejestru(nazwa_klucza :string):variant;
var Reg               :TRegistry;
    WynikOtwarcia     :boolean;
    temp_var          :variant;
const Path = 'Software\Soft_Era\SPS_Edit';

begin
  temp_var := null;
  Reg := TRegistry.Create;
  try
    WynikOtwarcia := Reg.OpenKey(Path, False);
    if WynikOtwarcia then
    begin
      temp_var := Reg.ReadString(nazwa_klucza);
      PobierzKluczRejestru := temp_var;
    end
    else PobierzKluczRejestru := null ;

  except
    ShowMessage('B≥πd podczas otwierania rejestru');
    PobierzKluczRejestru := null;
    Reg.Free;
  end;
  Reg.Free;
end;


procedure ZapiszKluczRejestru(nazwa_klucza :string; wartosc :variant);
var Reg               :TRegistry;
    WynikOtwarcia     :boolean;

const Path = 'Software\Soft_Era\SPS_Edit';

begin
  Reg := TRegistry.Create;
  try
    WynikOtwarcia := Reg.OpenKey(Path, False);
    if WynikOtwarcia then
    begin
      Reg.WriteString(nazwa_klucza, wartosc);
    end;

  except
    ShowMessage('B≥πd rejestru');
    Reg.Free;
  end;
  Reg.Free;
end;





procedure TTestyDoZrobienia.ZapiszParametryTestuDoRejestru ;
var Reg               :TRegistry;
    WynikOtwarcia     :boolean;

const Path = 'Software\SOFT_ERA\SPS_Edit';

begin
  Reg := TRegistry.Create;
  try
    WynikOtwarcia := Reg.OpenKey(Path, True);
    if WynikOtwarcia then
    begin
//    PROJEKT
      Reg.WriteFloat('Ver', Ver);
      Reg.WriteFloat('PierwszaLinia',PierwszaLinia);
      Reg.WriteFloat('KrokLinii', KrokLinii);
      Reg.WriteInteger('IloscLinii', IloscLinii);
      Reg.WriteFloat('Azymut', Azymut);
      Reg.WriteFloat('OdlegloscKanalow', OdlegloscKanalow);
      Reg.WriteFloat('ZmianaLine', ZmianaLine);
      Reg.WriteFloat('ZmianaOLine', ZmianaOLine);
      Reg.WriteString('PunktWiazania', PunktWiazania)   ;
      Reg.WriteFloat('ZmianaStation', ZmianaStation)  ;
      Reg.WriteFloat('ZmianaOStation', ZmianaOStation) ;
      Reg.WriteFloat('Eastingowa', Eastingowa) ;
      Reg.WriteFloat('Northingowa', Northingowa) ;

      Reg.WriteInteger('Zrodlo', Zrodlo) ;


      Reg.WriteInteger('Aparatura', Aparatura) ;


//    SPS - S
      Reg.WriteFloat('MinDeph', MinDeph);
      Reg.WriteFloat('MaxDeph', MaxDeph);
      Reg.WriteFloat('MaxStat', MaxStat);
      Reg.WriteFloat('MinStat', MinStat);
      Reg.WriteFloat('MaxElev', MaxElev);
      Reg.WriteFloat('MinElev', MinElev);
      Reg.WriteFloat('Datum', Datum);
      Reg.WriteBool('DatumCheck', DatumCheck);
      Reg.WriteString('LegalIndexes', LegalIndexes);
      Reg.WriteFloat('OdPalikaS', OdPalikaS);

//    SPS - X
      Reg.WriteFloat('MaxOffset', MaxOffset);
      Reg.WriteInteger('MaxActiveLines', MaxActiveLines);
      Reg.WriteInteger('MinActiveLines', MinActiveLines);
      Reg.WriteInteger('InstrNum', InstrNum);
      Reg.WriteInteger('StepNumChanel', StepNumChanel);
      Reg.WriteInteger('MaxActivChanel', MaxActivChanel);
      Reg.WriteInteger('MinActivChanel', MinActivChanel);

//    SPS - R
      Reg.WriteBool('BrakKanalowTest', BrakKanalowTest);

//    TESTY
      Reg.WriteBool('MetodykaTest', MetodykaTest);
      Reg.WriteBool('NumerGeodTest', NumerGeodTest);
      Reg.WriteBool('ExternalSPSTest', ExternalSPSTest);
      Reg.WriteBool('DephTest', DephTest);
      Reg.WriteBool('VSrTest', VSrTest);
      Reg.WriteBool('UpholeTest', UpholeTest);
      Reg.WriteBool('CzasTest', CzasTest);
      Reg.WriteBool('GeodezjaTest', GeodezjaTest);
      Reg.WriteBool('ZrodloTest', ZrodloTest);
      Reg.WriteBool('StatykaTest', StatykaTest);
      Reg.WriteBool('SkrajneTest', SkrajneTest);
      Reg.WriteBool('SkipyTest', SkipyTest);
      Reg.WriteBool('MaxOffTest', MaxOffTest);
      Reg.WriteBool('SkokRecTest', SkokRecTest);
      Reg.WriteBool('SkokTapeTest', SkokTapeTest);
      Reg.WriteBool('KolejnoscLiniiTest', KolejnoscLiniiTest) ;
    end ;

  finally
    Reg.Free;
  end;
end;



procedure TTestyDoZrobienia.WczytajParametryTestuZRejestru ;
var Reg               :TRegistry;
    WynikOtwarcia     :boolean;

const Path = 'SOFTWARE\Soft_Era\SPS_Edit';

begin
  Reg := TRegistry.Create;
  try
    WynikOtwarcia := Reg.OpenKey(Path, False);
    if WynikOtwarcia then
    begin
   //   Ver  := Reg.ReadFloat('Ver');

      if Reg.ReadInteger('Licz')= 0 then
      begin
//    PROJEKT
         Reg.WriteFloat('Ver', 1.0);
         Reg.WriteFloat('PierwszaLinia',1001.11);
         Reg.WriteFloat('KrokLinii', 1.0);
         Reg.WriteFloat('Azymut', 45.5);
         Reg.WriteFloat('OdlegloscKanalow', 12.5);
         Reg.WriteFloat('ZmianaLine', 12.33);
         Reg.WriteFloat('ZmianaOLine', 1.1);
         Reg.WriteFloat('ZmianaStation', 3.3)  ;
         Reg.WriteFloat('ZmianaOStation', 3.3) ;
         Reg.WriteFloat('Eastingowa', 53000.0) ;
         Reg.WriteFloat('Northingowa', 43000.0) ;

//    SPS - S
         Reg.WriteFloat('MinDeph', 2.1);
         Reg.WriteFloat('MaxDeph', 20.5);
         Reg.WriteFloat('MaxStat', 50.5);
         Reg.WriteFloat('MinStat', 2.2);
         Reg.WriteFloat('MaxElev', 100.36);
         Reg.WriteFloat('MinElev', 11.11);
         Reg.WriteFloat('Datum', 1.1);
         Reg.WriteFloat('MaxOffset', 2022.33);
         Reg.WriteInteger('Licz', 1);
      end; /////////////////////////////

      PierwszaLinia :=    Reg.ReadFloat('PierwszaLinia');
      KrokLinii :=  Reg.ReadFloat('KrokLinii');
      IloscLinii :=  Reg.ReadInteger('IloscLinii');
      Azymut :=  Reg.ReadFloat('Azymut');
      OdlegloscKanalow :=  Reg.ReadFloat('OdlegloscKanalow');
      ZmianaLine :=  Reg.ReadFloat('ZmianaLine');
      ZmianaOLine :=  Reg.ReadFloat('ZmianaOLine');
      PunktWiazania :=  Reg.ReadString('PunktWiazania')    ;
      ZmianaStation :=  Reg.ReadFloat('ZmianaStation')   ;
      ZmianaOStation :=  Reg.ReadFloat('ZmianaOStation')  ;
      Eastingowa :=  Reg.ReadFloat('Eastingowa')  ; //Dodac do Rejestru *********
      Northingowa :=  Reg.ReadFloat('Northingowa')  ;

      Zrodlo :=  Reg.ReadInteger('Zrodlo') ;
      Aparatura :=  Reg.ReadInteger('Aparatura')  ;
      Skipy     :=  Reg.ReadString('Skipy'); //Tekst o formacie "1001,101,120;1002,102,130"

//    SPS - S
      MinDeph :=  Reg.ReadFloat('MinDeph');
      MaxDeph :=  Reg.ReadFloat('MaxDeph');
      MaxStat :=  Reg.ReadFloat('MaxStat');
      MinStat :=  Reg.ReadFloat('MinStat');
      MaxElev :=  Reg.ReadFloat('MaxElev');
      MinElev :=  Reg.ReadFloat('MinElev');
      Datum :=  Reg.ReadFloat('Datum');
      DatumCheck :=  Reg.ReadBool('DatumCheck');
      LegalIndexes := Trim(Reg.ReadString('LegalIndexes'));   //Indeksy pozniej maja byc wczytane do DBGrida
      OdPalikaS    := Reg.ReadFloat('OdPalikaS');

//    SPS - X
      MaxOffset :=  Reg.ReadFloat('MaxOffset');
      MaxActiveLines :=  Reg.ReadInteger('MaxActiveLines');
      MinActiveLines :=  Reg.ReadInteger('MinActiveLines');
      InstrNum :=  Reg.ReadInteger('InstrNum');
      StepNumChanel :=  Reg.ReadInteger('StepNumChanel');
      MaxActivChanel :=  Reg.ReadInteger('MaxActivChanel');
      MinActivChanel :=  Reg.ReadInteger('MinActivChanel');

//    SPS - R
      BrakKanalowTest :=  Reg.ReadBool('BrakKanalowTest');

//    TESTY
      MetodykaTest :=  Reg.ReadBool('MetodykaTest');
      NumerGeodTest :=  Reg.ReadBool('NumerGeodTest');
      ExternalSPSTest :=  Reg.ReadBool('ExternalSPSTest');
      DephTest :=  Reg.ReadBool('DephTest');
      VSrTest :=  Reg.ReadBool('VSrTest') ;
      UpholeTest :=  Reg.ReadBool('UpholeTest');
      CzasTest :=  Reg.ReadBool('CzasTest');
      StatykaTest := Reg.ReadBool('StatykaTest');
      GeodezjaTest :=  Reg.ReadBool('GeodezjaTest');
      ZrodloTest :=  Reg.ReadBool('ZrodloTest');
      SkrajneTest :=  Reg.ReadBool('SkrajneTest');
      SkipyTest :=  Reg.ReadBool('SkipyTest');
      MaxOffTest :=  Reg.ReadBool('MaxOffTest');
      SkokRecTest :=  Reg.ReadBool('SkokRecTest');
      SkokTapeTest :=  Reg.ReadBool('SkokTapeTest');
      KolejnoscLiniiTest :=  Reg.ReadBool('KolejnoscLiniiTest');
//      OdPalikaSTest       :=  Reg.ReadBool('OdPalikaSTest');
    end
    else
    begin
      ShowMessage('B≥πd rejestru');
      Reg.Free;
      eXIT;
    end;
  except
    Reg.Free;
    Exit;
  end;
  Reg.Free;
end;

Constructor TTestyDoZrobienia.Init;
begin
      PierwszaLinia :=  0;
      KrokLinii := 0;
      IloscLinii :=  0;
      Azymut := 0;
      OdlegloscKanalow :=  0;
      ZmianaLine :=  0;
      ZmianaOLine := 0;
      ZmianaStation :=  0   ;
      ZmianaOStation := 0  ;
      Northingowa := 0;
      Eastingowa := 0;
      Zrodlo :=  0 ;
      Aparatura :=  0  ;

//    SPS - S
      MinDeph := 0;
      MaxDeph := 0;
      MaxStat := 0;
      MinStat := 0;
      MaxElev := 0;
      MinElev := 0;
      Datum :=  0;
      OdPalikaS := 0;

//    SPS - X
      MaxOffset :=  0;
      MaxActiveLines := 0;
      MinActiveLines := 0;
      InstrNum := 0;
      StepNumChanel :=  0;
      MaxActivChanel := 0;
      MinActivChanel := 0;
end;


function TTestyDoZrobienia.TestIntegralnosciParametrow  :boolean;

function SprawdzWersje(wer :real) :boolean;
begin
  if Wer <> 1.0 then  SprawdzWersje := false else
  SprawdzWersje := true;
end;

function  IntegrSprawdzZrodlo :string;
var Msg :string;
begin
  Msg := '';
  if Zrodlo = DYNAMIT then
  begin

  end else
  if Zrodlo = WIBRATOR THEN
  begin

  end else
  begin
    ShowMessage('Nie zdefiniowane ürÛd≥o');
    Abort;
  end;
  IntegrSprawdzZrodlo := Msg;
end;


begin
  if not SprawdzWersje(1.0) then
  begin
    ShowMessage('Nieprawid≥owa wersja parametrÛw testu');
    TestIntegralnosciParametrow :=  false;
    Exit;
  end;

  if ZrodloTest then  if IntegrSprawdzZrodlo <> '' then
  begin
    ShowMessage(IntegrSprawdzZrodlo);
  end;

  TestIntegralnosciParametrow :=  false;
end;


procedure TKopiaS.TabelaDoKopia(TabelaS  :TTable);
var       s:string;
begin
  ile_szt                      := TabelaS['ile_szt'];
  ind                          := TabelaS['ind'];
  rezerwa                      := TabelaS['rezerwa'];
  s :=  TabelaS['ident_s'];
  IDENT_S                      := s[1] ;
  line                         := TabelaS['line'];
  station                      := TabelaS['station'];
  s :=  TabelaS['ktory_raz'];
  ktory_raz                    := s[1];
  kod_zrodla                   := TabelaS['kod_zrodla'];
  statyka                      := TabelaS['statyka'];
  deph                         := TabelaS['deph'];
  datum                        := TabelaS['datum'];
  uphole                       := TabelaS['uphole'];
  water                        := TabelaS['water'];
  easting                      := TabelaS['easting'];
  northing                     := TabelaS['northing'];
  elew                         := TabelaS['elew'];
  day                          := TabelaS['day'];
  time                         := TabelaS['time'];
end;

procedure TKopiaS.KopiaToWierszS(TabelaS  :TTable);
begin
  TabelaS['ile_szt']                          := ile_szt;
  TabelaS['ind']                              := ind;
  TabelaS['rezerwa']                          := rezerwa;
  TabelaS['ident_s']                          := IDENT_S;
  TabelaS['line']                             := line;
  TabelaS['station']                          := station;
  TabelaS['ktory_raz']                        := ktory_raz;
  TabelaS['kod_zrodla']                       := kod_zrodla ;
  TabelaS['statyka']                          := statyka;
  TabelaS['deph']                             := deph;
  TabelaS['datum']                            := datum;
  TabelaS['uphole']                           := uphole ;
  TabelaS['water']                            := water;
  TabelaS['easting']                          := easting;
  TabelaS['northing']                         := northing;
  TabelaS['elew']                             := elew;
  TabelaS['day']                              := day;
  TabelaS['time']                             := time;
end;



procedure xsps_line.TabelaDoKopia(TabelaX :TTable);
VAR s :string[2];
begin
  s := TabelaX['X'];
  identyfikator := s[1];
  tasma         := TabelaX['TASMA'];
  rekord        := TabelaX['REKORD'];
  numeracja     := TabelaX['NUMERACJA'];
  s := TabelaX['APARATURA'];
  aparatura     := s[1];
  linia         := TabelaX['LINE'];
  punkt         := TabelaX['STATION'];
  s := TabelaX['KTORY_RAZ'];
  indeks        := s[1];
  od_kanalu     := TabelaX['OD'];
  do_kanalu     := TabelaX['DO'];
  step_chan     := TabelaX['KROK_KAN'];
  linia_odb     := TabelaX['LINIA'];
  od_odbior     := TabelaX['SKAD'];
  do_odbior     := TabelaX['DOKAD'];
  s := TabelaX['INDEKS_ODB'];
  indeks_odb    := s[1];
end;

procedure xsps_line.KopiaDoTabela(TabelaX :TTable);
begin
  TabelaX.Edit;
  TabelaX['X']            := identyfikator;
  TabelaX['TASMA']        := tasma ;
  TabelaX['REKORD']       := rekord ;
  TabelaX['NUMERACJA']    := numeracja  ;
  TabelaX['APARATURA']    := aparatura;
  TabelaX['LINE']         := linia;
  TabelaX['KTORY_RAZ']    := indeks;
  TabelaX['OD']           := od_kanalu;
  TabelaX['STATION']      := punkt  ;
  TabelaX['DO']           := do_kanalu  ;
  TabelaX['KROK_KAN']     := step_chan ;
  TabelaX['LINIA']        := linia_odb;
  TabelaX['SKAD']         := od_odbior;
  TabelaX['DOKAD']        := do_odbior;
  TabelaX['INDEKS_ODB']   := indeks_odb;
  TabelaX.Post;
end;

function ElementListy(linia :string; Nr :integer) :string;
var i    :integer;
    licz :integer;
    s    :string;
begin
  s := '';   Licz := 0;
  if linia <> '' then  ElementListy := '' else
  begin
  for i := 1 to Length(s) do
     begin
       if linia[i] <> ';' then s := s + Linia[i] else
       begin
         inc(licz);
         if licz = Nr then
         begin
           ElementListy := Linia;
           Exit;
         end;
       end;
     end;
  end;
end;

Function IleZnakow(znak, wiersz :String) :integer;
var i :integer;
    num :integer;
begin
  num := 0;
  for i := 1 to Length(wiersz) do
  if wiersz[i] = znak[1] then inc(num);
  IleZnakow := num;
end;

              //        *********************************************

procedure TKopiaR.TabelaDoKopia(TabelaR  :TTable);
var       s:string;
begin
  ile_szt                      := TabelaR['ile_szt'];
  s :=  TabelaR['ident_s'];
  IDENT_R                      := s[1] ;
  line                         := TabelaR['line'];
  station                      := TabelaR['station'];
  s :=  TabelaR['ktory_raz'];
  ktory_raz                    := s[1];
  kod_odb                      := TabelaR['kod_odb'];
  statyka                      := TabelaR['statyka'];
  deph                         := TabelaR['deph'];
  datum                        := TabelaR['datum'];
  uphole                       := TabelaR['uphole'];
  water                        := TabelaR['water'];
  easting                      := TabelaR['easting'];
  northing                     := TabelaR['northing'];
  elew                         := TabelaR['elew'];
  day                          := TabelaR['day'];
  time                         := TabelaR['time'];
end;


procedure TKopiaR.KopiaToWierszR(TabelaR  :TTable);
begin
  TabelaR['ile_szt']                          := ile_szt;
  TabelaR['ident_s']                          := IDENT_R;
  TabelaR['line']                             := line;
  TabelaR['station']                          := station;
  TabelaR['ktory_raz']                        := ktory_raz;
  TabelaR['kod_odb']                          := kod_odb ;
  TabelaR['statyka']                          := statyka;
  TabelaR['deph']                             := deph;
  TabelaR['datum']                            := datum;
  TabelaR['uphole']                           := uphole ;
  TabelaR['water']                            := water;
  TabelaR['easting']                          := easting;
  TabelaR['northing']                         := northing;
  TabelaR['elew']                             := elew;
  TabelaR['day']                              := day;
  TabelaR['time']                             := time;
end;




destructor TStosSkipow.SkasujStos;
var tmp_wsk :wskaznik_stosu;
begin
  if wierzcholek <> nil then
  begin
    while not (wierzcholek <> nil) do
    begin
      with wierzcholek^ do
      begin
        tmp_wsk := wskaznik;
      end;
      Dispose(wierzcholek);
      wierzcholek := tmp_wsk;
    end;
  end;
end;


procedure TStosSkipow.Updatuj(Skipek, NaSkipek :TSkip);
begin
end;

constructor TStosSkipow.Init;
begin
  wskaznik := nil;
  Elementow := 0;
  wierzcholek := nil;
end;



function TStosSkipow.DodajSkip(Skipek :TSkip) :boolean;
var temp :wskaznik_stosu;
begin
  temp := wierzcholek;
  New(wierzcholek);
  with wierzcholek^ do
  begin
    Linia := Skipek.Linia;
    OstatniPrzed := Skipek.OstatniPrzed;
    PierwszyZa := Skipek.PierwszyZa;
    wskaznik := temp;
    Inc(Elementow);
    AktualnyNr := Elementow;
  end;
  AktualnyWskaznik := wierzcholek;
end;

function TStosSkipow.CzyJestJuzSkip(LiniaOdb :real;  Ostatni, Pierwszy :integer) :integer;
var licz :longint;
    wsk  :wskaznik_stosu;
begin
  if wierzcholek <> nil then
  begin
    licz := 1;
    wsk := wierzcholek;

    while (licz <= Elementow) do
    begin
      if (LiniaOdb = wsk^.Linia) and (Ostatni= wsk^.OstatniPrzed)
         and (Pierwszy = wsk^.PierwszyZa)
         then
         begin
           CzyJestJuzSkip := licz;
           Exit;
         end;
      wsk := wsk^.wskaznik;
      inc(licz);
    end;
  end;
  CzyJestJuzSkip := 0;
end;

function TStosSkipow.CzyJestLinia(const LiniaOdb :real) :boolean;
var licz :longint;
    wsk  :wskaznik_stosu;
begin
  if wierzcholek <> nil then
  begin
    licz := 1;
    wsk := wierzcholek;

    while (licz <= Elementow) do
    begin
      if (LiniaOdb = wsk^.Linia)
         then
         begin
           CzyJestLinia := true;
           Exit;
         end;
      wsk := wsk^.wskaznik;
      inc(licz);
    end;
  end;
  CzyJestLinia := false;
end;

function TStosSkipow.DajElementNr(Pozycja :longint) :OpisLinii;
//Ustawia wskaznik na N-ty element stosu;
var licz :longint;
    wsk  :wskaznik_stosu;
    t    :OpisLinii;
begin
  if wierzcholek <> nil then
  begin
    licz := 1;
    wsk := wierzcholek;
    while (licz <= Pozycja) do
    begin
      wsk := wsk^.wskaznik;
      inc(licz);
    end;
     t.Linia := wsk^.Linia;
     t.Kanal_1 := wsk^.OstatniPrzed;
     t.Kanal_2 := wsk^.PierwszyZa;
     DajElementNr := t;
  end;
end;

procedure TStosSkipow.UsunSkip(Numer :integer);
var licz             :integer;
    wsk, przed,
    za               :wskaznik_stosu;
    t                :OpisLinii;
begin
  ShowMessage('Funkcja niedokoÒczona');
  if wierzcholek <> nil then
  begin
    licz := 1;
    wsk := wierzcholek;
    while (licz <= Numer) do
    begin
      przed := wsk;
      wsk := wsk^.wskaznik;
      inc(licz);
    end;
     dispose(przed);
//     w
  end;
end;

function OneCharakterStrToChar(czarek :string; Numer:integer):char;
//funkcja konwertuje jeden wyszczegolniony znak stringa na typ char
var i         :integer;
    str       :char;
begin
    str := czarek[numer];
    OneCharakterStrToChar := str;
end;

end.
