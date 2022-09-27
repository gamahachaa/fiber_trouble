package flow.phone;

import regex.ExpReg;
import tstool.process.ActionMultipleInput;
import tstool.process.Process;

/**
 * ...
 * @author bb
 */
class ListImpactedNumbers extends ActionMultipleInput 
{
	static inline var IMPACTED_NUMS_01:String = "impacted number 1";
	static inline var IMPACTED_NUMS_02:String = "impacted number 2";
	static inline var IMPACTED_NUMS_03:String = "impacted number 3";
	static inline var IMPACTED_NUMS_04:String = "impacted number 4";
	static inline var IMPACTED_NUMS_05:String = "impacted number 5";

	public function new ()
	{
		super(
		[{
			ereg: new EReg(ExpReg.MISIDN_UNIVERAL,"i"),
			input:{
				width:800,
				mustValidate:[Next],
				prefix:IMPACTED_NUMS_01,
				position: [bottom, left]
			}
		},
		{
			ereg: new EReg(ExpReg.MISIDN_UNIVERAL,"i"),
			input:{
				width:800,
				mustValidate:[Exit],
				prefix:IMPACTED_NUMS_02,
				buddy:IMPACTED_NUMS_01,
				position: [bottom, left]
			}
		}
		,
		{
			ereg: new EReg(ExpReg.MISIDN_UNIVERAL,"i"),
			input:{
				width:800,
				mustValidate:[Exit],
				prefix:IMPACTED_NUMS_03,
				buddy:IMPACTED_NUMS_02,
				position: [bottom, left]
			}
		}
		,
		{
			ereg: new EReg(ExpReg.MISIDN_UNIVERAL,"i"),
			input:{
				width:800,
				mustValidate:[Exit],
				prefix:IMPACTED_NUMS_04,
				buddy:IMPACTED_NUMS_03,
				position: [bottom, left]
			}
		}
		,
		{
			ereg: new EReg(ExpReg.MISIDN_UNIVERAL,"i"),
			input:{
				width:800,
				mustValidate:[Exit],
				prefix:IMPACTED_NUMS_05,
				buddy:IMPACTED_NUMS_04,
				position: [bottom, left]
			}
		}
		]
		);
	}
	
	
	override public function onClick():Void
	{
		if (validate())
		{
			this._nexts = [{step: getNext(), params: []}];
			super.onClick();
		}
	}
	inline function getNext():Class<Process>{
		return ProvideSamples;
	}
	/****************************
	* Needed only for validation
	*****************************/
	/*
	override public function validate():Bool
	{
		return true;
	}
	*/
	
}