       IDENTIFICATION DIVISION.
       PROGRAM-ID. URL-SHORTENER.
       
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 WS-URL PIC X(200).
       01 WS-SHORT-CODE PIC X(6).
       01 WS-COUNTER PIC 9(3) VALUE 0.
       01 WS-URLS-TABLE.
          05 WS-URL-ENTRY OCCURS 100 TIMES.
             10 WS-SHORT PIC X(6).
             10 WS-LONG-URL PIC X(200).
       
       PROCEDURE DIVISION.
       MAIN-LOGIC.
           PERFORM GENERATE-SHORT-CODE
           PERFORM STORE-URL
           PERFORM DISPLAY-RESULT
           STOP RUN.
           
       GENERATE-SHORT-CODE.
           MOVE 'ABC123' TO WS-SHORT-CODE.
           
       STORE-URL.
           ADD 1 TO WS-COUNTER
           MOVE WS-SHORT-CODE TO WS-SHORT(WS-COUNTER)
           MOVE 'https://www.example.com' TO WS-LONG-URL(WS-COUNTER).
           
       DISPLAY-RESULT.
           DISPLAY 'Short URL: ' WS-SHORT-CODE
           DISPLAY 'Original URL: ' WS-LONG-URL(WS-COUNTER).
           
       END PROGRAM URL-SHORTENER.
