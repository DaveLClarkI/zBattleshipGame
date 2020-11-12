BSHP    TITLE  'B S H P M A P   -  M A P S E T   F O R   B S H P P G M' 00000100
        PRINT  ON,GEN                                                   00000200
BSHPMAP DFHMSD TYPE=(&SYSPARM),MODE=INOUT,TIOAPFX=YES,TERM=3270-2,     X00000300
               CTRL=(FREEKB,FRSET),DATA=FIELD,LANG=COBOL,STORAGE=AUTO   00000400
        EJECT                                                           00000500
DATAMAP DFHMDI SIZE=(24,80),                                           X00000600
               JUSTIFY=LEFT,                                           X00000700
               LINE=NEXT,                                              X00000800
               COLUMN=SAME                                              00000900
        PRINT  ON,NOGEN                                                 00001000
        DFHMDF POS=(01,01),LENGTH=45,ATTRB=(ASKIP,BRT),                X00001100
               INITIAL='Y O U R  B A T T L E S H I P  G A M E A R E A'  00001200
        DFHMDF POS=(01,58),LENGTH=11,ATTRB=(ASKIP,BRT),                X00001300
               INITIAL='T H E I R S'                                    00001400
        DFHMDF POS=(02,01),LENGTH=45,ATTRB=(ASKIP,NORM),               X00001500
               INITIAL='      A   B   C   D   E   F   G   H   I      '  00001600
        DFHMDF POS=(02,47),LENGTH=33,ATTRB=(ASKIP,NORM),               X00001700
               INITIAL='   A  B  C  D  E  F  G  H  I     '              00001800
        DFHMDF POS=(03,01),LENGTH=45,ATTRB=(ASKIP,BRT),                X00001900
               INITIAL='  -----------------------------------------  '  00002000
        DFHMDF POS=(03,47),LENGTH=33,ATTRB=(ASKIP,BRT),                X00002100
               INITIAL='-------------------------------  '              00002200
        DFHMDF POS=(04,03),LENGTH=01,ATTRB=(ASKIP,BRT),                X00002300
               INITIAL=']'                                              00002400
        DFHMDF POS=(04,43),LENGTH=01,ATTRB=(ASKIP,BRT),                X00002500
               INITIAL=']'                                              00002600
        DFHMDF POS=(04,45),LENGTH=01,ATTRB=(ASKIP,NORM),               X00002700
               INITIAL='1'                                              00002800
        DFHMDF POS=(04,47),LENGTH=01,ATTRB=(ASKIP,BRT),                X00002900
               INITIAL=']'                                              00003000
RGHTRW1 DFHMDF POS=(04,50),LENGTH=02,ATTRB=(ASKIP,NORM,FSET),          X00003100
               INITIAL='. ',OCCURS=9                                    00003200
        DFHMDF POS=(04,77),LENGTH=01,ATTRB=(ASKIP,BRT),                X00003300
               INITIAL=']'                                              00003400
        DFHMDF POS=(04,79),LENGTH=01,ATTRB=(ASKIP,NORM),               X00003500
               INITIAL='1'                                              00003600
        DFHMDF POS=(05,01),LENGTH=01,ATTRB=(ASKIP,NORM),               X00003700
               INITIAL='1'                                              00003800
        DFHMDF POS=(05,03),LENGTH=01,ATTRB=(ASKIP,BRT),                X00003900
               INITIAL=']'                                              00004000
LEFTRW1 DFHMDF POS=(05,07),LENGTH=03,ATTRB=(ASKIP,NORM,FSET),          X00004100
               INITIAL='.  ',OCCURS=9                                   00004200
        DFHMDF POS=(05,43),LENGTH=01,ATTRB=(ASKIP,BRT),                X00004300
               INITIAL=']'                                              00004400
        DFHMDF POS=(05,45),LENGTH=01,ATTRB=(ASKIP,NORM),               X00004500
               INITIAL='2'                                              00004600
        DFHMDF POS=(05,47),LENGTH=01,ATTRB=(ASKIP,BRT),                X00004700
               INITIAL=']'                                              00004800
