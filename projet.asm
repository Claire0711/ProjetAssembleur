  TITLE   DISPLAY - programme prototype
            .286
            

SSEG        SEGMENT STACK
            DB      32      DUP("STACK---")
SSEG        ENDS

DSEG       SEGMENT
COORDX DW 0
COORDY DW 25
TITRE	DB 		"Le labyrinthe", 0DH, 0AH, 24H
FIN 	DB 		"Vous avez gagne en ", 0DH, 0AH, 24H
NBMOVE DW 0
MOVE  	DB 		" mouvements", 0DH, 0AH, 24H
DSEG        ENDS

;---------------------------------------------MACROS 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;macros pour les murs du labyrinthe;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
LIGPIX MACRO XA, YA, XB
local ligpixlbl

    MOV AH, 0CH
    MOV AL, 0FH
    MOV BH, 0
    MOV CX, XA
    MOV DX, YA
    ligpixlbl: 
        INT 10H
        INC CX
        CMP CX, XB 
        JLE ligpixlbl
ENDM

COLPIX MACRO XA, YA, YB
local colpixlbl

    MOV AH, 0CH
    MOV AL, 0FH
    MOV BH, 0
    MOV CX, XA
    MOV DX, YA
    colpixlbl: 
        INT 10H
        INC DX
        CMP DX, YB 
        JLE colpixlbl
ENDM

;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;macro pour la case arrivée;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;
PIXARRIVEE MACRO XA, YA, YB
local pixarriveelbl

    MOV AH, 0CH
    MOV AL, 68H
    MOV BH, 0
    MOV CX, XA
    MOV DX, YA
    pixarriveelbl: 
        INT 10H
        INC DX
        CMP DX, YB 
        JLE pixarriveelbl
ENDM


;---------------------------------------------CODE SEGMENT
CSEG        SEGMENT 'CODE'
ASSUME      CS:CSEG, SS:SSEG, DS:DSEG

;MAIN 
MAIN PROC FAR 
; sauver l'adresse de retour 
PUSH DS
PUSH 0 

; registre
MOV AX, DSEG 
MOV DS, AX 
MOV AH, 00H
MOV AL,  13H
INT 10H




