extends RigidBody2D

var speed := 400;
var score := 0;

@onready var flap_audio = $"../FlapAudio"
@onready var score_audio = $"../ScoreAudio"
@onready var die_audio = $"../DieAudio"

func _integrate_forces(state):
	if Input.is_action_just_pressed("ui_accept"):
		flap_audio.play();
		linear_velocity = Vector2.ZERO;
		apply_central_impulse(Vector2(0, -speed));
		$AnimatedSprite2D.play("flap");

func die():
	get_tree().paused = true;
	die_audio.play();
	$"../Message".show();
	$"../Message/Gameover".show();

func increaseScore():
	score = score + 1;
	score_audio.play();
	$"../LabelScore".text = str(score);

func _on_player_area_floor_body_entered(body):
	if body.is_in_group("Blockers"):
		die();
