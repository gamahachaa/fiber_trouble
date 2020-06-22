package flow.nointernet.fiberbox;

import flow.installation.OTOPlugDamagedNotClicking;
import process.DescisionMultipleInput;
//import flow.installation._EnsureCorrectPortPlug;
import flow.nointernet.customer._TellCustomerAllOkWithFiberCnx;
import process.DescisionMultipleInput;
import layout.UIInputTfCore;
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
				position:bottom
			}
		}]);
	}
	override public function create()
	{
		//this._titleTxt = "RX est > -11 dBm ou RX < -18 dBm ?";
		//this._illustration = "vti/rx_values";
		//this._nextNoProcesses = [new _OpenSpeedTest()];
		this._nextNoProcesses = [new OTOPlugDamagedNotClicking()];
		//this._nextYesProcesses = [new _TroubleShootActivation()];
		this._nextYesProcesses = [new _TellCustomerAllOkWithFiberCnx()];
		super.create();
	}
	override public function onYesClick(){
		if (!valueInRange()){
			this._nextYesProcesses = [new OTOPlugDamagedNotClicking()];
		}
		super.onYesClick();
	}
	override public function onNoClick(){
		if (valueInRange()){
			this._nextNoProcesses = [new _TellCustomerAllOkWithFiberCnx()];
		}
		super.onNoClick();
	}
	function valueInRange()
	{
		var rxString = this.multipleInputs.inputs.get("VTI RX").getInputedText();
		var rxFloat = Std.parseFloat(rxString);
		return (rxFloat > -21.00);
	}
}