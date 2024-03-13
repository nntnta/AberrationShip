extends Node


var cd = 1
var speed = 8000
var hp = 5
var score = 0
var red = 0
var silver = 0

func _process(_delta):
	if cd <= 0.2:
		cd = 0.2
