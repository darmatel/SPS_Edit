
{26.03.1993}

unit WSKAZNIK;

INTERFACE



type   tab   =array[1..30, 1..2] of real;

type   typ_danych  = record
                       wsp_x,
                       wsp_y,
                       wsp_z   :real;
                     end;



type   wskaznik_listy1=^skladnik_listy1;
       skladnik_listy1 =record
                          dane:typ_danych;
                          wskaznik:wskaznik_listy1
                        end;

type    wskaznik_stosu  =^skladnik_stosu;
        skladnik_stosu  =record
                           dane     :typ_danych;
                           wskaznik :wskaznik_stosu
                         end;

type    wskaznik_kolejki=^skladnik_kolejki;
        skladnik_kolejki=record
                           dane    :typ_danych;
                           wskaznik:wskaznik_kolejki;
                         end;



type    wskaznik_listy2=^skladnik_listy2;
        skladnik_listy2=record
                          wskaznik1 :wskaznik_listy2;
                          dane      :typ_danych;
                          wskaznik2 :wskaznik_listy2;
                        end;

type    wskaznik_listy_cykl =^skladnik_listy_cykl;
        skladnik_listy_cykl =record
                               wskaznik1 :wskaznik_listy_cykl;
                               numer     :integer;
                               dane      :typ_danych;
                               wskaznik2 :wskaznik_listy_cykl;
                             end;


type    wskaznik_drzewa  =^skladnik_drzewa;
        skladnik_drzewa  =record
                            dane1      :string;
                            dane2      :typ_danych;
                            wskaznik1,
                            wskaznik2  :wskaznik_drzewa
                          end;



function Newton(A :tab ; x: real):real;


procedure DoKolejki(var element :typ_danych;
                    var koniec  :wskaznik_kolejki);


procedure ZKolejki(var element             :typ_danych;
                   var poczatek_kolejki    :wskaznik_kolejki);


procedure NaStos(var element    :typ_danych;
                 var wierzcholek:wskaznik_stosu);


Procedure ZeStosu(var element     :typ_danych;
                  var wierzcholek :wskaznik_stosu);

function JestXYNaStosie(const Szukane :typ_danych;
                              const Gora:wskaznik_stosu ):boolean;

function JestXYZNaStosie(const Szukane :typ_danych;
                              const Gora:wskaznik_stosu ):boolean;


Procedure WezZeStosu(var element     :typ_danych;
                  var wierzcholek :wskaznik_stosu);

Procedure SkasujStos(var wierzcholek :wskaznik_stosu);

procedure DoListy1(var element  :typ_danych;
                   var skladnik_biezacy  :wskaznik_listy1);


procedure AdresSkladnikaListy1(var k:   integer;
              var pierwszy_skladnik,skladnik_biezacy:wskaznik_listy1);


procedure ZListy1(var element                             :typ_danych;
                 var pierwszy_skladnik ,skladnik_biezacy  :wskaznik_listy1);


Procedure DoListy2(var element            :typ_danych;
                   var skladnik_biezacy   :wskaznik_listy2);


Procedure AdresSkladnikaListy2( var k                  :integer  ;
                                var skladnik_biezacy   :wskaznik_listy2);


procedure ZListy2(var element             :typ_danych;
                  var skladnik_biezacy    :wskaznik_listy2);


procedure DoListyCykl(var element           :typ_danych;
                  var skladnik_biezacy  :wskaznik_listy_cykl;
                 var k                 :integer        );


Procedure AdresSkladnikaListyCykl( var       k         :integer  ;
                                 var skladnik_biezacy   :wskaznik_listy_cykl);


procedure ZListyCykl(var  element          :typ_danych;
                     var  skladnik_biezacy :wskaznik_listy_cykl);




procedure DoDrzewa( var element1        :string;
                    var element2        :typ_danych;
                    var korzen          :wskaznik_drzewa;
                    var wymiana         :boolean     );

procedure AdresSkladnikaDrzewa
              (var element1                 :string;
               var korzen,skladnik_biezacy  :wskaznik_drzewa );