BOUCLE:     ;;;;;;;;;;;;;;;;;
            ;NETTOYAGE ECRAN; 
            ;;;;;;;;;;;;;;;;;

            MOV AH, 6H
            MOV CH, 00H
            MOV CL, 00H
            MOV DH, 24
            MOV DL, 39
            MOV BH, 00H
            MOV AL, 0H 
            INT 10H


            ;;;;;;;;;;;;;;;;;
            ;AFFICHAGE TITRE;
            ;;;;;;;;;;;;;;;;;

            ; on place le curseur
            mov	ah, 02H
            mov	bh, 00   
            mov	dl, 14	; colonne
            mov	dh, 1	; ligne
            int	10H


            LEA DX, TITRE
            mov AH, 09H
            int 21H


            ;;;;;;;;;;;;;;;;;;;;;;
            ;AFFICHAGE PERSONNAGE;
            ;;;;;;;;;;;;;;;;;;;;;;

            ;AFFICHAGE 1 PIXEL 
            MOV AH, 0CH
            MOV AL, 28H
            MOV CX, COORDX
            MOV DX, COORDY
            MOV BH, 0
            INT 10H

            INC COORDY

            MOV AH, 0CH
            MOV AL, 28H
            MOV CX, COORDX
            MOV DX, COORDY
            MOV BH, 0
            INT 10H

            INC COORDY

            MOV AH, 0CH
            MOV AL, 28H
            MOV CX, COORDX
            MOV DX, COORDY
            MOV BH, 0
            INT 10H

            INC COORDY

            MOV AH, 0CH
            MOV AL, 28H
            MOV CX, COORDX
            MOV DX, COORDY
            MOV BH, 0
            INT 10H

            INC COORDY

            MOV AH, 0CH
            MOV AL, 28H
            MOV CX, COORDX
            MOV DX, COORDY
            MOV BH, 0
            INT 10H

            INC COORDY

            MOV AH, 0CH
            MOV AL, 28H
            MOV CX, COORDX
            MOV DX, COORDY
            MOV BH, 0
            INT 10H

            INC COORDY

            MOV AH, 0CH
            MOV AL, 28H
            MOV CX, COORDX
            MOV DX, COORDY
            MOV BH, 0
            INT 10H

            INC COORDY

            MOV AH, 0CH
            MOV AL, 28H
            MOV CX, COORDX
            MOV DX, COORDY
            MOV BH, 0
            INT 10H

            INC COORDY

            MOV AH, 0CH
            MOV AL, 28H
            MOV CX, COORDX
            MOV DX, COORDY
            MOV BH, 0
            INT 10H

            INC COORDY

            MOV AH, 0CH
            MOV AL, 28H
            MOV CX, COORDX
            MOV DX, COORDY
            MOV BH, 0
            INT 10H

            INC COORDY

            MOV AH, 0CH
            MOV AL, 28H
            MOV CX, COORDX
            MOV DX, COORDY
            MOV BH, 0
            INT 10H

            INC COORDY

            MOV AH, 0CH
            MOV AL, 28H
            MOV CX, COORDX
            MOV DX, COORDY
            MOV BH, 0
            INT 10H

            INC COORDY

            MOV AH, 0CH
            MOV AL, 28H
            MOV CX, COORDX
            MOV DX, COORDY
            MOV BH, 0
            INT 10H

            INC COORDY

            MOV AH, 0CH
            MOV AL, 28H
            MOV CX, COORDX
            MOV DX, COORDY
            MOV BH, 0
            INT 10H

            INC COORDY

            MOV AH, 0CH
            MOV AL, 28H
            MOV CX, COORDX
            MOV DX, COORDY
            MOV BH, 0
            INT 10H

            INC COORDX

            MOV AH, 0CH
            MOV AL, 28H
            MOV CX, COORDX
            MOV DX, COORDY
            MOV BH, 0
            INT 10H

            DEC COORDY

            MOV AH, 0CH
            MOV AL, 28H
            MOV CX, COORDX
            MOV DX, COORDY
            MOV BH, 0
            INT 10H

            DEC COORDY
            
            MOV AH, 0CH
            MOV AL, 28H
            MOV CX, COORDX
            MOV DX, COORDY
            MOV BH, 0
            INT 10H

            DEC COORDY
            
            MOV AH, 0CH
            MOV AL, 28H
            MOV CX, COORDX
            MOV DX, COORDY
            MOV BH, 0
            INT 10H

            DEC COORDY
            
            MOV AH, 0CH
            MOV AL, 28H
            MOV CX, COORDX
            MOV DX, COORDY
            MOV BH, 0
            INT 10H

            DEC COORDY
            
            MOV AH, 0CH
            MOV AL, 28H
            MOV CX, COORDX
            MOV DX, COORDY
            MOV BH, 0
            INT 10H

            DEC COORDY
            
            MOV AH, 0CH
            MOV AL, 28H
            MOV CX, COORDX
            MOV DX, COORDY
            MOV BH, 0
            INT 10H

            DEC COORDY
            
            MOV AH, 0CH
            MOV AL, 28H
            MOV CX, COORDX
            MOV DX, COORDY
            MOV BH, 0
            INT 10H

            DEC COORDY
            
            MOV AH, 0CH
            MOV AL, 28H
            MOV CX, COORDX
            MOV DX, COORDY
            MOV BH, 0
            INT 10H

            DEC COORDY
            
            MOV AH, 0CH
            MOV AL, 28H
            MOV CX, COORDX
            MOV DX, COORDY
            MOV BH, 0
            INT 10H

            DEC COORDY
            
            MOV AH, 0CH
            MOV AL, 28H
            MOV CX, COORDX
            MOV DX, COORDY
            MOV BH, 0
            INT 10H

            DEC COORDY
            
            MOV AH, 0CH
            MOV AL, 28H
            MOV CX, COORDX
            MOV DX, COORDY
            MOV BH, 0
            INT 10H

            DEC COORDY
            
            MOV AH, 0CH
            MOV AL, 28H
            MOV CX, COORDX
            MOV DX, COORDY
            MOV BH, 0
            INT 10H

            DEC COORDY
            
            MOV AH, 0CH
            MOV AL, 28H
            MOV CX, COORDX
            MOV DX, COORDY
            MOV BH, 0
            INT 10H

            DEC COORDY
            
            MOV AH, 0CH
            MOV AL, 28H
            MOV CX, COORDX
            MOV DX, COORDY
            MOV BH, 0
            INT 10H

            INC COORDX

            MOV AH, 0CH
            MOV AL, 28H
            MOV CX, COORDX
            MOV DX, COORDY
            MOV BH, 0
            INT 10H

            INC COORDY

            MOV AH, 0CH
            MOV AL, 28H
            MOV CX, COORDX
            MOV DX, COORDY
            MOV BH, 0
            INT 10H

            INC COORDY

            MOV AH, 0CH
            MOV AL, 28H
            MOV CX, COORDX
            MOV DX, COORDY
            MOV BH, 0
            INT 10H

            INC COORDY

            MOV AH, 0CH
            MOV AL, 28H
            MOV CX, COORDX
            MOV DX, COORDY
            MOV BH, 0
            INT 10H

            INC COORDY

            MOV AH, 0CH
            MOV AL, 28H
            MOV CX, COORDX
            MOV DX, COORDY
            MOV BH, 0
            INT 10H

            INC COORDY

            MOV AH, 0CH
            MOV AL, 28H
            MOV CX, COORDX
            MOV DX, COORDY
            MOV BH, 0
            INT 10H

            INC COORDY

            MOV AH, 0CH
            MOV AL, 28H
            MOV CX, COORDX
            MOV DX, COORDY
            MOV BH, 0
            INT 10H

            INC COORDY

            MOV AH, 0CH
            MOV AL, 28H
            MOV CX, COORDX
            MOV DX, COORDY
            MOV BH, 0
            INT 10H

            INC COORDY

            MOV AH, 0CH
            MOV AL, 28H
            MOV CX, COORDX
            MOV DX, COORDY
            MOV BH, 0
            INT 10H

            INC COORDY

            MOV AH, 0CH
            MOV AL, 28H
            MOV CX, COORDX
            MOV DX, COORDY
            MOV BH, 0
            INT 10H

            INC COORDY

            MOV AH, 0CH
            MOV AL, 28H
            MOV CX, COORDX
            MOV DX, COORDY
            MOV BH, 0
            INT 10H

            INC COORDY

            MOV AH, 0CH
            MOV AL, 28H
            MOV CX, COORDX
            MOV DX, COORDY
            MOV BH, 0
            INT 10H

            INC COORDY

            MOV AH, 0CH
            MOV AL, 28H
            MOV CX, COORDX
            MOV DX, COORDY
            MOV BH, 0
            INT 10H

            INC COORDY

            MOV AH, 0CH
            MOV AL, 28H
            MOV CX, COORDX
            MOV DX, COORDY
            MOV BH, 0
            INT 10H

            INC COORDY

            MOV AH, 0CH
            MOV AL, 28H
            MOV CX, COORDX
            MOV DX, COORDY
            MOV BH, 0
            INT 10H

            INC COORDX


            MOV AH, 0CH
            MOV AL, 28H
            MOV CX, COORDX
            MOV DX, COORDY
            MOV BH, 0
            INT 10H

            DEC COORDY

            MOV AH, 0CH
            MOV AL, 28H
            MOV CX, COORDX
            MOV DX, COORDY
            MOV BH, 0
            INT 10H

            DEC COORDY

            MOV AH, 0CH
            MOV AL, 28H
            MOV CX, COORDX
            MOV DX, COORDY
            MOV BH, 0
            INT 10H

            DEC COORDY

            MOV AH, 0CH
            MOV AL, 0FH
            MOV CX, COORDX
            MOV DX, COORDY
            MOV BH, 0
            INT 10H

            DEC COORDY

            MOV AH, 0CH
            MOV AL, 0FH
            MOV CX, COORDX
            MOV DX, COORDY
            MOV BH, 0
            INT 10H

            DEC COORDY

            MOV AH, 0CH
            MOV AL, 0FH
            MOV CX, COORDX
            MOV DX, COORDY
            MOV BH, 0
            INT 10H

            DEC COORDY

            MOV AH, 0CH
            MOV AL, 28H
            MOV CX, COORDX
            MOV DX, COORDY
            MOV BH, 0
            INT 10H

            DEC COORDY

            MOV AH, 0CH
            MOV AL, 28H
            MOV CX, COORDX
            MOV DX, COORDY
            MOV BH, 0
            INT 10H

            DEC COORDY

            MOV AH, 0CH
            MOV AL, 28H
            MOV CX, COORDX
            MOV DX, COORDY
            MOV BH, 0
            INT 10H

            DEC COORDY

            MOV AH, 0CH
            MOV AL, 0FH
            MOV CX, COORDX
            MOV DX, COORDY
            MOV BH, 0
            INT 10H

            DEC COORDY

            MOV AH, 0CH
            MOV AL, 0FH
            MOV CX, COORDX
            MOV DX, COORDY
            MOV BH, 0
            INT 10H

            DEC COORDY

            MOV AH, 0CH
            MOV AL, 0FH
            MOV CX, COORDX
            MOV DX, COORDY
            MOV BH, 0
            INT 10H

            DEC COORDY

            MOV AH, 0CH
            MOV AL, 28H
            MOV CX, COORDX
            MOV DX, COORDY
            MOV BH, 0
            INT 10H

            DEC COORDY

            MOV AH, 0CH
            MOV AL, 28H
            MOV CX, COORDX
            MOV DX, COORDY
            MOV BH, 0
            INT 10H

            DEC COORDY

            MOV AH, 0CH
            MOV AL, 28H
            MOV CX, COORDX
            MOV DX, COORDY
            MOV BH, 0
            INT 10H

            INC COORDX

            MOV AH, 0CH
            MOV AL, 28H
            MOV CX, COORDX
            MOV DX, COORDY
            MOV BH, 0
            INT 10H
            
            INC COORDY

            MOV AH, 0CH
            MOV AL, 28H
            MOV CX, COORDX
            MOV DX, COORDY
            MOV BH, 0
            INT 10H

            INC COORDY

            MOV AH, 0CH
            MOV AL, 28H
            MOV CX, COORDX
            MOV DX, COORDY
            MOV BH, 0
            INT 10H

            INC COORDY

            MOV AH, 0CH
            MOV AL, 0FH
            MOV CX, COORDX
            MOV DX, COORDY
            MOV BH, 0
            INT 10H

            INC COORDY

            MOV AH, 0CH
            MOV AL, 0FH
            MOV CX, COORDX
            MOV DX, COORDY
            MOV BH, 0
            INT 10H

            INC COORDY

            MOV AH, 0CH
            MOV AL, 0FH
            MOV CX, COORDX
            MOV DX, COORDY
            MOV BH, 0
            INT 10H

            INC COORDY

            MOV AH, 0CH
            MOV AL, 28H
            MOV CX, COORDX
            MOV DX, COORDY
            MOV BH, 0
            INT 10H

            INC COORDY

            MOV AH, 0CH
            MOV AL, 28H
            MOV CX, COORDX
            MOV DX, COORDY
            MOV BH, 0
            INT 10H

            INC COORDY

            MOV AH, 0CH
            MOV AL, 28H
            MOV CX, COORDX
            MOV DX, COORDY
            MOV BH, 0
            INT 10H

            INC COORDY

            MOV AH, 0CH
            MOV AL, 28H
            MOV CX, COORDX
            MOV DX, COORDY
            MOV BH, 0
            INT 10H

            INC COORDY

            MOV AH, 0CH
            MOV AL, 28H
            MOV CX, COORDX
            MOV DX, COORDY
            MOV BH, 0
            INT 10H

            INC COORDY

            MOV AH, 0CH
            MOV AL, 0FH
            MOV CX, COORDX
            MOV DX, COORDY
            MOV BH, 0
            INT 10H

            INC COORDY

            MOV AH, 0CH
            MOV AL, 28H
            MOV CX, COORDX
            MOV DX, COORDY
            MOV BH, 0
            INT 10H

            INC COORDY

            MOV AH, 0CH
            MOV AL, 28H
            MOV CX, COORDX
            MOV DX, COORDY
            MOV BH, 0
            INT 10H

            INC COORDY

            MOV AH, 0CH
            MOV AL, 28H
            MOV CX, COORDX
            MOV DX, COORDY
            MOV BH, 0
            INT 10H

            INC COORDX

            MOV AH, 0CH
            MOV AL, 28H
            MOV CX, COORDX
            MOV DX, COORDY
            MOV BH, 0
            INT 10H

            DEC COORDY

            MOV AH, 0CH
            MOV AL, 28H
            MOV CX, COORDX
            MOV DX, COORDY
            MOV BH, 0
            INT 10H

            DEC COORDY

            MOV AH, 0CH
            MOV AL, 28H
            MOV CX, COORDX
            MOV DX, COORDY
            MOV BH, 0
            INT 10H

            DEC COORDY

            MOV AH, 0CH
            MOV AL, 0FH
            MOV CX, COORDX
            MOV DX, COORDY
            MOV BH, 0
            INT 10H

            DEC COORDY

            MOV AH, 0CH
            MOV AL, 28H
            MOV CX, COORDX
            MOV DX, COORDY
            MOV BH, 0
            INT 10H

            DEC COORDY

            MOV AH, 0CH
            MOV AL, 28H
            MOV CX, COORDX
            MOV DX, COORDY
            MOV BH, 0
            INT 10H

            DEC COORDY

            MOV AH, 0CH
            MOV AL, 28H
            MOV CX, COORDX
            MOV DX, COORDY
            MOV BH, 0
            INT 10H

            DEC COORDY

            MOV AH, 0CH
            MOV AL, 28H
            MOV CX, COORDX
            MOV DX, COORDY
            MOV BH, 0
            INT 10H

            DEC COORDY

            MOV AH, 0CH
            MOV AL, 28H
            MOV CX, COORDX
            MOV DX, COORDY
            MOV BH, 0
            INT 10H

            DEC COORDY

            MOV AH, 0CH
            MOV AL, 0FH
            MOV CX, COORDX
            MOV DX, COORDY
            MOV BH, 0
            INT 10H

            DEC COORDY

            MOV AH, 0CH
            MOV AL, 0FH
            MOV CX, COORDX
            MOV DX, COORDY
            MOV BH, 0
            INT 10H

            DEC COORDY

            MOV AH, 0CH
            MOV AL, 0FH
            MOV CX, COORDX
            MOV DX, COORDY
            MOV BH, 0
            INT 10H

            DEC COORDY

            MOV AH, 0CH
            MOV AL, 28H
            MOV CX, COORDX
            MOV DX, COORDY
            MOV BH, 0
            INT 10H

            DEC COORDY

            MOV AH, 0CH
            MOV AL, 28H
            MOV CX, COORDX
            MOV DX, COORDY
            MOV BH, 0
            INT 10H

            DEC COORDY

            MOV AH, 0CH
            MOV AL, 28H
            MOV CX, COORDX
            MOV DX, COORDY
            MOV BH, 0
            INT 10H

            INC COORDX

            MOV AH, 0CH
            MOV AL, 28H
            MOV CX, COORDX
            MOV DX, COORDY
            MOV BH, 0
            INT 10H

            INC COORDY

            MOV AH, 0CH
            MOV AL, 28H
            MOV CX, COORDX
            MOV DX, COORDY
            MOV BH, 0
            INT 10H

            INC COORDY

            MOV AH, 0CH
            MOV AL, 28H
            MOV CX, COORDX
            MOV DX, COORDY
            MOV BH, 0
            INT 10H

            INC COORDY

            MOV AH, 0CH
            MOV AL, 28H
            MOV CX, COORDX
            MOV DX, COORDY
            MOV BH, 0
            INT 10H

            INC COORDY

            MOV AH, 0CH
            MOV AL, 28H
            MOV CX, COORDX
            MOV DX, COORDY
            MOV BH, 0
            INT 10H

            INC COORDY

            MOV AH, 0CH
            MOV AL, 28H
            MOV CX, COORDX
            MOV DX, COORDY
            MOV BH, 0
            INT 10H

            INC COORDY

            MOV AH, 0CH
            MOV AL, 28H
            MOV CX, COORDX
            MOV DX, COORDY
            MOV BH, 0
            INT 10H

            INC COORDY

            MOV AH, 0CH
            MOV AL, 28H
            MOV CX, COORDX
            MOV DX, COORDY
            MOV BH, 0
            INT 10H

            INC COORDY

            MOV AH, 0CH
            MOV AL, 28H
            MOV CX, COORDX
            MOV DX, COORDY
            MOV BH, 0
            INT 10H

            INC COORDY

            MOV AH, 0CH
            MOV AL, 28H
            MOV CX, COORDX
            MOV DX, COORDY
            MOV BH, 0
            INT 10H

            INC COORDY

            MOV AH, 0CH
            MOV AL, 28H
            MOV CX, COORDX
            MOV DX, COORDY
            MOV BH, 0
            INT 10H

            INC COORDY

            MOV AH, 0CH
            MOV AL, 0FH
            MOV CX, COORDX
            MOV DX, COORDY
            MOV BH, 0
            INT 10H

            INC COORDY

            MOV AH, 0CH
            MOV AL, 28H
            MOV CX, COORDX
            MOV DX, COORDY
            MOV BH, 0
            INT 10H

            INC COORDY

            MOV AH, 0CH
            MOV AL, 28H
            MOV CX, COORDX
            MOV DX, COORDY
            MOV BH, 0
            INT 10H

            INC COORDY

            MOV AH, 0CH
            MOV AL, 28H
            MOV CX, COORDX
            MOV DX, COORDY
            MOV BH, 0
            INT 10H

            INC COORDX

            MOV AH, 0CH
            MOV AL, 28H
            MOV CX, COORDX
            MOV DX, COORDY
            MOV BH, 0
            INT 10H

            DEC COORDY

            MOV AH, 0CH
            MOV AL, 28H
            MOV CX, COORDX
            MOV DX, COORDY
            MOV BH, 0
            INT 10H

            DEC COORDY

            MOV AH, 0CH
            MOV AL, 28H
            MOV CX, COORDX
            MOV DX, COORDY
            MOV BH, 0
            INT 10H

            DEC COORDY

            MOV AH, 0CH
            MOV AL, 0FH
            MOV CX, COORDX
            MOV DX, COORDY
            MOV BH, 0
            INT 10H

            DEC COORDY

            MOV AH, 0CH
            MOV AL, 28H
            MOV CX, COORDX
            MOV DX, COORDY
            MOV BH, 0
            INT 10H

            DEC COORDY

            MOV AH, 0CH
            MOV AL, 28H
            MOV CX, COORDX
            MOV DX, COORDY
            MOV BH, 0
            INT 10H

            DEC COORDY

            MOV AH, 0CH
            MOV AL, 28H
            MOV CX, COORDX
            MOV DX, COORDY
            MOV BH, 0
            INT 10H

            DEC COORDY

            MOV AH, 0CH
            MOV AL, 28H
            MOV CX, COORDX
            MOV DX, COORDY
            MOV BH, 0
            INT 10H

            DEC COORDY

            MOV AH, 0CH
            MOV AL, 28H
            MOV CX, COORDX
            MOV DX, COORDY
            MOV BH, 0
            INT 10H

            DEC COORDY

            MOV AH, 0CH
            MOV AL, 28H
            MOV CX, COORDX
            MOV DX, COORDY
            MOV BH, 0
            INT 10H

            DEC COORDY

            MOV AH, 0CH
            MOV AL, 28H
            MOV CX, COORDX
            MOV DX, COORDY
            MOV BH, 0
            INT 10H

            DEC COORDY

            MOV AH, 0CH
            MOV AL, 28H
            MOV CX, COORDX
            MOV DX, COORDY
            MOV BH, 0
            INT 10H

            DEC COORDY

            MOV AH, 0CH
            MOV AL, 28H
            MOV CX, COORDX
            MOV DX, COORDY
            MOV BH, 0
            INT 10H

            DEC COORDY

            MOV AH, 0CH
            MOV AL, 28H
            MOV CX, COORDX
            MOV DX, COORDY
            MOV BH, 0
            INT 10H

            DEC COORDY

            MOV AH, 0CH
            MOV AL, 28H
            MOV CX, COORDX
            MOV DX, COORDY
            MOV BH, 0
            INT 10H

            INC COORDX

            MOV AH, 0CH
            MOV AL, 28H
            MOV CX, COORDX
            MOV DX, COORDY
            MOV BH, 0
            INT 10H

            INC COORDY

            MOV AH, 0CH
            MOV AL, 28H
            MOV CX, COORDX
            MOV DX, COORDY
            MOV BH, 0
            INT 10H

            INC COORDY

            MOV AH, 0CH
            MOV AL, 28H
            MOV CX, COORDX
            MOV DX, COORDY
            MOV BH, 0
            INT 10H

            INC COORDY

            MOV AH, 0CH
            MOV AL, 28H
            MOV CX, COORDX
            MOV DX, COORDY
            MOV BH, 0
            INT 10H

            INC COORDY

            MOV AH, 0CH
            MOV AL, 28H
            MOV CX, COORDX
            MOV DX, COORDY
            MOV BH, 0
            INT 10H

            INC COORDY

            MOV AH, 0CH
            MOV AL, 28H
            MOV CX, COORDX
            MOV DX, COORDY
            MOV BH, 0
            INT 10H

            INC COORDY

            MOV AH, 0CH
            MOV AL, 28H
            MOV CX, COORDX
            MOV DX, COORDY
            MOV BH, 0
            INT 10H

            INC COORDY

            MOV AH, 0CH
            MOV AL, 28H
            MOV CX, COORDX
            MOV DX, COORDY
            MOV BH, 0
            INT 10H

            INC COORDY

            MOV AH, 0CH
            MOV AL, 28H
            MOV CX, COORDX
            MOV DX, COORDY
            MOV BH, 0
            INT 10H

            INC COORDY

            MOV AH, 0CH
            MOV AL, 28H
            MOV CX, COORDX
            MOV DX, COORDY
            MOV BH, 0
            INT 10H

            INC COORDY

            MOV AH, 0CH
            MOV AL, 28H
            MOV CX, COORDX
            MOV DX, COORDY
            MOV BH, 0
            INT 10H

            INC COORDY

            MOV AH, 0CH
            MOV AL, 0FH
            MOV CX, COORDX
            MOV DX, COORDY
            MOV BH, 0
            INT 10H

            INC COORDY

            MOV AH, 0CH
            MOV AL, 28H
            MOV CX, COORDX
            MOV DX, COORDY
            MOV BH, 0
            INT 10H

            INC COORDY

            MOV AH, 0CH
            MOV AL, 28H
            MOV CX, COORDX
            MOV DX, COORDY
            MOV BH, 0
            INT 10H

            INC COORDY

            MOV AH, 0CH
            MOV AL, 28H
            MOV CX, COORDX
            MOV DX, COORDY
            MOV BH, 0
            INT 10H

            INC COORDX

            MOV AH, 0CH
            MOV AL, 28H
            MOV CX, COORDX
            MOV DX, COORDY
            MOV BH, 0
            INT 10H

            DEC COORDY

            MOV AH, 0CH
            MOV AL, 28H
            MOV CX, COORDX
            MOV DX, COORDY
            MOV BH, 0
            INT 10H

            DEC COORDY

            MOV AH, 0CH
            MOV AL, 28H
            MOV CX, COORDX
            MOV DX, COORDY
            MOV BH, 0
            INT 10H

            DEC COORDY

            MOV AH, 0CH
            MOV AL, 0FH
            MOV CX, COORDX
            MOV DX, COORDY
            MOV BH, 0
            INT 10H

            DEC COORDY

            MOV AH, 0CH
            MOV AL, 28H
            MOV CX, COORDX
            MOV DX, COORDY
            MOV BH, 0
            INT 10H

            DEC COORDY

            MOV AH, 0CH
            MOV AL, 28H
            MOV CX, COORDX
            MOV DX, COORDY
            MOV BH, 0
            INT 10H

            DEC COORDY

            MOV AH, 0CH
            MOV AL, 28H
            MOV CX, COORDX
            MOV DX, COORDY
            MOV BH, 0
            INT 10H

            DEC COORDY

            MOV AH, 0CH
            MOV AL, 28H
            MOV CX, COORDX
            MOV DX, COORDY
            MOV BH, 0
            INT 10H

            DEC COORDY

            MOV AH, 0CH
            MOV AL, 28H
            MOV CX, COORDX
            MOV DX, COORDY
            MOV BH, 0
            INT 10H

            DEC COORDY

            MOV AH, 0CH
            MOV AL, 0FH
            MOV CX, COORDX
            MOV DX, COORDY
            MOV BH, 0
            INT 10H

            DEC COORDY

            MOV AH, 0CH
            MOV AL, 0FH
            MOV CX, COORDX
            MOV DX, COORDY
            MOV BH, 0
            INT 10H

            DEC COORDY

            MOV AH, 0CH
            MOV AL, 0FH
            MOV CX, COORDX
            MOV DX, COORDY
            MOV BH, 0
            INT 10H

            DEC COORDY

            MOV AH, 0CH
            MOV AL, 28H
            MOV CX, COORDX
            MOV DX, COORDY
            MOV BH, 0
            INT 10H

            DEC COORDY

            MOV AH, 0CH
            MOV AL, 28H
            MOV CX, COORDX
            MOV DX, COORDY
            MOV BH, 0
            INT 10H

            DEC COORDY

            MOV AH, 0CH
            MOV AL, 28H
            MOV CX, COORDX
            MOV DX, COORDY
            MOV BH, 0
            INT 10H

            INC COORDX

            MOV AH, 0CH
            MOV AL, 28H
            MOV CX, COORDX
            MOV DX, COORDY
            MOV BH, 0
            INT 10H

            INC COORDY

            MOV AH, 0CH
            MOV AL, 28H
            MOV CX, COORDX
            MOV DX, COORDY
            MOV BH, 0
            INT 10H

            INC COORDY

            MOV AH, 0CH
            MOV AL, 28H
            MOV CX, COORDX
            MOV DX, COORDY
            MOV BH, 0
            INT 10H

            INC COORDY

            MOV AH, 0CH
            MOV AL, 0FH
            MOV CX, COORDX
            MOV DX, COORDY
            MOV BH, 0
            INT 10H

            INC COORDY

            MOV AH, 0CH
            MOV AL, 0FH
            MOV CX, COORDX
            MOV DX, COORDY
            MOV BH, 0
            INT 10H

            INC COORDY

            MOV AH, 0CH
            MOV AL, 0FH
            MOV CX, COORDX
            MOV DX, COORDY
            MOV BH, 0
            INT 10H

            INC COORDY

            MOV AH, 0CH
            MOV AL, 28H
            MOV CX, COORDX
            MOV DX, COORDY
            MOV BH, 0
            INT 10H

            INC COORDY

            MOV AH, 0CH
            MOV AL, 28H
            MOV CX, COORDX
            MOV DX, COORDY
            MOV BH, 0
            INT 10H

            INC COORDY

            MOV AH, 0CH
            MOV AL, 28H
            MOV CX, COORDX
            MOV DX, COORDY
            MOV BH, 0
            INT 10H

            INC COORDY

            MOV AH, 0CH
            MOV AL, 28H
            MOV CX, COORDX
            MOV DX, COORDY
            MOV BH, 0
            INT 10H

            INC COORDY

            MOV AH, 0CH
            MOV AL, 28H
            MOV CX, COORDX
            MOV DX, COORDY
            MOV BH, 0
            INT 10H

            INC COORDY

            MOV AH, 0CH
            MOV AL, 0FH
            MOV CX, COORDX
            MOV DX, COORDY
            MOV BH, 0
            INT 10H

            INC COORDY

            MOV AH, 0CH
            MOV AL, 28H
            MOV CX, COORDX
            MOV DX, COORDY
            MOV BH, 0
            INT 10H

            INC COORDY

            MOV AH, 0CH
            MOV AL, 28H
            MOV CX, COORDX
            MOV DX, COORDY
            MOV BH, 0
            INT 10H

            INC COORDY

            MOV AH, 0CH
            MOV AL, 28H
            MOV CX, COORDX
            MOV DX, COORDY
            MOV BH, 0
            INT 10H

            INC COORDX

            MOV AH, 0CH
            MOV AL, 28H
            MOV CX, COORDX
            MOV DX, COORDY
            MOV BH, 0
            INT 10H

            DEC COORDY

            MOV AH, 0CH
            MOV AL, 28H
            MOV CX, COORDX
            MOV DX, COORDY
            MOV BH, 0
            INT 10H

            DEC COORDY

            MOV AH, 0CH
            MOV AL, 28H
            MOV CX, COORDX
            MOV DX, COORDY
            MOV BH, 0
            INT 10H

            DEC COORDY

            MOV AH, 0CH
            MOV AL, 0FH
            MOV CX, COORDX
            MOV DX, COORDY
            MOV BH, 0
            INT 10H

            DEC COORDY

            MOV AH, 0CH
            MOV AL, 0FH
            MOV CX, COORDX
            MOV DX, COORDY
            MOV BH, 0
            INT 10H

            DEC COORDY

            MOV AH, 0CH
            MOV AL, 0FH
            MOV CX, COORDX
            MOV DX, COORDY
            MOV BH, 0
            INT 10H

            DEC COORDY

            MOV AH, 0CH
            MOV AL, 28H
            MOV CX, COORDX
            MOV DX, COORDY
            MOV BH, 0
            INT 10H

            DEC COORDY

            MOV AH, 0CH
            MOV AL, 28H
            MOV CX, COORDX
            MOV DX, COORDY
            MOV BH, 0
            INT 10H

            DEC COORDY

            MOV AH, 0CH
            MOV AL, 28H
            MOV CX, COORDX
            MOV DX, COORDY
            MOV BH, 0
            INT 10H

            DEC COORDY

            MOV AH, 0CH
            MOV AL, 0FH
            MOV CX, COORDX
            MOV DX, COORDY
            MOV BH, 0
            INT 10H

            DEC COORDY

            MOV AH, 0CH
            MOV AL, 0FH
            MOV CX, COORDX
            MOV DX, COORDY
            MOV BH, 0
            INT 10H

            DEC COORDY

            MOV AH, 0CH
            MOV AL, 0FH 
            MOV CX, COORDX
            MOV DX, COORDY
            MOV BH, 0
            INT 10H

            DEC COORDY

            MOV AH, 0CH
            MOV AL, 28H
            MOV CX, COORDX
            MOV DX, COORDY
            MOV BH, 0
            INT 10H

            DEC COORDY

            MOV AH, 0CH
            MOV AL, 28H
            MOV CX, COORDX
            MOV DX, COORDY
            MOV BH, 0
            INT 10H

            DEC COORDY

            MOV AH, 0CH
            MOV AL, 28H
            MOV CX, COORDX
            MOV DX, COORDY
            MOV BH, 0
            INT 10H

            INC COORDX

            MOV AH, 0CH
            MOV AL, 28H
            MOV CX, COORDX
            MOV DX, COORDY
            MOV BH, 0
            INT 10H

            INC COORDY

            MOV AH, 0CH
            MOV AL, 28H
            MOV CX, COORDX
            MOV DX, COORDY
            MOV BH, 0
            INT 10H

            INC COORDY

            MOV AH, 0CH
            MOV AL, 28H
            MOV CX, COORDX
            MOV DX, COORDY
            MOV BH, 0
            INT 10H

            INC COORDY

            MOV AH, 0CH
            MOV AL, 28H
            MOV CX, COORDX
            MOV DX, COORDY
            MOV BH, 0
            INT 10H

            INC COORDY

            MOV AH, 0CH
            MOV AL, 28H
            MOV CX, COORDX
            MOV DX, COORDY
            MOV BH, 0
            INT 10H

            INC COORDY

            MOV AH, 0CH
            MOV AL, 28H
            MOV CX, COORDX
            MOV DX, COORDY
            MOV BH, 0
            INT 10H

            INC COORDY

            MOV AH, 0CH
            MOV AL, 28H
            MOV CX, COORDX
            MOV DX, COORDY
            MOV BH, 0
            INT 10H

            INC COORDY

            MOV AH, 0CH
            MOV AL, 28H
            MOV CX, COORDX
            MOV DX, COORDY
            MOV BH, 0
            INT 10H

            INC COORDY

            MOV AH, 0CH
            MOV AL, 28H
            MOV CX, COORDX
            MOV DX, COORDY
            MOV BH, 0
            INT 10H

            INC COORDY

            MOV AH, 0CH
            MOV AL, 28H
            MOV CX, COORDX
            MOV DX, COORDY
            MOV BH, 0
            INT 10H

            INC COORDY

            MOV AH, 0CH
            MOV AL, 28H
            MOV CX, COORDX
            MOV DX, COORDY
            MOV BH, 0
            INT 10H

            INC COORDY

            MOV AH, 0CH
            MOV AL, 28H
            MOV CX, COORDX
            MOV DX, COORDY
            MOV BH, 0
            INT 10H

            INC COORDY

            MOV AH, 0CH
            MOV AL, 28H
            MOV CX, COORDX
            MOV DX, COORDY
            MOV BH, 0
            INT 10H

            INC COORDY

            MOV AH, 0CH
            MOV AL, 28H
            MOV CX, COORDX
            MOV DX, COORDY
            MOV BH, 0
            INT 10H

            INC COORDY

            MOV AH, 0CH
            MOV AL, 28H
            MOV CX, COORDX
            MOV DX, COORDY
            MOV BH, 0
            INT 10H

            INC COORDX

            MOV AH, 0CH
            MOV AL, 28H
            MOV CX, COORDX
            MOV DX, COORDY
            MOV BH, 0
            INT 10H

            DEC COORDY

            MOV AH, 0CH
            MOV AL, 28H
            MOV CX, COORDX
            MOV DX, COORDY
            MOV BH, 0
            INT 10H

            DEC COORDY

            MOV AH, 0CH
            MOV AL, 28H
            MOV CX, COORDX
            MOV DX, COORDY
            MOV BH, 0
            INT 10H

            DEC COORDY

            MOV AH, 0CH
            MOV AL, 28H
            MOV CX, COORDX
            MOV DX, COORDY
            MOV BH, 0
            INT 10H

            DEC COORDY

            MOV AH, 0CH
            MOV AL, 28H
            MOV CX, COORDX
            MOV DX, COORDY
            MOV BH, 0
            INT 10H

            DEC COORDY

            MOV AH, 0CH
            MOV AL, 28H
            MOV CX, COORDX
            MOV DX, COORDY
            MOV BH, 0
            INT 10H

            DEC COORDY

            MOV AH, 0CH
            MOV AL, 28H
            MOV CX, COORDX
            MOV DX, COORDY
            MOV BH, 0
            INT 10H

            DEC COORDY

            MOV AH, 0CH
            MOV AL, 28H
            MOV CX, COORDX
            MOV DX, COORDY
            MOV BH, 0
            INT 10H

            DEC COORDY

            MOV AH, 0CH
            MOV AL, 28H
            MOV CX, COORDX
            MOV DX, COORDY
            MOV BH, 0
            INT 10H

            DEC COORDY

            MOV AH, 0CH
            MOV AL, 28H
            MOV CX, COORDX
            MOV DX, COORDY
            MOV BH, 0
            INT 10H

            DEC COORDY

            MOV AH, 0CH
            MOV AL, 28H
            MOV CX, COORDX
            MOV DX, COORDY
            MOV BH, 0
            INT 10H

            DEC COORDY

            MOV AH, 0CH
            MOV AL, 28H
            MOV CX, COORDX
            MOV DX, COORDY
            MOV BH, 0
            INT 10H

            DEC COORDY

            MOV AH, 0CH
            MOV AL, 28H
            MOV CX, COORDX
            MOV DX, COORDY
            MOV BH, 0
            INT 10H

            DEC COORDY

            MOV AH, 0CH
            MOV AL, 28H
            MOV CX, COORDX
            MOV DX, COORDY
            MOV BH, 0
            INT 10H

            DEC COORDY

            MOV AH, 0CH
            MOV AL, 28H
            MOV CX, COORDX
            MOV DX, COORDY
            MOV BH, 0
            INT 10H

            INC COORDX

            MOV AH, 0CH
            MOV AL, 28H
            MOV CX, COORDX
            MOV DX, COORDY
            MOV BH, 0
            INT 10H

            INC COORDY

            MOV AH, 0CH
            MOV AL, 28H
            MOV CX, COORDX
            MOV DX, COORDY
            MOV BH, 0
            INT 10H

            INC COORDY

            MOV AH, 0CH
            MOV AL, 28H
            MOV CX, COORDX
            MOV DX, COORDY
            MOV BH, 0
            INT 10H

            INC COORDY

            MOV AH, 0CH
            MOV AL, 28H
            MOV CX, COORDX
            MOV DX, COORDY
            MOV BH, 0
            INT 10H

            INC COORDY

            MOV AH, 0CH
            MOV AL, 28H
            MOV CX, COORDX
            MOV DX, COORDY
            MOV BH, 0
            INT 10H

            INC COORDY

            MOV AH, 0CH
            MOV AL, 28H
            MOV CX, COORDX
            MOV DX, COORDY
            MOV BH, 0
            INT 10H

            INC COORDY

            MOV AH, 0CH
            MOV AL, 28H
            MOV CX, COORDX
            MOV DX, COORDY
            MOV BH, 0
            INT 10H

            INC COORDY

            MOV AH, 0CH
            MOV AL, 28H
            MOV CX, COORDX
            MOV DX, COORDY
            MOV BH, 0
            INT 10H

            INC COORDY

            MOV AH, 0CH
            MOV AL, 28H
            MOV CX, COORDX
            MOV DX, COORDY
            MOV BH, 0
            INT 10H

            INC COORDY

            MOV AH, 0CH
            MOV AL, 28H
            MOV CX, COORDX
            MOV DX, COORDY
            MOV BH, 0
            INT 10H

            INC COORDY

            MOV AH, 0CH
            MOV AL, 28H
            MOV CX, COORDX
            MOV DX, COORDY
            MOV BH, 0
            INT 10H

            INC COORDY

            MOV AH, 0CH
            MOV AL, 28H
            MOV CX, COORDX
            MOV DX, COORDY
            MOV BH, 0
            INT 10H

            INC COORDY

            MOV AH, 0CH
            MOV AL, 28H
            MOV CX, COORDX
            MOV DX, COORDY
            MOV BH, 0
            INT 10H

            INC COORDY

            MOV AH, 0CH
            MOV AL, 28H
            MOV CX, COORDX
            MOV DX, COORDY
            MOV BH, 0
            INT 10H

            INC COORDY

            MOV AH, 0CH
            MOV AL, 28H
            MOV CX, COORDX
            MOV DX, COORDY
            MOV BH, 0
            INT 10H

            SUB COORDX,14 ;on initialise coordx au coin superieur gauche
            SUB COORDY,14 ;on initialise coordy au coin superieur gauche


            ;;;;;;;;;;;;;;;;
            ;AFFICHAGE MURS;
            ;;;;;;;;;;;;;;;;

            LIGPIX 0,24,319
            LIGPIX 15,40,79
            COLPIX 15,40,104
            COLPIX 95,24,88
            COLPIX 79, 40, 72
            LIGPIX 31,72, 79
            COLPIX 31,56,72
            LIGPIX 31,56,63
            LIGPIX 31,88,95
            LIGPIX 15,104,31
            COLPIX 31,88,104
            LIGPIX 0,120,111
            COLPIX 47, 104,120
            LIGPIX 47,104,111
            COLPIX 111, 40,104
            LIGPIX 111,40,143
            COLPIX 127,56,120
            COLPIX 159,40,88
            LIGPIX 127,88 ,191
            COLPIX 143,40,72
            COLPIX 303,40,120
            LIGPIX 271,120,303
            LIGPIX 271,136,319
            COLPIX 271, 120,136
            COLPIX 319,24,184
            COLPIX 175,24,72 
            COLPIX 191, 40,88
            LIGPIX 191,40,287
            COLPIX 287,40,104
            LIGPIX 255,104,287
            COLPIX 255, 104, 152
            LIGPIX 175,152,303
            COLPIX 303,152,184
            LIGPIX 303,184,319
            LIGPIX 239,184,303
            COLPIX 223,168,200
            LIGPIX 223,168,287
            COLPIX 111,120,136
            LIGPIX 111,136,143
            COLPIX 143, 104,168
            LIGPIX 143,104,207
            COLPIX 207,56,104
            LIGPIX 207,56,255
            COLPIX 255, 56,72
            COLPIX 271,56,88
            LIGPIX 239,88,271
            COLPIX 239, 72,88
            LIGPIX 223,72,239
            COLPIX 223,72,120
            LIGPIX 159,120,223
            COLPIX 239,104,136
            LIGPIX 159,136,239
            COLPIX 159, 136,184
            LIGPIX 95,184,207
            COLPIX 95, 136,184
            LIGPIX 111,168,143
            LIGPIX 95,152,127
            COLPIX 207,152,184
            COLPIX 175,152,168
            LIGPIX 175,168,191
            LIGPIX 15,136,95
            COLPIX 47,136,184
            LIGPIX 47,184,79
            COLPIX 79,152,184
            COLPIX 63, 136,168
            LIGPIX 0,152,31
            COLPIX 31,152,184
            COLPIX 15,168,184
            LIGPIX 15,184,31

            ;;;;;;;;;;;;;;;;;;;;;;;;;;
            ;affichage case d'arrivee;
            ;;;;;;;;;;;;;;;;;;;;;;;;;;

            PIXARRIVEE 304,185,200
            PIXARRIVEE 305,185,200
            PIXARRIVEE 306,185,200
            PIXARRIVEE 307,185,200
            PIXARRIVEE 308,185,200
            PIXARRIVEE 309,185,200
            PIXARRIVEE 310,185,200
            PIXARRIVEE 311,185,200
            PIXARRIVEE 312,185,200
            PIXARRIVEE 313,185,200
            PIXARRIVEE 314,185,200
            PIXARRIVEE 315,185,200
            PIXARRIVEE 316,185,200
            PIXARRIVEE 317,185,200
            PIXARRIVEE 318,185,200
            PIXARRIVEE 319,185,200

            
            ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
            ;test de la touche pour se déplacer;
            ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


            MOV AH, 0
            INT 16H
            CMP AH, 4DH
            JE appui_sur_fleche_droite

            CMP AH, 4BH
            JE appui_sur_fleche_gauche

            CMP AH, 48H
            JE appui_sur_fleche_haut

            CMP AH, 50H
            JE appui_sur_fleche_bas

            JMP BOUCLE

            

