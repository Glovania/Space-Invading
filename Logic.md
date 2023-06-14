# Logic

## Movement system
### Player Movement
```mermaid
flowchart TD
%% Comment
    Start([playerMovement])
    End([End])

    xPosition_1{position.x > 30}
    xPosition_2{position.x < 1250}

    yPosition_1{position.y < 1690}
    yPosition_2{position.y > 600}

    movePlayer_1{move_and_collide}
    movePlayer_2{move_and_collide}
    movePlayer_3{move_and_collide}
    movePlayer_4{move_and_collide}

    GetLeftUI{ui_left}
    GetRightUI{ui_right}
    GetUpUI{ui_up}
    GetDownUI{ui_down}



    Start ==> GetLeftUI


    GetLeftUI -->|Yes| xPosition_1
    xPosition_1 -->|Yes| movePlayer_1


        movePlayer_1 ==> GetRightUI
        GetLeftUI ==> |No| GetRightUI
        xPosition_1 ==> |No| GetRightUI


        GetRightUI --> |Yes| xPosition_2
        xPosition_2 --> |Yes| movePlayer_2



            movePlayer_2 ==> GetDownUI
            GetRightUI ==> |No| GetDownUI
            xPosition_2 ==> |No| GetDownUI


            GetDownUI --> |Yes| yPosition_1
            yPosition_1 --> |Yes| movePlayer_3



                movePlayer_3 ==> GetUpUI
                GetDownUI ==>|No| GetUpUI
                yPosition_1 ==> |No| GetUpUI


                GetUpUI --> |Yes| yPosition_2
                yPosition_2 --> |Yes| movePlayer_4



                    movePlayer_4 ==> End
                    GetUpUI ==>|No| End
                    yPosition_2 ==> |No| End
 ```

### Enemy Movement
```mermaid
flowchart TD
%% Comment
    Start([enemyMovement])
    End([End])
    xGlobalPosition{global_position.x}
    EnemyMovementActivate(move and collide the enemy)


    Start ==> xGlobalPosition 

    xGlobalPosition --> |True| EnemyMovementActivate
    xGlobalPosition --> |False| End
```

## Bullets system

### Automatic Firing
```mermaid
flowchart TD
%% Comment
    Start([autoFiring])
    End([End])

    GetGlobalVariable{Get GlobalVariables}
    KeyPressedAction{is_action_pressed}
    CollidedBullets(Bullets collided)


    Start ==> GetGlobalVariable
    CollidedBullets ==> End

    GetGlobalVariable --> |Yes| KeyPressedAction
    GetGlobalVariable --> |No| End

    KeyPressedAction --> |Yes| CollidedBullets
    KeyPressedAction --> |No| End
```
### Enemy Bullets
```mermaid
flowchart TD
%% Comment
    Start([enemyBullet])
    End([End])

    GetGlobalVariable{Get GlobalVariables}
    EnemyBulletsActivate{move_and_collide}
    CollidedBullets(Bullets collided)


    Start ==> GetGlobalVariable

    GetGlobalVariable --> |Yes| EnemyBulletsActivate
    GetGlobalVariable --> |No| End

    EnemyBulletsActivate --> |Yes| CollidedBullets
    EnemyBulletsActivate --> |No| End
```
### Player Bullets
```mermaid
flowchart TD
%% Comment
    Start([playerBullets])
    End([End])

    GetGlobalVariable{Get GlobalVariables}
    PlayerBulletsActivate{move_and_collide}
    CollidedBullets(Bullets collided)


    Start ==> GetGlobalVariable

    GetGlobalVariable --> |Yes| PlayerBulletsActivate
    GetGlobalVariable --> |No| End

    PlayerBulletsActivate --> |Yes| CollidedBullets
    PlayerBulletsActivate --> |No| End
```

## Health system

### Player's Heath
```mermaid
flowchart TD
%% Comment
    Start([reduceHeath])
    End([End])

    GetVariable(Get Player's health variable)
    DecreaseHealthValue{health -= 1}
    ZeroHealthValue{if health = 0}
    KillThePlayer{Kill the Player}

    Start ==> GetVariable ==> DecreaseHealthValue
    KillThePlayer ==> End

    DecreaseHealthValue --> |True| ZeroHealthValue
    DecreaseHealthValue --> |False| End

    ZeroHealthValue --> |True| KillThePlayer
    ZeroHealthValue --> |False| End
```
### Enemy's Health
```mermaid
flowchart TD
%% Comment
    Start([reduceHeath])
    End([End])

    GetVariable(Get Enemy's health variable)
    DecreaseHealthValue{health -= 1}
    ZeroHealthValue{if health = 0}
    KillTheEnemy{Kill the Enemy}

    Start ==> GetVariable ==> DecreaseHealthValue
    KillTheEnemy ==> End

    DecreaseHealthValue --> |True| ZeroHealthValue
    DecreaseHealthValue --> |False| End

    ZeroHealthValue --> |True| KillTheEnemy
    ZeroHealthValue --> |False| End
```