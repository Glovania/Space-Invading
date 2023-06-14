# Logic

## Movement system
### Player Movement
```mermaid
flowchart TD
%% Comment
    Start([playerMovement])
    End(End)

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


        movePlayer_1 --> GetRightUI
        GetLeftUI --> |No| GetRightUI
        xPosition_1 --> |No| GetRightUI


        GetRightUI --> |Yes| xPosition_2
        xPosition_2 --> |Yes| movePlayer_2



            movePlayer_2 --> GetDownUI
            GetRightUI --> |No| GetDownUI
            xPosition_2 --> |No| GetDownUI


            GetDownUI --> |Yes| yPosition_1
            yPosition_1 --> |Yes| movePlayer_3



                movePlayer_3 --> GetUpUI
                GetDownUI-->|No| GetUpUI
                yPosition_1 --> |No| GetUpUI


                GetUpUI --> |Yes| yPosition_2
                yPosition_2 --> |Yes| movePlayer_4



                    movePlayer_4 --> End
                    GetUpUI -->|No| End
                    yPosition_2 --> |No| End
 ```

### Enemy Movement
```mermaid
flowchart TD
%% Comment
    Start([enemyMovement])
    End(End)
    xGlobalPosition[global_position.x]


    Start ==> xGlobalPosition --> End
```

## Bullets system

### Enemy Bullets
```mermaid
flowchart TD
%% Comment
    Start([KineticBody2D])
    PhysicEnemyBulletProcess(func _physics_process)
    Executed(Executed)

    GetEnemyBulletSpeedValue(Get Bullet Speed's Value)
    GetDeltaValue(Get Delta Values)
    ActivateEnemyBulletMovement(move_and_collide)


    Start ==> PhysicEnemyBulletProcess
    PhysicEnemyBulletProcess ==> GetEnemyBulletSpeedValue --> ActivateEnemyBulletMovement
    PhysicEnemyBulletProcess ==> GetDeltaValue --> ActivateEnemyBulletMovement

    ActivateEnemyBulletMovement ---> |Hit Bottom Boundary| Executed
    ActivateEnemyBulletMovement ---> |Hit Player| Executed

    Executed -- Return the signal -.-> Start 
```
### Player Bullets
```mermaid
flowchart TD
%% Comment
    Start([KineticBody2D])
    PhysicPlayerBulletProcess(func _physics_process)
    Executed(Executed)

    GetPlayerBulletSpeedValue(Get Bullet Speed's Value)
    GetDeltaValue(Get Delta Values)
    ActivatePlayerBulletMovement(move_and_collide)


    Start ==> PhysicPlayerBulletProcess
    PhysicPlayerBulletProcess ==> GetPlayerBulletSpeedValue --> ActivatePlayerBulletMovement
    PhysicPlayerBulletProcess ==> GetDeltaValue --> ActivatePlayerBulletMovement

    ActivatePlayerBulletMovement ---> |Hit Bottom Boundary| Executed 
    ActivatePlayerBulletMovement ---> |Hit Enemies| Executed

    Executed -- Return the signal -.-> Start 
```

## Health system

### Player's Heath

### Enemy's Health

## Scene changes system

### Win Scene

### Lose Scene

### Mid-Scene

### Pause Menu

## Killed/Executed system

### Kill Player

### Kill Enemy

## Other UIs

### Levels system

### Highsccore system

### Automatic Firing

