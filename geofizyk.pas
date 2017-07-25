 unit geofizyk;

 interface
{ uses algtyp;}
 const h=10;
 const
      MAX_ILOSC = 10; {ilosc elementow do interpolowania w poprzek}
      PIERW_GEO = 2001;{Piersza linia geofonowa (w kier - X)}
      PIERW_WIB = 2000;{Pierwsza wspolrzedna wibratorowa}
      LAST_WIB  = 3440;
      SKOK_GEO  = 14;  {Odstepy pom. LO}
      SKOK_WIB  = 14;  {Odstepy pom. LWzbudzenia}
      DLUG_INTERP= 8;   {Ilosc probek dla interpolacji}
 type cyferki      = set of '0'..'9';
 const cyfry : cyferki =['0', '1','2','3','4','5','6','7','8','9'];


 type
 poprz_typ = array[1..MAX_ILOSC] of real; {Poprzecznych wspolrzednych}

 function il_wier(plik :string) :longint; {ilosc wierszy pliku tekstowego}
 function power(n :integer) : shortint;
 function Hex(liczba : Byte) : string;



                          {***************************}


 function normuj(linia :string) :string;
 {funkcja dosuwa liczbe do lewa i zwraca taka dlugosc lancucha ile cyfr}
 function cyfr(wiersz :string) :byte;
          {Podaje ilosc cyfr w lancuchu oraz niektorych bialych znakow}
 function first_non_space(wiersz :string) :byte;
          {Zwraca pozycje pierwszego nie-bialego znaku}
 function szukaj_char(lin:string; znaczek :char; ktora :byte):byte;
          {Zwraca pozycje n-tego wystapienia znaku "znak"}
 function last_digit(wiersz: string) :integer;
 	{funkcja zwraca pozycj© ostatniego znaku niebiaˆego}
 function kolumna(linia:string; n :byte) :string;
	 {funkcja zwraca wartsc zawarta w n-tej kolumnie}
 procedure dostaw_space(var liczbus :string; szerokosc :byte);
	 {procedura uzupelnia lancuch liczbus spacjami od lewej do szer. szerokosc}
 procedure dostaw_zera(var liczbus :string; szerokosc :byte);
 	{uzupelnia liczb© zerami od lewej}
 procedure  dolacz_kom(nazwa :string; komunikat :string);
 	{Procedura dalacza do pliku tekstowego "nazwa" wiersz o tresci "komunikat"}
 procedure wstaw(var wiersz_cel :string; liczba :string; kolumna_cel :byte);
 	{wstawia do wiersz_cel liczbe liczba tak, aby znajdowala sie w danej
 	kolumnie i byla dosunieta do prawej}
 procedure wstaw_do_kol(var wiersz_celu :string; co_wstawic:string;
                            do_znaku :integer);
 	{wstawia "co_wstawi†" do wiersza "wiersz_celu" do kolumny "do_znaku"
          wyr¢wnuj¥c do prawej. Kolumna to kolejny znak w ˆaäcuchu wraz z biaˆymi}

 function ile_znakow(wiersz :string; znak :char):byte;
 	{funkcja zlicza ile znakow "znak" znajduje si© w wierszu}


 IMPLEMENTATION

 uses  wincrt;



 function il_wier(plik :string) :longint;
 { ilosc wierszy pliku tekstowego}
 var pliczek  :text;
     i        :longint;
     linia    :string;
 begin
   assign(pliczek,plik);
   reset(pliczek);
   i := 0;
   while not eof(pliczek) do
   begin
     readln(pliczek,linia);
     inc(i);
   end;
   close(pliczek);
   il_wier := i;

 end;





 function pow(x,a :real) :real;
 {oblicza x do potegi a}
 begin
   pow := exp(a * ln(x))
 end;








 function power(n :integer) : shortint;
 begin
   if odd(n) then power := -1
   else power := 1
 end;





 function Hex(liczba : Byte) : string;
 var    y, x : LongInt;
 	d, i : Byte;
	S    : string[2];
 begin
  S[0]:=#2; i:=2; x:=liczba;
  repeat
    y:=x div 16;
    d:=x-16*y;
    S[i]:=Chr(d+48+7*Ord(d>9));
    x:=y;
    Dec(i)
  until x=0;
  Hex:=Copy(S, i+1, 2)
 end;

                {*****************************************}


 function normuj(linia :string) :string;
 {funkcja dosuwa liczbe do lewa i zwraca taka dlugosc lancucha ile cyfr}
 var znak      :char;
     i,dlugosc :byte;
     tmp_str   :string;
 begin

 i := 1;   tmp_str := '';
 znak := linia[i]; dlugosc := length(linia);

 while not (znak in cyfry) and (i <= dlugosc)  do
 begin
 inc(i);
 znak := linia[i];
 end;

 while (znak in cyfry) and (i <= length(linia)) do
 begin
   tmp_str := tmp_str + znak;
   inc(i);
   znak := linia[i];
 end;
 normuj := tmp_str;

 end;


 function szukaj_char(lin:string; znaczek :char; ktora :byte):byte;
 {Zwraca pozycje n-tego wystapienia znaku "znak"}
 var temp        :byte;
    pozycja,ile :byte;
    licznik     :byte;
 begin
   ile := length(lin);   temp := 0; pozycja := 1;
   repeat
     if (lin[pozycja] = znaczek) then inc(temp);
     inc(pozycja);
   until (pozycja = ile + 1) or (temp = ktora);

   if temp = ktora then  szukaj_char := pozycja - 1 else
           szukaj_char := 0;
 end;


 function first_non_space(wiersz :string) :byte;
 {Zwraca pozycje pierwszego nie-bialego znaku}
 var i,j   :byte;
     temp  :string;
     znak  :char;
 begin
   i := 0; j := 0;
   repeat
      inc(i);
   until  (wiersz[i] <> ' ') or (i = length(wiersz));
   first_non_space := i;
 end;

 function first_after_cyfra(wiersz :string) :byte;
 var i       :byte;
     znak    :char;
     dlugosc :integer;
 begin
   i := 0;
   dlugosc := length(wiersz);
   if dlugosc = 0 then
   begin
     first_after_cyfra := 0;
     exit;
   end;

   repeat
     inc(i);
     znak := wiersz[i];
   until   (znak in cyfry) or (znak='.') or (znak='+') or (znak='-');
   repeat
     inc(i);
     znak := wiersz[i];
   until (znak = ' ') or (i=dlugosc);
    if i = dlugosc then  first_after_cyfra := i+1
    else  first_after_cyfra := i;
 end;

 function last_digit(wiersz: string) :integer;
 var count :integer;
     i     :integer;
 begin
   count := 0;
   for i := 1 to 256 do
   begin
     if wiersz[i] in cyfry then count := i;
   end;
   last_digit := count;
 end;

 function cyfr(wiersz :string) :byte;
 { Podaje ilosc cyfr w lancuchu oraz niektorych bialych znakow}
 var i,j   :byte;
     znak  :char;

 begin
   i := 0; j := 0;
   repeat
     inc(i);
     znak := wiersz[i] ;
     if (znak in cyfry) or (znak = '.') or (znak = 'e') or (znak = '+')
        or (znak = '-') then inc(j);
   until (i=length(wiersz)) ;
   cyfr := j;
 end;


 procedure  dolacz_kom(nazwa :string; komunikat :string);
 {Procedura dalacza do pliku tekstowego "nazwa" wiersz o tresci "nazwa"}
 var tmp   :integer;
     plik  :text;

 begin
   assign(plik, nazwa);
   {$I-}
   append(plik);
   {$I+}
   if (ioresult <> 0) then
      begin
        rewrite(plik);
        close(plik);
        assign(plik, nazwa);
        append(plik);
      end;

   writeln(plik, komunikat);
   close(plik);
 end;

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

 end;


 begin
 kol := 0; sumka := '';
 i := 1;     znakow := length(linia);
 spacje;   {pocz¥tkowe}
 while (kol < n) and (i <= znakow) and (znak <> ' ') do
 begin
   spacje;
   inc(kol);
   znaczki;
 end;

 kolumna := sumka;
 end;                                           { function kolumna }



 function element(linia:string; n :byte) :string;
 {funkcja oprata na "kolumna" zwraca wartsc zawarta w n-tej kolumnie}
 {separator jest przecinek}
 var kol,znakow,i  :byte;
     sumka         :string;
     znak          : char;

 procedure spacje;
 begin
   while ((linia[i] = ' ') or (linia[i] = ',')) and (i < znakow) do   inc(i);
   sumka := '';
 end;

 procedure znaczki;
 begin
   while ((linia[i] <> ',') or (linia[i] <> ' ')) and (i <= znakow)   do
   begin
     sumka := sumka + linia[i];
     inc(i);
   end;
 end;


 begin
 kol := 0; sumka := '';
 i := 1;     znakow := length(linia);
 spacje;   {pocz¥tkowe i inne znaki}
 while (kol < n) and (i <= znakow) and (znak <> ',') do
 begin
   spacje;
   inc(kol);
   znaczki;
 end;

 element := sumka;
 end;                                           { function element }


 procedure dostaw_space(var liczbus :string; szerokosc :byte);
 var i   :byte;
 begin
   for i := 1 to  szerokosc -  cyfr(liczbus) do
       liczbus := ' ' + liczbus;
 end;                                           {procedure dostaw_space}

 procedure dostaw_zera(var liczbus :string; szerokosc :byte);
 {uzupelnia liczb© zerami od lewej}
 var i   :byte;
 begin
   liczbus := normuj(liczbus);
   for i := 1 to  szerokosc -  cyfr(liczbus) do
       liczbus := '0' + liczbus;
 end;

 procedure wstaw(var wiersz_cel :string; liczba :string; kolumna_cel :byte);
 {wstawia do wiersz_cel liczbe liczba tak, aby znjdowala sie w danej
 kolumnie i byla dosunieta do prawej}
 var cyfr_celu     :byte;
    cyfer         :byte; {cyfr "liczby"}
    pozycja_celu  :byte;
    zawartosc_kol :string;
    zawartosc     :string;
 begin
   zawartosc_kol := Kolumna(wiersz_cel, kolumna_cel);
   pozycja_celu := Pos(zawartosc_kol, wiersz_cel);
   cyfr_celu    := cyfr(zawartosc_kol);
   cyfer  := cyfr(normuj(liczba));
 {  zawartosc :=   copy(liczba,first_non_space(liczba), cyfer);}{dosun do lewej}
   zawartosc := normuj(liczba);
   if cyfr_celu >= cyfer then delete(wiersz_cel, pozycja_celu, cyfr_celu)
      else delete(wiersz_cel, pozycja_celu-(cyfer-cyfr_celu), cyfer);
   if cyfr_celu > cyfer then dostaw_space(zawartosc, cyfr_celu);
   if cyfr_celu >= cyfer then insert(zawartosc, wiersz_cel, pozycja_celu)
   else insert(zawartosc, wiersz_cel, pozycja_celu-(cyfer-cyfr_celu)) ;
 end;        { procedure wstaw}

 procedure wstaw_do_kol(var wiersz_celu :string; co_wstawic:string;
                            do_znaku :integer);
 {wstawia "co_wstawi†" do wiersza "wiersz_celu" do kolumny "do_znaku"
          wyr¢wnuj¥c do prawej. Kolumna to kolejny znak w ˆaäcuchu wraz z biaˆymi}
 var odkad_wstawiac   :integer;
     co_wycinam       :string;
 begin

   odkad_wstawiac := do_znaku - cyfr(normuj(co_wstawic));
   Insert(co_wstawic, wiersz_celu,odkad_wstawiac);
   {Delete(wiersz_celu, do_znaku+1,}
 end;

 function ile_znakow(wiersz :string; znak :char):byte;
 {funkcja zlicza ile znakow znajduje si© w wierszu}
 var   licznik :byte;
       znakow  :byte;
 begin
   znakow := 0;
   for licznik := 1 to length(wiersz) do
   begin
     if wiersz[licznik] = znak then inc(znakow);
   end;
 ile_znakow :=  znakow;
 end;


end.    {of unit }