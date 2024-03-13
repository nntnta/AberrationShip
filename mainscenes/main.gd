extends Node2D

@export var red_fish: PackedScene
@export var silver_fish: PackedScene
@export var player: PackedScene
# Called when the node enters the scene tree for the first time.
func _ready():
	$red_fish.start()
	$silver_fish.start()
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_red_fish_timeout():
	if global.red <= 20:
		spawn_red_fish()
		global.red += 1

func spawn_red_fish():
	var rand_location = Vector2(randi_range(-3000,3000),randi_range(-3000,3000))
	var red_spawner = red_fish.instantiate()
	red_spawner.position = rand_location
	get_tree().current_scene.call_deferred('add_child', red_spawner)


func _on_silver_fish_timeout():
	if global.silver <= 25:
		spawn_silver_fish()
		global.silver += 1

func spawn_silver_fish():
	var rand_location = Vector2(randi_range(-4000,4000),randi_range(-4000,4000))
	var silver_spawner = silver_fish.instantiate()
	silver_spawner.position = rand_location
	get_tree().current_scene.call_deferred('add_child', silver_spawner)
