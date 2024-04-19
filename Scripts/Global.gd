extends Node

# Paths to different scenes and scene changing variables
var NewGame = "res://Scenes/new_game.tscn"
var SettingsMenu = "res://Scenes/Menus/SettingsMenu.tscn"
var MainMenu = "res://Scenes/Menus/MainMenu.tscn"
var Battle = "res://Scenes/battle.tscn"
var Dialogue = "res://Scenes/dialogue.tscn"
var GameOver = "res://Scenes/Menus/game_over.tscn"
var VillageDeserted = "res://Scenes/village_deserted.tscn"
var current_scene = null

#region Character variables - for saving/loading and going between scenes
#region Basic Stats - (Name, Health, Attack, Defense)
var PlayerName = null
var PlayerMaxHealth = null
var PlayerCurHealth = null
var PlayerAttack = null
var PlayerAP = null
var PlayerStartingAP = null
var PlayerDefense = null
var PlayerMove = null
#endregion

#region Leveling
var PlayerLvl = null
var PlayerMaxExperience = null
var PlayerCurExperience = null
#endregion

var PlayerWeapon1 = null
var PlayerWeapon1Name = null
var PlayerWeapon1Attack = null
var PlayerWeapon1Defense = null
var PlayerWeapon2 = null
var PlayerWeapon2Name = null
var PlayerWeapon2Attack = null
var PlayerWeapon2Defense = null
var PlayerWeapon3 = null
var PlayerWeapon3Name = null
var PlayerWeapon3Attack = null
var PlayerWeapon3Defense = null
var PlayerWeapon4 = null
var PlayerWeapon4Name = null
var PlayerWeapon4Attack = null
var PlayerWeapon4Defense = null

var PlayerInv = null

var PlayerLoc = null
#endregion

#region Enemy variables
var EnemyNumberOf = 0

var Enemy1 = ""
var Enemy1Name = ""
var Enemy1Health = 0
var Enemy1Attack = 0
var Enemy1Defense = 0

var Enemy2 = ""
var Enemy2Name = ""
var Enemy2Health = 0
var Enemy2Attack = 0
var Enemy2Defense = 0

var enemy3 = ""
var Enemy3Name = ""
var Enemy3Health = 0
var Enemy3Attack = 0
var Enemy3Defense = 0
#endregion

# Dialogue
var DiaBackground = "res://Art/BlakeTest/new_noise_texture_2d.tres"
var DiaSpriteRight = "res://Art/NPCs/Fortune Teller/Fortune Teller Idle Sprite.png"
var DiaSpriteLeft = "res://Art/Character/MC Idle Sprite(Open World).png"
var DiaText = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed pellentesque justo nec odio ultrices, vitae tincidunt nibh mollis. Nulla facilisi. Suspendisse potenti. Vivamus auctor nisl vel nunc mattis, eu sodales nibh molestie. ~Praesent nec nisl nec nunc volutpat mollis. Sed quis nunc nec nunc mattis molestie. Sed auctor nisl nec nunc mattis, eu sodales nibh molestie. Vivamus auctor nisl vel nunc mattis, eu sodales nibh molestie. Praesent nec nisl nec nunc volutpat mollis. Sed quis nunc nec nunc mattis molestie. ~Sed auctor nisl nec nunc mattis, eu sodales nibh molestie.~"


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

func dialogue():
	var scene = load(Dialogue)
	var instance = scene.instantiate()
	current_scene.add_child(instance)

func dialogue_end():
	DiaBackground = ""
	DiaSpriteLeft = ""
	DiaSpriteRight = ""
	DiaText = ""

func load_battle():
	var scene = load(Battle)
	var instance = scene.instantiate()
	current_scene.add_child(instance)

func battle_end():
	EnemyNumberOf = 0

	Enemy1 = ""
	Enemy1Name = ""
	Enemy1Health = 0
	Enemy1Attack = 0
	Enemy1Defense = 0

	Enemy2 = ""
	Enemy2Name = ""
	Enemy2Health = 0
	Enemy2Attack = 0
	Enemy2Defense = 0

	enemy3 = ""
	Enemy3Name = ""
	Enemy3Health = 0
	Enemy3Attack = 0
	Enemy3Defense = 0

func game_over():
	var scene = load(GameOver)
	var instance = scene.instantiate()
	current_scene.add_child(instance)

func new_game():
	PlayerMaxHealth = 50
	PlayerCurHealth = 50
	PlayerAttack = 15
	PlayerAP = 1
	PlayerStartingAP = 25
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
	current_scene.get_tree().paused = true


func unpause():
	current_scene.get_tree().paused = false

