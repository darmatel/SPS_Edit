unit check ;
{modu� zawiera funkcje dla programu checksps}

INTERFACE
uses pomoc, sysutils, registry, FORMS, variants;



VAR
                ilosc_wierszy_x :longint;
                ilosc_wierszy_s :longint;
                ilosc_wierszy_r :longint;
                number_rec_in_x :word;
                number_rec_in_s :word;
                rozna_il_rec    :boolean; {w S i X}
                skok_nr_tasmy,
                line_not_in_swath,
                line_not_in_project,
                line_not_exists,
                malo_kanalow_w_rek,
                skip_is_changed,
                to_many_chanels,
                first_chanel_incorrect,
                bad_line_def             :boolean;{r��na ilo�� z kana�ow i odbiornik�w}
                {"testuj_linie_parami" i "dobre_kana�y" dubluj� si� }
                no_index_sp,
                too_deep_hole,
                too_shellow_hole,
                incorrect_time_format,
                inconsistent_x_s,
                inconsistent_x_r,
                inconsistent_s_r         :boolean;
                is_non_visible           :boolean;


                nazwa_xsps   :string;     {nazwa xsps - tekstowego}
                nazwa_ssps,
                nazwa_rsps   :string;
                nazwa_xout   :string;     {xsps w postaci binarnej}
                nazwa_sout   :string;     {ssps w postaci binarnej}
                nazwa_pliku_ini :string;
                plik_ini        :text;      {init param tematu}
                plik_s          :text;
                plik_x          :text;
                aut_s       :file of ssps_line;
                aut_x       :file of xsps_line;

                {aut_r       :file of rsps_line;}


procedure init;
procedure done;
procedure otwieram_pliki;
procedure test_xsps;
procedure test_ssps;
procedure naglowek_testu(nazwa_pliku_S, nazwa_pliku_X, nazwa_pliku_R :string);
function is_non_visible_char(jakas_linia  :string):boolean;

function TestujPrzyrostCzasu(dzien_poprzedni, dzien_nastepny:integer;
         czas_nastepny, czas_poprzedni :real) :boolean;function TestujCzas(data, czas :longint):boolean; //Zawiera w sobie obie nast�pne funkcje
function TestDaty(data :longint):boolean;
function TestGodziny(czas :longint):boolean;
function TestKoduLadunku(KodLadunku :string):boolean;
function TestDlugosciWierszaS(wiersz :string) :boolean;

function TestPoprawnosciWierszaS(wiersz :string):boolean;
function TestPoprawnosciWierszaX(wiersz :string):boolean;
function TestPoprawnosciWierszaR(wiersz :string):boolean;

function TestNumeruTasmy(Numer :integer):boolean;
function TestNumeruRekordu(Numer :real):boolean;
function TestOdDoSkadDokad(od, doo, skad, dokad :real; krok_kanalu :integer) :boolean;
function CzyDobryTypZrodla(kod :string; Zrodlo :byte):boolean;  //Dynamit lub wibrator
function TestKrotnosci(znak :string) :boolean;

function TestujPierszyZnakS(znak :char) :boolean;
function TestujPierszyZnakR(znak :char) :boolean;
function TestElewacji(wartosc :real; MinElev, MaxElev :real) :boolean;
function TestPoprawkiStatycznej(wartosc :real; iks_min:real; iks_max :real) :boolean;


function CzySkokRekordu(Poprzedni, Nastepny :real) :boolean;
function CzySkokTasmy(Poprzedni, Nastepny :real) :boolean;
function CzySkokAparatury(Poprzedni, Nastepny :char) :boolean;
function CzySkokKrokKan(Poprzedni, Nastepny :integer) :boolean;
function CzySkokDoKan(Poprzedni, Nastepny :real) :boolean;
function CzySkokOdKan(Poprzedni, Nastepny :real) :boolean;
function CzyKolenoscLiniiOK(Poprzedni, Nastepny, Roznica :real ) :boolean;
procedure NumerNaWspolrzedna(Linia, Stacja, PierwszaLinia, PierwszyKanal,
                x0, y0, DeltaX, DeltaY, Azym:real; var WynikX, WynikY:real);
function Odleglosc(x1, y1, x2,y2 :real) :real;

type ECorrectS    = class(Exception);
     ECorrectR    = class(Exception);
     ECorrectX    = class(Exception);



IMPLEMENTATION
uses geofizyk, Dialogs;

const       EPS =0.0001;

          {***** DEFINICJA SSPS *****}


const      POSSIBLE_NUM_LINES       = 100;
           {dopuszczalna ilo�� linii odbior�w na temacie}
           POSSIBLE_LINES_in_spread = 20;

var     FIRST_R_LINE,
        LAST_R_LINE,
        STEP_R_LINE             :real;
        ILOSC_LINII_ODBIORU     :byte;
        MAX_LINES_IN_SPREAD,
        MIN_LINES_IN_SPREAD     :byte;
        MAX_LINE_IN_SWATH       :byte;
        FIRST_LINE_IN_SWATH     :real;
        LAST_LINE_IN_SWATH      :real;
        MAX_CHANELS_IN_SPREAD   :word;
        MIN_CHANELS_IN_SPREAD   :word;
        LINIE_ODBIORU           :array[1..POSSIBLE_LINES_in_spread] of real;
        ALL_LINES               :array[1..POSSIBLE_NUM_LINES] of real;
        LEGAL_INDSS_ARR         :array[1..24] of string[2];
        SKIP_NA_LINII           :real;
        PIERWSZY_NIEMY_SKIP,
        DRUGI_NIEMY_SKIP        :word; {pierwszy i ostatni "niemy" kana� w skipie}
        MAX_DEPH                :byte;
        MIN_DEPH                :byte;
        MIN_NORTH_COORD,
        MAX_NORTH_COORD,
        MIN_EAST_COORD ,
        MAX_EAST_COORD          :double;
        TEST_COORD              :boolean;




        SP_LINE_NUM_COEF,
        SP_SHOT_NUM_COEF,
        SP_LINE_NUM_PLUS,
        SP_SHOT_NUM_PLUS,
        RLINE_NUM_COEF  ,
        RLINE_NUM_PLUS  ,
        FROM_NUM_CHAN_COEF,
        FROM_NUM_CHAN_PLUS,
        TO_NUM_CHAN_COEF  ,
        TO_NUM_CHAN_PLUS       :REAL;



