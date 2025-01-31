# Main scene script (Main.gd) attached to the root node
extends Node2D

@onready var counter = 0
@onready var my_timer = $Timer
signal jimmyspawn
@onready var label = $CanvasLayer/Label
@onready var jimmydead = 0
@onready var bossAmount = 3
@onready var hasnot_triggered = true
func _ready():
	for i in range(50):
		spawn_mob()

#a list of 2 different mobs
var enemy_list = [
	preload("res://Enemy/demon.tscn"),
	preload("res://Enemy/skeleton.tscn"),
	preload("res://Enemy/boss/boss.tscn")
	]

#randomly spawns mobs from the enemy list
func spawn_mob():
	var enemy_spawn = randf_range(0, 2)
	var scene = enemy_list[enemy_spawn].instantiate()
	%PathFollow2D.progress_ratio = randf()
	scene.position = %PathFollow2D.global_position
	scene.connect("dead", Callable(self, "counting"))
	add_child(scene)

func counting():
	counter +=1
	print(counter)

#spawns boss
func spawn_jimmy():
	jimmyspawn.emit()
	var scene = enemy_list[2].instantiate()
	add_child(scene)
	%PathFollow2D.progress_ratio = randf()
	scene.position = %PathFollow2D.global_position



# If 10 mobs has been killed, spawn boss
func _process(delta):
	print(hasnot_triggered)
	print(counter)
	if counter > 5 and hasnot_triggered:
		hasnot_triggered = false
		$CanvasLayer/Upgrading.visible = true
		$upgradetimer.start()
		counter -= 1000
		counter = 6
	if counter > 10:
		$CanvasLayer/Warning.visible = true
		$warningtimer.start()
		counter -= 1000
		
	


func _on_upgradetimer_timeout():
	$Player/can_shoot.wait_time = 0.15
	$Player.speed = 300
	$Player.dashspeed = 1000
	$CanvasLayer/Upgrading.visible = false


func _on_warningtimer_timeout():
	for i in range(15):
		spawn_jimmy()
		$CanvasLayer/Warning.visible = false
