import UnityEngine
import Erik

class Spawn (MonoBehaviour):
	static public timer as single = 50
	public enemy as GameObject
	public static wave = 0
	
	def Start ():
		pass
	
	def Update ():
		timer -= Time.deltaTime
		if timer<=0 :
			timer = 20
			++wave
			spawn()

	def spawn() :
		for i in range(wave) :
			position = Vector3(Random.Range(-Globals.WIDTH, Globals.WIDTH), 1, transform.position.z)
			Instantiate(enemy, position, Quaternion(0, 0, 0, 0))