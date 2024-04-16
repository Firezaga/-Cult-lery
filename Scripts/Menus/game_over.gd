extends CanvasLayer


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_quit_to_menu_button_pressed():
	Global.main_menu()


func _on_load_game_button_pressed():
	pass # Replace with function body.


func _on_quit_game_button_pressed():
	Global.quit_game()
