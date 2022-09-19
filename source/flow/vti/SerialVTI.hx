package flow.vti;

import regex.ExpReg;
import tstool.process.ActionMultipleInput;
import tstool.process.Process;

/**
 * ...
 * @author bb
 */
class SerialVTI extends ActionMultipleInput
{
	static inline var SERIAL_PREFIX:String = "Serial Nb";
	var vals:Map<String,String>;
	public function new()
	{
		super([{
			ereg: new EReg(ExpReg.BOX_WHITE_SERIAL,"gi"),
			input:{
				width:150,
				prefix:SERIAL_PREFIX,
				debug: "SFAA12345678",
				position:[bottom, left]
			}
		}]);
	}

	override public function onClick():Void
	{
		if (validate())
		{
			checkSN();
			this._nexts = [ {step: _RXfromVTI}];
			super.onClick();
		}
	}

	function checkSN()
	{
		vals = [for (k => v in multipleInputs.inputs) k => v.getInputedText()];
		var _index = Main.SN_TAB.lastIndexOf(multipleInputs.inputs.get(SERIAL_PREFIX).getInputedText()) ;
		if (_index > -1)
		{
			vals.set("Chipset", Main.snTabRecord[_index][1]);
		}
	}
	override function pushToHistory( buttonTxt:String, interactionType:tstool.layout.History.Interactions,?values:Map<String,Dynamic>=null)
	{
		super.pushToHistory( buttonTxt, interactionType, vals);
	}
}