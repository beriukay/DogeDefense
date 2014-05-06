import UnityEngine
import Projectile

class Erik (MonoBehaviour): 
	public hp as int
	
	private direction as Vector3
	private target as GameObject
	private stuck as bool
	private moved_left as bool
	private moved_right as bool
	private moving_right as bool
	private moving_left as bool
	private old_position as Vector3
	
	def Start():
		hp = 50
		direction = Vector3.forward
		stuck = false
		moved_right = false
		moved_left = false
		moving_right = false
		moving_left = false

	def Update():
		select_direction()
		if stuck :
			Globals.damage(target)
			if not target:
				stuck = false
			moved_left, moved_right, moving_right, moving_left = false, false, false, false
		Destroy(gameObject) if hp<=0
		old_position = transform.position
		transform.Translate(direction * Time.deltaTime)

	def OnCollisionEnter(collision as Collision) :
		if collision.gameObject.tag == "Erik" :
			Physics.IgnoreCollision(collision.collider, collider)
	def OnTriggerEnter(collider as Collider) :
		if collider.gameObject.tag == "Erik" :
			return
		elif collider.gameObject.tag == "Tower" :
			target = collider.gameObject
		elif collider.gameObject.tag == "Cannonball" :
			hp -= Cannonball.damage
		elif collider.gameObject.tag == "Missile" :
			hp -= Missile.damage

	def select_direction():
		pos_x, pos_y = transform.position.x+Globals.WIDTH, transform.position.z+Globals.HEIGHT
		if pos_x+1>=Globals.WIDTH*2 or pos_y+1>=Globals.HEIGHT*2 or pos_x-1<0 or pos_y<0:
			Destroy(gameObject)
		elif Globals.grid[pos_x, pos_y+1]==0:// and Globals.grid[Mathf.Ceil(pos_x), pos_y+1]==0:
			if old_position.z >= transform.position.z:
				direction = Vector3(-1, 0, .01)
			else :
				direction = Vector3.forward
				moved_left, moved_right, moving_right, moving_left = false, false, false, false
		elif Globals.grid[pos_x+1, pos_y]==0 and (moving_right or not moved_right) :
			direction = Vector3.right
			moved_right = true
			moving_right = true
			moving_left = false
		elif Globals.grid[pos_x-1, pos_y]==0 and (moving_left or not moved_left):
			direction = Vector3.left
			moved_left = true
			moved_right = true
			moving_left = true
			moving_right = false
		else :
			direction = Vector3(0, 0, 0)
			stuck = true