procedure UsuniecieDrzewa( var korzen       :wskaznik_drzewa);
var  poprzedni_skladnik,
     nastepny_skladnik  :wskaznik_drzewa;

IMPLEMENTATION




function Newton(A :tab ; x: real):real;

var j,i: integer;
var iloczyn,suma :real;
begin
  suma:=0;
  for  i:=0 to 30 do begin
  iloczyn:=1;
  for j:=0 to 30 do
    if j<>i
       then iloczyn:=iloczyn*(x-A[j,1])/(A[i,1]-A[j,1]);
     suma:=suma+A[i,2]*iloczyn
   end;
   Newton:=suma
end;


procedure DoKolejki(var element :typ_danych;
                    var koniec  :wskaznik_kolejki);
var punkt :wskaznik_kolejki;
begin
 Punkt:=koniec;
 new(koniec);
 with koniec^ do
   begin
    dane:=element;
    wskaznik:=nil
   end;
  if punkt<>nil
    then punkt^.wskaznik:=koniec
end;



procedure ZKolejki(var element             :typ_danych;
                   var poczatek_kolejki    :wskaznik_kolejki);
var  punkt:wskaznik_kolejki;
begin
  if poczatek_kolejki <> nil
    then begin
           with poczatek_kolejki^ do
             begin
               element:=dane;
               punkt:=wskaznik
             end;
           Dispose(poczatek_kolejki);
           poczatek_kolejki:=punkt
         end;
end;




procedure NaStos(var element    :typ_danych;
                 var wierzcholek:wskaznik_stosu);
var punkt  :wskaznik_stosu;
begin
  punkt := wierzcholek;
  New(wierzcholek);
  with wierzcholek^ do
    begin
      dane:=element;
      wskaznik:=punkt
    end
end;


Procedure ZeStosu(var element     :typ_danych;
                  var wierzcholek :wskaznik_stosu);
var punkt  :wskaznik_stosu;
begin
 if wierzcholek<>nil
  then begin
        with wierzcholek^ do
          begin
            element:=dane;
            punkt:=wskaznik;
          end;
        Dispose(wierzcholek);
        wierzcholek:=punkt
      end;
end;

function JestXYNaStosie(const Szukane :typ_danych; const Gora:wskaznik_stosu ):boolean;
var punkt       :wskaznik_stosu;
    Element     :typ_danych;
    wierzcholek :wskaznik_stosu;
begin
 element     := szukane;
 wierzcholek := Gora;
 if wierzcholek<>nil
  then begin
        with wierzcholek^ do
          begin
            element:=dane;
            if (element.wsp_x = Szukane.wsp_x) and (element.wsp_y = Szukane.wsp_y) then
               begin
                 JestXYNaStosie := true;
                 Exit;
               end;
            punkt:=wskaznik;
          end;
        wierzcholek:=punkt
      end;
 JestXYNaStosie := false;
end;


function JestXYZNaStosie(const Szukane :typ_danych; const Gora:wskaznik_stosu ):boolean;
var punkt       :wskaznik_stosu;
    Element     :typ_danych;
    wierzcholek :wskaznik_stosu;
begin
 element     := szukane;
 wierzcholek := Gora;
 if wierzcholek<>nil
  then begin
        with wierzcholek^ do
          begin
            element:=dane;
            if (element.wsp_x = Szukane.wsp_x) and (element.wsp_y = Szukane.wsp_y)
               and (element.wsp_z = Szukane.wsp_z) then
               begin
                 JestXYZNaStosie := true;
                 Exit;
               end;
            punkt:=wskaznik;
          end;
        wierzcholek:=punkt
      end;
 JestXYZNaStosie := false;
end;


Procedure SkasujStos(var wierzcholek :wskaznik_stosu);
var punkt  :wskaznik_stosu;
begin
 while wierzcholek <> nil do
 begin
   with wierzcholek^ do
   begin
      punkt:=wskaznik;
   end;
     Dispose(wierzcholek);
     wierzcholek:=punkt
 end;
