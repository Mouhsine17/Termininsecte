# Termininsecte
## Présentation

Termininsecte est un jeu d’action en 2D développé avec Godot dans le cadre du cours Programmation jeux et multimédias (420-0SW).

Le thème du projet est les insectes. Inspiré du principe de Jetpack Joyride, le jeu met en scène un insecte ailé équipé d’une arme qui traverse un environnement rempli de plantes carnivores et d’obstacles.

Auteur : Mouhsine Abiola Achamou
Plateforme cible : Linux et borne arcade du cours.

## Concept du jeu

L’insecte reste près du côté gauche de l’écran pendant que le décor défile de droite à gauche.

Le joueur contrôle sa hauteur en battant des ailes. Des plantes carnivores foncent vers lui : il peut les éliminer avec son arme ou les esquiver. Il doit également éviter des obstacles indestructibles.

Le parcours est généré progressivement pour renouveler les dangers et le décor. La difficulté augmente avec la distance parcourue.

## Objectif

- Atteindre une distance cible en conservant au moins un point de vie.
- Gagner des points grâce à la distance parcourue et aux plantes éliminées.
- Éviter les plantes et les obstacles pour survivre.

La victoire sera déclenchée à une distance cible, provisoirement fixée à 1 500 mètres.
La défaite sera déclenchée lorsque l’insecte perd tous ses points de vie.

Un mode sans fin pourra être ajouté si le temps le permet.

## Commandes prévues

| Touche | Action |
| --- | --- |
| Espace maintenu | Faire monter l’insecte |
| Espace relâché | Laisser descendre l’insecte |
| X | Tirer |
| P | Mettre en pause ou reprendre |
| Ctrl + M | Activer ou désactiver le son |
| F12 | Afficher ou masquer les données de débogage |
| F9 | Tester la scène de victoire |
| F10 | Tester la scène de défaite |

Les commandes seront adaptées aux boutons de la borne arcade.

## Algorithmes prévus

### 1. Génération procédurale du parcours

Un algorithme programmé dans le projet générera les segments du parcours.

Il choisira les positions des obstacles et des ennemis selon la difficulté. Il conservera un passage suffisamment large pour l’insecte et limitera les changements de hauteur du passage entre les segments.

L’objectif est de varier les parties tout en conservant un parcours praticable.

### 2. Poursuite avec anticipation

Les plantes carnivores utiliseront la position et la vitesse de l’insecte pour estimer une position future à attaquer.

Une animation annoncera leur attaque. Au début de la charge, la cible sera verrouillée pour permettre au joueur de l’esquiver.

Ces deux algorithmes seront développés dans les scripts du projet. Leur portée sera validée avec le professeur.

## Fonctionnalités prévues

- Menu principal : jouer, instructions, configuration, classement et quitter.
- Réglage indépendant du volume de la musique et des effets sonores.
- Musique d’ambiance et effets sonores.
- Animation des ailes, des plantes, des tirs et des impacts.
- Affichage du score, de la distance et des points de vie.
- Mise en pause.
- Scènes de victoire et de défaite.
- Choix de rejouer, de revenir au menu ou de quitter.
- Sauvegarde locale des meilleures performances.
- Affichage de débogage avec F12 : FPS, mémoire actuelle, minimale et maximale, collisions et vecteurs.
- Export Linux et tests sur la borne arcade.

## Structure prévue du dépôt

- README.md : présentation et documentation.
- src/ : projet Godot.
- src/scenes/ : scènes du jeu et des menus.
- src/scripts/ : scripts et algorithmes.
- src/assets/ : images, animations et sons.
- src/credits.md : sources et licences des ressources utilisées.

## Suivi du projet

Les tâches seront suivies dans un GitHub Project avec les colonnes :

1. Backlog : tâches prévues pour plus tard.
2. To do : tâches à réaliser prochainement.
3. In progress : tâches commencées.
4. Done : tâches terminées et vérifiées.

Chaque tâche sera créée sous forme d’issue liée au dépôt.

## État actuel

Le projet est à l’étape de conception et de planification pour le suivi 1.
Les fonctionnalités présentées dans ce document sont prévues et restent à développer.
## Tableau de suivi
[Consulter le Kanban](https://github.com/users/Mouhsine17/projects/1)
