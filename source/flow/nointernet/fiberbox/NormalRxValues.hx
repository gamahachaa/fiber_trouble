package flow.nointernet.fiberbox;

import flow.installation.OTOPlugDamagedNotClicking;
import tstool.process.DescisionMultipleInput;
//import flow.installation._EnsureCorrectPortPlug;
import flow.nointernet.customer._TellCustomerAllOkWithFiberCnx;
import tstool.process.DescisionMultipleInput;
//import tstool.layout.UIInputTfCore;
/**
 * ...
 * @author ...
 Changesd title to "RX values are normal ?"
 */
class NormalRxValues extends DescisionMultipleInput
{
	public function new() 
	{
		super([
		{
			ereg: new EReg("(^-[0-9]{1,2}((,|.)[0-9]{1,3})?$)","i"),
			input:{
				width:100,
				prefix:"VTI RX",
				position:[bottom, left]
			}
		}]);
	}
	override public function create()
	{
		this._nextNoProcesses = [new OTOPlugDamagedNotClicking()];
		this._nextYesProcesses = [new _TellCustomerAllOkWithFiberCnx()];
		super.create();
	}
	override public function onYesClick(){
		if (valueInRange(true)) super.onYesClick();
	}
	override public function onNoClick(){
		if (valueInRange(false)) super.onNoClick();
	}
	function valueInRange( waitingFor:Bool )
	{
		var valueInputField = this.multipleInputs.inputs.get("VTI RX");
		var rxString = valueInputField.getInputedText();
		var rxFloat = Std.parseFloat(rxString);
		#if debug
			trace(rxFloat, (rxFloat > -21.00));
		#end
		valueInputField.blink(true);
		if (rxFloat == Math.NaN || (rxFloat > -21 && !waitingFor ) || (rxFloat < -21 && waitingFor )) {
			//valueInputField.blink(true);
			return false;
		}
		return true;
	}
}