end;


Procedure WezZeStosu(var element     :typ_danych;
                     var wierzcholek :wskaznik_stosu);
var punkt  :wskaznik_stosu;
begin
 if wierzcholek <> nil
 then begin
        with wierzcholek^ do
          begin
            element:=dane;
            punkt:=wskaznik;
          end;
        wierzcholek:=punkt
      end;
end;







procedure DoListy1(var element  :typ_danych;
                   var skladnik_biezacy  :wskaznik_listy1);
var poprzedni_skladnik,nastepny_skladnik  :wskaznik_listy1;
begin
  if skladnik_biezacy<>nil
   then begin
         poprzedni_skladnik:=skladnik_biezacy;
         nastepny_skladnik:=skladnik_biezacy;
        end
   else begin
         poprzedni_skladnik:=nil;
         nastepny_skladnik:=nil
        end;
   New(skladnik_biezacy);
   with skladnik_biezacy^ do
      begin
        dane:=element;
        wskaznik:=nastepny_skladnik
      end;
   if poprzedni_skladnik<>nil
      then poprzedni_skladnik^.wskaznik:=skladnik_biezacy
end;





procedure AdresSkladnikaListy1(var k:   integer;
              var pierwszy_skladnik,skladnik_biezacy:wskaznik_listy1);
var   nastepny_skladnik   :wskaznik_listy1;
      i                   :integer;
begin
 if pierwszy_skladnik<>nil
   then if k=1
     then skladnik_biezacy:=pierwszy_skladnik
     else
        if (k=2) and (pierwszy_skladnik^.wskaznik=nil)
          then k:=0
          else begin
                 nastepny_skladnik:=pierwszy_skladnik;
                 i:=1;
                 repeat
                   inc(i);
                   if nastepny_skladnik^.wskaznik<>nil
                     then nastepny_skladnik:=nastepny_skladnik^.wskaznik
                 until (nastepny_skladnik^.wskaznik=nil) or (i=k);
                 if (nastepny_skladnik^.wskaznik=nil) and (i<k)
                           then k:=0
                           else skladnik_biezacy:=nastepny_skladnik
                end;
end;





procedure ZListy1(var element    :typ_danych;
                 var pierwszy_skladnik ,
                     skladnik_biezacy  :wskaznik_listy1);

var poprzedni_skladnik,
    nastepny_skladnik  :wskaznik_listy1;
begin
 if(pierwszy_skladnik<>nil) and (skladnik_biezacy<>nil)
   then
     if pierwszy_skladnik<>skladnik_biezacy
       then
         begin
           poprzedni_skladnik:=pierwszy_skladnik;
           nastepny_skladnik:=poprzedni_skladnik^.wskaznik;
            if nastepny_skladnik<>skladnik_biezacy
              then
               repeat
                poprzedni_skladnik:=nastepny_skladnik;
                nastepny_skladnik:=poprzedni_skladnik^.wskaznik
               until nastepny_skladnik=skladnik_biezacy;
           with skladnik_biezacy^ do
             begin
               element:=dane;
               poprzedni_skladnik^.wskaznik:=wskaznik
             end;
           Dispose(skladnik_biezacy);
           skladnik_biezacy:=poprzedni_skladnik
         end
       else
         begin
           with pierwszy_skladnik^ do
             begin
               element:=dane;
               pierwszy_skladnik:=wskaznik
             end;
           Dispose(skladnik_biezacy);
           skladnik_biezacy:=pierwszy_skladnik
        end;
end;




{*********** PROCEDURA TWORZENIA LISTY DWUKIERUNKOWEJ I DOLACZENIA ********}
{*********** DO NIEJ NOWYCH SKLADNIKOW                             ********}

Procedure DoListy2(var element  :typ_danych;
                   var skladnik_biezacy :
                                wskaznik_listy2);

var poprzedni_skladnik ,
    nastepny_skladnik :wskaznik_listy2;
