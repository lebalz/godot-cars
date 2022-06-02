extends RigidBody2D

var Wheel = preload("res://Wheel.tscn")

var rng = RandomNumberGenerator.new()
var layer: int = 0
var front_wheel
var rear_wheel

func add_wheel(pos, wheel_config):
	# create new wheel
	var wheel = Wheel.instance()
	
	# set the radius of the wheel
	wheel.init(wheel_config)
	# set the position of the new wheel
	wheel.position = Vector2.ZERO
	
	# create PinJoint
	var axis = PinJoint2D.new()
	# add axis node to scene "CarBody"
	add_child(axis)
	# add wheel node to axis
	axis.add_child(wheel)
	# set the position of the axis
	axis.position = pos

	# connect the pinjoint
	axis.node_a = get_path()
	axis.node_b = wheel.get_node("WheelBody").get_path()
	# set pinjoint props
	axis.softness = 2.5
	return wheel

func _ready():
	# get the config of the car
	var config = get_parent().config
	# setup the mass of the rigid body
	mass = config.chassis.mass

	# setup the chassis
	var chassis = get_node("Chassis")
	chassis.polygon = PoolVector2Array(config.chassis.vertexes)

	# get the wheel positions
	var rear_pos = config.chassis.vertexes[0]
	var front_pos = config.chassis.vertexes[1]

	add_wheel(front_pos, config.wheel.front)
	add_wheel(rear_pos, config.wheel.rear)
