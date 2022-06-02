extends CollisionShape2D


func init(radius):
	# create a new shape with the given radius
	var circle = CircleShape2D.new()
	circle.radius = radius
	shape = circle
	position = Vector2.ZERO
	scale = Vector2.ONE

func _draw():
	draw_circle(position, shape.radius, Color.yellow)
