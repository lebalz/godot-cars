extends Node2D

var Car = preload("res://Car.tscn")

func _ready():
	randomize()
	for i in range(10):
		var car = Car.instance()
		# setup config - here the genetic algorithm has to take place...
		car.config.wheel.front.radius = rand_range(5, 50)
		car.config.wheel.front.speed = 100

		# initialize car position
		car.position = Vector2(rand_range(180, 250), 10)

		add_child(car)
