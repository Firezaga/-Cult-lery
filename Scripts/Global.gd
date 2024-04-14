extends Node

# Paths to different scenes and scene changing variables
var NewGame = "res://Scenes/new_game.tscn"
var SettingsMenu = "res://Scenes/Menus/SettingsMenu.tscn"
var MainMenu = "res://Scenes/Menus/MainMenu.tscn"
var VillageDeserted = "res://Scenes/village_deserted.tscn"
var current_scene = null

# Character variables - for saving/loading and going between scenes
var PlayerName = null
var PlayerMaxHealth = null
var PlayerCurHealth = null
var PlayerAttack = null
var PlayerDefense = null
var PlayerLvl = null
var PlayerMaxExperience = null
var PlayerCurExperience = null
var PlayerInv = null
var PlayerLoc = null

# Enemy variables
var EnemyNumberOf = null
var Enemy1 = null
var Enemy2 = null
var Enemy3 = null


# ------------------------------------------------------------------------------
#region
# Getter/Setter functions
func set_player(MaxHealth, CurHealth, Attack, Defense, Lvl, MaxExperience, CurExperience, Inv):
	PlayerMaxHealth = MaxHealth
	PlayerCurHealth = CurHealth
	PlayerAttack = Attack
	PlayerDefense = Defense
	PlayerLvl = Lvl
	PlayerMaxExperience = MaxExperience
	PlayerCurExperience = CurExperience
	PlayerInv = Inv

func set_player_max_health(i):
	PlayerMaxHealth = i

func set_player_cur_health(i):
	PlayerCurHealth = i

func set_player_attack(i):
	PlayerAttack = i

func set_player_defense(i):
	PlayerDefense = i

func set_player_lvl(i):
	PlayerLvl = i

func set_player_max_experience(i):
	PlayerMaxExperience = i

func set_player_cur_experience(i):
	PlayerCurExperience = i

func set_player_inv(i):
	PlayerInv = i

func get_player_max_health(): 
	return PlayerMaxHealth

func get_player_cur_health(): 
	return PlayerCurHealth

func get_player_attack(): 
	return PlayerAttack

func get_player_defense():
	return PlayerDefense

func get_player_lvl():
	return PlayerLvl

func get_player_max_experience():
	return PlayerMaxExperience

func get_player_cur_experience():
	return PlayerCurExperience

func get_player_inv():
	return PlayerInv


func set_enemy(NumberOf, _Enemy1, _Enemy2, _Enemy3):
	EnemyNumberOf = NumberOf
	Enemy1 = _Enemy1
	Enemy2 = _Enemy2
	Enemy3 = _Enemy3

func get_enemy_number_of():
	return EnemyNumberOf

func get_enemy_1():
	return Enemy1

func get_enemy_2():
	return Enemy2

func get_enemy_3():
	return Enemy3

#endregion

func _ready():
	var root = get_tree().get_root()
	current_scene = root.get_child(root.get_child_count() - 1)


func _process(_delta):
	if Input.is_action_pressed("escape"):
		quit_game()

func goto_scene(path):
	# This function will usually be called from a signal callback,
	# or some other function in the current scene.
	# Deleting the current scene at this point is
	# a bad idea, because it may still be executing code.
	# This will result in a crash or unexpected behavior.

	# The solution is to defer the load to a later time, when
	# we can be sure that no code from the current scene is running:

	call_deferred("_deferred_goto_scene", path)


func _deferred_goto_scene(path):
	# It is now safe to remove the current scene
	current_scene.free()
	
	# Load the new scene.
	var s = ResourceLoader.load(path)
	
	# Instance the new scene.
	current_scene = s.instantiate()
	
	# Add it to the active scene, as child of root.
	get_tree().get_root().add_child(current_scene)
	
	# Optionally, to make it compatible with the SceneTree.change_scene() API.
	get_tree().set_current_scene(current_scene)

func goto_village_deserted():
	goto_scene(VillageDeserted)

func new_game():
	PlayerMaxHealth = 50
	PlayerCurHealth = 50
	PlayerAttack = 5
	PlayerDefense = 5
	PlayerLvl = 1
	PlayerMaxExperience = 10
	PlayerCurExperience = 0
	goto_scene(NewGame)


func save():
	pass #todo


func load():
	pass #todo


func settings():
	goto_scene(SettingsMenu)


func main_menu():
	goto_scene(MainMenu)


# Used to quit game
func quit_game():
	get_tree().quit()


func pause():
	get_tree().paused = true


func unpause():
	get_tree().paused = false

