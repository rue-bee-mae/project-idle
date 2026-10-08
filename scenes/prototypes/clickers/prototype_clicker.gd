class_name PrototypeClicker
extends Control
## A clicker prototype to create moon rocks.

## Reference to the label displaying the current amount of moon rocks.
@export var moonRockLabel : Label
## The current number of moon rocks.
@export var int_moonRock : int = 0
## The base amount of moon rocks to create with each click before any multipliers.
@export var int_moonRockBase : int = 1
## The multipler amount for creating moon rocks.
@export var int_moonRockMult : int = 1 

## Init moon rock label at launch.
func _ready() -> void:
	update_label()

## Create an amount of moon rocks based on base and multipler amounts.
func create_moon_rock() -> void:
	int_moonRock += int_moonRockBase * int_moonRockMult
	update_label()

## Update the label to reflect new amount of moon rocks.
func update_label() -> void:
	moonRockLabel.text = "Moon Rock - %s" %int_moonRock

## Triggered when the moon rock button is pressed.
func _on_moon_rock_pressed() -> void:
	create_moon_rock()