;;;;;;;;;;;;;;;;;;;;;
;gestion déplacement;
;;;;;;;;;;;;;;;;;;;;;

appui_sur_fleche_droite: CMP COORDX, 304 ;taille de la fenêtre-la taille du personnage
                         JGE BOUCLE
                         MOV AH, 0DH ;lecture couleur pixel pour empecher le pion d'aller dans le mur
                         MOV CX, COORDX
                         ADD CX, 15
                         MOV DX, COORDY
                         INT 10H ;lecture couleur pixel
                         CMP AL, 0FH
                         JE BOUCLE
                         INC DX
                         INT 10H ;lecture couleur pixel
                         CMP AL, 0FH
                         JE BOUCLE
                         INC DX
                         INT 10H ;lecture couleur pixel
                         CMP AL, 0FH
                         JE BOUCLE
                         INC DX
                         INT 10H ;lecture couleur pixel
                         CMP AL, 0FH
                         JE BOUCLE
                         INC DX
                         INT 10H ;lecture couleur pixel
                         CMP AL, 0FH
                         JE BOUCLE
                         INC DX
                         INT 10H ;lecture couleur pixel
                         CMP AL, 0FH
                         JE BOUCLE
                         INC DX
                         INT 10H ;lecture couleur pixel
                         CMP AL, 0FH
                         JE BOUCLE
                         INC DX
                         INT 10H ;lecture couleur pixel
                         CMP AL, 0FH
                         JE BOUCLE
                         INC DX
                         INT 10H ;lecture couleur pixel
                         CMP AL, 0FH
                         JE BOUCLE
                         INC DX
                         INT 10H ;lecture couleur pixel
                         CMP AL, 0FH
                         JE BOUCLE
                         INC DX
                         INT 10H ;lecture couleur pixel
                         CMP AL, 0FH
                         JE BOUCLE
                         INC DX
                         INT 10H ;lecture couleur pixel
                         CMP AL, 0FH
                         JE BOUCLE
                         INC DX
                         INT 10H ;lecture couleur pixel
                         CMP AL, 0FH
                         JE BOUCLE
                         INC DX
                         INT 10H ;lecture couleur pixel
                         CMP AL, 0FH
                         JE BOUCLE
                         INC DX
                         INT 10H ;lecture couleur pixel
                         CMP AL, 0FH
                         JE BOUCLE
                         ADD COORDX, 2
                         INC NBMOVE
                         CMP AL, 68H ;si vrai, la partie est terminée
                         JE message_fin
                         JMP BOUCLE
                         

