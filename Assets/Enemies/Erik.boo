import UnityEngine
import Projectile

class Erik (MonoBehaviour): 
	public hp as int
	def Start ():
		hp = 50
	
	def Update ():
		transform.Translate(Vector3.forward * Time.deltaTime)

	def OnTriggerEnter(projectile as Collider) :
		hp -= Projectile.damage
		if hp<=0 :
			Destroy(gameObject)
			Globals.money += 10
		Destroy(projectile)