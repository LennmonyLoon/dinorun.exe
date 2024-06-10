extends Area2D

signal hit

func _ready():
	GHUD.mob_counter = GHUD.mob_counter + 1
	var collisions = [
		$SquareAA,
		$CircleAA,
		$TriangleAA,
		$QQQA1,
		$QQQA2,
	]
	var sprites = [
		$SquareA,
		$CircleA,
		$TriangleA,
		$QQQ1,
		$QQQ2,
	]
	var random_int = randi() % collisions.size()
	var selected_collisions = collisions[random_int]
	var selected_sprite = sprites[random_int]
	
	selected_collisions.disabled = false
	selected_collisions.visible = true
	selected_sprite.visible = true


func _on_visible_on_screen_notifier_2d_screen_exited():
	if GHUD.mob_counter > 0:
		GHUD.mob_counter = GHUD.mob_counter - 1
	queue_free()


func _on_body_entered(body):
	if body.is_in_group("dinosaurio"):
		print("game over")
		hit.emit()
