extends Node

var score = 0

var levels=[0,0]

var current_level = 1

func updateScore(level:int,score:int)->void:
	levels[level]=score

func getScore(level:int) -> int:
	return levels[level]
	
func add_point():
	score += 1

func getPoints() -> int:
	return score
	
func resetScore():
	score=0
	
func getCurrentLevel() -> int:
	return current_level
	
func update_current_level(level:int):
	current_level=level