RGHTRW2 DFHMDF POS=(05,50),LENGTH=02,ATTRB=(ASKIP,NORM,FSET),          X00004900
               INITIAL='. ',OCCURS=9                                    00005000
        DFHMDF POS=(05,77),LENGTH=01,ATTRB=(ASKIP,BRT),                X00005100
               INITIAL=']'                                              00005200
        DFHMDF POS=(05,79),LENGTH=01,ATTRB=(ASKIP,NORM),               X00005300
               INITIAL='2'                                              00005400
        DFHMDF POS=(06,03),LENGTH=01,ATTRB=(ASKIP,BRT),                X00005500
               INITIAL=']'                                              00005600
        DFHMDF POS=(06,43),LENGTH=01,ATTRB=(ASKIP,BRT),                X00005700
               INITIAL=']'                                              00005800
        DFHMDF POS=(06,45),LENGTH=01,ATTRB=(ASKIP,NORM),               X00005900
               INITIAL='3'                                              00006000
        DFHMDF POS=(06,47),LENGTH=01,ATTRB=(ASKIP,BRT),                X00006100
               INITIAL=']'                                              00006200
RGHTRW3 DFHMDF POS=(06,50),LENGTH=02,ATTRB=(ASKIP,NORM,FSET),          X00006300
               INITIAL='. ',OCCURS=9                                    00006400
        DFHMDF POS=(06,77),LENGTH=01,ATTRB=(ASKIP,BRT),                X00006500
               INITIAL=']'                                              00006600
        DFHMDF POS=(06,79),LENGTH=01,ATTRB=(ASKIP,NORM),               X00006700
               INITIAL='3'                                              00006800
        DFHMDF POS=(07,01),LENGTH=01,ATTRB=(ASKIP,NORM),               X00006900
               INITIAL='2'                                              00007000
        DFHMDF POS=(07,03),LENGTH=01,ATTRB=(ASKIP,BRT),                X00007100
               INITIAL=']'                                              00007200
LEFTRW2 DFHMDF POS=(07,07),LENGTH=03,ATTRB=(ASKIP,NORM,FSET),          X00007300
               INITIAL='.  ',OCCURS=9                                   00007400
        DFHMDF POS=(07,43),LENGTH=01,ATTRB=(ASKIP,BRT),                X00007500
               INITIAL=']'                                              00007600
        DFHMDF POS=(07,45),LENGTH=01,ATTRB=(ASKIP,NORM),               X00007700
               INITIAL='4'                                              00007800
        DFHMDF POS=(07,47),LENGTH=01,ATTRB=(ASKIP,BRT),                X00007900
               INITIAL=']'                                              00008000
RGHTRW4 DFHMDF POS=(07,50),LENGTH=02,ATTRB=(ASKIP,NORM,FSET),          X00008100
               INITIAL='. ',OCCURS=9                                    00008200
        DFHMDF POS=(07,77),LENGTH=01,ATTRB=(ASKIP,BRT),                X00008300
               INITIAL=']'                                              00008400
        DFHMDF POS=(07,79),LENGTH=01,ATTRB=(ASKIP,NORM),               X00008500
               INITIAL='4'                                              00008600
        DFHMDF POS=(08,03),LENGTH=01,ATTRB=(ASKIP,BRT),                X00008700
               INITIAL=']'                                              00008800
        DFHMDF POS=(08,43),LENGTH=01,ATTRB=(ASKIP,BRT),                X00008900
               INITIAL=']'                                              00009000
        DFHMDF POS=(08,45),LENGTH=01,ATTRB=(ASKIP,NORM),               X00009100
               INITIAL='5'                                              00009200
        DFHMDF POS=(08,47),LENGTH=01,ATTRB=(ASKIP,BRT),                X00009300
               INITIAL=']'                                              00009400
RGHTRW5 DFHMDF POS=(08,50),LENGTH=02,ATTRB=(ASKIP,NORM,FSET),          X00009500
               INITIAL='. ',OCCURS=9                                    00009600
        DFHMDF POS=(08,77),LENGTH=01,ATTRB=(ASKIP,BRT),                X00009700
               INITIAL=']'                                              00009800
        DFHMDF POS=(08,79),LENGTH=01,ATTRB=(ASKIP,NORM),               X00009900
               INITIAL='5'                                              00010000
        DFHMDF POS=(09,01),LENGTH=01,ATTRB=(ASKIP,NORM),               X00010100
               INITIAL='3'                                              00010200
        DFHMDF POS=(09,03),LENGTH=01,ATTRB=(ASKIP,BRT),                X00010300
               INITIAL=']'                                              00010400
LEFTRW3 DFHMDF POS=(09,07),LENGTH=03,ATTRB=(ASKIP,NORM,FSET),          X00010500
               INITIAL='.  ',OCCURS=9                                   00010600
        DFHMDF POS=(09,43),LENGTH=01,ATTRB=(ASKIP,BRT),                X00010700
               INITIAL=']'                                              00010800
        DFHMDF POS=(09,45),LENGTH=01,ATTRB=(ASKIP,NORM),               X00010900
               INITIAL='6'                                              00011000
        DFHMDF POS=(09,47),LENGTH=01,ATTRB=(ASKIP,BRT),                X00011100
               INITIAL=']'                                              00011200