var  temp_str           :string;
     rok,miesiac,dzien,godzina,minuta,sekunda :word;
     atrapa                                   :word;
     temp_str2                                :string;

function is_non_visible_char(jakas_linia  :string):boolean;
{zwraca warto�� 'true' je�eli w danym wierszu istnieje znak 'bia�y'
 w sensie SPS}
var znak :char;
    i    :byte;

begin
  {w zasadzie plus jest mocno podejrzanym znakiem a SPS. Minus teoret.
   mo�e wyst�pi� w poz. odniesienia, poprawce statycznej}
  for i := 1 to length(jakas_linia) do
  begin
    znak := UpCase(jakas_linia[i]);
    if not ((znak = '.') or
          (znak = '-') or
          (znak = ' ') or
          ((ord(znak) >= 48) and (ord(znak) <= 57) ) or
          ((ord(znak) >= 65) and (ord(znak) <= 90) ))
    then
    begin
      is_non_visible_char := true;
      Exit;
    end;
  end;

  is_non_visible_char := false;
end;


procedure init;

procedure init_parametry_tematu;
{wczytuje wszystkie sta�e dotycz�ce badanego tematu}
var
          temp_str        :string;
          temp_real       :real;
          temp_byte       :byte;
          temp_word       :word;
          temp_double     :double;
          kod             :integer;
          i               :byte;


procedure pobierz_sekcje(nazwa_sekcji :string);
var  sekcja_znaleziona :boolean;
begin
  sekcja_znaleziona := FALSE;
  while (not eof(plik_ini) and (not sekcja_znaleziona)) do
  begin
    readln(plik_ini,temp_str);
    if temp_str = nazwa_sekcji then  sekcja_znaleziona := true
    else sekcja_znaleziona := false
  end;
  if eof(plik_ini) or  sekcja_znaleziona = false
  then
  begin
    done;
    writeln('Nie znaleziono sekcji: ', nazwa_sekcji);
    halt;
  end;
end;

function pobierz_parametr(nazwa :string):string;
begin
  readln(plik_ini,temp_str);
  if Pos('<', temp_str) <> 0 then
  temp_str := copy(temp_str, 1, Pos('<', temp_str) - 1); {usuwam komentarz}

  if Pos(nazwa,temp_str)=1 then
  begin
    if (Pos(':', temp_str) <> 0) and  (Pos(';', temp_str) <> 0) and
       (Pos(';', temp_str) > Pos(':', temp_str))
    then
    temp_str := Copy(temp_str, Pos(':', temp_str)+ 1,
                Pos(';', temp_str) - Pos(':', temp_str) - 1 )
    else
    begin
      dolacz_kom('checksps.err', 'b��d parametr�w inicjuj�cych programu');
      done;
      halt;
    end;
  end;
  pobierz_parametr := temp_str;
end;

function pobierz_element(temp_str :string; numer :byte):string;
var pozycja      :byte;
    lokal_str    :string;
begin

      lokal_str := Copy(temp_str, Pos(':', temp_str)+ 1,
                Pos(';', temp_str) - Pos(':', temp_str) - 1);
      lokal_str := ',' + lokal_str ; {bardzo mi to u�atwi}



    if szukaj_char(lokal_str,',',numer + 1) = 0 then
    begin
      lokal_str := copy(lokal_str, szukaj_char(lokal_str,',',numer)+1,
                 length(lokal_str) - szukaj_char(lokal_str,',',numer) +1 +1);
    end    else
    begin
      pozycja := szukaj_char(lokal_str,',',numer ) + 1;
      lokal_str := copy(lokal_str,pozycja,
                  szukaj_char(lokal_str,',',numer+1)-1 - pozycja + 1);
    end;

  pobierz_element := lokal_str;
end;