appui_sur_fleche_gauche: CMP COORDX, 0
                         JLE BOUCLE
                         MOV AH, 0DH ;lecture couleur pixel
                         MOV CX, COORDX
                         SUB CX, 1
                         MOV DX, COORDY
                         INT 10H ;lecture couleur pixel
                         CMP AL, 0FH
                         JE BOUCLE 
                         INC DX
                         INT 10H ;lecture couleur pixel
                         CMP AL, 0FH
                         JE BOUCLE
                         INC DX
                         INT 10H ;lecture couleur pixel
                         CMP AL, 0FH
                         JE BOUCLE
                         INC DX
                         INT 10H ;lecture couleur pixel
                         CMP AL, 0FH
                         JE BOUCLE
                         INC DX
                         INT 10H ;lecture couleur pixel
                         CMP AL, 0FH
                         JE BOUCLE
                         INC DX
                         INT 10H ;lecture couleur pixel
                         CMP AL, 0FH
                         JE BOUCLE
                         INC DX
                         INT 10H ;lecture couleur pixel
                         CMP AL, 0FH
                         JE BOUCLE
                         INC DX
                         INT 10H ;lecture couleur pixel
                         CMP AL, 0FH
                         JE BOUCLE
                         INC DX
                         INT 10H ;lecture couleur pixel
                         CMP AL, 0FH
                         JE BOUCLE
                         INC DX
                         INT 10H ;lecture couleur pixel
                         CMP AL, 0FH
                         JE BOUCLE
                         INC DX
                         INT 10H ;lecture couleur pixel
                         CMP AL, 0FH
                         JE BOUCLE
                         INC DX
                         INT 10H ;lecture couleur pixel
                         CMP AL, 0FH
                         JE BOUCLE
                         INC DX
                         INT 10H ;lecture couleur pixel
                         CMP AL, 0FH
                         JE BOUCLE
                         INC DX
                         INT 10H ;lecture couleur pixel
                         CMP AL, 0FH
                         JE BOUCLE
                         INC DX
                         INT 10H ;lecture couleur pixel
                         CMP AL, 0FH
                         JE BOUCLE
                         SUB COORDX, 2
                         INC NBMOVE
                         JMP BOUCLE