RGHTRW6 DFHMDF POS=(09,50),LENGTH=02,ATTRB=(ASKIP,NORM,FSET),          X00011300
               INITIAL='. ',OCCURS=9                                    00011400
        DFHMDF POS=(09,77),LENGTH=01,ATTRB=(ASKIP,BRT),                X00011500
               INITIAL=']'                                              00011600
        DFHMDF POS=(09,79),LENGTH=01,ATTRB=(ASKIP,NORM),               X00011700
               INITIAL='6'                                              00011800
        DFHMDF POS=(10,03),LENGTH=01,ATTRB=(ASKIP,BRT),                X00011900
               INITIAL=']'                                              00012000
        DFHMDF POS=(10,43),LENGTH=01,ATTRB=(ASKIP,BRT),                X00012100
               INITIAL=']'                                              00012200
        DFHMDF POS=(10,45),LENGTH=01,ATTRB=(ASKIP,NORM),               X00012300
               INITIAL='7'                                              00012400
        DFHMDF POS=(10,47),LENGTH=01,ATTRB=(ASKIP,BRT),                X00012500
               INITIAL=']'                                              00012600
RGHTRW7 DFHMDF POS=(10,50),LENGTH=02,ATTRB=(ASKIP,NORM,FSET),          X00012700
               INITIAL='. ',OCCURS=9                                    00012800
        DFHMDF POS=(10,77),LENGTH=01,ATTRB=(ASKIP,BRT),                X00012900
               INITIAL=']'                                              00013000
        DFHMDF POS=(10,79),LENGTH=01,ATTRB=(ASKIP,NORM),               X00013100
               INITIAL='7'                                              00013200
        DFHMDF POS=(11,01),LENGTH=01,ATTRB=(ASKIP,NORM),               X00013300
               INITIAL='4'                                              00013400
        DFHMDF POS=(11,03),LENGTH=01,ATTRB=(ASKIP,BRT),                X00013500
               INITIAL=']'                                              00013600
LEFTRW4 DFHMDF POS=(11,07),LENGTH=03,ATTRB=(ASKIP,NORM,FSET),          X00013700
               INITIAL='.  ',OCCURS=9                                   00013800
        DFHMDF POS=(11,43),LENGTH=01,ATTRB=(ASKIP,BRT),                X00013900
               INITIAL=']'                                              00014000
        DFHMDF POS=(11,45),LENGTH=01,ATTRB=(ASKIP,NORM),               X00014100
               INITIAL='8'                                              00014200
        DFHMDF POS=(11,47),LENGTH=01,ATTRB=(ASKIP,BRT),                X00014300
               INITIAL=']'                                              00014400
RGHTRW8 DFHMDF POS=(11,50),LENGTH=02,ATTRB=(ASKIP,NORM,FSET),          X00014500
               INITIAL='. ',OCCURS=9                                    00014600
        DFHMDF POS=(11,77),LENGTH=01,ATTRB=(ASKIP,BRT),                X00014700
               INITIAL=']'                                              00014800
        DFHMDF POS=(11,79),LENGTH=01,ATTRB=(ASKIP,NORM),               X00014900
               INITIAL='8'                                              00015000
        DFHMDF POS=(12,03),LENGTH=01,ATTRB=(ASKIP,BRT),                X00015100
               INITIAL=']'                                              00015200
        DFHMDF POS=(12,43),LENGTH=01,ATTRB=(ASKIP,BRT),                X00015300
               INITIAL=']'                                              00015400
        DFHMDF POS=(12,45),LENGTH=01,ATTRB=(ASKIP,NORM),               X00015500
               INITIAL='9'                                              00015600
        DFHMDF POS=(12,47),LENGTH=01,ATTRB=(ASKIP,BRT),                X00015700
               INITIAL=']'                                              00015800
RGHTRW9 DFHMDF POS=(12,50),LENGTH=02,ATTRB=(ASKIP,NORM,FSET),          X00015900
               INITIAL='. ',OCCURS=9                                    00016000
        DFHMDF POS=(12,77),LENGTH=01,ATTRB=(ASKIP,BRT),                X00016100
               INITIAL=']'                                              00016200
        DFHMDF POS=(12,79),LENGTH=01,ATTRB=(ASKIP,NORM),               X00016300
               INITIAL='9'                                              00016400
        DFHMDF POS=(13,01),LENGTH=01,ATTRB=(ASKIP,NORM),               X00016500
               INITIAL='5'                                              00016600
        DFHMDF POS=(13,03),LENGTH=01,ATTRB=(ASKIP,BRT),                X00016700
               INITIAL=']'                                              00016800