begin
  if skladnik_biezacy<>nil
    then begin
           poprzedni_skladnik:=skladnik_biezacy;
           nastepny_skladnik:=skladnik_biezacy^.wskaznik2;
         end
     else begin
            poprzedni_skladnik:=nil;
            nastepny_skladnik:=nil;
          end;
  new(skladnik_biezacy);
  with skladnik_biezacy^ do
     begin
       wskaznik1:=poprzedni_skladnik;
       dane:=element;
       wskaznik2:=nastepny_skladnik;
     end;
    if poprzedni_skladnik <> nil
       then poprzedni_skladnik^.wskaznik2:=skladnik_biezacy;
    if nastepny_skladnik <> nil
       then nastepny_skladnik^.wskaznik1:=skladnik_biezacy
 end;   {************** PROCEDURA DOLISTY2 ***************}




 {PROCEDURA USTALANIA ADRESU K-TEGO SKLADNIKA LISTY DWUKIERUNKOWEJ}

Procedure AdresSkladnikaListy2( var       k:integer  ;
                                var skladnik_biezacy :
                                      wskaznik_listy2);
var poprzedni_skladnik,
    nastepny_skladnik :wskaznik_listy2;
    i                 :integer;
begin
  if skladnik_biezacy <> nil
     then
       if (skladnik_biezacy^.wskaznik1 <> nil) or (k<>1)
         then
           begin
             poprzedni_skladnik:=skladnik_biezacy;
             if poprzedni_skladnik^.wskaznik1 <> nil
                then
                  repeat
                    poprzedni_skladnik:=
                      poprzedni_skladnik^.wskaznik1;
                  until poprzedni_skladnik^.wskaznik1 = nil;
             if k=1
                then skladnik_biezacy:=poprzedni_skladnik
                else
                  if (k=2)
                     and (poprzedni_skladnik^.wskaznik2=nil)
                     then k:=0
                    else
                      begin
                        nastepny_skladnik:=poprzedni_skladnik;
                        i:=1;
                        repeat
                          inc(i);
                          if nastepny_skladnik^.wskaznik2 <> nil
                             then nastepny_skladnik
                                   :=nastepny_skladnik^.wskaznik2
                        until (nastepny_skladnik^.wskaznik2=nil)
                            or (i=k);
                   if (nastepny_skladnik^.wskaznik2 = nil)
                     and (i<k)
                     then k:=0
                     else skladnik_biezacy:=nastepny_skladnik
                   end
             end
 end;    {PROCEDURY USTALANIA ADRESU }




 {***************** PROCEDURA USUWANIA SKLADNIKA Z LISTY ******************}
 {*****************         DWUKIERUNKOWEJ               ******************}

 procedure ZListy2(var element     :typ_danych;
                   var skladnik_biezacy
                                 :wskaznik_listy2);

var poprzedni_skladnik ,
    nastepny_skladnik :wskaznik_listy2;
begin
  if skladnik_biezacy <> nil
     then begin
            with skladnik_biezacy^ do
               begin
                  poprzedni_skladnik:=wskaznik1;
                  element :=dane;
                  nastepny_skladnik:=wskaznik2;
                  if wskaznik1 <> nil
                    then poprzedni_skladnik^.wskaznik2
                          :=wskaznik2;
                  if wskaznik2 <> nil
                     then nastepny_skladnik^.wskaznik1
                          :=wskaznik1
                  end;
                Dispose (skladnik_biezacy);
                if poprzedni_skladnik <> nil
                  then skladnik_biezacy :=poprzedni_skladnik
                  else skladnik_biezacy :=nastepny_skladnik
               end;
 end;  { PROCEDURA USUWANIA Z LISTY 2 }


 { ************* PROCEDURA TWORZENIA I DOLACZANIA DO *********************}
 { *************         LISTY CYKLICZNEJ            *********************}

procedure DoListyCykl(var element           :typ_danych;
                      var skladnik_biezacy  :wskaznik_listy_cykl;
                      var k                 :integer        );

