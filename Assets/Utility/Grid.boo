import UnityEngine
import Globals

class Grid (MonoBehaviour): 
	public cannon as GameObject
	public sam as GameObject
	public static final HEIGHT = 50
	public static final WIDTH = 50
	
	private static pixel_width = 1024
	private static pixel_height = 768
	private towers = matrix(bool, WIDTH*2, HEIGHT*2)
	
	def Start ():
		for i in range(WIDTH*2) :
			for j in range(HEIGHT*2) :
				towers[i, j]=true
	
	def Update ():
		if Input.GetMouseButtonDown(0) :
			Debug.Log(Input.mousePosition.x)
			Debug.Log(Input.mousePosition.y)
			build(WIDTH*Input.mousePosition.x/pixel_width*2-WIDTH, HEIGHT*Input.mousePosition.y/pixel_height*2-HEIGHT)

	def build(x as int, y as int) :
		Debug.Log(x)
		Debug.Log(y)
		Debug.Log(x+WIDTH)
		Debug.Log(y+HEIGHT)
		return if x+WIDTH<0 or x>=WIDTH*2 or y+HEIGHT<0 or y>=HEIGHT*2
		Debug.Log("pass")
		if towers[x+WIDTH, y+HEIGHT] :
			Debug.Log("In first")
			if Globals.towers[Globals.tower] == "Cannon" and Globals.money >= 100 :
				Instantiate(cannon, Vector3(x, 0, y), Quaternion(0, 0, 0, 0))
				Globals.money -= 100
			elif Globals.towers[Globals.tower] == "SAM" and Globals.money >= 150 :
				Instantiate(sam, Vector3(x, 0, y), Quaternion(0, 0, 0, 0))
				Globals.money -= 150
			towers[x+WIDTH, y+HEIGHT] = false