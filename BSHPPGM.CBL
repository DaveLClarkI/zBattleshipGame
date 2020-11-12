000100 IDENTIFICATION DIVISION.
000200 PROGRAM-ID.    BSHPPGM.
000300 AUTHOR.        DAVE L CLARK.
000400 INSTALLATION.  CLARKE INDUSTRIES.
000500 DATE-WRITTEN.  MAR 7, 1983.
000600 DATE-COMPILED.
000700 SECURITY.      CICS SECURITY KEY ONLY.
000800 REMARKS.       BATTLESHIP (TWO TERMINAL) PROGRAM.
000900* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
001000*                                                               *
001100* CLARKE Industries, Inc.                       Written by:     *
001200* 2100 Highway 265                           Dave Leonard Clark *
001300* Springdale, AR  72764                        (501)750-8248    *
001400*                                                               *
001500* No warranty is expressed or implied.   Neither the author nor *
001600* the company is responsible  for  any loss or damage resulting *
001700* from the use of this  code.   Source  is provided on an as-is *
001800* basis.                                                        *
001900*                                                               *
002000* ============================================================= *
002100*                                                               *
002200* This program is invoked as a CICS transaction as follows:     *
002300*                                                               *
002400* BSHP tttt                                                     *
002500*                                                               *
002600* This is entered from a  blank  CICS  screen and "tttt" is the *
002700* terminal identification for your desired opponent.            *
002800*                                                               *
002900* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
003000 ENVIRONMENT DIVISION.
003100 CONFIGURATION SECTION.
003200 SOURCE-COMPUTER. IBM-4381-T91E.
003300 OBJECT-COMPUTER. IBM-4381-T91E.
003400 DATA DIVISION.
003500 WORKING-STORAGE SECTION.
003600 77  FILLER                      PIC X(58)    VALUE IS
003700     '*****  BATTLESHIP GAME PROGRAM      - DAVE L. CLARK  *****'.
003800 77  ENTRY-PREV                  PIC X        VALUE SPACES.
003900 77  SHIP-HIT REDEFINES ENTRY-PREV PIC X.
004000 77  SHIP-MISS REDEFINES ENTRY-PREV PIC X.
004100 77  ENTRY-CHAR                  PIC X        VALUE SPACES.
004200 77  SHIP-POSN                   PIC 9        VALUE ZEROES.
004300 77  SHPNO                       PIC 9        VALUE ZEROES.
004400 77  COLNO    REDEFINES SHPNO    PIC 9.
004500 77  SHIP-LENG                   PIC 9        VALUE ZEROES.
004600 77  OFFS-LEN                    PIC 9        VALUE ZEROES.
004700 77  ROW                         PIC 9        VALUE ZEROES.
004800 77  COL                         PIC 9        VALUE ZEROES.
004900 77  ROW1                        PIC 9        VALUE ZEROES.
005000 77  COL1                        PIC 9        VALUE ZEROES.
005100 01  BOAT-DATA.
005200     05  FILLER                PIC X(16) VALUE 'PT-BOAT         '.
005300     05  FILLER                PIC X(16) VALUE 'SUBMARINE       '.
005400     05  FILLER                PIC X(16) VALUE 'BATTLESHIP      '.
005500     05  FILLER                PIC X(16) VALUE 'DESTROYER       '.
005600     05  FILLER                PIC X(16) VALUE 'AIRCRAFT CARRIER'.
005700 01  BOAT-TBLE REDEFINES BOAT-DATA.
005800     05  BOAT  OCCURS 5 TIMES.
005900         10  CHAR                PIC X(1).
006000         10  FILLER              PIC X(15).
006100 01  I-O-LEN                     PIC S9(4)    COMP VALUE +1920.
006200 01  OUT-MSG.
006300     05  OUT-MES                 PIC X(46)    VALUE SPACES.
006400     05  OUT-RTC                 PIC X(4)     VALUE SPACES.
006500 01  INP-MSG.
006600     05  INP-TRAN                PIC X(4)     VALUE SPACES.
006700     05  FILLER                  PIC X        VALUE SPACES.
006800     05  INP-TERM                PIC X(4)     VALUE SPACES.
006900 01  TERM-IOA                    PIC X(2020)  VALUE LOW-VALUES.
007000 01  INP-DIR.
007100     05  INP-DIRC                PIC XX       VALUE SPACES.
007200     05  FILLER                  PIC X(27)    VALUE SPACES.
007300 01  ACK-LENG                    PIC S9(4)    COMP VALUE +0079.
007400 01  ACK-MESG.
007500     05  FILLER                  PIC X(39)    VALUE IS
007600         'YOU HAVE NOW BEEN LINKED WITH TERMINAL '.
007700     05  ACK-TERM                PIC X(4).
007800     05  FILLER                  PIC X(36)    VALUE IS
007900         ' - PLEASE PRESS ENTER AND STAND BY -'.
008000 01  ENEMY                       PIC 9        VALUE ZERO.
008100 01  BATTLESHIP                  PIC X(4)     VALUE 'BSHP'.
008200 01  INTERVAL-TERM               PIC X(4)     VALUE SPACES.
008300 01  INTERVAL-LENG               PIC S9(4)    COMP VALUE +0281.
008400 01  INTERVAL-LINK.
008500     05  PLAYR                   PIC 9        VALUE 1.
008600     05  MESSG                   PIC X        VALUE SPACE.
008700     05  PREMV.
008800         10  MVROW               PIC 9.
008900         10  MVCOL               PIC 9.
009000     05  INTERVAL-PLAYER                      OCCURS 2 TIMES.
009100         10  INTERVAL-BOARD.
009200             15  INTERVAL-BRDCOL              OCCURS 9 TIMES.
009300                 20  INTERVAL-BRDROW          OCCURS 9 TIMES.
009400                     25  BRDPOS  PIC X.
009500         10  INTERVAL-SHIPS.
009600             15  INTERVAL-SHPNUM              OCCURS 5 TIMES.
009700                 20  SHPFLG      PIC X.
009800                 20  INTERVAL-SHPPOS          OCCURS 5 TIMES.
009900                     25  SHPROW  PIC 9.
010000                     25  SHPCOL  PIC 9.
010100 01  WS-CONVRT.
010200     05  MULT-CONVRT             PIC 99       VALUE ZEROES.
010300     05  SUBBT-CONVRT            PIC 99       VALUE ZEROES.
010400     05  SUBHX-CONVRT            PIC S9(3)    VALUE ZEROES.
010500 01  AREA-D-CONVRT.
010600     05  DECHEX-CONVRT           PIC S9(4)    COMP   VALUE ZEROES.
010700 01  AREA-H-CONVRT REDEFINES     AREA-D-CONVRT.
010800     05  FILLER                  PIC X.
010900     05  HEXDEC-CONVRT           PIC X.
011000 01  AREA-I-CONVRT.
011100     05  BYTI-1-CONVRT           PIC X        OCCURS 80 TIMES.
011200     05  FILLER                  PIC X(80).
011300 01  FILLER        REDEFINES     AREA-I-CONVRT.
011400     05  BYTI-2-CONVRT           PIC XX       OCCURS 80 TIMES.
011500 01  AREA-O-CONVRT.
011600     05  BYTO-1-CONVRT           PIC X        OCCURS 80 TIMES.
011700     05  FILLER                  PIC X(80).
011800 01  FILLER        REDEFINES     AREA-O-CONVRT.
011900     05  BYTO-2-CONVRT           PIC XX       OCCURS 80 TIMES.
012000 01  DATA-HEX-CONVRT.
012100     05 FILLER PIC X(32) VALUE '000102030405060708090A0B0C0D0E0F'.
012200     05 FILLER PIC X(32) VALUE '101112131415161718191A1B1C1D1E1F'.
012300     05 FILLER PIC X(32) VALUE '202122232425262728292A2B2C2D2E2F'.
012400     05 FILLER PIC X(32) VALUE '303132333435363738393A3B3C3D3E3F'.
012500     05 FILLER PIC X(32) VALUE '404142434445464748494A4B4C4D4E4F'.
012600     05 FILLER PIC X(32) VALUE '505152535455565758595A5B5C5D5E5F'.
012700     05 FILLER PIC X(32) VALUE '606162636465666768696A6B6C6D6E6F'.
012800     05 FILLER PIC X(32) VALUE '707172737475767778797A7B7C7D7E7F'.
012900     05 FILLER PIC X(32) VALUE '808182838485868788898A8B8C8D8E8F'.
013000     05 FILLER PIC X(32) VALUE '909192939495969798999A9B9C9D9E9F'.
013100     05 FILLER PIC X(32) VALUE 'A0A1A2A3A4A5A6A7A8A9AAABACADAEAF'.
013200     05 FILLER PIC X(32) VALUE 'B0B1B2B3B4B5B6B7B8B9BABBBCBDBEBF'.
013300     05 FILLER PIC X(32) VALUE 'C0C1C2C3C4C5C6C7C8C9CACBCCCDCECF'.
013400     05 FILLER PIC X(32) VALUE 'D0D1D2D3D4D5D6D7D8D9DADBDCDDDEDF'.
013500     05 FILLER PIC X(32) VALUE 'E0E1E2E3E4E5E6E7E8E9EAEBECEDEEEF'.
013600     05 FILLER PIC X(32) VALUE 'F0F1F2F3F4F5F6F7F8F9FAFBFCFDFEFF'.
013700 01  TBLE-HEX-CONVRT REDEFINES DATA-HEX-CONVRT.
013800     05 HEX-VALUE-CONVRT         PIC XX
013900               OCCURS 256 TIMES, INDEXED BY TBLES-CONVRT.
014000 01  DATA-ADR-CONVRT.
014100     05  FILLER                  PIC X(9)     VALUE '268435456'.
014200     05  FILLER                  PIC X(9)     VALUE '016777216'.
014300     05  FILLER                  PIC X(9)     VALUE '001048576'.
014400     05  FILLER                  PIC X(9)     VALUE '000065536'.
014500     05  FILLER                  PIC X(9)     VALUE '000004096'.
014600     05  FILLER                  PIC X(9)     VALUE '000000256'.
014700     05  FILLER                  PIC X(9)     VALUE '000000016'.
014800     05  FILLER                  PIC X(9)     VALUE '000000001'.
014900 01  TBLE-ADR-CONVRT REDEFINES DATA-ADR-CONVRT.
015000     05 ADR-VALUE-CONVRT         PIC 9(9)     OCCURS 8 TIMES.
015100 01  USER-CONVRT.
015200     05  RQC-CONVRT              PIC 99       VALUE ZEROES.
015300         88  CHR-DEC-CONVRT                     VALUE 01.
015400         88  CHR-HEX-CONVRT                     VALUE 02.
015500         88  CHR-HEX-STR-CONVRT                 VALUE 03.
015600         88  HEX-DEC-CONVRT                     VALUE 04.
015700         88  HEX-CHR-CONVRT                     VALUE 05.
015800         88  HEX-CHR-STR-CONVRT                 VALUE 06.
015900         88  DEC-HEX-CONVRT                     VALUE 07.
016000         88  DEC-CHR-CONVRT                     VALUE 08.
016100         88  ADR-DEC-CONVRT                     VALUE 09.
016200         88  DEC-ADR-CONVRT                     VALUE 10.
016300     05  CHAR-CONVRT             PIC X        VALUE SPACES.
016400     05  HEX-CONVRT              PIC XX       VALUE SPACES.
016500     05  ADR-CONVRT              PIC X(8)     VALUE SPACES.
016600     05  DEC-CONVRT              PIC S9(11)   COMP-3 VALUE ZEROES.
016700     05  INP-CONVRT              PIC X(160)   VALUE SPACES.
016800     05  LEN-CONVRT              PIC 99       VALUE ZEROES.
016900     05  OUT-CONVRT              PIC X(160)   VALUE SPACES.
017000     05  RTC-CONVRT              PIC XX       VALUE SPACES.
017100         88  COMPLETED-CONVRT                   VALUE '00'.
017200         88  INVA-REQU-CONVRT                   VALUE '01'.
017300         88  INVA-CHAR-CONVRT                   VALUE '02'.
017400         88  INVA-HEX-CONVRT                    VALUE '03'.
017500         88  INVA-DEC-CONVRT                    VALUE '04'.
017600         88  INVA-LENG-CONVRT                   VALUE '05'.
017700******************************************************************
017800*                                                                *
017900*    DEFAULT TERMINAL I/O AREA                                   *
018000*                                                                *
018100******************************************************************
018200 01  MAPPHASE                    PIC X(8)     VALUE 'BSHPMAP '.
018300 01  MAPNAME1                    PIC X(8)     VALUE 'DATAMAP '.
018400 01  MAPNAME2                    PIC X(8)     VALUE 'INSTMAP '.
018500     COPY 'BSHPMAP'.
018600 01  SCRATTRB.
018700     02  SCRUNPRO                PIC X        VALUE ' '.
018800*          X'40'= UNPRO NORM                    GREEN ON 3279 TERM
018900     02  SCRUNNUM                PIC X        VALUE '&'.
019000*          X'50'= UNPRO NORM NUM                GREEN ON 3279 TERM
019100     02  SCRUNFST                PIC X        VALUE 'A'.
019200*          X'C1'= UNPRO NORM FSET               GREEN ON 3279 TERM
019300     02  SCRUNNMF                PIC X        VALUE 'J'.
019400*          X'D1'= UNPRO NORM NUM FSET           GREEN ON 3279 TERM
019500     02  SCRUNBRT                PIC X        VALUE 'H'.
019600*          X'C8'= UNPRO BRT                      RED  ON 3279 TERM
019700     02  SCRUNBRF                PIC X        VALUE 'I'.
019800*          X'C9'= UNPRO BRT  FSET                RED  ON 3279 TERM
019900     02  SCRUNBRN                PIC X        VALUE 'Q'.
020000*          X'D8'= UNPRO BRT  NUM                 RED  ON 3279 TERM
020100     02  SCRUNBNF                PIC X        VALUE 'R'.
020200*          X'D9'= UNPRO BRT  NUM FSET            RED  ON 3279 TERM
020300     02  SCRUNDRK                PIC X        VALUE '<'.
020400*          X'4C'= UNPRO DRK                     BLANK ON  ANY TERM
020500     02  SCRUNDKF                PIC X        VALUE '('.
020600*          X'4D'= UNPRO DRK  FSET               BLANK ON  ANY TERM
020700     02  SCRUNDKN                PIC X        VALUE '*'.
020800*          X'5C'= UNPRO DRK  NUM                BLANK ON  ANY TERM
020900     02  SCRUNDNF                PIC X        VALUE ')'.
021000*          X'5D'= UNPRO DRK  NUM FSET           BLANK ON  ANY TERM
021100     02  SCRASKIP                PIC X        VALUE '0'.
021200*          X'F0'= ASKIP NORM                    BLUE  ON 3279 TERM
021300     02  SCRASFST                PIC X        VALUE '1'.
021400*          X'F1'= ASKIP NORM FSET               BLUE  ON 3279 TERM
021500     02  SCRASBRT                PIC X        VALUE '8'.
021600*          X'F8'= ASKIP BRT                     WHITE ON 3279 TERM
021700     02  SCRASBRF                PIC X        VALUE '9'.
021800*          X'F9'= ASKIP BRT  FSET               WHITE ON 3279 TERM
021900     02  SCRASDRK                PIC X        VALUE '@'.
022000*          X'7C'= ASKIP DRK                     BLANK ON  ANY TERM
022100     02  SCRASDKF                PIC X        VALUE QUOTE.
022200*          X'7D'= ASKIP DRK  FSET               BLANK ON  ANY TERM
022300     02  SCRSETBA                PIC X        VALUE ''.
022400*          X'11'= SET SCREEN BUFFER ADDR (2-BYTE ADDR MUST FOLLOW)
022500     02  SCRERASE                PIC X        VALUE ''.
022600*          X'12'= ERASE UNPROT TO ADDR (2-BYTE ADDR MUST FOLLOW)
022700     02  SCRCURSR                PIC X        VALUE ''.
022800*          X'13'= INSERT CURSOR
022900     02  SCRSTRTF                PIC X        VALUE ''.
023000*          X'1D'= START SCREEN FIELD (1-BYTE ATTRB MUST FOLLOW)
023100     02  SCREPEAT                PIC X        VALUE ''.
023200*          X'3C'= REPEAT TO ADDR (2-BYTE ADDR + CHAR MUST FOLLOW)
023300     02  CTLCHR40   PIC X  VALUE ' '.
023400* AS WRITE CONTROL CHARCTER = X'40'= FSET   LEAVEKB  SILENT
023500* AS COPY CONTROL CHARACTER = X'40'= ATTRB ONLY
023600     02  CTLCHR41   PIC X  VALUE ' '.
023700* AS WRITE CONTROL CHARCTER = X'41'= FRSET  LEAVEKB  SILENT
023800* AS COPY CONTROL CHARACTER = X'41'= DATA ONLY
023900     02  CTLCHR42   PIC X  VALUE '¡'.
024000* AS WRITE CONTROL CHARCTER = X'42'= FSET   FREEKB   SILENT
024100* AS COPY CONTROL CHARACTER = X'42'= MAP ONLY
024200     02  CTLCHR43   PIC X  VALUE '¢'.
024300* AS WRITE CONTROL CHARCTER = X'43'= FRSET  FREEKB   SILENT
024400* AS COPY CONTROL CHARACTER = X'43'= FULL BUFFER
024500     02  CTLCHR44   PIC X  VALUE '£'.
024600* AS WRITE CONTROL CHARCTER = X'44'= FSET   LEAVEKB  ALARM
024700* AS COPY CONTROL CHARACTER = X'44'= ATTRB ONLY    + ALARM
024800     02  CTLCHR45   PIC X  VALUE '¤'.
024900* AS WRITE CONTROL CHARCTER = X'45'= FRSET  LEAVEKB  ALARM
025000* AS COPY CONTROL CHARACTER = X'45'= DATA ONLY     + ALARM
025100     02  CTLCHR46   PIC X  VALUE '¥'.
025200* AS WRITE CONTROL CHARCTER = X'46'= FSET   FREEKB   ALARM
025300* AS COPY CONTROL CHARACTER = X'46'= MAP ONLY      + ALARM
025400     02  CTLCHR47   PIC X  VALUE '¦'.
025500* AS WRITE CONTROL CHARCTER = X'47'= FRSET  FREEKB   ALARM
025600* AS COPY CONTROL CHARACTER = X'47'= FULL BUFFER   + ALARM
025700*****************************************************************
025800*                                                               *
025900*    USER ROUTING LIST AREA                                     *
026000*                                                               *
026100*****************************************************************
026200 01  URLENTRY.
026300     02  URLFIRST.
026400         03  URLTRMID        PIC X(4).
026500         03  URLLDCMN        PIC X(2).
026600         03  URLOPID         PIC X(3).
026700         03  URLTSF          PIC X.
026800             88  URLSKIP     VALUES 'Ã', 'h', 'Ê', 'Ñ', '{', 'd'.
026900             88  URLITI      VALUE  '{'.
027000             88  URLNS       VALUE  'Ñ'.
027100             88  URLONSO     VALUES 'Ê', ''.
027200             88  URLSOUST    VALUE  'h'.
027300             88  URLINVMN    VALUE  'd'.
027400         03  FILLER          PIC X(6).
027500     02  URLCHAIN.
027600         03  URLCHIND         PIC S9(4) USAGE IS COMPUTATIONAL.
027700             88  URLEND      VALUE -1.
027800             88  URLCONT     VALUE -2.
027900         03  FILLER           PIC S9(4) USAGE IS COMPUTATIONAL.
028000         03  URLCHADR         PIC S9(8) USAGE IS COMPUTATIONAL.
028100******************************************************************
028200*                                                                *
028300*    EXECUTE INTERFACE VARIABLES                                 *
028400*                                                                *
028500******************************************************************
028600 PROCEDURE DIVISION.
028700******************************************************************
028800*                                                                *
028900*    HOUSEKEEPING                                                *
029000*                                                                *
029100******************************************************************
029200     EXEC CICS HANDLE CONDITION ENDDATA(A00-INITIALIZE)
029300                                ERROR(X00-ERROR)
029400                                END-EXEC.
029500*                                                                *
029600     EXEC CICS RETRIEVE INTO(INTERVAL-LINK)
029700                        LENGTH(INTERVAL-LENG)
029800                        RTERMID(INTERVAL-TERM)
029900                        END-EXEC.
030000     EXEC CICS HANDLE CONDITION ENDDATA
030100                                END-EXEC.
030200*                                                                *
030300     IF PREMV = 'SP'
030400         GO TO A10-INSTRUCTIONS.
030500*                                                                *
030600     GO TO B00-INPROCESS.
030700******************************************************************
030800*                                                                *
030900*    INITIALIZE GAMEAREAS & SET SHIP POSITIONS                   *
031000*                                                                *
031100******************************************************************
031200 A00-INITIALIZE.
031300     EXEC CICS HANDLE CONDITION ENDDATA
031400                                END-EXEC.
031500*                                                                *
031600     EXEC CICS RECEIVE INTO(TERM-IOA)
031700                       LENGTH(I-O-LEN)
031800                       END-EXEC.
031900     EXEC CICS ASKTIME END-EXEC.
032000     IF (EIBTIME > 0065959 AND EIBTIME < 0073201)
032100     OR (EIBTIME > 0115959 AND EIBTIME < 0123201)
032200     OR (EIBTIME > 0165959 AND EIBTIME < 0173201)
032300         NEXT SENTENCE
032400     ELSE
032500         MOVE 'GAME TIMES: 7-7:30, 12-12:30 OR 5-5:30' TO OUT-MSG
032600         MOVE  +0038   TO I-O-LEN
032700         EXEC CICS SEND FROM(OUT-MSG)
032800                        LENGTH(I-O-LEN)
032900                        ERASE
033000                        END-EXEC
033100         EXEC CICS RETURN END-EXEC.
033200     MOVE   TERM-IOA   TO INP-MSG.
033300     IF INP-TRAN NOT = BATTLESHIP
033400         MOVE 'START TRANSACTION FROM A CLEAR SCREEN' TO OUT-MSG
033500         MOVE  +0037   TO I-O-LEN
033600         EXEC CICS SEND FROM(OUT-MSG)
033700                        LENGTH(I-O-LEN)
033800                        ERASE
033900                        END-EXEC
034000         EXEC CICS RETURN END-EXEC.
034100*                                                                *
034200     MOVE  LOW-VALUES  TO URLENTRY.
034300     MOVE    SPACES    TO URLFIRST.
034400     MOVE   INP-TERM   TO URLTRMID.
034500     MOVE      -1      TO URLCHIND.
034600     MOVE    ZEROES    TO URLCHADR.
034700     EXEC CICS ROUTE LIST(URLENTRY)
034800                     ERRTERM(EIBTRMID)
034900                     END-EXEC.
035000     IF URLITI GO TO Z00-EOJ.
035100*                                                                *
035200     MOVE   EIBTRMID   TO ACK-TERM.
035300     EXEC CICS SEND TEXT FROM(ACK-MESG)
035400                         LENGTH(ACK-LENG)
035500                         CURSOR(80)
035600                         PAGING
035700                         ACCUM
035800                         ALARM
035900                         ERASE
036000                         FREEKB
036100                         END-EXEC.
036200     EXEC CICS SEND PAGE END-EXEC.
036300*                                                                *
036400     MOVE   INP-TERM   TO INTERVAL-TERM.
036500     MOVE      2       TO PLAYR.
036600     MOVE     'SP'     TO PREMV.
036700     MOVE  ALL ZEROES  TO INTERVAL-PLAYER (1) INTERVAL-PLAYER (2).
036800*                                                                *
036900 A10-INSTRUCTIONS.
037000     MOVE  LOW-VALUES  TO INSTMAPO.
037100     EXEC CICS SEND MAP(MAPNAME2)
037200                    FROM(INSTMAPO)
037300                    MAPSET(MAPPHASE)
037400                    TERMINAL
037500                    FREEKB
037600                    FRSET
037700                    ERASE
037800                    ALARM
037900                    END-EXEC.
038000     EXEC CICS RECEIVE END-EXEC.
038100*                                                                *
038200 A20-BEGIN-SETUP.
038300     IF PLAYR = 1
038400         THEN  MOVE  2  TO PLAYR
038500         ELSE  MOVE  1  TO PLAYR.
038600     MOVE  LOW-VALUES  TO DATAMAPO.
038700     MOVE   ALL '.'    TO INTERVAL-BOARD (PLAYR).
038800     PERFORM A30-SETUP-LOOP THRU A70-SETUP-EXIT
038900         VARYING SHPNO FROM 5 BY -1 UNTIL SHPNO = 0.
039000     GO TO A80-FINISH-SETUP.
039100*                                                                *
039200 A30-SETUP-LOOP.
039300     STRING '* PLACE YOUR ', BOAT (SHPNO), ' *',
039400         DELIMITED BY SIZE INTO MESSAGEO.
039500     MOVE   SCRUNFST   TO DIRLINEA.
039600     MOVE '__ <== ENTER COMPASS DIRECTION!' TO DIRLINEO.
039700*                                                                *
039800     EXEC CICS SEND MAP(MAPNAME1)
039900                    FROM(DATAMAPO)
040000                    MAPSET(MAPPHASE)
040100                    TERMINAL
040200                    FREEKB
040300                    FRSET
040400                    ERASE
040500                    ALARM
040600                    END-EXEC.
040700     EXEC CICS RECEIVE MAP(MAPNAME1)
040800                       INTO(DATAMAPI)
040900                       MAPSET(MAPPHASE)
041000                       TERMINAL
041100                       END-EXEC.
041200*                                                                *
041300     IF ROWNUMBI IS NOT NUMERIC
041400         GO TO A30-SETUP-LOOP.
041500     IF ROWNUMBI = ZERO
041600         GO TO A30-SETUP-LOOP.
041700     IF COLLETTI < 'A' OR > 'I'
041800         GO TO A30-SETUP-LOOP.
041900     MOVE   DIRLINEI   TO INP-DIR.
042000     IF INP-DIRC NOT = 'NO' AND 'SO' AND 'EA' AND 'WE'
042100                   AND 'NE' AND 'SE' AND 'NW' AND 'SW'
042200         GO TO A30-SETUP-LOOP.
042300*                                                                *
042400     MOVE   ROWNUMBI   TO ROW.
042500     MOVE      01      TO RQC-CONVRT.
042600     MOVE   COLLETTI   TO CHAR-CONVRT.
042700     PERFORM PROC-CONVRT THRU EXIT-CONVRT.
042800     SUBTRACT 192 FROM DEC-CONVRT GIVING COL.
042900*                                                                *
043000     SUBTRACT    1     FROM SHPNO GIVING OFFS-LEN.
043100     IF SHPNO < 3  MOVE SHPNO TO OFFS-LEN.
043200     IF (INP-DIRC = 'NE' OR 'NO' OR 'NW') AND (ROW - OFFS-LEN) < 1
043300         GO TO A30-SETUP-LOOP.
043400     IF (INP-DIRC = 'NW' OR 'WE' OR 'SW') AND (COL - OFFS-LEN) < 1
043500         GO TO A30-SETUP-LOOP.
043600     IF (INP-DIRC = 'SW' OR 'SO' OR 'SE') AND (ROW + OFFS-LEN) > 9
043700         GO TO A30-SETUP-LOOP.
043800     IF (INP-DIRC = 'SE' OR 'EA' OR 'NE') AND (COL + OFFS-LEN) > 9
043900         GO TO A30-SETUP-LOOP.
044000*                                                                *
044100     MOVE     ROW      TO ROW1.
044200     MOVE     COL      TO COL1.
044300     MOVE  SHPNO   TO SHIP-LENG.
044400     IF SHPNO < 3  ADD 1 TO SHIP-LENG.
044500     MOVE    SPACES    TO ENTRY-PREV.
044600     PERFORM A40-CHECK-PREVPOS VARYING SHIP-POSN FROM 1 BY 1
044700                                 UNTIL SHIP-POSN IS > SHIP-LENG.
044800     IF ENTRY-PREV = 'X'
044900         GO TO A30-SETUP-LOOP.
045000     GO TO A50-MAKE-ENTRY.
045100*                                                                *
045200 A40-CHECK-PREVPOS.
045300     IF ROW1 = 1 AND LEFTRW1I (COL1) NOT = '.'
045400         MOVE 'X' TO ENTRY-PREV.
045500     IF ROW1 = 2 AND LEFTRW2I (COL1) NOT = '.'
045600         MOVE 'X' TO ENTRY-PREV.
045700     IF ROW1 = 3 AND LEFTRW3I (COL1) NOT = '.'
045800         MOVE 'X' TO ENTRY-PREV.
045900     IF ROW1 = 4 AND LEFTRW4I (COL1) NOT = '.'
046000         MOVE 'X' TO ENTRY-PREV.
046100     IF ROW1 = 5 AND LEFTRW5I (COL1) NOT = '.'
046200         MOVE 'X' TO ENTRY-PREV.
046300     IF ROW1 = 6 AND LEFTRW6I (COL1) NOT = '.'
046400         MOVE 'X' TO ENTRY-PREV.
046500     IF ROW1 = 7 AND LEFTRW7I (COL1) NOT = '.'
046600         MOVE 'X' TO ENTRY-PREV.
046700     IF ROW1 = 8 AND LEFTRW8I (COL1) NOT = '.'
046800         MOVE 'X' TO ENTRY-PREV.
046900     IF ROW1 = 9 AND LEFTRW9I (COL1) NOT = '.'
047000         MOVE 'X' TO ENTRY-PREV.
047100     IF INP-DIRC = 'NE' OR 'NO' OR 'NW'  SUBTRACT  1   FROM ROW1.
047200     IF INP-DIRC = 'NW' OR 'WE' OR 'SW'  SUBTRACT  1   FROM COL1.
047300     IF INP-DIRC = 'SW' OR 'SO' OR 'SE'  ADD       1   TO   ROW1.
047400     IF INP-DIRC = 'SE' OR 'EA' OR 'NE'  ADD       1   TO   COL1.
047500*                                                                *
047600 A50-MAKE-ENTRY.
047700     MOVE CHAR (SHPNO) TO ENTRY-CHAR.
047800     PERFORM A60-ENTRY-LOOP VARYING SHIP-POSN FROM 1 BY 1
047900                              UNTIL SHIP-POSN IS > SHIP-LENG.
048000     GO TO A70-SETUP-EXIT.
048100*                                                                *
048200 A60-ENTRY-LOOP.
048300     MOVE   ROW   TO SHPROW (PLAYR SHPNO SHIP-POSN).
048400     MOVE   COL   TO SHPCOL (PLAYR SHPNO SHIP-POSN).
048500     PERFORM S00-ENTER-MOVE THRU T00-MOVE-EXIT.
048600     IF INP-DIRC = 'NE' OR 'NO' OR 'NW'  SUBTRACT  1   FROM ROW.
048700     IF INP-DIRC = 'NW' OR 'WE' OR 'SW'  SUBTRACT  1   FROM COL.
048800     IF INP-DIRC = 'SW' OR 'SO' OR 'SE'  ADD       1   TO   ROW.
048900     IF INP-DIRC = 'SE' OR 'EA' OR 'NE'  ADD       1   TO   COL.
049000 A70-SETUP-EXIT.
049100     EXIT.
049200*                                                                *
049300 A80-FINISH-SETUP.
049400     IF PLAYR = 2
049500         MOVE   'PL'   TO PREMV.
049600     EXEC CICS START TRANSID(BATTLESHIP)
049700                     FROM(INTERVAL-LINK)
049800                     LENGTH(INTERVAL-LENG)
049900                     TERMID(INTERVAL-TERM)
050000                     RTERMID(EIBTRMID)
050100                     END-EXEC.
050200*                                                                *
050300     MOVE '**** WAIT FOR OTHER PLAYER ****' TO MESSAGEO.
050400     MOVE  LOW-VALUES  TO DIRLINEA DIRLINEO.
050500*                                                                *
050600     EXEC CICS SEND MAP(MAPNAME1)
050700                    FROM(DATAMAPO)
050800                    MAPSET(MAPPHASE)
050900                    TERMINAL
051000                    FREEKB
051100                    FRSET
051200                    END-EXEC.
051300*                                                                *
051400     EXEC CICS RETURN END-EXEC.
051500******************************************************************
051600*                                                                *
051700*    END OF SETUP ROUTINE                                        *
051800*                                                                *
051900******************************************************************
052000 EJECT
052100******************************************************************
052200*                                                                *
052300*    BEGIN CURRENT TURN OF PLAY                                  *
052400*                                                                *
052500******************************************************************
052600 B00-INPROCESS.
052700     IF PLAYR = 1
052800         THEN MOVE  2  TO PLAYR, MOVE  1  TO ENEMY
052900         ELSE MOVE  1  TO PLAYR, MOVE  2  TO ENEMY.
053000*                                                                *
053100     MOVE  LOW-VALUES  TO DATAMAPO.
053200     MOVE      1       TO ROW.
053300     MOVE    ZEROES    TO COLNO.
053400*                                                                *
053500 B05-LOAD-SCREEN.
053600     ADD       1       TO COLNO.
053700     IF ROW = 1
053800         MOVE BRDPOS (PLAYR ROW COLNO) TO LEFTRW1O (COLNO)
053900         MOVE BRDPOS (ENEMY ROW COLNO) TO RGHTRW1O (COLNO).
054000     IF ROW = 2
054100         MOVE BRDPOS (PLAYR ROW COLNO) TO LEFTRW2O (COLNO)
054200         MOVE BRDPOS (ENEMY ROW COLNO) TO RGHTRW2O (COLNO).
054300     IF ROW = 3
054400         MOVE BRDPOS (PLAYR ROW COLNO) TO LEFTRW3O (COLNO)
054500         MOVE BRDPOS (ENEMY ROW COLNO) TO RGHTRW3O (COLNO).
054600     IF ROW = 4
054700         MOVE BRDPOS (PLAYR ROW COLNO) TO LEFTRW4O (COLNO)
054800         MOVE BRDPOS (ENEMY ROW COLNO) TO RGHTRW4O (COLNO).
054900     IF ROW = 5
055000         MOVE BRDPOS (PLAYR ROW COLNO) TO LEFTRW5O (COLNO)
055100         MOVE BRDPOS (ENEMY ROW COLNO) TO RGHTRW5O (COLNO).
055200     IF ROW = 6
055300         MOVE BRDPOS (PLAYR ROW COLNO) TO LEFTRW6O (COLNO)
055400         MOVE BRDPOS (ENEMY ROW COLNO) TO RGHTRW6O (COLNO).
055500     IF ROW = 7
055600         MOVE BRDPOS (PLAYR ROW COLNO) TO LEFTRW7O (COLNO)
055700         MOVE BRDPOS (ENEMY ROW COLNO) TO RGHTRW7O (COLNO).
055800     IF ROW = 8
055900         MOVE BRDPOS (PLAYR ROW COLNO) TO LEFTRW8O (COLNO)
056000         MOVE BRDPOS (ENEMY ROW COLNO) TO RGHTRW8O (COLNO).
056100     IF ROW = 9
056200         MOVE BRDPOS (PLAYR ROW COLNO) TO LEFTRW9O (COLNO)
056300         MOVE BRDPOS (ENEMY ROW COLNO) TO RGHTRW9O (COLNO).
056400*                                                                *
056500     IF COLNO < 9  GO TO B05-LOAD-SCREEN.
056600     MOVE    ZEROES    TO COLNO.
056700     IF ROW < 9  ADD 1 TO ROW
056800                 GO TO B05-LOAD-SCREEN.
056900*                                                                *
057000     MOVE      1       TO SHPNO.
057100     MOVE CHAR (SHPNO) TO ENTRY-CHAR.
057200     MOVE    SHPNO     TO SHIP-LENG.
057300     IF SHPNO < 3  ADD 1 TO SHIP-LENG.
057400     MOVE    ZEROES    TO SHIP-POSN.
057500*                                                                *
057600 B10-SETUP-SHIPS.
057700     ADD       1       TO SHIP-POSN.
057800     MOVE SHPROW (PLAYR SHPNO SHIP-POSN) TO ROW.
057900     MOVE SHPCOL (PLAYR SHPNO SHIP-POSN) TO COL.
058000     IF BRDPOS (PLAYR ROW COL) = '.'
058100         PERFORM S00-ENTER-MOVE THRU T00-MOVE-EXIT.
058200*                                                                *
058300     IF SHIP-POSN < SHIP-LENG  GO TO B10-SETUP-SHIPS.
058400     IF SHPFLG (PLAYR SHPNO) = CHAR (SHPNO)
058500         IF SHPNO = 1  MOVE SCRASBRF TO LEGENDPA ELSE
058600         IF SHPNO = 2  MOVE SCRASBRF TO LEGENDSA ELSE
058700         IF SHPNO = 3  MOVE SCRASBRF TO LEGENDBA ELSE
058800         IF SHPNO = 4  MOVE SCRASBRF TO LEGENDDA ELSE
058900         IF SHPNO = 5  MOVE SCRASBRF TO LEGENDAA.
059000     ADD       1       TO SHPNO.
059100     MOVE CHAR (SHPNO) TO ENTRY-CHAR.
059200     MOVE    SHPNO     TO SHIP-LENG.
059300     IF SHPNO < 3  ADD 1 TO SHIP-LENG.
059400     MOVE    ZEROES    TO SHIP-POSN.
059500     IF SHPNO < 6  GO TO B10-SETUP-SHIPS.
059600*                                                                *
059700     IF PREMV = 'PL'
059800         MOVE '**** MAKE YOUR FIRST MOVE! ****' TO MESSAGEO
059900         GO TO B20-SEND-SCREEN.
060000*                                                                *
060100     IF MVROW = 1 MOVE SCRASBRF TO LEFTRW1A (MVCOL).
060200     IF MVROW = 2 MOVE SCRASBRF TO LEFTRW2A (MVCOL).
060300     IF MVROW = 3 MOVE SCRASBRF TO LEFTRW3A (MVCOL).
060400     IF MVROW = 4 MOVE SCRASBRF TO LEFTRW4A (MVCOL).
060500     IF MVROW = 5 MOVE SCRASBRF TO LEFTRW5A (MVCOL).
060600     IF MVROW = 6 MOVE SCRASBRF TO LEFTRW6A (MVCOL).
060700     IF MVROW = 7 MOVE SCRASBRF TO LEFTRW7A (MVCOL).
060800     IF MVROW = 8 MOVE SCRASBRF TO LEFTRW8A (MVCOL).
060900     IF MVROW = 9 MOVE SCRASBRF TO LEFTRW9A (MVCOL).
061000*                                                                *
061100     IF MESSG = 'X'
061200         MOVE '**** BAD SHOTS OVER THERE! ****' TO MESSAGEO
061300         MOVE   SCRASBRF   TO LEGENDMA.
061400     IF MESSG = '*'
061500         MOVE '**** WE BEEN HOLED MATIE!  ****' TO MESSAGEO
061600         MOVE   SCRASBRF   TO LEGENDHA.
061700     IF MESSG = 'S'
061800         MOVE '***** HIT THE LIFE BOATS! *****' TO MESSAGEO
061900         MOVE   SCRASBRF   TO LEGENDHA.
062000     IF MESSG = 'A'
062100         MOVE '* ALL OF YOUR FLEET IS LOST!  *' TO MESSAGEO
062200         MOVE   SCRASBRF   TO LEGENDHA
062300         GO TO Y00-END-OF-GAME.
062400*                                                                *
062500 B20-SEND-SCREEN.
062600     EXEC CICS SEND MAP(MAPNAME1)
062700                    FROM(DATAMAPO)
062800                    MAPSET(MAPPHASE)
062900                    TERMINAL
063000                    FREEKB
063100                    FRSET
063200                    ALARM
063300                    END-EXEC.
063400     EXEC CICS RECEIVE MAP(MAPNAME1)
063500                       INTO(DATAMAPI)
063600                       MAPSET(MAPPHASE)
063700                       TERMINAL
063800                       END-EXEC.
063900*                                                                *
064000     IF ROWNUMBI IS NOT NUMERIC
064100         MOVE SCRUNBRF TO ROWNUMBA
064200         MOVE '@@@@ ROW MUST BE NUMERIC!  @@@@' TO MESSAGEO
064300         GO TO B20-SEND-SCREEN.
064400     IF ROWNUMBI = ZERO
064500         MOVE SCRUNBRF TO ROWNUMBA
064600         MOVE '@@@@  ROW MUST BE > ZERO!  @@@@' TO MESSAGEO
064700         GO TO B20-SEND-SCREEN.
064800     IF COLLETTI < 'A' OR > 'I'
064900         MOVE SCRUNBRF TO COLLETTA
065000         MOVE '@@@@ COL MUST BE FROM A-I! @@@@' TO MESSAGEO
065100         GO TO B20-SEND-SCREEN.
065200*                                                                *
065300     MOVE   ROWNUMBI   TO ROW.
065400     MOVE      01      TO RQC-CONVRT.
065500     MOVE   COLLETTI   TO CHAR-CONVRT.
065600     PERFORM PROC-CONVRT THRU EXIT-CONVRT.
065700     SUBTRACT 192 FROM DEC-CONVRT GIVING COL.
065800*                                                                *
065900     IF BRDPOS (ENEMY ROW COL) NOT = '.'
066000         MOVE SCRUNBRF TO ROWNUMBA COLLETTA
066100         MOVE '@@@ MAKE ANOTHER SELECTION! @@@' TO MESSAGEO
066200         GO TO B20-SEND-SCREEN.
066300*                                                                *
066400     MOVE    ZEROES    TO SHPNO.
066500 B30-CHECK-SHIP-HIT.
066600     ADD       1       TO SHPNO.
066700     MOVE    SHPNO     TO SHIP-LENG.
066800     IF SHPNO < 3  ADD 1 TO SHIP-LENG.
066900     MOVE    SPACES    TO SHIP-HIT.
067000     PERFORM B40-CHECK-SHIP-POS-HIT VARYING SHIP-POSN FROM 1 BY 1
067100         UNTIL SHIP-POSN > SHIP-LENG OR SHIP-HIT = 'X'.
067200     IF SHIP-HIT = 'X'
067300         GO TO B50-CHECK-SHIP-SUNK.
067400     IF SHPNO < 5
067500         GO TO B30-CHECK-SHIP-HIT.
067600*                                                                *
067700     MOVE    'X'    TO ENTRY-CHAR, MESSG, BRDPOS (ENEMY ROW COL).
067800     PERFORM S00-ENTER-MOVE THRU T00-MOVE-EXIT.
067900     MOVE '*** YA MISSED ME THAT TIME! ***' TO MESSAGEO.
068000     MOVE   SCRASBRF   TO LEGENDMA.
068100     GO TO B90-START-TRANSACTION.
068200*                                                                *
068300 B40-CHECK-SHIP-POS-HIT.
068400     IF ROW = SHPROW (ENEMY SHPNO SHIP-POSN) AND
068500        COL = SHPCOL (ENEMY SHPNO SHIP-POSN)
068600         MOVE 'X' TO SHIP-HIT.
068700*                                                                *
068800 B50-CHECK-SHIP-SUNK.
068900     MOVE    '*'     TO ENTRY-CHAR, MESSG, BRDPOS (ENEMY ROW COL).
069000     PERFORM S00-ENTER-MOVE THRU T00-MOVE-EXIT.
069100     MOVE '**** GOOD SHOOTING, MATIE! ****' TO MESSAGEO.
069200     MOVE   SCRASBRF   TO LEGENDHA.
069300     MOVE    SPACES    TO SHIP-MISS.
069400     PERFORM B60-CHECK-SHIP-POS-MISS VARYING SHIP-POSN FROM 1 BY 1
069500         UNTIL SHIP-POSN > SHIP-LENG OR SHIP-MISS = 'X'.
069600     IF SHIP-MISS = 'X'
069700         GO TO B90-START-TRANSACTION.
069800*                                                                *
069900     GO TO B70-CHECK-ALL-SUNK.
070000*                                                                *
070100 B60-CHECK-SHIP-POS-MISS.
070200     MOVE SHPROW (ENEMY SHPNO SHIP-POSN) TO ROW1.
070300     MOVE SHPCOL (ENEMY SHPNO SHIP-POSN) TO COL1.
070400     IF BRDPOS (ENEMY ROW1 COL1) = '.'
070500         MOVE 'X' TO SHIP-MISS.
070600*                                                                *
070700 B70-CHECK-ALL-SUNK.
070800     MOVE     'S'      TO MESSG.
070900     MOVE CHAR (SHPNO) TO SHPFLG (PLAYR SHPNO)
071000         IF SHPNO = 1  MOVE SCRASBRF TO LEGENDPA ELSE
071100         IF SHPNO = 2  MOVE SCRASBRF TO LEGENDSA ELSE
071200         IF SHPNO = 3  MOVE SCRASBRF TO LEGENDBA ELSE
071300         IF SHPNO = 4  MOVE SCRASBRF TO LEGENDDA ELSE
071400         IF SHPNO = 5  MOVE SCRASBRF TO LEGENDAA.
071500     STRING '-YOU SUNK MY ', BOAT (SHPNO), '!-',
071600         DELIMITED BY SIZE INTO MESSAGEO.
071700     MOVE    SPACES    TO SHIP-MISS.
071800     PERFORM B80-CHECK-SHIP-POS-MISS
071900         VARYING SHPNO FROM 1 BY 1
072000                 UNTIL SHPNO > 5 OR SHIP-MISS = 'X'
072100           AFTER SHIP-POSN FROM 1 BY 1
072200                 UNTIL SHIP-POSN > 5 OR SHIP-MISS = 'X'.
072300     IF SHIP-MISS = 'X'
072400         GO TO B90-START-TRANSACTION.
072500*                                                                *
072600     MOVE     'A'      TO MESSG.
072700     MOVE '@#*& MY WHOLE FLEET, LOST! &*#@' TO MESSAGEO.
072800     GO TO B90-START-TRANSACTION.
072900*                                                                *
073000 B80-CHECK-SHIP-POS-MISS.
073100     MOVE SHPROW (ENEMY SHPNO SHIP-POSN) TO ROW1.
073200     MOVE SHPCOL (ENEMY SHPNO SHIP-POSN) TO COL1.
073300     IF ZEROES NOT = ROW1 AND COL1
073400         IF BRDPOS (ENEMY ROW1 COL1) = '.'
073500             MOVE 'X' TO SHIP-MISS.
073600*                                                                *
073700 B90-START-TRANSACTION.
073800     MOVE     ROW      TO MVROW.
073900     MOVE     COL      TO MVCOL.
074000*                                                                *
074100     EXEC CICS START TRANSID(BATTLESHIP)
074200                     FROM(INTERVAL-LINK)
074300                     LENGTH(INTERVAL-LENG)
074400                     TERMID(INTERVAL-TERM)
074500                     RTERMID(EIBTRMID)
074600                     END-EXEC.
074700*                                                                *
074800     EXEC CICS SEND MAP(MAPNAME1)
074900                    FROM(DATAMAPO)
075000                    MAPSET(MAPPHASE)
075100                    TERMINAL
075200                    FREEKB
075300                    FRSET
075400                    END-EXEC.
075500*                                                                *
075600     EXEC CICS RETURN END-EXEC.
075700******************************************************************
075800*                                                                *
075900*    END CURRENT TURN OF PLAY                                    *
076000*                                                                *
076100******************************************************************
076200 EJECT
076300******************************************************************
076400*                                                                *
076500*    PERFORMED ROUTINES                                          *
076600*                                                                *
076700******************************************************************
076800 PROC-CONVRT.
076900     MOVE     '00'     TO RTC-CONVRT.
077000     GO TO  CHR-TO-DEC-CONVRT      CHR-TO-HEX-CONVRT
077100            CHR-TO-HEX-STR-CONVRT  HEX-TO-DEC-CONVRT
077200            HEX-TO-CHR-CONVRT      HEX-TO-CHR-STR-CONVRT
077300            DEC-TO-HEX-CONVRT      DEC-TO-CHR-CONVRT
077400            ADR-TO-DEC-CONVRT      DEC-TO-ADR-CONVRT
077500         DEPENDING ON RQC-CONVRT.
077600     MOVE     '01'     TO RTC-CONVRT.
077700     GO TO EXIT-CONVRT.
077800 DEC-TO-ADR-CONVRT.
077900     IF DEC-CONVRT > 4581298448
078000         MOVE '04'     TO RTC-CONVRT
078100         GO TO EXIT-CONVRT.
078200     MOVE    SPACES    TO AREA-I-CONVRT.
078300     PERFORM DECM-ADDRESS-CONVRT THRU DECM-ADDR-CONVRT
078400         VARYING SUBBT-CONVRT FROM 1 BY 1 UNTIL
078500             SUBBT-CONVRT > 8 OR RTC-CONVRT NOT = '00'.
078600     MOVE AREA-I-CONVRT TO ADR-CONVRT.
078700     GO TO EXIT-CONVRT.
078800 ADR-TO-DEC-CONVRT.
078900     MOVE    ZEROES    TO DEC-CONVRT.
079000     MOVE  ADR-CONVRT  TO AREA-I-CONVRT.
079100     PERFORM ADDRESS-DECM-CONVRT THRU ADDR-DECM-CONVRT
079200         VARYING SUBBT-CONVRT FROM 1 BY 1 UNTIL
079300             SUBBT-CONVRT > 8 OR RTC-CONVRT NOT = '00'.
079400     GO TO EXIT-CONVRT.
079500 DEC-TO-CHR-CONVRT.
079600     IF DEC-CONVRT > 256
079700         MOVE '04'     TO RTC-CONVRT
079800         GO TO EXIT-CONVRT.
079900     MOVE  DEC-CONVRT  TO DECHEX-CONVRT.
080000     MOVE HEXDEC-CONVRT TO CHAR-CONVRT.
080100     GO TO EXIT-CONVRT.
080200 DEC-TO-HEX-CONVRT.
080300     IF DEC-CONVRT > 256
080400         MOVE '04'     TO RTC-CONVRT
080500         GO TO EXIT-CONVRT.
080600     ADD 1  DEC-CONVRT GIVING SUBHX-CONVRT.
080700     MOVE HEX-VALUE-CONVRT (SUBHX-CONVRT) TO HEX-CONVRT.
080800     GO TO EXIT-CONVRT.
080900 HEX-TO-CHR-STR-CONVRT.
081000     IF LEN-CONVRT = 00 OR > 80
081100         MOVE '05'     TO RTC-CONVRT
081200         GO TO EXIT-CONVRT.
081300     MOVE  INP-CONVRT  TO AREA-I-CONVRT.
081400     MOVE    SPACES    TO AREA-O-CONVRT.
081500     PERFORM HEX-CHARACTER-CONVRT THRU HEX-CHAR-CONVRT
081600         VARYING SUBBT-CONVRT FROM 1 BY 1 UNTIL
081700           SUBBT-CONVRT > LEN-CONVRT OR RTC-CONVRT NOT = '00'.
081800     MOVE AREA-O-CONVRT TO OUT-CONVRT.
081900     GO TO EXIT-CONVRT.
082000 HEX-TO-CHR-CONVRT.
082100     SET TBLES-CONVRT  TO +1.
082200     MOVE    ZEROES    TO SUBHX-CONVRT.
082300     SEARCH HEX-VALUE-CONVRT VARYING SUBHX-CONVRT
082400         AT END MOVE '03' TO RTC-CONVRT
082500           WHEN HEX-VALUE-CONVRT (SUBHX-CONVRT) = HEX-CONVRT
082600                SUBTRACT 1 FROM SUBHX-CONVRT
082700                MOVE SUBHX-CONVRT TO DECHEX-CONVRT
082800                MOVE HEXDEC-CONVRT TO CHAR-CONVRT.
082900     GO TO EXIT-CONVRT.
083000 HEX-TO-DEC-CONVRT.
083100     SET TBLES-CONVRT  TO +1.
083200     MOVE    ZEROES    TO SUBHX-CONVRT.
083300     SEARCH HEX-VALUE-CONVRT VARYING SUBHX-CONVRT
083400         AT END MOVE '03' TO RTC-CONVRT
083500           WHEN HEX-VALUE-CONVRT (SUBHX-CONVRT) = HEX-CONVRT
083600                SUBTRACT 1 FROM SUBHX-CONVRT
083700                MOVE SUBHX-CONVRT TO DEC-CONVRT.
083800     GO TO EXIT-CONVRT.
083900 CHR-TO-HEX-STR-CONVRT.
084000     IF LEN-CONVRT = 00 OR > 80
084100         MOVE '05'     TO RTC-CONVRT
084200         GO TO EXIT-CONVRT.
084300     MOVE  INP-CONVRT  TO AREA-I-CONVRT.
084400     MOVE    SPACES    TO AREA-O-CONVRT.
084500     PERFORM CHARACTER-HEX-CONVRT THRU CHAR-HEX-CONVRT
084600         VARYING SUBBT-CONVRT FROM 1 BY 1 UNTIL
084700           SUBBT-CONVRT > LEN-CONVRT.
084800     MOVE AREA-O-CONVRT TO OUT-CONVRT.
084900     GO TO EXIT-CONVRT.
085000 CHR-TO-HEX-CONVRT.
085100     MOVE CHAR-CONVRT  TO HEXDEC-CONVRT.
085200     ADD 1 DECHEX-CONVRT GIVING SUBHX-CONVRT.
085300     MOVE HEX-VALUE-CONVRT (SUBHX-CONVRT) TO HEX-CONVRT.
085400     GO TO EXIT-CONVRT.
085500 CHR-TO-DEC-CONVRT.
085600     MOVE CHAR-CONVRT  TO HEXDEC-CONVRT.
085700     MOVE DECHEX-CONVRT TO DEC-CONVRT.
085800     GO TO EXIT-CONVRT.
085900 CHARACTER-HEX-CONVRT.
086000     MOVE BYTI-1-CONVRT (SUBBT-CONVRT) TO HEXDEC-CONVRT.
086100     ADD 1 DECHEX-CONVRT GIVING SUBHX-CONVRT.
086200     MOVE HEX-VALUE-CONVRT (SUBHX-CONVRT)
086300          TO BYTO-2-CONVRT (SUBBT-CONVRT).
086400 CHAR-HEX-CONVRT.
086500     EXIT.
086600 HEX-CHARACTER-CONVRT.
086700     SET TBLES-CONVRT  TO +1.
086800     MOVE    ZEROES    TO SUBHX-CONVRT.
086900     SEARCH HEX-VALUE-CONVRT VARYING SUBHX-CONVRT
087000         AT END MOVE '03' TO RTC-CONVRT
087100                GO TO HEX-CHAR-CONVRT
087200           WHEN HEX-VALUE-CONVRT (SUBHX-CONVRT) =
087300                   BYTI-2-CONVRT (SUBBT-CONVRT)
087400                NEXT SENTENCE.
087500     SUBTRACT 1 FROM SUBHX-CONVRT.
087600     MOVE SUBHX-CONVRT TO DECHEX-CONVRT.
087700     MOVE HEXDEC-CONVRT TO BYTO-1-CONVRT (SUBBT-CONVRT).
087800 HEX-CHAR-CONVRT.
087900     EXIT.
088000 ADDRESS-DECM-CONVRT.
088100     MOVE    ZEROES    TO MULT-CONVRT.
088200     IF BYTI-1-CONVRT (SUBBT-CONVRT) = '0' GO TO ADDR-DECM-CONVRT.
088300     IF BYTI-1-CONVRT (SUBBT-CONVRT) = '1' MOVE 01 TO MULT-CONVRT.
088400     IF BYTI-1-CONVRT (SUBBT-CONVRT) = '2' MOVE 02 TO MULT-CONVRT.
088500     IF BYTI-1-CONVRT (SUBBT-CONVRT) = '3' MOVE 03 TO MULT-CONVRT.
088600     IF BYTI-1-CONVRT (SUBBT-CONVRT) = '4' MOVE 04 TO MULT-CONVRT.
088700     IF BYTI-1-CONVRT (SUBBT-CONVRT) = '5' MOVE 05 TO MULT-CONVRT.
088800     IF BYTI-1-CONVRT (SUBBT-CONVRT) = '6' MOVE 06 TO MULT-CONVRT.
088900     IF BYTI-1-CONVRT (SUBBT-CONVRT) = '7' MOVE 07 TO MULT-CONVRT.
089000     IF BYTI-1-CONVRT (SUBBT-CONVRT) = '8' MOVE 08 TO MULT-CONVRT.
089100     IF BYTI-1-CONVRT (SUBBT-CONVRT) = '9' MOVE 09 TO MULT-CONVRT.
089200     IF BYTI-1-CONVRT (SUBBT-CONVRT) = 'A' MOVE 10 TO MULT-CONVRT.
089300     IF BYTI-1-CONVRT (SUBBT-CONVRT) = 'B' MOVE 11 TO MULT-CONVRT.
089400     IF BYTI-1-CONVRT (SUBBT-CONVRT) = 'C' MOVE 12 TO MULT-CONVRT.
089500     IF BYTI-1-CONVRT (SUBBT-CONVRT) = 'D' MOVE 13 TO MULT-CONVRT.
089600     IF BYTI-1-CONVRT (SUBBT-CONVRT) = 'E' MOVE 14 TO MULT-CONVRT.
089700     IF BYTI-1-CONVRT (SUBBT-CONVRT) = 'F' MOVE 15 TO MULT-CONVRT.
089800     IF MULT-CONVRT = ZERO
089900         MOVE   '03'   TO RTC-CONVRT
090000         GO TO ADDR-DECM-CONVRT.
090100     COMPUTE DEC-CONVRT = DEC-CONVRT
090200                 + ADR-VALUE-CONVRT (SUBBT-CONVRT) * MULT-CONVRT.
090300 ADDR-DECM-CONVRT.
090400     EXIT.
090500 DECM-ADDRESS-CONVRT.
090600     DIVIDE DEC-CONVRT BY ADR-VALUE-CONVRT (SUBBT-CONVRT)
090700         GIVING MULT-CONVRT REMAINDER DEC-CONVRT.
090800     IF MULT-CONVRT > 15
090900         MOVE   '04'   TO RTC-CONVRT
091000         GO TO DECM-ADDR-CONVRT.
091100     IF MULT-CONVRT = 00 MOVE '0' TO BYTI-1-CONVRT (SUBBT-CONVRT).
091200     IF MULT-CONVRT = 01 MOVE '1' TO BYTI-1-CONVRT (SUBBT-CONVRT).
091300     IF MULT-CONVRT = 02 MOVE '2' TO BYTI-1-CONVRT (SUBBT-CONVRT).
091400     IF MULT-CONVRT = 03 MOVE '3' TO BYTI-1-CONVRT (SUBBT-CONVRT).
091500     IF MULT-CONVRT = 04 MOVE '4' TO BYTI-1-CONVRT (SUBBT-CONVRT).
091600     IF MULT-CONVRT = 05 MOVE '5' TO BYTI-1-CONVRT (SUBBT-CONVRT).
091700     IF MULT-CONVRT = 06 MOVE '6' TO BYTI-1-CONVRT (SUBBT-CONVRT).
091800     IF MULT-CONVRT = 07 MOVE '7' TO BYTI-1-CONVRT (SUBBT-CONVRT).
091900     IF MULT-CONVRT = 08 MOVE '8' TO BYTI-1-CONVRT (SUBBT-CONVRT).
092000     IF MULT-CONVRT = 09 MOVE '9' TO BYTI-1-CONVRT (SUBBT-CONVRT).
092100     IF MULT-CONVRT = 10 MOVE 'A' TO BYTI-1-CONVRT (SUBBT-CONVRT).
092200     IF MULT-CONVRT = 11 MOVE 'B' TO BYTI-1-CONVRT (SUBBT-CONVRT).
092300     IF MULT-CONVRT = 12 MOVE 'C' TO BYTI-1-CONVRT (SUBBT-CONVRT).
092400     IF MULT-CONVRT = 13 MOVE 'D' TO BYTI-1-CONVRT (SUBBT-CONVRT).
092500     IF MULT-CONVRT = 14 MOVE 'E' TO BYTI-1-CONVRT (SUBBT-CONVRT).
092600     IF MULT-CONVRT = 15 MOVE 'F' TO BYTI-1-CONVRT (SUBBT-CONVRT).
092700 DECM-ADDR-CONVRT.
092800     EXIT.
092900 EXIT-CONVRT.
093000     MOVE    ZEROES    TO SUBBT-CONVRT.
093100 EJECT
093200******************************************************************
093300*                                                                *
093400*    PSUEDO TABLE ENTRIES FOR CURRENT MOVE                       *
093500*                                                                *
093600******************************************************************
093700 S00-ENTER-MOVE.
093800     GO TO S10-ROW S20-ROW S30-ROW S40-ROW S50-ROW
093900           S60-ROW S70-ROW S80-ROW S90-ROW    DEPENDING ON ROW.
094000     GO TO X00-ERROR.
094100 S10-ROW.
094200     IF MESSG NOT = 'A'
094300       IF ENTRY-CHAR = 'P' OR 'S' OR 'B' OR 'D' OR 'A'
094400         MOVE ENTRY-CHAR TO LEFTRW1O (COL)
094500         IF PREMV = 'SP'  MOVE SCRASBRF TO LEFTRW1A (COL)
094600                              GO TO T00-MOVE-EXIT
094700             ELSE             GO TO T00-MOVE-EXIT.
094800     MOVE   SCRASBRF   TO RGHTRW1A (COL).
094900     MOVE  ENTRY-CHAR  TO RGHTRW1O (COL).
095000     GO TO T00-MOVE-EXIT.
095100 S20-ROW.
095200     IF MESSG NOT = 'A'
095300       IF ENTRY-CHAR = 'P' OR 'S' OR 'B' OR 'D' OR 'A'
095400         MOVE ENTRY-CHAR TO LEFTRW2O (COL)
095500         IF PREMV = 'SP'  MOVE SCRASBRF TO LEFTRW2A (COL)
095600                              GO TO T00-MOVE-EXIT
095700             ELSE             GO TO T00-MOVE-EXIT.
095800     MOVE   SCRASBRF   TO RGHTRW2A (COL).
095900     MOVE  ENTRY-CHAR  TO RGHTRW2O (COL).
096000     GO TO T00-MOVE-EXIT.
096100 S30-ROW.
096200     IF MESSG NOT = 'A'
096300       IF ENTRY-CHAR = 'P' OR 'S' OR 'B' OR 'D' OR 'A'
096400         MOVE ENTRY-CHAR TO LEFTRW3O (COL)
096500         IF PREMV = 'SP'  MOVE SCRASBRF TO LEFTRW3A (COL)
096600                              GO TO T00-MOVE-EXIT
096700             ELSE             GO TO T00-MOVE-EXIT.
096800     MOVE   SCRASBRF   TO RGHTRW3A (COL).
096900     MOVE  ENTRY-CHAR  TO RGHTRW3O (COL).
097000     GO TO T00-MOVE-EXIT.
097100 S40-ROW.
097200     IF MESSG NOT = 'A'
097300       IF ENTRY-CHAR = 'P' OR 'S' OR 'B' OR 'D' OR 'A'
097400         MOVE ENTRY-CHAR TO LEFTRW4O (COL)
097500         IF PREMV = 'SP'  MOVE SCRASBRF TO LEFTRW4A (COL)
097600                              GO TO T00-MOVE-EXIT
097700             ELSE             GO TO T00-MOVE-EXIT.
097800     MOVE   SCRASBRF   TO RGHTRW4A (COL).
097900     MOVE  ENTRY-CHAR  TO RGHTRW4O (COL).
098000     GO TO T00-MOVE-EXIT.
098100 S50-ROW.
098200     IF MESSG NOT = 'A'
098300       IF ENTRY-CHAR = 'P' OR 'S' OR 'B' OR 'D' OR 'A'
098400         MOVE ENTRY-CHAR TO LEFTRW5O (COL)
098500         IF PREMV = 'SP'  MOVE SCRASBRF TO LEFTRW5A (COL)
098600                              GO TO T00-MOVE-EXIT
098700             ELSE             GO TO T00-MOVE-EXIT.
098800     MOVE   SCRASBRF   TO RGHTRW5A (COL).
098900     MOVE  ENTRY-CHAR  TO RGHTRW5O (COL).
099000     GO TO T00-MOVE-EXIT.
099100 S60-ROW.
099200     IF MESSG NOT = 'A'
099300       IF ENTRY-CHAR = 'P' OR 'S' OR 'B' OR 'D' OR 'A'
099400         MOVE ENTRY-CHAR TO LEFTRW6O (COL)
099500         IF PREMV = 'SP'  MOVE SCRASBRF TO LEFTRW6A (COL)
099600                              GO TO T00-MOVE-EXIT
099700             ELSE             GO TO T00-MOVE-EXIT.
099800     MOVE   SCRASBRF   TO RGHTRW6A (COL).
099900     MOVE  ENTRY-CHAR  TO RGHTRW6O (COL).
100000     GO TO T00-MOVE-EXIT.
100100 S70-ROW.
100200     IF MESSG NOT = 'A'
100300       IF ENTRY-CHAR = 'P' OR 'S' OR 'B' OR 'D' OR 'A'
100400         MOVE ENTRY-CHAR TO LEFTRW7O (COL)
100500         IF PREMV = 'SP'  MOVE SCRASBRF TO LEFTRW7A (COL)
100600                              GO TO T00-MOVE-EXIT
100700             ELSE             GO TO T00-MOVE-EXIT.
100800     MOVE   SCRASBRF   TO RGHTRW7A (COL).
100900     MOVE  ENTRY-CHAR  TO RGHTRW7O (COL).
101000     GO TO T00-MOVE-EXIT.
101100 S80-ROW.
101200     IF MESSG NOT = 'A'
101300       IF ENTRY-CHAR = 'P' OR 'S' OR 'B' OR 'D' OR 'A'
101400         MOVE ENTRY-CHAR TO LEFTRW8O (COL)
101500         IF PREMV = 'SP'  MOVE SCRASBRF TO LEFTRW8A (COL)
101600                              GO TO T00-MOVE-EXIT
101700             ELSE             GO TO T00-MOVE-EXIT.
101800     MOVE   SCRASBRF   TO RGHTRW8A (COL).
101900     MOVE  ENTRY-CHAR  TO RGHTRW8O (COL).
102000     GO TO T00-MOVE-EXIT.
102100 S90-ROW.
102200     IF MESSG NOT = 'A'
102300       IF ENTRY-CHAR = 'P' OR 'S' OR 'B' OR 'D' OR 'A'
102400         MOVE ENTRY-CHAR TO LEFTRW9O (COL)
102500         IF PREMV = 'SP'  MOVE SCRASBRF TO LEFTRW9A (COL)
102600                              GO TO T00-MOVE-EXIT
102700             ELSE             GO TO T00-MOVE-EXIT.
102800     MOVE   SCRASBRF   TO RGHTRW9A (COL).
102900     MOVE  ENTRY-CHAR  TO RGHTRW9O (COL).
103000     GO TO T00-MOVE-EXIT.
103100 T00-MOVE-EXIT.
103200     EXIT.
103300 EJECT
103400******************************************************************
103500*                                                                *
103600*    ERROR EXIT ROUTINE               (HANDLE CONDITION EXIT)    *
103700*                                                                *
103800******************************************************************
103900 X00-ERROR.
104000     MOVE      03      TO RQC-CONVRT.
104100     MOVE   EIBRCODE   TO INP-CONVRT.
104200     MOVE      02      TO LEN-CONVRT.
104300     PERFORM PROC-CONVRT THRU EXIT-CONVRT.
104400*                                                                *
104500 X10-CONTINUE.
104600     MOVE 'UNDEFINED ERROR HAS OCCURED - RETURN CODE ==> '
104700                       TO OUT-MES.
104800     MOVE  OUT-CONVRT  TO OUT-RTC.
104900     MOVE    +0050     TO I-O-LEN.
105000*                                                                *
105100     EXEC CICS SEND FROM(OUT-MSG)
105200                    LENGTH(I-O-LEN)
105300                    CTLCHAR(CTLCHR47)
105400                    ERASE
105500                    END-EXEC.
105600     EXEC CICS RETURN END-EXEC.
105700 EJECT
105800******************************************************************
105900*                                                                *
106000*    TRANSACTION EXIT ROUTINE         (BRANCH AT END OF GAME)    *
106100*                                                                *
106200******************************************************************
106300 Y00-END-OF-GAME.
106400     PERFORM Y10-SETUP-SHIPS
106500         VARYING SHPNO FROM 1 BY 1 UNTIL SHPNO > 5
106600           AFTER SHIP-POSN FROM 1 BY 1 UNTIL SHIP-POSN > 5.
106700     GO TO Y20-SEND-SCREEN.
106800*                                                                *
106900 Y10-SETUP-SHIPS.
107000     MOVE SHPROW (ENEMY SHPNO SHIP-POSN) TO ROW.
107100     MOVE SHPCOL (ENEMY SHPNO SHIP-POSN) TO COL.
107200     IF ZEROES NOT = ROW AND COL
107300         IF BRDPOS (ENEMY ROW COL) = '.'
107400             MOVE CHAR (SHPNO) TO ENTRY-CHAR
107500             PERFORM S00-ENTER-MOVE THRU T00-MOVE-EXIT.
107600*                                                                *
107700 Y20-SEND-SCREEN.
107800     EXEC CICS SEND MAP(MAPNAME1)
107900                    FROM(DATAMAPO)
108000                    MAPSET(MAPPHASE)
108100                    TERMINAL
108200                    FREEKB
108300                    FRSET
108400                    ALARM
108500                    END-EXEC.
108600     EXEC CICS RETURN END-EXEC.
108700 EJECT
108800******************************************************************
108900*                                                                *
109000*    TRANSACTION EXIT ROUTINE         (BRANCH ON ROUTE ERROR)    *
109100*                                                                *
109200******************************************************************
109300 Z00-EOJ.
109400     MOVE 'INVALID TERMINAL ID SPECIFIED - RETRY - ' TO OUT-MSG.
109500     MOVE    +0040     TO I-O-LEN.
109600*                                                                *
109700     EXEC CICS SEND FROM(OUT-MSG)
109800                    LENGTH(I-O-LEN)
109900                    ERASE
110000                    END-EXEC.
110100     EXEC CICS RETURN END-EXEC.
110200*                                                                *
110300     GOBACK.