begin

     pobierz_sekcje('[SEKCJA PARAMETROW TEMATU]');
     val(pobierz_parametr('FIRST_R_LINE'),temp_real, kod);
     if kod = 0 then  FIRST_R_LINE := temp_real else
                       begin
                         dolacz_kom('checksps.err', 'b��d parametr�w programu');
                         done;
                         halt;
                       end;
     val(pobierz_parametr('LAST_R_LINE'),temp_real, kod);
     if kod = 0 then  LAST_R_LINE := temp_real else
                       begin
                         dolacz_kom('checksps.err', 'b��d parametr�w programu');
                         done;
                         halt;
                       end;

     val(pobierz_parametr('STEP_R_LINE'),temp_real, kod);
     if kod = 0 then  STEP_R_LINE := temp_real else
                       begin
                         dolacz_kom('checksps.err', 'b��d parametr�w programu');
                         done;
                         halt;
                       end;
     val(pobierz_parametr('ILOSC_LINII_ODBIORU'),temp_byte, kod);
     if kod = 0 then  ILOSC_LINII_ODBIORU := temp_byte else
                       begin
                         dolacz_kom('checksps.err', 'b��d parametr�w programu');
                         done;
                         halt;
                       end;

     val(pobierz_parametr('MAX_LINES_IN_SPREAD'),temp_byte, kod);
     if kod = 0 then  MAX_LINES_IN_SPREAD := temp_byte else
                       begin
                         dolacz_kom('checksps.err', 'b��d parametr�w programu');
                         done;
                         halt;
                       end;

     val(pobierz_parametr('MIN_LINES_IN_SPREAD'),temp_byte, kod);
     if kod = 0 then  MIN_LINES_IN_SPREAD := temp_byte else
                       begin
                         dolacz_kom('checksps.err', 'b��d parametr�w programu');
                         done;
                         halt;
                       end;

     val(pobierz_parametr('MAX_LINE_IN_SWATH'),temp_byte, kod);
     if kod = 0 then  MAX_LINE_IN_SWATH := temp_byte else
                       begin
                         dolacz_kom('checksps.err', 'b��d parametr�w programu');
                         done;
                         halt;
                       end;

     val(pobierz_parametr('FIRST_LINE_IN_SWATH'),temp_real, kod);
     if kod = 0 then  FIRST_LINE_IN_SWATH := temp_real else
                       begin
                         dolacz_kom('checksps.err', 'b��d parametr�w programu');
                         done;
                         halt;
                       end;

     val(pobierz_parametr('LAST_LINE_IN_SWATH'),temp_real, kod);
     if kod = 0 then  LAST_LINE_IN_SWATH := temp_real else
                       begin
                         dolacz_kom('checksps.err', 'b��d parametr�w programu');
                         done;
                         halt;
                       end;

     val(pobierz_parametr('MAX_CHANELS_IN_SPREAD'), temp_word, kod);
     if kod = 0 then  MAX_CHANELS_IN_SPREAD := temp_word else
                       begin
                         dolacz_kom('checksps.err', 'b��d parametr�w programu');
                         done;
                         halt;
                       end;

     val(pobierz_parametr('MIN_CHANELS_IN_SPREAD'), temp_word, kod);
     if kod = 0 then  MIN_CHANELS_IN_SPREAD := temp_word else
                       begin
                         dolacz_kom('checksps.err', 'b��d parametr�w programu');
                         done;
                         halt;
                       end;


        {********  �ADUJ� MACIERZ *************}
     readln(plik_ini,temp_str);
     if Pos('<', temp_str) <> 0 then
        temp_str := copy(temp_str, 1, Pos('<', temp_str) - 1); {usuwam komentarz}
     if Pos('LINIE_ODBIORU',temp_str)=1 then
     begin
       if (Pos(':', temp_str) <> 0) and  (Pos(';', temp_str) <> 0) and
          (Pos(';', temp_str) > Pos(':', temp_str))
       then
       for i := 1 to ile_znakow(temp_str,',') + 1 do {BO W �RODKU DODAJ�  ','}
       begin
         val(pobierz_element(temp_str, i), temp_real, kod);
         LINIE_ODBIORU[i] := temp_real; {a teraz wczytujemy do macierzy}
       end
       else
       begin
         dolacz_kom('checksps.err', 'b��d parametr�w inicjuj�cych programu');
         done;
         halt;
       end;
     end;

        {********  �ADUJ� MACIERZ *************}
     readln(plik_ini, temp_str);
     if Pos('<', temp_str) <> 0 then
        temp_str := copy(temp_str, 1, Pos('<', temp_str) - 1); {usuwam komentarz}
     if Pos('ALL_LINES',temp_str) = 1 then
     begin
       if (Pos(':', temp_str) <> 0) and  (Pos(';', temp_str) <> 0) and
          (Pos(';', temp_str) > Pos(':', temp_str))
       then
       for i := 1 to ile_znakow(temp_str,',') + 1 do
       begin
         val(pobierz_element(temp_str, i), temp_real, kod);
         ALL_LINES[i] := temp_real; {a teraz wczytujemy do macierzy}
       end
       else
       begin
         dolacz_kom('checksps.err', 'b��d parametr�w inicjuj�cych programu');
         done;
         halt;
       end;
     end;

     {SKIPY WCZYTUJ�}
     readln(plik_ini,temp_str);

     if Pos('<', temp_str) <> 0 then
        temp_str := copy(temp_str, 1, Pos('<', temp_str) - 1); {usuwam komentarz}
     if Pos('SKIP',temp_str) = 1 then
     begin
       if (Pos(':', temp_str) <> 0) and  (Pos(';', temp_str) <> 0) and
          (Pos(';', temp_str) > Pos(':', temp_str))
       then

       if  ile_znakow(temp_str,',') = 2 then
       begin
         val(pobierz_element(temp_str, 1), temp_real, kod);
         if kod <>0 then
         begin
           dolacz_kom('checksps.err', 'b��d parametr�w inicjuj�cych skip');
           done;
           halt;
         end;
         SKIP_NA_LINII := temp_real;

         val(pobierz_element(temp_str, 2), temp_word, kod);
         if kod <>0 then
         begin
           dolacz_kom('checksps.err', 'b��d parametr�w inicjuj�cych skip');
           done;
           halt;
         end;
         PIERWSZY_NIEMY_SKIP := temp_word;

         val(pobierz_element(temp_str, 3), temp_word, kod);
         if kod <>0 then
         begin
           dolacz_kom('checksps.err', 'b��d parametr�w inicjuj�cych skip');
           done;
           halt;
         end;
         DRUGI_NIEMY_SKIP := temp_word;
       end
       else {brak przecink�w = brak skipu}
       begin
         PIERWSZY_NIEMY_SKIP := 0;
         DRUGI_NIEMY_SKIP    := 0;
         SKIP_NA_LINII       := 0;
       end;
     end;

     pobierz_sekcje('[SEKCJA S_SPS]');
     {maksymalna g��boko��}
     val(pobierz_parametr('MAX_DEPH'), temp_byte, kod);
     if kod = 0 then MAX_DEPH  := temp_byte else
                       begin
                         dolacz_kom('checksps.err', 'b��d parametr�w programu');
                         done;
                         halt;
                       end;
     {minimalna g��boko��}
     val(pobierz_parametr('MIN_DEPH'), temp_byte, kod);
     if kod = 0 then MIN_DEPH  := temp_byte else
                       begin
                         dolacz_kom('checksps.err', 'b��d parametr�w programu');
                         done;
                         halt;
                       end;

     {�aduj� dopuszczalne indeksy PS}
     readln(plik_ini, temp_str);
     if Pos('<', temp_str) <> 0 then
        temp_str := copy(temp_str, 1, Pos('<', temp_str) - 1); {usuwam komentarz}
     if Pos('LEGAL_INDSS',temp_str) = 1 then
     begin
       if (Pos(':', temp_str) <> 0) and  (Pos(';', temp_str) <> 0) and
          (Pos(';', temp_str) > Pos(':', temp_str))
       then
       for i := 1 to ile_znakow(temp_str,',') + 1 do
       begin
         LEGAL_INDSS_ARR[i] := pobierz_element(temp_str, i); {a teraz wczytujemy do macierzy}
       end
       else
       begin
         dolacz_kom('checksps.err', 'b��d parametr�w inicjuj�cych programu');
         done;
         halt;
       end;
     end;

     temp_str := pobierz_parametr('TEST_COORD');
     if temp_str = 'TAK' then TEST_COORD := true else
     if temp_str = 'NIE' then TEST_COORD := false else
        begin
          dolacz_kom('checksps.err',
                      'B��D: Niedopuszczalna opcja inicjalizuj�ca');
          done;
          halt;
        end;
     if  TEST_COORD = true then
     begin
       val(pobierz_parametr('MIN_NORTH_COORD'), temp_double, kod);
       if kod = 0 then MIN_NORTH_COORD  := temp_double else
                       begin
                         dolacz_kom('checksps.err', 'b��d parametr�w programu');
                         done;
                         halt;
                       end;

       val(pobierz_parametr('MAX_NORTH_COORD'), temp_double, kod);
       if kod = 0 then MAX_NORTH_COORD  := temp_double else
                       begin
                         dolacz_kom('checksps.err', 'b��d parametr�w programu');
                         done;
                         halt;
                       end;
       val(pobierz_parametr('MIN_EAST_COORD'), temp_double, kod);
       if kod = 0 then MIN_EAST_COORD  := temp_double else
                       begin
                         dolacz_kom('checksps.err', 'b��d parametr�w programu');
                         done;
                         halt;
                       end;

       val(pobierz_parametr('MAX_EAST_COORD'), temp_double, kod);
       if kod = 0 then MAX_EAST_COORD  := temp_double else
                       begin
                         dolacz_kom('checksps.err', 'b��d parametr�w programu');
                         done;
                         halt;
                       end;
     end else
     begin
       {
       readln(plik_ini, temp_str);
       readln(plik_ini, temp_str);
       readln(plik_ini, temp_str);
       readln(plik_ini, temp_str);
       }
     end;

     pobierz_sekcje('[SEKCJA WSPOLCZYNNIKOW]');
       val(pobierz_parametr('SP_LINE_NUM_COEF'), temp_reaL, kod);
       if kod = 0 then SP_LINE_NUM_COEF  := temp_real else
                       begin
                         dolacz_kom('checksps.err', 'b��d parametr�w programu');
                         done;
                         halt;
                       end;

       val(pobierz_parametr('SP_SHOT_NUM_COEF'), temp_reaL, kod);
       if kod = 0 then SP_SHOT_NUM_COEF  := temp_real else
                       begin
                         dolacz_kom('checksps.err', 'b��d parametr�w programu');
                         done;
                         halt;
                       end;

       val(pobierz_parametr('SP_LINE_NUM_PLUS'), temp_reaL, kod);
       if kod = 0 then SP_LINE_NUM_PLUS  := temp_real else
                       begin
                         dolacz_kom('checksps.err', 'b��d parametr�w programu');
                         done;
                         halt;
                       end;
       val(pobierz_parametr('SP_SHOT_NUM_PLUS'), temp_reaL, kod);
       if kod = 0 then SP_SHOT_NUM_PLUS  := temp_real else
                       begin
                         dolacz_kom('checksps.err', 'b��d parametr�w programu');
                         done;
                         halt;
                       end;
       Val(pobierz_parametr('RLINE_NUM_COEF'), temp_reaL, kod);
       if kod = 0 then RLINE_NUM_COEF  := temp_real else
                       begin
                         dolacz_kom('checksps.err', 'b��d parametr�w programu');
                         done;
                         halt;
                       end;
       val(pobierz_parametr('RLINE_NUM_PLUS'), temp_reaL, kod);
       if kod = 0 then RLINE_NUM_PLUS  := temp_real else
                       begin
                         dolacz_kom('checksps.err', 'b��d parametr�w programu');
                         done;
                         halt;
                       end;
     val(pobierz_parametr('FROM_NUM_CHAN_COEF'), temp_reaL, kod);
       if kod = 0 then FROM_NUM_CHAN_COEF  := temp_real else
                       begin
                         dolacz_kom('checksps.err', 'b��d parametr�w programu');
                         done;
                         halt;
                       end;

     val(pobierz_parametr('FROM_NUM_CHAN_PLUS'), temp_reaL, kod);
       if kod = 0 then FROM_NUM_CHAN_PLUS  := temp_real else
                       begin
                         dolacz_kom('checksps.err', 'b��d parametr�w programu');
                         done;
                         halt;
                       end;

     val(pobierz_parametr('TO_NUM_CHAN_COEF'), temp_reaL, kod);
     if kod = 0 then TO_NUM_CHAN_COEF  := temp_real else
     begin
       dolacz_kom('checksps.err', 'b��d parametr�w programu');
       done;
       halt;
     end;

     val(pobierz_parametr('TO_NUM_CHAN_PLUS'), temp_reaL, kod);
                       if kod = 0 then  TO_NUM_CHAN_PLUS := temp_real else
                       begin
                         dolacz_kom('checksps.err', 'b��d parametr�w programu');
                         done;
                         halt;
                       end;