appui_sur_fleche_haut: CMP COORDY, 0
                       JLE BOUCLE
                       MOV AH, 0DH ;lecture couleur pixel
                       MOV CX, COORDX
                       MOV DX, COORDY
                       SUB DX,1
                       INT 10H ;lecture couleur pixel
                       CMP AL, 0FH
                       JE BOUCLE
                       INC CX
                       INT 10H ;lecture couleur pixel
                       CMP AL, 0FH
                       JE BOUCLE
                       INC CX
                       INT 10H ;lecture couleur pixel
                       CMP AL, 0FH
                       JE BOUCLE
                       INC CX
                       INT 10H ;lecture couleur pixel
                       CMP AL, 0FH
                       JE BOUCLE
                       INC CX
                       INT 10H ;lecture couleur pixel
                       CMP AL, 0FH
                       JE BOUCLE
                       INC CX
                       INT 10H ;lecture couleur pixel
                       CMP AL, 0FH
                       JE BOUCLE
                       INC CX
                       INT 10H ;lecture couleur pixel
                       CMP AL, 0FH
                       JE BOUCLE
                       INC CX
                       INT 10H ;lecture couleur pixel
                       CMP AL, 0FH
                       JE BOUCLE
                       INC CX
                       INT 10H ;lecture couleur pixel
                       CMP AL, 0FH  
                       JE BOUCLE
                       INC CX
                       INT 10H ;lecture couleur pixel  
                       CMP AL, 0FH
                       JE BOUCLE
                       INC CX
                       INT 10H ;lecture couleur pixel
                       CMP AL, 0FH
                       JE BOUCLE
                       INC CX
                       INT 10H ;lecture couleur pixel
                       CMP AL, 0FH
                       JE BOUCLE
                       INC CX
                       INT 10H ;lecture couleur pixel
                       CMP AL, 0FH
                       JE BOUCLE
                       INC CX
                       INT 10H ;lecture couleur pixel
                       CMP AL, 0FH
                       JE BOUCLE
                       INC CX
                       INT 10H ;lecture couleur pixel
                       CMP AL, 0FH
                       JE BOUCLE
                       SUB COORDY, 2
                       INC NBMOVE
                       JMP BOUCLE

