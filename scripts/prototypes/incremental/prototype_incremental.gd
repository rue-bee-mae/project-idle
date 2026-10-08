class_name PrototypeClicker
extends Control
## A incremental game prototype to create a moon base.

## Reference to the label displaying the current amount of regolith.
@export var regolithLabel : Label
## Reference to the label displaying the current regolith usage/gain.
@export var regolithChangeLabel : Label
## Reference to the main hour tick timer.
@export var timer : Timer
## Reference to the in-game time
@export var clock : Label

## Extractor base speed per game tick
@export var extractorSpeed : float = 12.5
## Number of extractors on regolith
@export var extractorsReg : int = 1
## Number of extractors on ice
@export var extractorsIce : int = 3

## Amount of regolith in kilograms
@export var regolith : float = 0
## Amount of regolith being used per game tick
@export var regolithUsage : float = 0

## Clock hours
var clockHrs : int = 0
## Clock minutes
var clockMin : int = 0
## Clock days
var clockDay : int = 1
## Amount of in-game minutes to advance per timer tick
var clockTickRate : int = 1

## Init regolith label at launch.
func _ready() -> void:
	update_labels()

## Create an amount of regolith based on base and multipler amounts.
func mine_regolith() -> void:
	regolith += extractorsReg * extractorSpeed
	update_labels()

## Update the label to reflect new amount of regolith.
func update_labels() -> void:
	regolithLabel.text = "%.2f Kg" %regolith
	
	var regolithChange : float = extractorsReg * extractorSpeed - regolithUsage
	# Check regolith usage
	if regolithChange < 0:
		regolithChangeLabel.text = "-%.2f / hr" %(regolithChange * 4)
	else:
		regolithChangeLabel.text = "+%.2f / hr" %(regolithChange * 4)

## Update the time display to show the curreny day and time.
func update_time_display() -> void:
	clock.text = "Day: %d | %02d:%02d" %[clockDay, clockHrs, clockMin]

## Update the clock based on the timer
func _on_timer_timeout() -> void:
	clockMin += clockTickRate
	
	# Every 15 minutes, trigger a game tick
	if clockMin % 15 == 0:
		mine_regolith()
	
	# Hour overflow, tick hour up by one, set minutes to zero
	if clockMin >= 60:
		clockHrs += 1
		clockMin = 0
		
	# Day overflow, rick day up by one, set hours to zero
	if clockHrs >= 24:
		clockHrs = 0
		clockDay += 1
		
	update_time_display()
