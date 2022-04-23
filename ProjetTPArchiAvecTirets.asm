;Projet TP Archi 
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
            cmp si,di ;compare les indice de si et di
            jae bcl2
            mov cl,[di]
            cmp [si],cl       ;compare le contenu de si et di
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
    
    
    lea si,DNA     ;charge si avec l'adresse de debut de DNA
    mov di,si      ;copie l'adresse si dans di
    dec si         ;decrement si pour pouvoir l'incrementer dans bouble1 sans perdre la 1er valeur

    Boucle1:
        mov Bool,0
        inc di
        cmp [di],'-'
        jne Boucle1   

    inc si
    mov ax,si   ;sauvegarde de si et di 
    mov bx,di
    dec di
    call inverse
    mov si,ax
    mov di,bx               
    cmp bool,1
    jne aff        ;si la sequence est non inverse on jump vers aff pouir l'afficher
    mov bh,0
    call affichage  ;afficher la sequence si elle est inversee par la prcedure affichage
    cmp [si],'-'
    je affi ;jump pour affichier le caractere "-" 

    aff:        cmp [si],'$'   ;condition d arret
                je fin  
                mov dl,[si]    ;affichage de la sequence non inverse
                mov ah,2h
                int 21h 
                inc si
                    cmp [si],'-'
                je affi
                jmp aff
                
    affi:
            mov dl,[si]
            mov ah,2h           ;affichage du '-'
            int 21h
            jmp boucle1                           
            
    fin:
                mov ah,4ch
                int 21h     
                ret 

ret     
    


ends

end start