appui_sur_fleche_bas: CMP COORDY, 185 ;taille de la fenêtre-la taille du personnage
                      JGE BOUCLE
                      MOV AH, 0DH ;lecture couleur pixel 
                      MOV CX, COORDX
                      MOV DX, COORDY
                      ADD DX,15
                      INT 10H ;lecture couleur pixel
                      CMP AL, 0FH
                      JE BOUCLE
                      INC CX
                      INT 10H ;lecture couleur pixel
                      CMP AL, 0FH
                      JE BOUCLE
                      INC CX
                      INT 10H ;lecture couleur pixel
                      CMP AL, 0FH
                      JE BOUCLE
                      INC CX
                      INT 10H ;lecture couleur pixel
                      CMP AL, 0FH
                      JE BOUCLE
                      INC CX
                      INT 10H ;lecture couleur pixel
                      CMP AL, 0FH
                      JE BOUCLE
                      INC CX
                      INT 10H ;lecture couleur pixel
                      CMP AL, 0FH
                      JE BOUCLE
                      INC CX
                      INT 10H ;lecture couleur pixel
                      CMP AL, 0FH
                      JE BOUCLE
                      INC CX
                      INT 10H ;lecture couleur pixel
                      CMP AL, 0FH
                      JE BOUCLE
                      INC CX
                      INT 10H ;lecture couleur pixel
                      CMP AL, 0FH  
                      JE BOUCLE
                      INC CX
                      INT 10H ;lecture couleur pixel  
                      CMP AL, 0FH
                      JE BOUCLE
                      INC CX
                      INT 10H ;lecture couleur pixel
                      CMP AL, 0FH
                      JE BOUCLE
                      INC CX
                      INT 10H ;lecture couleur pixel
                      CMP AL, 0FH
                      JE BOUCLE
                      INC CX
                      INT 10H ;lecture couleur pixel
                      CMP AL, 0FH
                      JE BOUCLE
                      INC CX
                      INT 10H ;lecture couleur pixel
                      CMP AL, 0FH
                      JE BOUCLE
                      INC CX
                      INT 10H ;lecture couleur pixel
                      CMP AL, 0FH
                      JE BOUCLE
                      ADD COORDY, 2
                      INC NBMOVE
                      JMP BOUCLE


