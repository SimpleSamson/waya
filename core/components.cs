using UnityEngine;
using System.Collections;

public class components : MonoBehaviour {
    public float Voltage;
    public GameObject Resistor;
    public float PowerDissipated;
	// Use this for initialization
	void Start () {
	
	}
	
	// Update is called once per frame
	void Update () {
	
	}

void OnTriggerEnter(Collider EComponent)
    {
        if (EComponent.CompareTag("resistor"){
            Voltage = current * resistance;
        }
    }
    public float CircuitCalculations() {
        //power dissipation
        Power = Current ^ 2 * resistance || current * Voltage || Voltage * 2 / resistance;


    }
}
