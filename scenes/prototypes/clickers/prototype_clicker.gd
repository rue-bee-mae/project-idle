class_name PrototypeClicker
extends Control
## A clicker prototype to create moon rocks.

## Reference to the label displaying the current amount of moon rocks.
@export var moonRockLabel : Label
## Reference to the main hour tick timer.
@export var timer : Timer
## Reference to the in-game time
@export var clock : Label
## The current amount of regolith in kilograms.
@export var flt_regolith : float = 0
## The base amount of regolith to mine per game tick before any multipliers.
@export var flt_regolithBase : float = 12.5
## The multipler amount mining regolith.
@export var flt_regolithMult : float = 1
## Clock hours
var int_clockHrs : int = 8
## Clock minutes
var int_clockMin : int = 0
## Clock days
var int_clockDay : int = 1
## Amount of in-game minutes to advance per timer tick
var int_clockTickRate : int = 1

## Init regolith label at launch.
func _ready() -> void:
	update_label()

## Create an amount of moon rocks based on base and multipler amounts.
func create_moon_rock() -> void:
	flt_regolith += flt_regolithBase * flt_regolithMult
	update_label()

## Update the label to reflect new amount of moon rocks.
func update_label() -> void:
	moonRockLabel.text = "Regolith - %.2f Kg" %flt_regolith

func update_time_display() -> void:
	clock.text = "Day: %d | %02d:%02d" %[int_clockDay, int_clockHrs, int_clockMin]

## Update the clock based on the timer
func _on_timer_timeout() -> void:
	int_clockMin += int_clockTickRate
	
	# Every 15 minutes, trigger a game tick
	if int_clockMin % 15 == 0:
		create_moon_rock()
	
	# Hour overflow, tick hour up by one, set minutes to zero
	if int_clockMin >= 60:
		int_clockHrs += 1
		int_clockMin = 0
		
	# Day overflow, rick day up by one, set hours to zero
	if int_clockHrs >= 24:
		int_clockHrs = 0
		int_clockDay += 1
		
	update_time_display()