message_fin: ;;;;;;;;;;;;;;;;;
             ;NETTOYAGE ECRAN; 
             ;;;;;;;;;;;;;;;;;

             MOV AH, 6H
             MOV CH, 10
             MOV CL, 10
             MOV DH, 15 ;colonne
             MOV DL, 31 ; ligne
             MOV BH, 00H
             MOV AL, 0H 
             INT 10H

            ;;;;;;;;;;;;;;;;;;;
            ;AFFICHAGE MESSAGE;
            ;;;;;;;;;;;;;;;;;;;

            ; on place le curseur
             mov	ah, 02H
            mov	bh, 00   
            mov	dl, 12	; colonne
            mov	dh, 12	; ligne
            int	10H

            LEA DX, FIN
            MOV AH, 09H
            INT 21H

            ;;;;;;;;;;;;;;;;;;
            ;AFFICHAGE NBMOVE;
            ;;;;;;;;;;;;;;;;;;

            ; on place le curseur
             mov	ah, 02H
            mov	bh, 00   
            mov	dl, 14	; colonne
            mov	dh, 13	; ligne
            int	10H
            
            MOV AX, NBMOVE
            
            ;;;;;;;;;;;;;;;;;;;;;
            ;conversion en ascii;
            ;;;;;;;;;;;;;;;;;;;;;

            ;initialisation
            MOV CX,0 
            MOV DX,0 
            LABEL1: 
                ; comparaison si AX=0
                CMP AX,0 
                JE PRINT1      
                
                ;initialisation bx
                MOV BX,10         
                
                ; divise  
                DIV BX                  
                
                PUSH DX         
                
                ;on incrémente CX 
                INC CX             
                
                ;on remet dx à 0
                XOR DX, DX
                JMP LABEL1
            PRINT1: 
                ;on vérifie que le compte est supérieur à 0
                CMP CX,0
                JE EXIT
                
                POP DX
                
                ;on ajoute 48 à dx pour avoir la valeur ascii
                ADD DX, 48
                
                ;on affiche 
                mov ah,02h 
                int 21h 
                
                ;on décrémente cx
                DEC CX
                JMP PRINT1
        EXIT:

            ;;;;;;;;;;;;;;;;;;;;;;;;;;
            ;AFFICHAGE FIN DU MESSAGE;
            ;;;;;;;;;;;;;;;;;;;;;;;;;;


            LEA DX, MOVE
            mov AH, 09H
            int 21H

            ; on place le curseur pour le message "Press any key to continue."
            mov	ah, 02H
            mov	bh, 00   
            mov	dl, 0	; colonne
            mov	dh, 22	; ligne
            int	10H



; retour
RET
; fin de la procédure main 
MAIN ENDP
;fin du code du segment 
CSEG ENDS
;fin du programme
END MAIN 
;--------------------fin de programme
