import UnityEngine
import Globals

class MenuGUI(MonoBehaviour) :
	public speed as int

	private speeds = ("Pause", "x1", "x2")
	private towers as (string) = array(string, Globals.TOWERS)
	private hide = false

	def Start():
		pass

	def Update():
		pass
	
	def OnGUI() :
		hide = GUI.Toggle(Rect(20, 30, 180, 20), hide, "Hide Menu")
		if hide :
			GUI.Box(Rect(10, 20, 100, 40), "")
			return
		GUI.Box(Rect(10, 10, 200, 300), "Menu")
		Globals.speed = GUI.Toolbar(Rect(20, 70, 180, 20), Globals.speed, speeds)
		if GUI.Button(Rect(20, 110, 180, 20), "Next Wave " + Mathf.Floor(Spawn.timer)):
			Spawn.timer=0
		GUI.TextField(Rect(20, 140, 180, 20), "Money: " + Mathf.Ceil(Globals.money))
		GUI.TextField(Rect(20, 170, 180, 20), "Score: " + Globals.score)
		Globals.tower = GUI.SelectionGrid(Rect(20, 200, 180, 40), Globals.tower, Globals.towers, 2)