end;      {********** KONIEC POBIERANIA PLIKU INI  ******************   }




procedure init_load_xsps;
var
    linia     :string[80];
    tempik    :string;
    record_x  :xsps_line;
begin
  ilosc_wierszy_x := 0;

  while not eof(plik_x) do
  begin
    inc(ilosc_wierszy_x);
    readln(plik_x, tempik);
    linia := tempik ;                      {OSTRO�NIE !!! D�UGO��}
    if length(tempik) > 80 then
       begin
         writeln('B��D FORMATU SPS -> WIERSZ D�U�SZY NI� 80 ZNAK�W');
         writeln('Naci�nij dowolny klawisz .... ');
         dolacz_kom('checksps.err', 'B��d:B��D FORMATU SPS -> WIERSZ D�U�SZY NI� 80 ZNAK�W');
         done;
         halt;
       end;

    if length(tempik) < 80 then dolacz_kom('checksps.err',
                      'UWAGA: Wiersz XSPS zawiera mniej ni� 80 znak�w');
    if (is_non_visible_char(tempik) = true) then
       begin
         dolacz_kom('checksps.err','B��D: Poni�szy wiersz w XSPS zawiera niedozwolone znaki... ');
         dolacz_kom('checksps.err','" ' + tempik + '"');
         halt;
       end;
    translate_xline(linia, record_x);
    write(aut_x, record_x);
  end;
end;


