# Emobot French Emotional Audio Dataset Labeling V2

## Objectif

**Attribuer à chaque échantillon de voix l'émotion correspondante**, à la fois catégoriquement et sur l'échelle Valence-Arousal.


### Qu'est-ce que l'échelle Valence-Arousal ?

**Arousal** (l'intensité) est le niveau d'« activation » de l'émotion et va **de calme/faible (noté -3) à excité/fort (noté +3)**.

**Valence** est le degré de positivité de l'émotion et va **de négatif (noté -3) à positif (noté +3)**.
<br>

Il existe également *deux labels facultatifs* relatifs à la qualité, au cas où l'enregistrement ne serait pas propre (*not clean*) ou bruyant (*noisy*).

## 1 - Télécharger le dossier sur votre ordinateur

### Téléchargement

Pour ce faire, cliquez sur le bouton vert "<> Code" en haut de cette page, puis sur "Download ZIP" en bas de la popup.

![Github download](https://eapi.pcloud.com/getpubthumb?code=XZuPseZGnbNfeQ0JrHDnvxXwXm5BusrF53k&linkpassword=undefined&size=414x428&crop=0&type=auto)

Choisissez un emplacement de téléchargement sur votre ordinateur dans lequel enregistrer ce fichier .zip.

### Extraction

Rendez-vous à l'emplacement de téléchargement, puis **décompressez le dossier .zip** :

- sur **MacOS** : double-cliquez sur le dossier compressé depuis le Finder, le dossier décompressé apparaît à côté
- sur **Windows** : clic-droit > Extraire tout... > Extraire, le dossier décompressé apparaît à côté

**Double-cliquez sur le dossier décompressé** pour l'ouvrir.

Le contenu du dossier est organisé de la sorte :
```
├── DATA
│ (empty for now)
├── MacOS
│ ├── LAUNCH.command
│ ├── SETUP.command
├── Windows
│ ├── LAUNCH.bat
│ ├── SETUP.bat
├── README.md
```

## ⚠️ Si vous êtes sur MacOS :

Avant de poursuivre, vous devez effectuer une petite étape supplémentaire :

- Depuis le Finder, sélectionnez le dossier `MacOS`

- Utilisez le `Clic secondaire` (ou clic-droit) pour faire apparaître ce menu :
<img src="https://eapi.pcloud.com/getpubthumb?code=XZjUDeZutbuweuPnmzNLafhCXsLA7USINmV&linkpassword=undefined&size=588x870&crop=0&type=auto" alt="Right click menu" width="300" height="auto">

- En bas, cliquez sur `Nouveau terminal au dossier`
<img src="https://eapi.pcloud.com/getpubthumb?code=XZIGDeZDErJew4IswSRSsquOtwGHVNVWywV&linkpassword=undefined&size=984x744&crop=0&type=auto" alt="MacOS terminal" width="500" height="auto">

- Dans la fenêtre qui souvre, copiez (Cmd ⌘ + C) / **collez (Cmd ⌘ + V**) la commande suivante :
`sudo chmod u+x LAUNCH.command SETUP.command`

- Appuyez sur **Entrée ⏎**
<img src="https://eapi.pcloud.com/getpubthumb?code=XZXvDeZtwBRE9hReXbDucGYqARB67KPfayk&linkpassword=undefined&size=984x742&crop=0&type=auto" alt="MacOS terminal" width="500" height="auto">

- Entrez le mot de passe de votre session et appuyez à nouveau sur **Entrée ⏎**

- Vous pouvez fermer la fenêtre

#### Vous êtes prêt à labelliser !


## 2 - Labelliser les données la 1ère fois

### Ouverture du dossier

Selon votre système d'exploitation (MacOS ou Windows), ouvrez le dossier correspondant.
Ce dernier devrait contenir un fichier `SETUP` et un fichier `LAUNCH`.

### Installation et lancement de Label Studio

Lorsque vous commencez à labelliser un jeu de données pour la 1ère fois, **lancez le fichier** `SETUP` en faisant : **Clic-droit** (clic secondaire sur Mac) > **Ouvrir**.

**⚠️ Sur MacOS :**
Une popup s'ouvre :

<img src="https://eapi.pcloud.com/getpubthumb?code=XZ8iDeZ2Kti7nCEf14o0HJsySeNGbpPDEYk&linkpassword=undefined&size=610x698&crop=0&type=auto" alt="MacOS open" width="300" height="auto">

Cliquez sur **Ouvrir** pour lancer le SETUP.

Ensuite, **le SETUP s'exécute automatiquement** dans un fenêtre de terminal.
Ce script installe tout ce qu'il faut pour vous permettre de labelliser simplement, et ouvre ensuite l'interface de labellisation.

### Création de votre compte

Lorsque vous utilisez Label Studio pour la 1ère fois, vous devrez **créer un compte** que vous réutiliserez par la suite.

1. Dans l'onglet **SIGN UP**, entrez un email et un mot de passe.
L'email peut être faux, du moment qu'il est valide (example@gmail.com).

2. Cliquez sur **CREATE ACCOUNT** pour créer votre compte et ouvrir l'interface de labellisation.

### Création d'un projet

1. Cliquez sur le bouton bleu **Create Project** au centre, ou sur le bouton bleu **Create** en haut à droite.
2. Entrez un nom pour ce projet de labellisation dans **Project Name**.
3. Cliquez sur **Save** en haut à droite pour créer le projet.

### Préparation de l'interface

1. En haut à droite, cliquez sur **Settings**.
2. Dans le menu à gauche, choisissez **Labeling Interface**.
3. Assurez-vous d'être dans la vue **Code** (et non *Visual*).
4. Effacez le contenu du champ de texte et remplacez-le par ceci :
```xml
<View>
  <Audio name="audio" value="$audio"/>
	
  <Choices name="sentiment" toName="audio" choice="single" showInLine="true">
    <Choice value="Anger" style="zoom: 1.5;" hotkey="1"/>
    <Choice value="Happiness" style="zoom: 1.5;" hotkey="2"/>
    <Choice value="Sadness" style="zoom: 1.5;" hotkey="3"/>
    <Choice value="Neutral" style="zoom: 1.5;" hotkey="4"/>
    <Choice value="Fear" style="zoom: 1.5;" hotkey="5"/>
  </Choices>

  <Text name="Valence" value="Valence"/>
  <Choices name="valence" toName="audio" choice="single" showInLine="true">
    <Choice value="-3" style="zoom: 1.5;" hotkey="a"/>
    <Choice value="-2" style="zoom: 1.5;" hotkey="z"/>
    <Choice value="-1" style="zoom: 1.5;" hotkey="e"/>
    <Choice value="0" style="zoom: 1.5;" hotkey="r"/>
    <Choice value="1" style="zoom: 1.5;" hotkey="t"/>
    <Choice value="2" style="zoom: 1.5;" hotkey="y"/>
    <Choice value="3" style="zoom: 1.5;" hotkey="u"/>
  </Choices>
  
  <Text name="Arousal" value="Arousal"/>
  <Choices name="arousal" toName="audio" choice="single" showInLine="true">
    <Choice value="-3" style="zoom: 1.5;" hotkey="q"/>
    <Choice value="-2" style="zoom: 1.5;" hotkey="s"/>
    <Choice value="-1" style="zoom: 1.5;" hotkey="d"/>
    <Choice value="0" style="zoom: 1.5;" hotkey="f"/>
    <Choice value="1" style="zoom: 1.5;" hotkey="g"/>
    <Choice value="2" style="zoom: 1.5;" hotkey="h"/>
    <Choice value="3" style="zoom: 1.5;" hotkey="j"/>
  </Choices>

  <Text name="Quality" value="Quality"/>
  <Choices name="quality" toName="audio" choice="multiple" showInLine="true">
    <Choice value="not clean" style="zoom: 1.5;" hotkey="w"/>
    <Choice value="contains noise" style="zoom: 1.5;" hotkey="x"/>
  </Choices>
  
</View>
```
#### Your interface preview should look like this :
![Labeling interface](https://eapi.pcloud.com/getpubthumb?code=XZuwv1Zwp0BQygfVmX2VSAJGFVjrjfpJxd7&linkpassword=undefined&size=604x292&crop=0&type=auto)

5. Cliquez sur **Save** en bas à droite de la zone de texte.
6. Vous pouvez maintenant retourner sur la page du projet en **cliquant sur le nom du projet** dans la barre du haut (`Projects / Nom du projet`).


### Téléchargement des données

1. **Téléchargez** le dataset depuis ce lien : https://drive.google.com/file/d/1gSzGCW57s7D7T55d6mOBbpEny_mt7t1t

2. **Extrayez** le dossier sur votre ordinateur, dans le dossier `DATA`.
Le résultat devrait resssembler à cela :
```
├── DATA
│ ├── french_audio_dataset_emobot_2
│ │ ├── audio_1.wav
│ │ ├── audio_2.wav
│ │ ├── audio_3.wav
│ │ ├── ...
```

3. Dans Label Studio, sur la page d'accueil du projet, dans le coin supérieur droit, cliquez sur **Settings**.

4. Dans le menu de gauche, sélectionnez **Cloud Storage**.

5. Cliquez sur **Add Source Storage**.

6.  Dans la boîte de dialogue qui s'affiche, sélectionnez **Local Files** comme type de stockage.

7.  Dans le champ **Absolute local path**, collez le *chemin absolu* du dossier contenant tous les échantillons audio (ex: `C:\...\DATA\french_audio_dataset_emobot_2`).

8.  Activez l'option **Treat every bucket object as a source file**.

9.  Cliquez sur **Add Storage**. Cela devrait fermer la boîte de dialogue.

10.  Dans l'encadré gris qui s'affiche, cliquez sur le bouton **Sync Storage** pour lancer l'importation de l'ensemble de données dans Label Studio.

11.  **Attendez** que le processus de synchronisation soit terminé. Cela devrait prendre **~2min**. Une fois la synchronisation terminée, le **Status** doit indiquer `Completed` et le bouton **Sync Storage** doit revenir à son état normal.

12. Retournez à la **page d'accueil du projet** en cliquant sur le nom du projet dans la barre supérieure (`Projects / Nom du projet`).

#### La configuration est terminée !

### Commencer à labelliser

Sur la page du projet, cliquez sur le bouton bleu **Label All Tasks** vers le haut, et commencez à labelliser les échantillons de voix.

### Raccourcis pour gagner du temps

Vous pouvez bien sûr utiliser votre souris pour cocher les cases et cliquer sur **Submit**.
Mais vous avez également la possibilité d'**utiliser votre clavier** pour gagner du temps comme ceci :
- les **touches 1 à 5, a à u, q à j et w et x** de votre clavier vous permettent de cocher/décocher les cases comme indiqué entre crochets

-  **Cmd ⌘ + Entrée ⏎** sur Mac ou **Ctrl + Entrée ⏎** sur Windows vous permet de valider et passer au suivant, comme en cliquant sur le bouton **Submit**


### Enregistrement de votre progression

Votre progression est enregistrée **automatiquement** dans votre ordinateur, vous pouvez donc quitter à tout moment (pour faire une pause par exemple) et continuer plus tard, la labellisation reprendra là où vous vous étiez arrêté.

#### Les instructions permettant de quitter Label Studio sont détaillées partie 5.

## 3 - Labelliser les données les fois suivantes

### Ouverture du dossier

Selon votre système d'exploitation (MacOS ou Windows), ouvrez le dossier correspondant.
Ce dernier devrait contenir un fichier `SETUP` et un fichier `LAUNCH`.

### Lancement de Label Studio

**Lancez le fichier** `LAUNCH` en faisant : **Clic-droit** (clic secondaire sur Mac) > **Ouvrir**.

**⚠️ Sur MacOS :**
Une popup s'ouvre :

<img src="https://eapi.pcloud.com/getpubthumb?code=XZ8iDeZ2Kti7nCEf14o0HJsySeNGbpPDEYk&linkpassword=undefined&size=610x698&crop=0&type=auto" alt="MacOS open" width="300" height="auto">

Cliquez sur **Ouvrir** pour lancer LAUNCH.

Ce dernier va charger Label Studio et ouvrir l'interface de labellisation.

### Connexion à votre compte

Si la page de connexion s'affiche, **connectez-vous à votre compte** précédemment créé.

1. Dans l'onglet **LOG IN**, entrez votre email et mot de passe précédemment configurés.
2. Cliquez sur **LOG IN** pour vous connecter à votre compte et ouvrir l'interface de labellisation.

Si vous avez oublié vos identifiants, créez un nouveau compte avec un autre email dans l'onglet **SIGN UP** comme à l'étape 2. Vous aurez toujours accès aux données précedemment labellisées.

### Ouverture du projet

Double-cliquez sur le **nom du projet** dans la page qui s'affiche pour accéder à votre projet de labellisation en cours.

### Commencer à labelliser

Sur la page du projet, cliquez sur le bouton bleu **Label All Tasks** vers le haut, et commencez à labelliser les échantillons de voix.

### Raccourcis pour gagner du temps

Vous pouvez bien sûr utiliser votre souris pour cocher les cases et cliquer sur **Submit**.
Mais vous avez également la possibilité d'**utiliser votre clavier** pour gagner du temps comme ceci :
- les **touches 1 à 5, a à u, q à j et w et x** de votre clavier vous permettent de cocher/décocher les cases comme indiqué entre crochets

-  **Cmd ⌘ + Entrée ⏎** sur Mac ou **Ctrl + Entrée ⏎** sur Windows vous permet de valider et passer au suivant, comme en cliquant sur le bouton **Submit**


### Enregistrement de votre progression

Votre progression est enregistrée **automatiquement** dans votre ordinateur, vous pouvez donc quitter à tout moment (pour faire une pause par exemple) et continuer plus tard, la labellisation reprendra là où vous vous étiez arrêté.

#### Les instructions permettant de quitter Label Studio sont détaillées partie 5.

## 4 - Exporter vos labels

- Une fois que vous avez fini de labelliser toutes les phrases, revenez à la page d'accueil du projet et cliquez sur le bouton **Export** en haut à droite.

- Sélectionnez le format `CSV` et cliquez sur le bouton **Export** en bas à droite.

- **Enregistrez le fichier .csv** à l'emplacement souhaité sur votre ordinateur et envoyez-le par courrier électronique.


## 5 - Quitter Label Studio

Pour quitter Label Studio, **commencez par fermer l'onglet de navigateur** dans lequel Label Studio s'est ouvert. Ensuite :

- sur **MacOS** : 
	- localisez dans votre Dock l'icône de Terminal <img src="https://eapi.pcloud.com/getpubthumb?code=XZNz1eZlwyafjzm34Qquc26R6izl82B7xS7&linkpassword=undefined&size=112x116&crop=0&type=auto" alt="MacOS open" width="36" height="auto">
	- fermez la fenêtre de Terminal en cliquant sur le rond rouge en haut à gauche puis sur **Terminer**
	<img src="https://eapi.pcloud.com/getpubthumb?code=XZYL1eZ0HauGPQXLObzJLBqm9d4DSooLvjk&linkpassword=undefined&size=984x746&crop=0&type=auto" alt="MacOS open" width="360" height="auto">

- sur **Windows** : 
	- localisez dans votre barre des tâches l'icône de Terminal <img src="https://eapi.pcloud.com/getpubthumb?code=XZgL1eZwDiVkwijKfzXWkQLwj1xpRn7YA2V&linkpassword=undefined&size=50x40&crop=0&type=auto" alt="MacOS open" width="36" height="auto">
	- fermez la fenêtre de Terminal en cliquant sur la croix rouge en haut à droite
	<img src="https://eapi.pcloud.com/getpubthumb?code=XZxL1eZL2FcxwGNmVYR4LJEWIb5t7iQRXlk&linkpassword=undefined&size=999x518&crop=0&type=auto" alt="MacOS open" width="520" height="auto">