extends Node2D

var config = {
	wheel = {
		front = {
			radius = 20,
			speed = 200,
		},
		rear = {
			radius = 10,
			speed = 200,
		}
	},
	chassis = {
		vertexes = [
				Vector2(-50, 0),
				Vector2(50, 0),
				Vector2(50, -15),
				Vector2(-50, -15),
		],
		mass = 3
	} 
}
