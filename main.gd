extends Node2D
@export var mob_scene: PackedScene

var screen_size : Vector2i

var PlayerInitialPosition

func _ready():
	screen_size = get_window().size
	PlayerInitialPosition = $Player.position
	GHUD.start_game.connect(new_game)
	
func game_over():
	GHUD.update_high_score_label()
	$MOBTimer.stop()
	
func new_game():
	$Floor.position.x = 0
	$Player.position = PlayerInitialPosition
	$MOBTimer.start()
	GHUD.mob_counter = 0

func _process(delta):
	$Floor.position.x = $Player.position.x - 100


func _on_mob_timer_timeout():
	if GHUD.mob_counter < 2:
		var mob = mob_scene.instantiate()
		mob.position.x = $Player.position.x + 1500
		mob.position.y = 640
		add_child(mob)
		mob.hit.connect(game_over)
		$MOBTimer.wait_time = 2
	
