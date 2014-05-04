import UnityEngine

class Globals(MonoBehaviour):
	static public speed as int = 1
	static public score as int = 0
	static public money as single = 300
	static public ready as bool = false
	static public tower as int = 0
	static public towers = ("Cannon", "SAM")
	static final public TOWERS = 2
	
	private previous_speed as int
	
	def Update():
		if Input.GetKeyDown(KeyCode.Space) :
			if speed == 0 :
				speed = previous_speed
			else :
				previous_speed = speed
				speed = 0
		Time.timeScale=speed
		money += Time.deltaTime