LEFTRW5 DFHMDF POS=(13,07),LENGTH=03,ATTRB=(ASKIP,NORM,FSET),          X00016900
               INITIAL='.  ',OCCURS=9                                   00017000
        DFHMDF POS=(13,43),LENGTH=01,ATTRB=(ASKIP,BRT),                X00017100
               INITIAL=']'                                              00017200
        DFHMDF POS=(13,47),LENGTH=33,ATTRB=(ASKIP,BRT),                X00017300
               INITIAL='-------------------------------  '              00017400
        DFHMDF POS=(14,03),LENGTH=01,ATTRB=(ASKIP,BRT),                X00017500
               INITIAL=']'                                              00017600
        DFHMDF POS=(14,43),LENGTH=01,ATTRB=(ASKIP,BRT),                X00017700
               INITIAL=']'                                              00017800
        DFHMDF POS=(14,46),LENGTH=33,ATTRB=(ASKIP,NORM),               X00017900
               INITIAL='    A  B  C  D  E  F  G  H  I    '              00018000
        DFHMDF POS=(15,01),LENGTH=01,ATTRB=(ASKIP,NORM),               X00018100
               INITIAL='6'                                              00018200
        DFHMDF POS=(15,03),LENGTH=01,ATTRB=(ASKIP,BRT),                X00018300
               INITIAL=']'                                              00018400
LEFTRW6 DFHMDF POS=(15,07),LENGTH=03,ATTRB=(ASKIP,NORM,FSET),          X00018500
               INITIAL='.  ',OCCURS=9                                   00018600
        DFHMDF POS=(15,43),LENGTH=01,ATTRB=(ASKIP,BRT),                X00018700
               INITIAL=']'                                              00018800
        DFHMDF POS=(16,03),LENGTH=01,ATTRB=(ASKIP,BRT),                X00018900
               INITIAL=']'                                              00019000
        DFHMDF POS=(16,43),LENGTH=01,ATTRB=(ASKIP,BRT),                X00019100
               INITIAL=']'                                              00019200
MESSAGE DFHMDF POS=(16,47),LENGTH=31,ATTRB=(ASKIP,BRT),                X00019300
               INITIAL='-------------------------------'                00019400
        DFHMDF POS=(17,01),LENGTH=01,ATTRB=(ASKIP,NORM),               X00019500
               INITIAL='7'                                              00019600
        DFHMDF POS=(17,03),LENGTH=01,ATTRB=(ASKIP,BRT),                X00019700
               INITIAL=']'                                              00019800
LEFTRW7 DFHMDF POS=(17,07),LENGTH=03,ATTRB=(ASKIP,NORM,FSET),          X00019900
               INITIAL='.  ',OCCURS=9                                   00020000
        DFHMDF POS=(17,43),LENGTH=01,ATTRB=(ASKIP,BRT),                X00020100
               INITIAL=']'                                              00020200
        DFHMDF POS=(17,47),LENGTH=29,ATTRB=(ASKIP,NORM),               X00020300
               INITIAL='ENTER "ROW" NUMBER ..........'                  00020400
ROWNUMB DFHMDF POS=(17,77),LENGTH=01,ATTRB=(UNPROT,NORM,FSET,IC),      X00020500
               INITIAL='_'                                              00020600
        DFHMDF POS=(17,79),LENGTH=01,ATTRB=(ASKIP,NORM),INITIAL=' '     00020700
        DFHMDF POS=(18,03),LENGTH=01,ATTRB=(ASKIP,BRT),                X00020800
               INITIAL=']'                                              00020900
        DFHMDF POS=(18,43),LENGTH=01,ATTRB=(ASKIP,BRT),                X00021000
               INITIAL=']'                                              00021100
        DFHMDF POS=(18,47),LENGTH=29,ATTRB=(ASKIP,NORM),               X00021200
               INITIAL='ENTER "COLUMN LETTER ........'                  00021300
COLLETT DFHMDF POS=(18,77),LENGTH=01,ATTRB=(UNPROT,NORM,FSET),         X00021400
               INITIAL='_'                                              00021500
        DFHMDF POS=(18,79),LENGTH=01,ATTRB=(ASKIP,NORM),INITIAL=' '     00021600
        DFHMDF POS=(19,01),LENGTH=01,ATTRB=(ASKIP,NORM),               X00021700
               INITIAL='8'                                              00021800
        DFHMDF POS=(19,03),LENGTH=01,ATTRB=(ASKIP,BRT),                X00021900
               INITIAL=']'                                              00022000
