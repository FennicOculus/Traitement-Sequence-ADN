;Projet TP Archi avec affichage sans tiret
;AOUABED Samy Aghiles ISIL B Groupe 1 181831084214
;ABED Nada Fatima-Zohra ISIL  B Groupe 1  181831052788

data segment

DNA db "GCAACCGCCAACGCGTATGA-GCGCGATGCGCGCGGATGC-TTACGCGTAAAATGCGCATT-CTTCCGCACATCCCGCTACT-GCACGATGGTACCGGTCGCC-CCTGCCATGGTGTTGATCCGC-CCGCTACTGCCGTCATCGCC-AAATAGGCGCCACAGAAAC-GCAGAGGGGAAGGGGAGACG-CGCTCCTTCGGCTTCCTCGC-GTCCGGACCGTGCTGACCC-AAAATAGGCGCCACAGAAAC$"
Bool db 0

ends

stack segment

ends

code segment  
        assume cs:code,ds:data,ss:stack 
        
inverse proc near
 
 bcl:
            cmp si,di  
            jae bcl2
            mov cl,[di]
            cmp [si],cl
            jne finpro        ;quitter la procedure avec bool=0 si on trouve au moins un carectre diff
            inc si
            dec di
            jmp bcl
bcl2:       
     mov bool,1        ;bool recoit 1 si la sequence est inverse
finpro:  ret
inverse endp        
          
          
          
affichage proc near
    
    
bcl3:
            mov al,[si]
            mov bl,0ah
            mov cx,1
            mov ah,09h
            int 10h              ;affichage carectere par carectere et en couleur avec l interruption 10h et sa fonction 09h
            inc si
            mov ah,0eh
            int 10h
            cmp [si],'-'
            jne bcl3
            ret
affichage endp

          
start:
    
    mov ax,data
    mov ds,ax
    mov ax,stack
    mov ss,ax
    
    
    lea si,DNA 
    mov di,si
    dec si

    Boucle1:
        mov Bool,0
        inc di
        cmp [di],'-'
        jne Boucle1   

    inc si
    mov ax,si  
    mov bx,di
    dec di
 
    call inverse
    mov si,ax
    mov di,bx               ;afficher la sequence si elle est inversee par la prcedure affichage
    cmp bool,1
    jne aff
    mov bh,0
    call affichage  
    cmp [si],'-'
    je boucle1  

    aff:        cmp [si],'$'   ;condition d arret
                je fin  
                mov dl,[si]    ;affichage de la sequence non inverse
                mov ah,2h
                int 21h 
                inc si
                    cmp [si],'-'
                je boucle1
                jmp aff           
            
    fin:
                mov ah,4ch
                int 21h     
                ret 