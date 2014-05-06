import UnityEngine

class Turret(MonoBehaviour): 
	public projectile as GameObject
	public reload as single
	public turn as single
	public pause as single
	public cost as single
	public static hitpoints as int
	public target as Transform
	public muzzle as Transform
	public this as Transform

	private next_fire as single
	private next_move as single
	private desired_rotation as Quaternion

	virtual def Start ():
		pass

	def Update ():
		if target :
			if Time.time >= next_move :
				position = target.position - transform.position
				desired_rotation = Quaternion.LookRotation(position)
				this.rotation = Quaternion.Lerp(this.rotation, desired_rotation, Time.deltaTime*turn)
			if Time.time >= next_fire :
				fire()

	def OnTriggerEnter(enemy as Collider) :
		if enemy.gameObject.tag == "Erik" :
			next_fire = Time.time+(reload*.5)
			target = enemy.gameObject.transform

	def OnTriggerExit(other as Collider) :
		if other.gameObject.transform == target :
			target = null

	def fire() :
		audio.Play()
		next_fire = Time.time+reload
		next_move = Time.time+pause
		Instantiate(projectile, muzzle.position, muzzle.rotation)

class Wall(Turret):
	def Start ():
		reload = 1
		turn = 5
		pause = .1
		cost = 5