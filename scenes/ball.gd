extends RigidBody2D

@onready var audio_player = $kick
var player_touching: CharacterBody2D = null  # Track the player touching the ball

func _ready():
	# Connect Area2D signals
	$Area2D.body_entered.connect(_on_body_entered)
	$Area2D.body_exited.connect(_on_body_exited)

func _on_body_entered(body):
	if body.name.to_lower() == "player":
		player_touching = body  # Store reference to the player
		print("Player detected!")

func _on_body_exited(body):
	if body == player_touching:  # Remove reference when player leaves
		player_touching = null

func _physics_process(delta):
	# Ensure ball never fully stops
	if linear_velocity.length() < 5.0:
		var random_direction = Vector2(randf_range(-1, 1), randf_range(-1, 1)).normalized()
		apply_central_impulse(random_direction * 10)  # Apply small nudge

	# Apply kick while player is touching
	if player_touching:
		var player_velocity = player_touching.velocity
		var kick_direction = Vector2.ZERO

		if player_velocity.length() > 10:
			kick_direction = player_velocity.normalized()  # Use player's movement direction
		else:
			kick_direction = (global_position - player_touching.global_position).normalized()

		var kick_strength = player_velocity.length() * 2.0  # Adjust kick power

		if abs(linear_velocity.y) < 1.0:
			kick_direction.y -= 0.8  # Extra upward boost

		apply_central_impulse(kick_direction * kick_strength)  # Apply force
		audio_player.play()