procedure init_load_ssps;
var linia     :string[80];
    tempik    :string;
    record_s  :ssps_line;

begin
  ilosc_wierszy_s := 0;
  while not eof(plik_s) do
  begin
    inc(ilosc_wierszy_s);
    readln(plik_s, tempik);                       {OSTRO�NIE !!! D�UGO��}
    linia := tempik;
    if length(tempik) > 80 then
       begin
         writeln('B��D FORMATU SSPS -> WIERSZ D�U�SZY NI� 80 ZNAK�W');
         writeln('Naci�nij dowolny klawisz .... ');

         done;
         halt;
       end;
    if length(tempik) < 80 then
         dolacz_kom('checksps.err',
         'UWAGA: wiersz SSPS zawiera mniej ni� 80 znak�w');

    if (is_non_visible_char(tempik) = true) then
       begin
         dolacz_kom('checksps.err','B��D: Poni�szy wiersz w SSPS zawiera niedozwolone znaki...');
         dolacz_kom('checksps.err','" ' + tempik + '"');
         done;
         halt;
       end;

    translate_sline(linia, record_s);
    write(aut_s, record_s);
  end;
  number_rec_in_s := ilosc_wierszy_s;
end;

procedure init_load_rsps;
begin
end;

begin                                           {init}
  init_parametry_tematu;
  init_load_xsps;
  init_load_ssps;
  init_load_rsps;
end;                                            {init}

procedure otwieram_pliki;
begin
  nazwa_pliku_ini := 'checksps.ini';

  if not FileExists(nazwa_pliku_ini) then
  begin
    writeln('B��d wej�cia - wyj�cia.');
    halt;
  end;
  assign(plik_ini, nazwa_pliku_ini);
  reset(plik_ini);

  assign(plik_s, nazwa_ssps);
  reset(plik_s);
  assign(aut_s, nazwa_sout); {wynik ssps w paostaci binarnej}
  rewrite(aut_s);

  assign(plik_x, nazwa_xsps);
  reset(plik_x);

  assign(aut_x, nazwa_xout);
  rewrite(aut_x);
{assign(aut_r, nazwa_rout);}
  reset(aut_x);
  reset(aut_s);
{  reset(aut_r);}
end;

procedure done;
begin
  close(plik_ini);
  close(aut_x);
  close(aut_s);
  assign(aut_x, nazwa_xout);
  assign(aut_s, nazwa_sout);
  erase(aut_x);
  erase(aut_s);
  { close(aut_r); }
end;

procedure test_xsps;                            {og�lna procedura}
var temp_rekord,
    next_rekord  :xsps_line;
    licznik      :longint;

procedure test_tapes;
var
     temp_str,
     temp_str2        :string;
begin
  licznik := 0;
  seek(aut_x, licznik);
  while licznik <= ilosc_wierszy_x - 2  do {�eby na przedostatniej}
  begin
    read(aut_x, temp_rekord);
    seek(aut_x, licznik + 1);
    read(aut_x, next_rekord);
    if ((next_rekord.tasma - temp_rekord.tasma) <> 0) then
    if ((next_rekord.tasma - temp_rekord.tasma) <> 1) then
       begin
         str(temp_rekord.tasma:5, temp_str );
         str(next_rekord.tasma:5, temp_str2 );
         dolacz_kom('checksps.err', 'UWAGA: skok numeracji ta�my: ' +  temp_str +
                     ' -> ' + temp_str2);
         skok_nr_tasmy := true;
       end;
    inc(licznik);
    seek(aut_x, licznik);
  end;
end;

procedure test_records;
var  temp_str,
     temp_str2        :string;
     sztuk            :longint;

begin                                           {********** test_records ******** }
  licznik := 0;   sztuk := 1;
  seek(aut_x, licznik);
  while licznik <= ilosc_wierszy_x - 2  do
  {�eby si� zatrzyma� na przedostatniej}
  begin
    read(aut_x, temp_rekord);
    seek(aut_x, licznik + 1);
    read(aut_x, next_rekord);
    if ((next_rekord.rekord - temp_rekord.rekord) <> 0) then
    begin
    inc(sztuk);
    if ((next_rekord.rekord - temp_rekord.rekord) <> 1) then
       begin
         str(temp_rekord.rekord:5, temp_str );
         str(next_rekord.rekord:5, temp_str2 );
         temp_str2 := 'UWAGA: skok numeracji rekordu: ' +
                       temp_str + ' -> ' + temp_str2;
         dolacz_kom('checksps.err', temp_str2   );
       end;
    end;
    inc(licznik);
    seek(aut_x, licznik);

  end;
  str(sztuk:4, temp_str2 );
  number_rec_in_x := sztuk;
  dolacz_kom('checksps.err', 'ilo�� rekord�w w XSPS------> ' + temp_str2 );
  str(ilosc_wierszy_s:4, temp_str);
  dolacz_kom('checksps.err', 'ilo�� rekord�w w SSPS ------>' + temp_str);
end;


procedure test_positions;
begin
end;


procedure test_lines;
var  tasma_1, tasma_2 :word;
     temp_str,
     temp_str2        :string;

procedure nalezy_do_swatha;
var       temp_str,
          temp_str2        :string;
          temp_byte        :byte;
          jest             :boolean;
begin
  if (temp_rekord.linia_odb < FIRST_LINE_IN_SWATH)
     or (temp_rekord.linia_odb > LAST_LINE_IN_SWATH )
  then
  begin
    str(temp_rekord.linia_odb:5:2, temp_str );
    str(temp_rekord.rekord:5, temp_str2);
    dolacz_kom('checksps.err','B��D: linia nie nale�y do swatha: ' +
    temp_str + ' (rekord: ' + temp_str2 + ')');
    line_not_in_swath := true;
  end
  else
  begin
  jest := false;   temp_byte := 1;
  while (temp_byte <= MAX_LINE_IN_SWATH) and (jest = false)  do
  begin
    if LINIE_ODBIORU[temp_byte] = temp_rekord.linia_odb then jest := true;
    inc(temp_byte);
  end;
  if jest = false
  then
  begin
    str(temp_rekord.linia_odb:5:2, temp_str );
    str(temp_rekord.rekord:5, temp_str2);
    dolacz_kom('checksps.err','B��D: linia nie nale�y do swatha: ' +
    temp_str + ' (rekord: ' + temp_str2 + ')');
    line_not_in_swath := true;
  end;
  end;
