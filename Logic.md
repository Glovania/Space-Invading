# Logic

## Movement system
### Player Movement
```mermaid
flowchart TD
    Start([KineticBody2D])
    ReturnValue(Return the value)
    Executed(Executed)

    GetDeltaValue(Get Delta Values)
    GetMovementSpeed(Get Movement Speed)
    CreateBoundaries{Create Boundaries}
    ActivatePlayerMovement(move_and_collide)

    GetLeftUI(ui_left)
    GetRightUI(ui_right)
    GetUpUI(ui_up)
    GetDownUI(ui_down)


    Start ==> GetMovementSpeed ==> GetDeltaValue

    GetMovementSpeed --> GetLeftUI
    GetDeltaValue --> GetLeftUI --- CreateBoundaries --> |x>30| ActivatePlayerMovement
    CreateBoundaries --> |x<30| Executed


    GetMovementSpeed --> GetRightUI
    GetDeltaValue --> GetRightUI --- CreateBoundaries --> |x<1250| ActivatePlayerMovement
    CreateBoundaries --> |x>1250| Executed


    GetMovementSpeed --> GetUpUI
    GetDeltaValue --> GetUpUI --- CreateBoundaries --> |y>600| ActivatePlayerMovement
    CreateBoundaries --> |y<600| Executed


    GetMovementSpeed --> GetDownUI
    GetDeltaValue --> GetDownUI --- CreateBoundaries --> |y<1690| ActivatePlayerMovement
    CreateBoundaries --> |y>1690| Executed

    Executed --- ReturnValue
    ActivatePlayerMovement --- ReturnValue

    ReturnValue -.-> Start
```

### Enemy Movement

## Bullets system
### Enemy Bullets

### Player Bullets

### Automatic Firing

## Health system

### Player's Heath

### Enemy's Health

## UIs

### Levels system

### Win Scene

### Lose Scene
### Highsccore system

### Scene changes system

### Pause Menu

## Killed/Executed system

### Kill Player

### Kill Enemy
