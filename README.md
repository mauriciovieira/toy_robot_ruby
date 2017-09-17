# toy_robot_ruby
Toy Robot Simulator in Ruby

## Description

* The application is a simulation of a toy robot moving
on a square tabletop, of dimensions 5 units x 5 units.
* There are no other obstructions on the table surface.
* The robot is free to roam around the surface of the table,
but must be prevented from falling to destruction.
Any movement that would result in the robot falling
from the table must be prevented, however further
valid movement commands must still be allowed.

## Task

This is an application that can read in commands of the following form:

```
PLACE X,Y,F
MOVE
LEFT
RIGHT
REPORT
```

* `PLACE` will put the toy robot on the table in position X,Y
and facing `NORTH`, `SOUTH`, `EAST` or `WEST`.
* The origin (0,0) can be considered to be the `SOUTH WEST` most corner.
* The first valid command to the robot is a `PLACE` command,
after that, any sequence of commands may be issued, in any order,
including another `PLACE` command.
The application should discard all commands in the sequence
until a valid `PLACE `command has been executed.
* `MOVE` will move the toy robot one unit forward
in the direction it is currently facing.
* `LEFT` and `RIGHT` will rotate the robot 90 degrees
in the specified direction
without changing the position of the robot.
* `REPORT` will announce the X,Y and F of the robot.

* A robot that is not on the table ignores the `MOVE`, `LEFT`, `RIGHT` and `REPORT` commands.

## Constraints

The toy robot does not fall off the table during movement.
This also includes the initial placement of the toy robot.
Any move that would cause the robot to fall is ignored.

Example Input and Output:

```
# Example a
echo "PLACE 0,0,NORTH
MOVE
REPORT" | bin/toy_robot
# Output: 0,1,NORTH
```


```
# Example b
echo "PLACE 0,0,NORTH
LEFT
REPORT" | bin/toy_robot
# Output: 0,0,WEST
```


```
# Example c
echo "PLACE 1,2,EAST
MOVE
MOVE
LEFT
MOVE
REPORT" | bin/toy_robot
# Output: 3,3,NORTH
```

## Acknowledgement

The Toy Robot Challenge was originally formulated by [Jon Eaves](https://twitter.com/joneaves)

## Author

**Mauricio Vieira (mauriciovieira)**
+ <http://mauriciovieira.net>
+ <https://twitter.com/mauriciovieira>
+ <https://github.com/mauriciovieira>