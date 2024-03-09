extends State
class_name EnemyFollow

@export var enemy: CharacterBody2D
@export var move_speed := 35
@export var unaggro = 350
@export var attack_range = 60
var player: CharacterBody2D

func enter():
	player = get_tree().get_first_node_in_group('player')

func physics_update(delta: float):
	var direction = player.global_position - enemy.global_position
	
	if direction.length() > attack_range :
		enemy.velocity = direction.normalized() * move_speed * delta
	else:
		enemy.velocity = Vector2()

	if direction.length() > unaggro:
		transitioned.emit(self, "idle")
