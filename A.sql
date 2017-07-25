/*

Answer: :PRIV:ANSWER.DBF
Type: DBASE
AuxTables: True
RunMode: Default
Alias: WORK
LiveAnswer: FALSE

*/

select distinct Linia, Min(SKAD), Max(DOKAD) as DUPA from spsx.dbf
group by Linia