end;




procedure testuj_linie_parami;
{sprwadzam, czy linie s�siednie s� logicznie napisane}
var
     temp_str,
     temp_str2                   :string;
     licznik_rekord              :longint;
     suma_kanalow_z_kanalow_next :word;
     suma_kanalow_z_odbior_next  :word;
     suma_kanalow_z_kanalow_temp :word;
     suma_kanalow_z_odbior_temp  :word;

{$I c:\progs\sps_e\testy\check\parami.pas}



begin  {testuj_linie_parami;}

  licznik := 0;   suma_kanalow_z_kanalow_next := 0;   suma_kanalow_z_odbior_next  := 0;
  suma_kanalow_z_kanalow_temp:= 0;   suma_kanalow_z_odbior_temp  := 0;

  while licznik <= ilosc_wierszy_x - 2  do
  begin
    seek(aut_x, licznik);
    read(aut_x, temp_rekord);
    seek(aut_x, licznik + 1);
    read(aut_x, next_rekord);

    {wychwytuj� "styk" dw�ch rekord�w. To jest robione tylko je�eli para
    linii odb. wypada na styku}

    test_na_jedynke; {cz�sty skutek niechlujnego kasowania}
    jest_wiecej; {..... kana��w w rekordzie}

    if (temp_rekord.do_kanalu < MIN_CHANELS_IN_SPREAD) and {tylko ostatni wiersz}
       (temp_rekord.rekord <> next_rekord.rekord) then
    begin
      if not jest_linia_skipem(temp_rekord) then
      begin
        str(next_rekord.rekord:5, temp_str2 );
        malo_kanalow_w_rek := true;
        dolacz_kom('checksps.err', 'UWAGA!!!: Zbyt ma�a ilo�� aktywnych kana��w w rekordzie '
                 + '(rec. ' + temp_str2 +')' );
      end;
    end;

    if ((next_rekord.rekord - temp_rekord.rekord) = 0) then
      {a tu ju� badamy we wn�tzru rekordu}
      begin
        {poni�sze procedury znajduj� si� w pliku}
        oblicz_sumy_kanalow; {w procedurze}

        dobre_sumy_kanalow;  {analizuje sumy kanalow}
        czy_rozne_sasiednie_linie; {testujemy s�siednie linie odb. w rekordzie}
        testuj_kanaly_parami; {jest to de facto procedura testuj_kana�y}
        testuj_odbiorniki_parami; {co innego kana�, co innego odbiornik}
      end;

  inc(licznik);
  end; {p�tla ilo�ci rekord�w  }

end;


begin                                          {procedury test_lines;}
  testuj_linie_parami; {tam od nowa ustawiam na pocz. pliku}
end;      {procedury test_lines;}


procedure test_indexes;
{indeksy s� chyba 3}
begin
end;

begin                          {****test_xsps}
  dolacz_kom('checksps.err', '                                           ');
  dolacz_kom('checksps.err', '                                           ');
  dolacz_kom('checksps.err', '       --------- TEST XSPS ---------       ');
  dolacz_kom('checksps.err', '                                           ');
  test_tapes;
  test_records;
  test_positions;
  test_lines;
  test_indexes;
end;                           {****   test_xsps *******}

procedure test_ssps;           {****   test_ssps *******}

procedure test_kodu;
{test �adunku oraz ilo�ci otwor�w - czemu nie ???}
var
         i   :longint;
    licznik  :byte;
    tymczas  :ssps_line;
    jest     :boolean;

begin
  licznik  := 1; jest := false;
  for i := 0 to ilosc_wierszy_s - 1 do
  begin
    seek(aut_s, i);
    read(aut_s, tymczas);
    while (LEGAL_INDSS_ARR[licznik] <> '') and (jest = false) and (licznik <= 24) do
    begin
      if tymczas.kod_pkt = LEGAL_INDSS_ARR[licznik]
      then
      begin
        jest := true;
        break;
      end
      else
      begin
        jest := false;
        inc(licznik);
      end;
    end;

    if (jest = false) then
    begin
      str((i+1):4, temp_str);
      dolacz_kom('checksps.err',
      'B��D: Brak takiego indeksu punktu strza�owego (wiersz: '+temp_str+')');
      no_index_sp := true;
    end;

  licznik  := 1; jest := false;
  end; {for}

end;


procedure test_deph;
{max i min zdefiniowane}
var tymczas :ssps_line;
    i       :longint;
begin
 {mo�na tak zrobi�, �e pewne przedzia�y g��boko�ci i
 indeksy pkt. si� wykluczaj� np E1 to przedzia� tylko >3m E4 tylko 2m}

  for i := 0 to ilosc_wierszy_s - 1 do
  begin
    seek(aut_s, i);
    read(aut_s, tymczas);
    str((i+1):4, temp_str);
    if tymczas.deph > MAX_DEPH THEN
       begin
         dolacz_kom('checksps.err',
         'B��D: Zbyt du�a g��boko�� otworu (wiersz:' + temp_str +')');
         too_deep_hole := true;
       end;
    if tymczas.deph < MIN_DEPH THEN
       begin
         dolacz_kom('checksps.err',
         'B��D: Zbyt ma�a g��boko�� otworu (wiersz:' + temp_str +')');
         too_shellow_hole := true;
       end;
  end; {for}
  {    WYMY�L INNE TESTY G��BOKO�CI !!!!}
end;

procedure test_uphole;
begin
end;

procedure   test_xy;
begin
end;


procedure test_times;
{test dnia i czasu}
var   i        :longint;
      tymczas  :ssps_line;

begin
  incorrect_time_format := false;
  for i := 0 to ilosc_wierszy_s - 1 do
  begin
    seek(aut_s, i);
    read(aut_s, tymczas);
  end; {for}
end;


procedure test_powtorek;
begin
{cholera trzeba sortowa�}
end;


begin              {cia�o procedury test SSPS}
  dolacz_kom('checksps.err', '                                           ');
  dolacz_kom('checksps.err', '                                           ');
  dolacz_kom('checksps.err', '      ---------- TEST SSPS ---------       ');
  dolacz_kom('checksps.err', '                                           ');
  test_kodu;
  test_deph;
  test_uphole;
  test_xy;
  test_times;
