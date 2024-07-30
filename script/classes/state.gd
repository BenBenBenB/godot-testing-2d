class_name State
extends Node

signal Transitioned(new_state_name: StringName)

func enter(prev_state = null) -> void:
	pass

func exit() -> void:
	pass
	
func update(_delta: float) -> void:
	pass

func physics_update(_delta: float) -> void:
	pass
