import UnityEngine
import Globals

class Projectile (MonoBehaviour):
	public range as single = 10
	public distance as single
	public static damage = 10
	
	def Start() :
		pass
	
	def Update() :
		transform.Translate(Vector3.forward * Time.deltaTime * speed * 10)
		distance += Time.deltaTime * speed * 10
		Destroy(gameObject) if distance >= range

	def OnTriggerEnter(collider as Collider) :
		if collider.gameObject.tag == "Erik" :
			Destroy(gameObject)