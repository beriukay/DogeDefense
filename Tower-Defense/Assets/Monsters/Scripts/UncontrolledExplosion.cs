using UnityEngine;
using System.Collections;

public class UncontrolledExplosion : MonoBehaviour {

	// Use this for initialization
	void Start () {
	
	}
	
	// Update is called once per frame
	void Update () {
		Vector3 scale = transform.localScale;
		scale.x += .01F;
		scale.y += .01F;
		scale.z += .01F;
		transform.localScale = scale;
	}
}
