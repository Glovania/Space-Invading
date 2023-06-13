# Logic

## Movement system
### Player Movement
```mermaid
flowchart TD
%% Comment
    Start([KineticBody2D])
    Executed(Executed)
    PhysicPlayerProcess(func _physics_process)

    GetDeltaValue(Get Delta Values)
    GetPlayerMovementSpeedValue(Get Movement Speed)
    CreateBoundaries{Create Boundaries}
    ActivatePlayerMovement(move_and_collide)

    GetLeftUI(ui_left)
    GetRightUI(ui_right)
    GetUpUI(ui_up)
    GetDownUI(ui_down)


    Start ==> PhysicPlayerProcess
    PhysicPlayerProcess ==> GetPlayerMovementSpeedValue
    PhysicPlayerProcess ==> GetDeltaValue

    GetPlayerMovementSpeedValue --> GetLeftUI
    GetDeltaValue --> GetLeftUI --- CreateBoundaries --> |x>30| ActivatePlayerMovement
    CreateBoundaries --> |x<30| Executed


    GetPlayerMovementSpeedValue --> GetRightUI
    GetDeltaValue --> GetRightUI --- CreateBoundaries --> |x<1250| ActivatePlayerMovement
    CreateBoundaries --> |x>1250| Executed


    GetPlayerMovementSpeedValue --> GetUpUI
    GetDeltaValue --> GetUpUI --- CreateBoundaries --> |y>600| ActivatePlayerMovement
    CreateBoundaries --> |y<600| Executed


    GetPlayerMovementSpeedValue --> GetDownUI
    GetDeltaValue --> GetDownUI --- CreateBoundaries --> |y<1690| ActivatePlayerMovement
    CreateBoundaries --> |y>1690| Executed

    Executed -- ReturnValue -.-> Start
    ActivatePlayerMovement -- Return the value -.-> Start
```

### Enemy Movement
```mermaid
flowchart TD
%% Comment
    Start([KineticBody2D])
    PhysicEnemyProcess(func _physics_process)

    GetEnemyMovementSpeedValue(Get Movement Speed's Value)
    GetDeltaValue(Get Delta Values)
    StartColliding(Collide)
    ShiftedDown(Shift down)
    RevertEnemyMovementSpeedValue(Revert Movement Speed's Value)


    Start ==> PhysicEnemyProcess
    PhysicEnemyProcess === GetEnemyMovementSpeedValue --> StartColliding
    PhysicEnemyProcess === GetDeltaValue --> StartColliding
    
    StartColliding --> |Hit Left Boundary| ShiftedDown
    StartColliding --> |Hit Right Boundary| ShiftedDown --> RevertEnemyMovementSpeedValue 

    RevertEnemyMovementSpeedValue -- Return the value -.-> Start
    ShiftedDown -- Return the signal -.-> Start
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

