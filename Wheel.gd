extends Node2D


var speed = 0
var max_speed = 100

var config = {
	radius = 10,
	speed = 200
}

func init(conf):
	config = conf
	var wheel_body = get_node("WheelBody")
	wheel_body.gravity_scale = 30
	wheel_body.mode = RigidBody2D.MODE_RIGID
	wheel_body.get_node("WheelShape").init(config.radius)

func _physics_process(delta): #https://youtu.be/nPX9MrnvNLo?t=672
	var wheel_body = get_node("WheelBody")
	if wheel_body.angular_velocity < max_speed:
			wheel_body.apply_torque_impulse(config.speed * delta * 60) 
	