var poprzedni_skladnik,
    nastepny_skladnik  :wskaznik_listy_cykl;
begin
  if skladnik_biezacy <>nil
     then begin
             poprzedni_skladnik :=skladnik_biezacy;
             nastepny_skladnik :=skladnik_biezacy^.wskaznik2
          end
      else begin
              poprzedni_skladnik := nil;
              nastepny_skladnik :=nil
           end;
       new(skladnik_biezacy);
      if ( poprzedni_skladnik = nil) and (nastepny_skladnik=nil)
         then begin
                 poprzedni_skladnik :=skladnik_biezacy;
                 nastepny_skladnik :=skladnik_biezacy;
                 poprzedni_skladnik^.numer :=0
              end;
        with skladnik_biezacy^ do
          begin
            wskaznik1 := poprzedni_skladnik;
            numer :=poprzedni_skladnik^.numer+1;
            k:= numer;
            dane :=element;
            wskaznik2 :=nastepny_skladnik
          end;
       if k<>1
          then begin
                 poprzedni_skladnik^.wskaznik2:=skladnik_biezacy;
                 nastepny_skladnik^.wskaznik1 :=skladnik_biezacy
               end
end;   {  PROCEDURY  LISTY CYKLICZNEJ  }




{PROCEDURA USTALANIA ADRESU K-TEGO SKLADNIKA LISTY CYKLICZNEJ }

Procedure AdresSkladnikaListyCykl( var       k:integer  ;
                                var skladnik_biezacy :
                                      wskaznik_listy_cykl);
var nastepny_skladnik :wskaznik_listy_cykl;
    maxi                 :integer;
begin
  if (skladnik_biezacy <> nil) and (skladnik_biezacy^.numer <> k)
    then begin
           nastepny_skladnik :=skladnik_biezacy;
           repeat
             maxi :=nastepny_skladnik^.numer;
             nastepny_skladnik:=nastepny_skladnik^.wskaznik2
           until nastepny_skladnik^.numer <=maxi;
           if k>maxi
              then k:=0
              else begin
                     nastepny_skladnik :=skladnik_biezacy;
                     repeat
                       nastepny_skladnik:=nastepny_skladnik^.wskaznik2
                     until nastepny_skladnik^.numer =k;
                     skladnik_biezacy:=nastepny_skladnik
                   end
         end
 end;


 {************** PROCEDURA USUWANIA SKLADNIKA Z LISTY  ******************}
 {**************           CYKLICZNEJ                  ******************}

procedure ZListyCykl(var  element          :typ_danych;
                     var  skladnik_biezacy :wskaznik_listy_cykl);
var poprzedni_skladnik,
    nastepny_skladnik   :wskaznik_listy_cykl;
    k                   :integer;
begin
  if skladnik_biezacy <> nil
    then
      begin
       with skladnik_biezacy^ do
          begin
            poprzedni_skladnik :=wskaznik1;
            element :=dane;
            k:= numer;
            nastepny_skladnik :=wskaznik2;
            poprzedni_skladnik^.wskaznik2:=wskaznik2;
            nastepny_skladnik^.wskaznik1:=wskaznik1
          end;
      Dispose(skladnik_biezacy);
      if (poprzedni_skladnik=nastepny_skladnik)
         and (k=nastepny_skladnik^.numer )
            then skladnik_biezacy :=nil
             else
              begin
                skladnik_biezacy :=poprzedni_skladnik;
                if nastepny_skladnik^.numer <> 1
                  then
                    repeat
                      nastepny_skladnik^.numer:=k;
                      inc(k);
                      nastepny_skladnik:=nastepny_skladnik^.wskaznik2
                    until nastepny_skladnik^.numer=1
               end
        end
end;   { PROCEDURY  USUWANIA Z LISTY CYKLICZNEJ  }



        {************** PROCEDURA TWORZENIA DRZEWA BINARNEGO ************}
        {************** I DOLACZANIA NOWYCH SKLADNIKOW       ************}