LEFTRW8 DFHMDF POS=(19,07),LENGTH=03,ATTRB=(ASKIP,NORM,FSET),          X00022100
               INITIAL='.  ',OCCURS=9                                   00022200
        DFHMDF POS=(19,43),LENGTH=01,ATTRB=(ASKIP,BRT),                X00022300
               INITIAL=']'                                              00022400
DIRLINE DFHMDF POS=(19,47),LENGTH=31,ATTRB=(ASKIP,BRT),                X00022500
               INITIAL='-------------------------------'                00022600
        DFHMDF POS=(20,03),LENGTH=01,ATTRB=(ASKIP,BRT),                X00022700
               INITIAL=']'                                              00022800
        DFHMDF POS=(20,43),LENGTH=01,ATTRB=(ASKIP,BRT),                X00022900
               INITIAL=']'                                              00023000
        DFHMDF POS=(21,01),LENGTH=01,ATTRB=(ASKIP,NORM),               X00023100
               INITIAL='9'                                              00023200
        DFHMDF POS=(21,03),LENGTH=01,ATTRB=(ASKIP,BRT),                X00023300
               INITIAL=']'                                              00023400
LEFTRW9 DFHMDF POS=(21,07),LENGTH=03,ATTRB=(ASKIP,NORM,FSET),          X00023500
               INITIAL='.  ',OCCURS=9                                   00023600
        DFHMDF POS=(21,43),LENGTH=01,ATTRB=(ASKIP,BRT),                X00023700
               INITIAL=']'                                              00023800
LEGENDM DFHMDF POS=(21,47),LENGTH=14,ATTRB=(ASKIP,NORM,FSET),          X00023900
               INITIAL='"X" = "MISS"  '                                 00024000
LEGENDH DFHMDF POS=(21,63),LENGTH=14,ATTRB=(ASKIP,NORM,FSET),          X00024100
               INITIAL='"*" = "HIT"   '                                 00024200
        DFHMDF POS=(22,03),LENGTH=01,ATTRB=(ASKIP,BRT),                X00024300
               INITIAL=']'                                              00024400
        DFHMDF POS=(22,43),LENGTH=01,ATTRB=(ASKIP,BRT),                X00024500
               INITIAL=']'                                              00024600
LEGENDP DFHMDF POS=(22,47),LENGTH=15,ATTRB=(ASKIP,NORM,FSET),          X00024700
               INITIAL='"P" = PT-BOAT  '                                00024800
LEGENDS DFHMDF POS=(22,63),LENGTH=15,ATTRB=(ASKIP,NORM,FSET),          X00024900
               INITIAL='"S" = SUBMARINE'                                00025000
        DFHMDF POS=(23,01),LENGTH=45,ATTRB=(ASKIP,BRT),                X00025100
               INITIAL='  -----------------------------------------  '  00025200
LEGENDB DFHMDF POS=(23,47),LENGTH=15,ATTRB=(ASKIP,NORM,FSET),          X00025300
               INITIAL='"B" = BATTLESHP'                                00025400
LEGENDD DFHMDF POS=(23,63),LENGTH=15,ATTRB=(ASKIP,NORM,FSET),          X00025500
               INITIAL='"D" = DESTROYER'                                00025600
        DFHMDF POS=(24,01),LENGTH=45,ATTRB=(ASKIP,NORM),               X00025700
               INITIAL='      A   B   C   D   E   F   G   H   I      '  00025800
LEGENDA DFHMDF POS=(24,51),LENGTH=22,ATTRB=(ASKIP,NORM,FSET),          X00025900
               INITIAL='"A" = AIRCRAFT CARRIER'                         00026000
        PRINT  ON,GEN                                                   00026100
        EJECT                                                           00026200
