class_name PrototypeClicker
extends Control
## A incremental game prototype to create a moon base.

## Reference to the label displaying the current amount of regolith.
@export var regolithLabel : Label
## Reference to the label displaying the current regolith usage/gain.
@export var regolithChangeLabel : Label
## Reference to the label displaying the current amount of ice.
@export var iceLabel : Label
## Reference to the label displaying the current ice usage/gain.
@export var iceChangeLabel : Label
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
## Amount of ice in kilograms
@export var ice : float = 0
## Amount of ice being used per game tick
@export var iceUsage : float = 0

## Clock hours
var clockHrs : int = 0
## Clock minutes
var clockMin : int = 0
## Clock days
var clockDay : int = 1
## Amount of in-game minutes to advance per timer tick
var clockTickRate : int = 1

## Init labels at launch.
func _ready() -> void:
	update_labels()

## Extract resources per game tick.
func extractors_tick() -> void:
	regolith += extractorsReg * extractorSpeed
	ice += extractorsIce * extractorSpeed
	update_labels()

## Update the label to reflect new amount of regolith.
func update_labels() -> void:
	regolithLabel.text = "%.2f Kg" %regolith
	iceLabel.text = "%.2f Kg" %ice
	
	# Check regolith usage
	var regolithChange : float = calc_resource_change(extractorsReg, regolithUsage)
	if regolithChange < 0:
		regolithChangeLabel.text = "-%.2f / hr" %(regolithChange * 4)
	else:
		regolithChangeLabel.text = "+%.2f / hr" %(regolithChange * 4)
		
	# Check ice usage
	var iceChange : float = calc_resource_change(extractorsIce, iceUsage)
	if iceChange < 0:
		iceChangeLabel.text = "-%.2f / hr" %(iceChange * 4)
	else:
		iceChangeLabel.text = "+%.2f / hr" %(iceChange * 4)
		
func calc_resource_change(extractorAmount : int, resourceUsage : float) -> float:
	return extractorAmount * extractorSpeed - resourceUsage

## Update the time display to show the curreny day and time.
func update_time_display() -> void:
	clock.text = "Day: %d | %02d:%02d" %[clockDay, clockHrs, clockMin]

## Update the clock based on the timer
func _on_timer_timeout() -> void:
	clockMin += clockTickRate
	
	# Every 15 minutes, trigger a game tick
	if clockMin % 15 == 0:
		extractors_tick()
	
	# Hour overflow, tick hour up by one, set minutes to zero
	if clockMin >= 60:
		clockHrs += 1
		clockMin = 0
		
	# Day overflow, rick day up by one, set hours to zero
	if clockHrs >= 24:
		clockHrs = 0
		clockDay += 1
		
	update_time_display()
