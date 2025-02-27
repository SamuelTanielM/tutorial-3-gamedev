extends CharacterBody2D

@export var gravity = 200.0
@export var walk_speed = 200
@export var jump_speed = -200
@export var dash_speed = 800  # Speed of the dash
@export var dash_duration = 0.12  # How long the dash lasts
@export var dash_time_window = 0.3  # Time (in seconds) allowed between inputs for a dash
@onready var anim: AnimatedSprite2D = $AnimatedSprite2D
@export var attack_cooldown = 0.5  # seconds
@export var slide_speed = 500  # Speed of the slide
@export var slide_duration = 0.2  # How long the slide lasts

var attack_timer = 0.0
var is_attacking = false  # Track if the player is currently attacking
var is_dashing = false  # Track if the player is currently dashing
var is_sliding = false  # Track if the player is currently sliding
var dash_timer = 0.0  # Timer for the dash
var slide_timer = 0.0  # Timer for the slide
var dash_direction = 0  # Direction of the dash (-1 for left, 1 for right)
var slide_direction = 0  # Direction of the slide (-1 for left, 1 for right)

var count_till_dash = 0
var time_since_last_input = 0.0
var jump_count = 0

func _physics_process(delta):
	if is_dashing:
		handle_dash(delta)
	elif is_sliding:
		handle_slide(delta)
	else:
		velocity.y += delta * gravity
		attack_timer -= delta

		if is_attacking:
			handle_attack_animation()
		else:
			handle_movement()
			dash(delta)
			double_jump()
			crouching()
			slide()  # Check for sliding input

	move_and_slide()

func handle_movement():
	if Input.is_action_pressed("ui_left"):
		if is_on_floor():
			anim.play("run")
		anim.flip_h = true
		velocity.x = -walk_speed
	elif Input.is_action_pressed("ui_right"):
		anim.flip_h = false
		if is_on_floor():
			anim.play("run")
		velocity.x = walk_speed
	else:
		if is_on_floor():  # Only play idle animation if on the floor
			anim.play("idle")
		velocity.x = 0

	if attack_timer <= 0 and Input.is_action_just_pressed("left_click"):
		start_attack()

func start_attack():
	is_attacking = true
	attack_timer = attack_cooldown
	anim.play("attack")

func handle_attack_animation():
	# Check if the attack animation has finished
	if not anim.is_playing():
		is_attacking = false  # Stop attack state and allow other actions

func double_jump():
	if is_on_floor():
		jump_count = 0
	
	if Input.is_action_just_pressed('ui_up'):
		if is_on_floor():
			jump_count += 1
			velocity.y = jump_speed
			anim.play("jump")  # Play jump animation
		elif jump_count == 1:
			jump_count = 0
			velocity.y = jump_speed
			anim.play("jump")  # Play jump animation

func dash(delta):
	time_since_last_input += delta

	if time_since_last_input > dash_time_window:
		count_till_dash = 0

	if Input.is_action_just_pressed("ui_left"):
		count_till_dash += 1
		time_since_last_input = 0.0

		if count_till_dash == 2:
			start_dash(-1)  # Start dashing to the left

	elif Input.is_action_just_pressed("ui_right"):
		count_till_dash += 1
		time_since_last_input = 0.0 

		if count_till_dash == 2:
			start_dash(1)  # Start dashing to the right

func start_dash(direction):
	is_dashing = true
	dash_timer = dash_duration
	dash_direction = direction
	anim.play("dash")  # Play dash animation if available

func handle_dash(delta):
	dash_timer -= delta
	velocity.x = dash_direction * dash_speed  # Apply dash speed in the given direction

	if dash_timer <= 0:
		is_dashing = false  # Stop dashing
		velocity.x = 0  # Stop horizontal movement

func slide():
	if is_on_floor() and Input.is_action_just_pressed("shift"):
		if Input.is_action_pressed("ui_left"):
			start_slide(-1)  # Slide left
		elif Input.is_action_pressed("ui_right"):
			start_slide(1)  # Slide right

func start_slide(direction):
	is_sliding = true
	slide_timer = slide_duration
	slide_direction = direction
	anim.play("sliding")  # Play sliding animation if available

func handle_slide(delta):
	slide_timer -= delta
	velocity.x = slide_direction * slide_speed  # Apply slide speed in the given direction

	if slide_timer <= 0:
		is_sliding = false  # Stop sliding
		velocity.x = 0  # Stop horizontal movement

func crouching():
	if Input.is_action_pressed("ui_down"):
		anim.play("crouch")  # Play crouch animation
		anim.scale = Vector2(1, 0.8)
		anim.position = Vector2(0, 10.25)
		walk_speed = 100
		jump_speed = -150
		dash_speed = 400
		gravity = 600.0
	
	if Input.is_action_just_released("ui_down"):
		anim.scale = Vector2(1, 1)
		anim.position = Vector2(0, 0)
		walk_speed = 200
		jump_speed = -200
		dash_speed = 600
		gravity = 200.0
		if is_on_floor():
			anim.play("idle")  # Return to idle if on the ground
