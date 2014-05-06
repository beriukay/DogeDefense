using UnityEngine;
using System.Collections;

public class HelloWorldBehavior : MonoBehaviour {
	public string myName;
	
	// Use this for initialization
	void Start () {
		
	}
	
	// Update is called once per frame
	void Update () {
		Debug.Log("(" + myName + ") I am alive and my position is " + transform.position);
	}
}
