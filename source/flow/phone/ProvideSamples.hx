package flow.phone;

import regex.ExpReg;
import tstool.process.ActionMultipleInput;
import tstool.process.Process;

/**
 * ...
 * @author bb
 */
class ProvideSamples extends ActionMultipleInput
{
	static inline var Expl_I_CountryCode:String = "Expl_I_CountryCode";
	static inline var Expl_II_CountryCode:String = "Expl_II_CountryCode";
	static inline var Expl_III_CountryCode:String = "Expl_III_CountryCode";
	static inline var Expl_I_PhoneNber:String = "Expl_I_PhoneNber";
	static inline var Expl_II_PhoneNber:String = "Expl_II_PhoneNber";
	static inline var Expl_III_PhoneNber:String = "Expl_III_PhoneNber";
	static inline var Expl_I_Date:String = "Expl_I_Date";
	static inline var Expl_II_Date:String = "Expl_II_Date";
	static inline var Expl_III_Date:String = "Expl_III_Date";
	static inline var Expl_I_Time:String = "Expl_I_Time";
	static inline var Expl_II_Time:String = "Expl_II_Time";
	static inline var Expl_III_Time:String = "Expl_III_Time";
	public function new ()
	{
		super([
		{
			ereg: new EReg(ExpReg.INTL_CODE,"i"),
			input:{
				width:180,
				prefix:Expl_I_CountryCode,
				position: [bottom, left],
				debug: "0033",
				mustValidate: [Next]
			}
		},
		{
			ereg: new EReg(ExpReg.INTL_NUMBER,"i"),
			input:{
				width:180,
				buddy: Expl_I_CountryCode,
				prefix:Expl_I_PhoneNber,
				position: [top, right],
				debug: "476879865",
				mustValidate: [Next]
			}
		},
		{
			ereg: new EReg(ExpReg.DATE_REG,"i"),
			input:{
				width:160,
				buddy: Expl_I_PhoneNber,
				prefix : Expl_I_Date,
				position: [top, right],
				debug: "01.01.2021",
				mustValidate: [Next]
			}
		},
		{
			ereg: new EReg(ExpReg.TIME,"i"),
			input:{
				width:200,
				buddy: Expl_I_Date,
				prefix : Expl_I_Time,
				position: [top, right],
				debug: "21h30",
				mustValidate: [Next]
			}
		},
		{
			ereg: new EReg(ExpReg.INTL_CODE,"i"),
			input:{
				width:180,
				prefix:Expl_II_CountryCode,
				buddy: Expl_I_CountryCode,
				position: [bottom, left],
				mustValidate: [Exit]
			}
		},
		{
			ereg: new EReg(ExpReg.INTL_NUMBER,"i"),
			input:{
				width:180,
				buddy: Expl_I_PhoneNber,
				prefix:Expl_II_PhoneNber,
				position: [bottom, left],
				mustValidate: [Exit]
			}
		},
		{
			ereg: new EReg(ExpReg.DATE_REG,"i"),
			input:{
				width:160,
				buddy: Expl_II_PhoneNber,
				prefix : Expl_II_Date,
				position: [top, right],
				mustValidate: [Exit]
			}
		},
		{
			ereg: new EReg(ExpReg.TIME,"i"),
			input:{
				width:200,
				buddy: Expl_II_Date,
				prefix : Expl_II_Time,
				position: [top, right],
				mustValidate: [Exit]
			}
		},
		{
			ereg: new EReg(ExpReg.INTL_CODE,"i"),
			input:{
				width:180,
				prefix:Expl_III_CountryCode,
				buddy: Expl_II_CountryCode,
				position: [bottom, left],
				mustValidate: [Exit]
			}
		},
		{
			ereg: new EReg(ExpReg.INTL_NUMBER,"i"),
			input:{
				width:180,
				buddy: Expl_II_PhoneNber,
				prefix:Expl_III_PhoneNber,
				position: [bottom, left],
				mustValidate: [Exit]
			}
		},
		{
			ereg: new EReg(ExpReg.DATE_REG,"i"),
			input:{
				width:160,
				buddy: Expl_III_PhoneNber,
				prefix : Expl_III_Date,
				position: [top, right],
				mustValidate: [Exit]
			}
		},
		{
			ereg: new EReg(ExpReg.TIME,"i"),
			input:{
				width:200,
				buddy: Expl_III_Date,
				prefix : Expl_III_Time,
				position: [top, right],
				mustValidate: [Exit]
			}
		}
		]);
	}

	override public function onClick():Void
	{
		if (validate())
		{
			this._nexts = [ {step: getNext(), params: []}];
			super.onClick();
		}
	}
	inline function getNext():Class<Process>
	{
		return InputDeviceNameAndBrand;
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