//  testuj_parami;
  test_powtorek; {czy s� podw�jne PS. Zwykle nie wyst�puje ale ....}
end;


procedure naglowek_testu(nazwa_pliku_S,nazwa_pliku_X,nazwa_pliku_R :string);
var tmp_byte :byte;
    Time: TDateTime;
begin
  dolacz_kom('checksps.err','   ' +  '                                 ');
  dolacz_kom('checksps.err','   ' +  '                                  ');
  dolacz_kom('checksps.err','   ' +  '******************************************');

  temp_str := TimeToStr(Time);

  dolacz_kom('checksps.err', '   *      (czas): ' + temp_str);
  temp_str2 := '   *' + 'Test plik�w    : ' + '   ' + nazwa_pliku_S + ' ' +
            nazwa_pliku_X + ' ' +nazwa_pliku_R;
  temp_str := '*';
  tmp_byte := Length(temp_str2);
  dostaw_space(temp_str, 44 - tmp_byte );
  temp_str2 := temp_str2 + temp_str;
  dolacz_kom('checksps.err', temp_str2);
  dolacz_kom('checksps.err', '   *' +'                                        *');
  dolacz_kom('checksps.err', '   ******************************************');
end;


function TestDaty(data :longint):boolean;
begin
  if kontrola_poprawnosci then
  begin
  if (data > 366) or (data < 0) THEN
  begin
    TestDaty := false;
    Exit;
  end;
  end;
  TestDaty := true;
end;


function TestGodziny(czas :longint):boolean;
begin
  if kontrola_poprawnosci then
  begin
  if (czas div 10000) > 24 then
  begin
    TestGodziny := false;
    Exit;
  end;
  if ((czas div 100) mod 100 > 60) then
  begin
    TestGodziny := false;
    Exit;
  end;
  if (czas mod 100 )> 60 then
  begin
    TestGodziny := false;
    Exit;
  end;
  end;
  TestGodziny := true;
end;

function TestujCzas(data, czas :longint):boolean;
begin
  if kontrola_poprawnosci then
  begin
  if not TestDaty(data) then
  begin
    TestujCzas := false;
    Exit;
  end;
  if not TestGodziny(czas) then
  begin
    TestujCzas := false;
    Exit;
  end;
  end;
  TestujCzas :=true;
end;

function TestujPrzyrostCzasu(dzien_poprzedni, dzien_nastepny:integer; czas_nastepny, czas_poprzedni :real) :boolean;
begin
  if kontrola_poprawnosci then
  begin
    if (dzien_poprzedni = 0) and  (dzien_nastepny = 0)
        and (czas_nastepny = 0) and  (czas_poprzedni = 0) then
        begin
          TestujPrzyrostCzasu := true;
          Exit;
        end;


    if (dzien_poprzedni <> 0) and  (dzien_nastepny <> 0)
        and (czas_nastepny <> 0) and  (czas_poprzedni <> 0) then
    begin
      if dzien_poprzedni > dzien_nastepny  then
      begin
        TestujPrzyrostCzasu := false;
        Exit;
      end;
      if (dzien_poprzedni = dzien_nastepny) and (czas_nastepny <= czas_poprzedni)
      then
      begin
        TestujPrzyrostCzasu := false;
        Exit;
      end;
    end else
    if  (dzien_poprzedni = 0) and  (dzien_nastepny = 0) then //Nie podano daty
    begin
      if (czas_nastepny <= czas_poprzedni) then
      begin
        TestujPrzyrostCzasu := false;
        Exit;
      end;
    end;

  end;
  TestujPrzyrostCzasu := true;
end;



  //****************************************************************


//function TestCzasuPionowego(const czas :Float) :boolean;

function TestKoduLadunku(KodLadunku :string):boolean;
var   local_charges   :string;// Oczywi�cie w rejestrze;
begin
  if kontrola_poprawnosci then
  begin
    local_charges := Param.LegalIndexes;
    if (local_charges <> null) and (Length(local_charges) <> 0) then
    begin
      if Pos(KodLadunku, local_charges) <> 0 then  TestKoduLadunku := true
      else TestKoduLadunku := false;
    end else
    BEGIN
       TestKoduLadunku := false;
    end;
  end;
end;

function TestKrotnosci(znak :string) :boolean;
begin
  if  (znak <> '0') and (znak <> '1') and (znak <> '2') and (znak <> '3') and (znak <> '4')and
   (znak <> '5')and  (znak <> '6') and (znak <> '7') and (znak <> '8') and (znak <> '9')  then
  TestKrotnosci := false else TestKrotnosci := true;
end;

function TestPoprawkiStatycznej(wartosc :real; iks_min:real; iks_max :real) :boolean;
begin
//  DataSource2.DataSet := SortujQuery;
  if (wartosc > iks_max) or (wartosc < iks_min) then
  TestPoprawkiStatycznej := false else TestPoprawkiStatycznej := true;
end;

function TestGlebokosci(wartosc :real; Param :PTestyDoZrobienia) :boolean;
begin
  if (wartosc < Param.MinDeph) or (wartosc > Param.MaxDeph) then
     TestGlebokosci := false else TestGlebokosci := true;
end;

function TestPredkosciSredniej(wartosc :real) :boolean;
begin

end;

function TestGeodezjiXY(LINE, STATION :real; Testy :PTestyDoZrobienia) :boolean;
begin
  ShowMessage('Nie zaimplementowano');
end;

function TestElewacji(wartosc :real; MinElev, MaxElev :real) :boolean;
begin
  if (wartosc < MinElev) or (wartosc > MaxElev) then
     TestElewacji := false else TestElewacji := true;
end;

function TestujPierszyZnakS(znak :char) :boolean;
begin
  if UpCase(znak) <> 'S' then  TestujPierszyZnakS := false else
  TestujPierszyZnakS := true;
end;

function TestujPierszyZnakR(znak :char) :boolean;
begin
  if UpCase(znak) <> 'R' then  TestujPierszyZnakR := false else
  TestujPierszyZnakR := true;
end;


