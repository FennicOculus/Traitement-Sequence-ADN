# Séquence d'ADN - Détection de Séquences Inversées

Ce dépôt contient deux programmes écrits en langage assembleur x86 pour l'architecture 8086. Ces programmes traitent de la manipulation de séquences d'ADN et de la détection de séquences inversées.

## ProjetTPArchiAvecTirets.asm

Ce programme, `ProjetTPArchiAvecTirets.asm`, comporte deux procédures principales : `inverse` et `affichage`. Voici un résumé de leur fonctionnalité :

- **Procédure `inverse`**: Cette procédure vérifie si une séquence d'ADN entre deux indices est inversée (lue de droite à gauche) et met à jour une variable booléenne en conséquence.

- **Procédure `affichage`**: Cette procédure est responsable de l'affichage de la séquence d'ADN à l'écran, caractère par caractère, en utilisant l'interruption 10h du BIOS.

- **Procédure `start`**: La procédure principale initialise les segments de données et de pile, puis appelle les procédures `inverse` et `affichage` pour traiter la séquence d'ADN.

## ProjetTPArchiSansTiret.asm

Ce programme, `ProjetTPArchiSansTiret.asm`, est similaire au précédent mais n'utilise pas de tirets dans la séquence d'ADN. Il comporte également les mêmes procédures `inverse` et `affichage`, mais le traitement de la séquence d'ADN est effectué sur une version sans tiret.

## Collaboration

Ce travail a été réalisé en collaboration avec [Nada](https://github.com/Abed-Nada)

## Utilisation

Pour exécuter ces programmes, vous aurez besoin d'un émulateur d'assembleur x86 tel que DOSBox ou un environnement de développement compatible. Vous pouvez assembler et exécuter les fichiers dans un environnement approprié pour observer leur fonctionnement.

