import UnityEngine
import Erik
import Grid

class Spawn (MonoBehaviour):
	static public timer as single = 20
	public enemy as GameObject
	
	private static wave = 0
	
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
			position = Vector3(Random.Range(-Grid.WIDTH, Grid.WIDTH), 0, transform.position.z)
			Instantiate(enemy, position, Quaternion(0, 0, 0, 0))