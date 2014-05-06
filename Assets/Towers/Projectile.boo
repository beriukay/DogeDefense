import UnityEngine
import Globals

class Projectile (MonoBehaviour):
	public range as single
	public static damage as int
	
	private distance as single
	
	virtual def Start() :
		pass
	
	def Update() :
		transform.Translate(Vector3.forward * Time.deltaTime * 30)
		distance += Time.deltaTime * 30
		Destroy(gameObject) if distance >= range

	def OnTriggerEnter(collider as Collider) :
		if collider.gameObject.tag == "Erik" :
			Destroy(gameObject)