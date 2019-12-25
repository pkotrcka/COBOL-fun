       IDENTIFICATION DIVISION.
       PROGRAM-ID. CALC.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 WS-FNINPUT PIC S9(5)V9(2).
       01 WS-SNINPUT PIC S9(5)V9(2).
       01 WS-RESULT PIC S9(10)V9(2).
       01 WS-OPER PIC 9(1).
       01 WS-DECISION PIC 9(1).

       PROCEDURE DIVISION.

       INPUTNUMBERS.
           DISPLAY 'Enter first number (5 + 2 dec): '.
           ACCEPT WS-FNINPUT.
           DISPLAY 'Enter second number (5 + 2 dec): '.
           ACCEPT WS-SNINPUT.
       INPUTOPERATION.
           DISPLAY 'Enter desired operation:'.
           DISPLAY '1 for ADD'.
           DISPLAY '2 for SUB'.
           DISPLAY '3 for MUL'.
           DISPLAY '4 for DIV'.
           ACCEPT WS-OPER.
           GO TO ADDNUM SUBNUM MULNUM DIVNUM DEPENDING ON WS-OPER.
           DISPLAY 'You choose poorly, try again.'.
           GO TO INPUTOPERATION.

       ADDNUM.
           COMPUTE WS-RESULT = WS-FNINPUT + WS-SNINPUT.
           DISPLAY 'Result of ' WITH NO ADVANCING.
           DISPLAY WS-FNINPUT ' + ' WS-SNINPUT WITH NO ADVANCING.
           DISPLAY ' is ' WS-RESULT.
           GO TO DECISION.

       SUBNUM.
           COMPUTE WS-RESULT = WS-FNINPUT - WS-SNINPUT.
           DISPLAY 'Resullt of ' WITH NO ADVANCING.
           DISPLAY WS-FNINPUT ' - ' WS-SNINPUT WITH NO ADVANCING.
           DISPLAY ' is ' WS-RESULT.
           GO TO DECISION.

       MULNUM.
           COMPUTE WS-RESULT = WS-FNINPUT * WS-SNINPUT.
           DISPLAY 'Result of ' WITH NO ADVANCING.
           DISPLAY WS-FNINPUT ' * ' WS-SNINPUT WITH NO ADVANCING.
           DISPLAY ' is ' WS-RESULT.
           GO TO DECISION.

       DIVNUM.
           IF WS-SNINPUT = 0 THEN
                   DISPLAY 'Divide by 0'
                   GO TO DECISION
           ELSE
                   COMPUTE WS-RESULT = WS-FNINPUT / WS-SNINPUT
                   DISPLAY 'Result of ' WITH NO ADVANCING
                   DISPLAY WS-FNINPUT ' / ' WS-SNINPUT WITH NO ADVANCING
                   DISPLAY ' is ' WS-RESULT
                   GO TO DECISION
           END-IF.

       DECISION.
           SET WS-DECISION TO 0.
           DISPLAY 'Want to do different calculation (1 = YES)?'.
           ACCEPT WS-DECISION.
           IF WS-DECISION = 1 THEN
                   GO TO INPUTNUMBERS
           ELSE
                   DISPLAY 'Goodbye!'
                   STOP RUN
           END-IF.