function CzyDobryTypZrodla(kod :string; Zrodlo :byte):boolean;  //Dynamit lub wibrator
//kod-E1, Zrodlo - predefiniowane
begin
  if (Zrodlo = DYNAMIT)  and ((Pos('V', kod)<>0) or (Pos('v', kod)<> 0) )
  then
    begin
      CzyDobryTypZrodla := false;
      Exit;
    end else
    begin
      CzyDobryTypZrodla := true;
      Exit;
    end;

  if (Zrodlo = WIBRATOR)  and ((Pos('E', kod)<> 0) or (Pos('e', kod)<> 0) )
  then
    begin
      CzyDobryTypZrodla := false;
      Exit;
    end else
    begin
      CzyDobryTypZrodla := true;
      Exit;
    end;

end;


function TestDlugosciWierszaS(wiersz :string) :boolean;
begin
  if kontrola_poprawnosci then
  begin
  if length(wiersz) <> 80 then
  begin
    TestDlugosciWierszaS := false;
    Exit;
  end;
  end;
  TestDlugosciWierszaS := true;
end;

function TestPoprawnosciWierszaS(wiersz :string):boolean;
begin
  if (is_non_visible_char(wiersz) = true) then
  begin
    TestPoprawnosciWierszaS := false;
    Raise ECorrectS.Create('Niedopuszczalne znaki w SPS-S');
    Exit;
  end;

  if  wiersz[1] <> 'S' then
  begin
    TestPoprawnosciWierszaS := false;
    Raise ECorrectS.Create('Pierwszy znak wiersza SPS-S musi by� "S"');
    Exit;
  end;

  TestPoprawnosciWierszaS := true;
end;


//**************************************************************************


function TestPoprawnosciWierszaX(wiersz :string):boolean;
begin
  if length(wiersz) <> 80 then
  begin
    TestPoprawnosciWierszaX := false;
    Raise ECorrectX.Create('D�ugo�� wiersz SPS-X r�na od 80 znak�w');
    Exit;
  end;

  if (is_non_visible_char(wiersz) = true) then
  begin
    TestPoprawnosciWierszaX := false;
    Raise ECorrectX.Create('Niedopuszczalne znaki w SPS-X');
    Exit;
  end;

  if  wiersz[1] <> 'X' then
  begin
    TestPoprawnosciWierszaX := false;
    Raise ECorrectX.Create('Pierwszy znak wiersza SPS-X musi by� "X"');
    Exit;
  end;
  TestPoprawnosciWierszaX := true;
end;

function TestNumeruTasmy(Numer :integer):boolean;
begin
  if kontrola_poprawnosci then
  begin
  if (numer < 0) or (numer >= 9999) then
  begin
    TestNumeruTasmy := false;
    Exit;
  end;
  end;
  TestNumeruTasmy := true;
end;


function TestNumeruRekordu(Numer :real):boolean;
begin
  if kontrola_poprawnosci then
  begin
  if (numer <= 0) or (numer >= 9999) then
  begin
    TestNumeruRekordu := false;
    Exit;
  end;
  end;
  TestNumeruRekordu := true;
end;


function TestOdDoSkadDokad(od, doo, skad, dokad :real; krok_kanalu :integer) :boolean;
var t1, t2           :integer;
begin
  if kontrola_poprawnosci then
  begin
  if not   (Trunc(doo - od) = (Trunc((dokad - skad)) div Trunc(KROK_KANALU)))
     then  TestOdDoSkadDokad := false else  TestOdDoSkadDokad := true;
  end;
end;


function TestPoprawnosciWierszaR(wiersz :string):boolean;
begin
  if (is_non_visible_char(wiersz) = true) then
  begin
    TestPoprawnosciWierszaR := false;
    Raise ECorrectR.Create('Niedopuszczalne znaki w SPS-R');
    Exit;
  end;
  if  wiersz[1] <> 'R' then
  begin
    TestPoprawnosciWierszaR := false;
    Raise ECorrectR.Create('Pierwszy znak w SPS-R musi by� "R"');
    Exit;
  end;
  TestPoprawnosciWierszaR := true;
end;

function CzySkokTasmy(Poprzedni, Nastepny :real) :boolean;
begin
  if (Nastepny - Poprzedni) <> 0 then  CzySkokTasmy := true
  else CzySkokTasmy := false;
end;

function CzySkokRekordu(Poprzedni, Nastepny :real) :boolean;
begin
  if Nastepny <> Poprzedni then  CzySkokRekordu := true
  else CzySkokRekordu := false;
end;

function CzySkokAparatury(Poprzedni, Nastepny :char) :boolean;
begin
  if Nastepny <> Poprzedni  then  CzySkokAparatury := true
  else CzySkokAparatury := false;
end;

function CzySkokKrokKan(Poprzedni, Nastepny :integer) :boolean;
begin
  if Nastepny <> Poprzedni  then  CzySkokKrokKan := true
  else CzySkokKrokKan := false;
end;

function CzySkokOdKan(Poprzedni, Nastepny :real) :boolean;
begin
  if Nastepny <> Poprzedni then CzySkokOdKan := true else
     CzySkokOdKan := false;
end;

function CzySkokDoKan(Poprzedni, Nastepny :real) :boolean;
begin
  if Nastepny <> Poprzedni then CzySkokDoKan := true else
     CzySkokDoKan := false;
end;

function CzyKolenoscLiniiOK(Poprzedni, Nastepny, Roznica :real ) :boolean;
begin
  if (Nastepny - Poprzedni) <> Roznica then CzyKolenoscLiniiOK := false else
     CzyKolenoscLiniiOK := true;
end;

procedure NumerNaWspolrzedna(Linia, Stacja, PierwszaLinia, PierwszyKanal,
                x0, y0, DeltaX, DeltaY, Azym:real; var WynikX, WynikY:real);
var x, y, Rad :real;

begin
   Rad := Azym*Pi/180;
//   x := x0 + (Linia-PierwszaLinia)*
//   y := y0 +
//   WynikX := x;
//   WynikY := y;
end;

function Odleglosc(x1, y1, x2,y2 :real) :real;
var wyn :real;
begin
  wyn := sqrt((x1-x2)*(x1-x2) + (y1-y2)*(y1-y2));
  Odleglosc := wyn;
end;

end.