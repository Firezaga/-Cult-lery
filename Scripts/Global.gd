extends Node

# Paths to different scenes and scene changing variables
var NewGame = "res://Scenes/new_game.tscn"
var SettingsMenu = "res://Scenes/Menus/SettingsMenu.tscn"
var MainMenu = "res://Scenes/Menus/MainMenu.tscn"
var Battle = "res://Scenes/battle.tscn"
var Shop = "res://Scenes/shop.tscn"
var Dialogue = "res://Scenes/dialogue.tscn"
var GameOver = "res://Scenes/Menus/game_over.tscn"
var VillageDeserted = "res://Scenes/village_deserted.tscn"
var MainVillage = "res://Scenes/main_village.tscn"
var OpenWorld = "res://Scenes/open_world.tscn"
var current_scene = null

#region Character variables - for saving/loading and going between scenes
#region Basic Stats - (Name, Health, Attack, Defense)
var PlayerName = "Test"
var PlayerMaxHealth = 200
var PlayerCurHealth = 200
var PlayerAttack = 50
var PlayerAP = 1
var PlayerStartingAP = 1
var PlayerDefense = 0
var PlayerMove = false
#endregion

#region Leveling
var PlayerLvl = 2
var PlayerMaxExperience = 200
var PlayerCurExperience = 0
#endregion

var PlayerWeapon1 = ""
var PlayerWeapon1Name = null
var PlayerWeapon1Attack = null
var PlayerWeapon1Defense = null
var PlayerWeapon2 = ""
var PlayerWeapon2Name = null
var PlayerWeapon2Attack = null
var PlayerWeapon2Defense = null
var PlayerWeapon3 = ""
var PlayerWeapon3Name = null
var PlayerWeapon3Attack = null
var PlayerWeapon3Defense = null
var PlayerWeapon4 = ""
var PlayerWeapon4Name = null
var PlayerWeapon4Attack = null
var PlayerWeapon4Defense = null

var PlayerMoney = 15
var PlayerPotion = 5
var PlayerLocX = -31
var PlayerLocY = 77
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

var Enemy3 = ""
var Enemy3Name = ""
var Enemy3Health = 0
var Enemy3Attack = 0
var Enemy3Defense = 0

var Enemy4 = ""
var Enemy4Name = ""
var Enemy4Health = 0
var Enemy4Attack = 0
var Enemy4Defense = 0
#endregion

# Dialogue
var DiaBackground = ""
var DiaSpriteRight = ""
var DiaSpriteLeft = ""
var DiaText = ""


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

func goto_main_village():
	goto_scene(MainVillage)

func goto_open_world():
	goto_scene(OpenWorld)

func shop():
	var scene = load(Shop)
	var instance = scene.instantiate()
	current_scene.add_child(instance)

func dialogue():
	var scene = load(Dialogue)
	var instance = scene.instantiate()
	current_scene.add_child(instance)

func dialogue_end():
	DiaBackground = ""
	DiaSpriteLeft = ""
	DiaSpriteRight = ""
	DiaText = ""
	await get_tree().create_timer(0.5).timeout
	PlayerMove = true

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
	
	Enemy3 = ""
	Enemy3Name = ""
	Enemy3Health = 0
	Enemy3Attack = 0
	Enemy3Defense = 0
	
	Enemy4 = ""
	Enemy4Name = ""
	Enemy4Health = 0
	Enemy4Attack = 0
	Enemy4Defense = 0
	
	await get_tree().create_timer(0.5).timeout
	PlayerMove = true

func game_over():
	var scene = load(GameOver)
	var instance = scene.instantiate()
	current_scene.add_child(instance)

func new_game():
	PlayerMaxHealth = 50
	PlayerCurHealth = 40
	PlayerAttack = 15
	PlayerAP = 1
	PlayerStartingAP = 25
	PlayerDefense = 5
	PlayerLvl = 1
	PlayerMaxExperience = 10
	PlayerCurExperience = 4
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
	PlayerMove = false


func unpause():
	PlayerMove = true

