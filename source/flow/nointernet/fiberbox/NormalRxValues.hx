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
		//super(100, "RX" , new EReg("(^-?[0-9,.]{1,6}$)|(^aaa$)","i"));
		//super(100, "RX" , new EReg("(^-[0-9]{1,2}((,|.)[0-9]{1,3})?$)", "i"), new EReg("(^-[0-9]{1,2}((,|.)[0-9]{1,3})?$)", "i"));
		super([
		{
			ereg: new EReg("(^-[0-9]{1,2}((,|.)[0-9]{1,3})?$)","i"),
			input:{
				width:100,
				prefix:"RX",
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
}