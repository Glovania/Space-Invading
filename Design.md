# Project Overview

- This game is a Upgraded version of "Space Invaders". The game's theme is The Outsiders vs The Belongings.


- The Outsiders are alliens that invading our planet. The Belongings are human that trying their best to protect their planet. 


# New Gameplay

- In this new gameplay for "Space Invader, we will have a total of 2 levels. In Level 1, there will be an enemy called "Space" for you to defeat. Similar in level 2, however, there will be a new enemy called "Arrow". The only way to win this game is to defeat all the enemies on both level within the limited time.

## New Level

- We will have 2 levels in this game.
## Multiple Enemy Types
        
- On level 2, we will have a new type of enemy called "Arrow" enemies.

    ![Arrow Enemies](https://www.pngkit.com/png/detail/28-284284_starfoxx-spaceship-pixel-art-spaceship-png.png)

## Player's Health

- Player will have at least 3 health.

    ![Health](https://i.pinimg.com/originals/1b/5a/22/1b5a22085086f5fbb7025bfd0d03c19f.png)

 
# Behaviour - User Journey

```mermaid
journey
title User Journey
    section Start Game
        Click Option button to choose "burst" mode: 5: User
        CLick Start button: 5: User

    section Change Scene inbetween 2 levels
        Click 'Level 2' button to move on: 7: User
        CLick 'Return to menu' button: 4: User

    section Winner Scene
        Click 'Return to menu' button: 7: User

    section Loser Scene
        Click 'Return to menu' button: 4: User
```


# Planning Diagram - Project Plan

```mermaid
gantt
    title Glovania's Space Invaders Plan
    dateFormat DD-MM-YYYY
    axisFormat %d-%B
    tickInterval 1week

    section Holidays
    School's Holidays: 09-04-2023, 23-04-2023
    ANZAC Day: 25-04-2023, 1d
    Reconciliation Day: 29-05-2023, 1d

    section Design
    Project Overview: 05-04-2023, 1d
    Project Plan: 05-04-2023, 1d

    section Implementation
    BetterMainMenu: 25-04-2023, 1d
    BetterOption: 01-05-2023, 1d
    Multiple Enemies: 17-05-2023, 24-05-2023
    PlayerHeath: 01-05-2023, 03-05-2023
    Levels: 10-05-2023, 12-05-2023
    PauseMenu: 26-05-2023, 1d


    Testing: 31-05-2023
    Final Submission: 07-06-2023, 1d
```