procedure DoDrzewa( var element1        :string;
                    var element2        :typ_danych;
                    var korzen          :wskaznik_drzewa;
                    var wymiana         :boolean     );

var poprzedni_skladnik,
    skladnik_biezacy      :wskaznik_drzewa;
    dodanie_skladnika    :boolean;
    odp                   :char;

procedure podstawienie;
begin
  with skladnik_biezacy^ do
     begin
       dane1:=element1;
       dane2:=element2;
       wskaznik1:=nil;
       wskaznik2:=nil;
       dodanie_skladnika :=true;
     end;
end;

begin
  if korzen =nil
    then
      begin
        new(korzen);
        with korzen^ do
          begin
            dane1 :=element1;
            dane2 :=element2;
            wskaznik1:=nil;
            wskaznik2:=nil;
          end;
      end
  else  begin
          skladnik_biezacy :=korzen;
          dodanie_skladnika :=false;
          while not dodanie_skladnika do
            if element1 <skladnik_biezacy^.dane1
              then
                if skladnik_biezacy^.wskaznik1 = nil
                  then
                    begin
                      poprzedni_skladnik:=skladnik_biezacy;
                      new(skladnik_biezacy);
                      poprzedni_skladnik^.wskaznik1 :=skladnik_biezacy;
                      podstawienie;
                    end
                else
                  if element1 >skladnik_biezacy^.dane1
                    then
                      if skladnik_biezacy^.wskaznik2= nil
                        then
                          begin
                            poprzedni_skladnik :=skladnik_biezacy;
                            new(skladnik_biezacy);
                            poprzedni_skladnik^.wskaznik2 :=skladnik_biezacy;
                            podstawienie;
                          end
                       else skladnik_biezacy :=skladnik_biezacy^.wskaznik2
                  else
                    begin
                      writeln;
                      Write(' drzewo zawiera podany skladnik');
                      repeat
                        write('wymienic 3 t/n ');
                        readln(odp);
                        odp :=UpCase(odp);
                       until (odp='T') or (odp='N');
                        if odp='T'
                         then
                           begin
                             skladnik_biezacy^.dane1:=element1;
                             wymiana :=true
                           end
                end
      end;
 end;



procedure AdresSkladnikaDrzewa
              (var element1                 :string;
               var korzen,skladnik_biezacy  :wskaznik_drzewa );
begin
  if korzen <> nil
       then
         begin
           skladnik_biezacy:=korzen;
           if element1 <> korzen^.dane1
             then
               repeat
                 if element1 <skladnik_biezacy^.dane1
                    then skladnik_biezacy :=skladnik_biezacy^.wskaznik1
                 else skladnik_biezacy :=skladnik_biezacy^.wskaznik2
               until (element1 =skladnik_biezacy^.dane1)
                      or (skladnik_biezacy= nil)
          end
end;


procedure UsuniecieDrzewa( var korzen       :wskaznik_drzewa);
var  poprzedni_skladnik,
     nastepny_skladnik  :wskaznik_drzewa;

begin
  if korzen <> nil
    then
      begin
        repeat
          nastepny_skladnik:=korzen;
          while nastepny_skladnik^.wskaznik1 <> nil do
             begin
               poprzedni_skladnik:=nastepny_skladnik;
               nastepny_skladnik:=nastepny_skladnik^.wskaznik1
             end;
          while nastepny_skladnik^.wskaznik2 <> nil do
            begin
              poprzedni_skladnik:=nastepny_skladnik ;
              nastepny_skladnik:=nastepny_skladnik^.wskaznik2
            end;
          if poprzedni_skladnik^.wskaznik1=nastepny_skladnik
             then poprzedni_skladnik^.wskaznik1 := nil
             else poprzedni_skladnik^.wskaznik2 := nil;
          write('Eliminowany skladnik :');
          writeln(nastepny_skladnik^.dane1);
          dispose(nastepny_skladnik);
        until nastepny_skladnik=korzen;
        korzen := nil
     end;
end;

end.{ end of unit  }