INSTMAP DFHMDI SIZE=(24,80),                                           X00026300
               JUSTIFY=LEFT,                                           X00026400
               LINE=NEXT,                                              X00026500
               COLUMN=SAME                                              00026600
        PRINT  ON,NOGEN                                                 00026700
        DFHMDF POS=(01,01),LENGTH=26,ATTRB=(ASKIP,BRT),                X00026800
               INITIAL='       B A T T L E S H I P'                     00026900
        DFHMDF POS=(01,28),LENGTH=09,ATTRB=(ASKIP,NORM),               X00027000
               INITIAL=':   ( A  '                                      00027100
        DFHMDF POS=(01,38),LENGTH=07,ATTRB=(ASKIP,BRT),                X00027200
               INITIAL='T W O  '                                        00027300
        DFHMDF POS=(01,46),LENGTH=34,ATTRB=(ASKIP,NORM),               X00027400
               INITIAL='T E R M I N A L   G A M E )       '             00027500
        DFHMDF POS=(02,01),LENGTH=07,ATTRB=(ASKIP,BRT),                X00027600
               INITIAL='Author:'                                        00027700
        DFHMDF POS=(02,09),LENGTH=39,ATTRB=(ASKIP,NORM),               X00027800
               INITIAL='Dave Leonard Clark I                   '        00027900
        DFHMDF POS=(02,49),LENGTH=13,ATTRB=(ASKIP,BRT),                X00028000
               INITIAL='Installation:'                                  00028100
        DFHMDF POS=(02,63),LENGTH=17,ATTRB=(ASKIP,NORM),               X00028200
               INITIAL='Clarke Industries'                              00028300
        DFHMDF POS=(03,01),LENGTH=01,ATTRB=(ASKIP,NORM),INITIAL=' '     00028400
        DFHMDF POS=(04,01),LENGTH=41,ATTRB=(ASKIP,NORM),               X00028500
               INITIAL='    Your mission is to so place the ships'      00028600
        DFHMDF POS=(04,43),LENGTH=37,ATTRB=(ASKIP,NORM),               X00028700
               INITIAL='under your command within the battle '          00028800
        DFHMDF POS=(05,01),LENGTH=20,ATTRB=(ASKIP,NORM),               X00028900
               INITIAL='area, such that your'                           00029000
        DFHMDF POS=(05,22),LENGTH=05,ATTRB=(ASKIP,BRT),                X00029100
               INITIAL='enemy'                                          00029200
        DFHMDF POS=(05,28),LENGTH=36,ATTRB=(ASKIP,NORM),               X00029300
               INITIAL='is unable to locate and destroy them'           00029400
        DFHMDF POS=(05,65),LENGTH=06,ATTRB=(ASKIP,BRT),                X00029500
               INITIAL='before'                                         00029600
        DFHMDF POS=(05,72),LENGTH=27,ATTRB=(ASKIP,NORM),               X00029700
               INITIAL='you can  locate and destroy'                    00029800
        DFHMDF POS=(06,20),LENGTH=03,ATTRB=(ASKIP,BRT),                X00029900
               INITIAL='his'                                            00030000
        DFHMDF POS=(06,24),LENGTH=24,ATTRB=(ASKIP,NORM),               X00030100
               INITIAL='ships.  Each of the five'                       00030200
        DFHMDF POS=(06,49),LENGTH=03,ATTRB=(ASKIP,BRT),                X00030300
               INITIAL='(5)'                                            00030400
        DFHMDF POS=(06,53),LENGTH=27,ATTRB=(ASKIP,NORM),               X00030500
               INITIAL='ships in your fleet can    '                    00030600
        DFHMDF POS=(07,01),LENGTH=37,ATTRB=(ASKIP,NORM),               X00030700
               INITIAL='withstand a specific number of direct'          00030800
        DFHMDF POS=(07,39),LENGTH=04,ATTRB=(ASKIP,BRT),                X00030900
               INITIAL='hits'                                           00031000
        DFHMDF POS=(07,44),LENGTH=06,ATTRB=(ASKIP,NORM),               X00031100
               INITIAL='before'                                         00031200
        DFHMDF POS=(07,51),LENGTH=08,ATTRB=(ASKIP,BRT),                X00031300
               INITIAL='sinking,'                                       00031400
        DFHMDF POS=(07,60),LENGTH=20,ATTRB=(ASKIP,NORM),               X00031500
               INITIAL='as follows:         '                           00031600
        DFHMDF POS=(08,01),LENGTH=01,ATTRB=(ASKIP,NORM),INITIAL=' '     00031700
        DFHMDF POS=(09,09),LENGTH=07,ATTRB=(ASKIP,BRT),                X00031800
               INITIAL='PT-boat'                                        00031900
        DFHMDF POS=(09,17),LENGTH=11,ATTRB=(ASKIP,NORM),               X00032000
               INITIAL='...........'                                    00032100
        DFHMDF POS=(09,29),LENGTH=06,ATTRB=(ASKIP,BRT),                X00032200
               INITIAL='2 hits'                                         00032300
        DFHMDF POS=(09,45),LENGTH=09,ATTRB=(ASKIP,BRT),                X00032400
               INITIAL='Submarine'                                      00032500
        DFHMDF POS=(09,55),LENGTH=09,ATTRB=(ASKIP,NORM),               X00032600
               INITIAL='.........'                                      00032700
        DFHMDF POS=(09,65),LENGTH=06,ATTRB=(ASKIP,BRT),                X00032800
               INITIAL='3 hits'                                         00032900
        DFHMDF POS=(10,09),LENGTH=10,ATTRB=(ASKIP,BRT),                X00033000
               INITIAL='Battleship'                                     00033100
        DFHMDF POS=(10,20),LENGTH=08,ATTRB=(ASKIP,NORM),               X00033200
               INITIAL='........'                                       00033300
        DFHMDF POS=(10,29),LENGTH=06,ATTRB=(ASKIP,BRT),                X00033400
               INITIAL='3 hits'                                         00033500
        DFHMDF POS=(10,45),LENGTH=09,ATTRB=(ASKIP,BRT),                X00033600
               INITIAL='Destroyer'                                      00033700
        DFHMDF POS=(10,55),LENGTH=09,ATTRB=(ASKIP,NORM),               X00033800
               INITIAL='.........'                                      00033900
        DFHMDF POS=(10,65),LENGTH=06,ATTRB=(ASKIP,BRT),                X00034000
               INITIAL='4 hits'                                         00034100
        DFHMDF POS=(11,25),LENGTH=16,ATTRB=(ASKIP,BRT),                X00034200
               INITIAL='Aircraft Carrier'                               00034300
        DFHMDF POS=(11,42),LENGTH=06,ATTRB=(ASKIP,NORM),               X00034400
               INITIAL='......'                                         00034500
        DFHMDF POS=(11,49),LENGTH=06,ATTRB=(ASKIP,BRT),                X00034600
               INITIAL='5 hits'                                         00034700
        DFHMDF POS=(12,01),LENGTH=01,ATTRB=(ASKIP,NORM),INITIAL=' '     00034800
        DFHMDF POS=(13,01),LENGTH=25,ATTRB=(ASKIP,NORM),               X00034900
               INITIAL='    You can position your'                      00035000
        DFHMDF POS=(13,27),LENGTH=25,ATTRB=(ASKIP,NORM),               X00035100
               INITIAL='ships in any of the eight'                      00035200
        DFHMDF POS=(13,53),LENGTH=03,ATTRB=(ASKIP,BRT),                X00035300
               INITIAL='(8)'                                            00035400
        DFHMDF POS=(13,57),LENGTH=40,ATTRB=(ASKIP,NORM),               X00035500
               INITIAL='compass directions (as  long as they are'       00035600
        DFHMDF POS=(14,18),LENGTH=06,ATTRB=(ASKIP,BRT),                X00035700
               INITIAL='inside'                                         00035800
        DFHMDF POS=(14,25),LENGTH=34,ATTRB=(ASKIP,NORM),               X00035900
               INITIAL='the battle area), and you can even'             00036000
        DFHMDF POS=(14,60),LENGTH=09,ATTRB=(ASKIP,BRT),                X00036100
               INITIAL='interlace'                                      00036200
        DFHMDF POS=(14,70),LENGTH=10,ATTRB=(ASKIP,NORM),               X00036300
               INITIAL='them (it`s'                                     00036400
        DFHMDF POS=(15,01),LENGTH=04,ATTRB=(ASKIP,BRT),                X00036500
               INITIAL='only'                                           00036600
        DFHMDF POS=(15,06),LENGTH=24,ATTRB=(ASKIP,NORM),               X00036700
               INITIAL='a game!) as long as they'                       00036800
        DFHMDF POS=(15,31),LENGTH=05,ATTRB=(ASKIP,BRT),                X00036900
               INITIAL='don`t'                                          00037000
        DFHMDF POS=(15,37),LENGTH=15,ATTRB=(ASKIP,NORM),               X00037100
               INITIAL='coincide on the'                                00037200
        DFHMDF POS=(15,53),LENGTH=04,ATTRB=(ASKIP,BRT),                X00037300
               INITIAL='same'                                           00037400
        DFHMDF POS=(15,58),LENGTH=22,ATTRB=(ASKIP,NORM),               X00037500
               INITIAL='coordinate.           '                         00037600
        DFHMDF POS=(16,01),LENGTH=01,ATTRB=(ASKIP,NORM),INITIAL=' '     00037700
        DFHMDF POS=(17,05),LENGTH=05,ATTRB=(ASKIP,BRT),                X00037800
               INITIAL='NOTE:'                                          00037900
        DFHMDF POS=(17,11),LENGTH=21,ATTRB=(ASKIP,NORM),               X00038000
               INITIAL='The ships take up the'                          00038100
        DFHMDF POS=(17,33),LENGTH=04,ATTRB=(ASKIP,BRT),                X00038200
               INITIAL='same'                                           00038300
        DFHMDF POS=(17,38),LENGTH=33,ATTRB=(ASKIP,NORM),               X00038400
               INITIAL='number of battle area coordinates'              00038500
        DFHMDF POS=(18,11),LENGTH=16,ATTRB=(ASKIP,NORM),               X00038600
               INITIAL='as the number of'                               00038700
        DFHMDF POS=(18,28),LENGTH=04,ATTRB=(ASKIP,BRT),                X00038800
               INITIAL='hits'                                           00038900
        DFHMDF POS=(18,33),LENGTH=15,ATTRB=(ASKIP,NORM),               X00039000
               INITIAL='each can take. '                                00039100
        DFHMDF POS=(18,49),LENGTH=05,ATTRB=(ASKIP,BRT),                X00039200
               INITIAL='Don`t'                                          00039300
        DFHMDF POS=(18,55),LENGTH=16,ATTRB=(ASKIP,NORM),               X00039400
               INITIAL='attempt to make '                               00039500
        DFHMDF POS=(19,11),LENGTH=13,ATTRB=(ASKIP,NORM),               X00039600
               INITIAL='your moves in'                                  00039700
        DFHMDF POS=(19,25),LENGTH=08,ATTRB=(ASKIP,BRT),                X00039800
               INITIAL='advance,'                                       00039900
        DFHMDF POS=(19,34),LENGTH=16,ATTRB=(ASKIP,NORM),               X00040000
               INITIAL='the program will'                               00040100
        DFHMDF POS=(19,51),LENGTH=04,ATTRB=(ASKIP,BRT),                X00040200
               INITIAL='beep'                                           00040300
        DFHMDF POS=(19,56),LENGTH=15,ATTRB=(ASKIP,NORM),               X00040400
               INITIAL='the terminal   '                                00040500
        DFHMDF POS=(20,11),LENGTH=10,ATTRB=(ASKIP,NORM),               X00040600
               INITIAL='when it is'                                     00040700
        DFHMDF POS=(20,22),LENGTH=05,ATTRB=(ASKIP,BRT),                X00040800
               INITIAL='ready'                                          00040900
        DFHMDF POS=(20,28),LENGTH=23,ATTRB=(ASKIP,NORM),               X00041000
               INITIAL='for input (and when any'                        00041100
        DFHMDF POS=(20,52),LENGTH=09,ATTRB=(ASKIP,BRT),                X00041200
               INITIAL='erroneous'                                      00041300
        DFHMDF POS=(20,62),LENGTH=02,ATTRB=(ASKIP,NORM),               X00041400
               INITIAL='or'                                             00041500
        DFHMDF POS=(20,65),LENGTH=06,ATTRB=(ASKIP,BRT),                X00041600
               INITIAL='con-  '                                         00041700
        DFHMDF POS=(21,11),LENGTH=08,ATTRB=(ASKIP,BRT),                X00041800
               INITIAL='flicting'                                       00041900
        DFHMDF POS=(21,20),LENGTH=27,ATTRB=(ASKIP,NORM),               X00042000
               INITIAL='data is input).  Good luck,'                    00042100
        DFHMDF POS=(21,48),LENGTH=23,ATTRB=(ASKIP,BRT),                X00042200
               INITIAL='Admiral!               '                        00042300
        DFHMDF POS=(22,01),LENGTH=01,ATTRB=(ASKIP,NORM),INITIAL=' '     00042400
        DFHMDF POS=(23,01),LENGTH=01,ATTRB=(ASKIP,NORM),INITIAL=' '     00042500
        DFHMDF POS=(24,01),LENGTH=16,ATTRB=(ASKIP,NORM),               X00042600
               INITIAL='PLEASE PRESS THE'                               00042700
        DFHMDF POS=(24,18),LENGTH=07,ATTRB=(ASKIP,BRT),                X00042800
               INITIAL='"ENTER"'                                        00042900
        DFHMDF POS=(24,26),LENGTH=26,ATTRB=(ASKIP,NORM),               X00043000
               INITIAL='KEY (WHEN DONE READING) TO'                     00043100
        DFHMDF POS=(24,53),LENGTH=05,ATTRB=(ASKIP,BRT),                X00043200
               INITIAL='BEGIN'                                          00043300
        DFHMDF POS=(24,59),LENGTH=19,ATTRB=(ASKIP,NORM),               X00043400
               INITIAL='SETTING YOUR SHIPS-'                            00043500
DUMYFLD DFHMDF POS=(24,79),LENGTH=01,ATTRB=(UNPROT,BRT,FSET,IC),       X00043600
               INITIAL=' '                                              00043700
        PRINT  ON,GEN                                                   00043800
        EJECT                                                           00043900
        DFHMSD TYPE=FINAL                                               00044000
