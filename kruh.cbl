       IDENTIFICATION DIVISION.
       PROGRAM-ID. CIRCLEAREA.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 WS-RADIUS PIC S9(2)V9(2) VALUE 0.
       01 WS-RADIUSSQR PIC S9(4)V9(2).
       01 WS-NAME PIC A(10).
       01 WS-PI PIC 9(1)V9(5) VALUE 3.14159.
       01 WS-AREA PIC S9(5)V9(4).
       01 WS-TRYAGAIN PIC X(10).
	88 YESANSWER VALUE "yes", "Yes", "ja", "Ja", "ano", "Ano".

       PROCEDURE DIVISION.

      * enter name of the user

       MAIN.
           DISPLAY 'Enter your name (10 chars max)'.
           ACCEPT WS-NAME.
      * enter radius of the circle, set TRYAGAIN to 0 for another round
       ENTERRADIUS.
           DISPLAY FUNCTION TRIM(WS-NAME) WITH NO ADVANCING.
           DISPLAY ' enter radius of the circle: '.
           ACCEPT WS-RADIUS.
           GO TO RADIUSCHECK.

      * check if radius is LE than 0, if yes ask for a value

       RADIUSCHECK.
           IF WS-RADIUS IS <= 0 THEN
                   DISPLAY 'Lower or equal to zero, try again!'
                   GO TO ENTERRADIUS
           ELSE
                   GO TO RADIUSCALC
           END-IF.
 
      * calculate area as radius sqr multiplied by PI

        RADIUSCALC.
           MULTIPLY WS-RADIUS BY WS-RADIUS GIVING WS-RADIUSSQR.
           MULTIPLY WS-RADIUSSQR BY WS-PI GIVING WS-AREA.
           DISPLAY FUNCTION TRIM(WS-NAME) WITH NO ADVANCING.
           DISPLAY ', are of the circle with radius ' WITH NO ADVANCING.
           DISPLAY WS-RADIUS WITH NO ADVANCING.
           DISPLAY ' is: ' WITH NO ADVANCING.
           DISPLAY WS-AREA.

      * asking if user wants to do it again

           DISPLAY 'Do you want to try again?'.
           ACCEPT WS-TRYAGAIN.

      * if his answer is from YESANSWER, returning to enter radius, otherwise BYE

           IF YESANSWER THEN
                   GO TO ENTERRADIUS
           ELSE
                   DISPLAY FUNCTION TRIM(WS-NAME) WITH NO ADVANCING
                   DISPLAY ', bye then.'
                   STOP RUN
           END-IF.

           STOP RUN.
