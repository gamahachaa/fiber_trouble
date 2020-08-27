package flow.nointernet.postLedChecks;

import flow.installation._EnsureNoLanLoop;
import flow.nointernet.so.tckets._SwapBox;
//import flow.nointernet.customer.FiberCableChanged;
//import tstool.layout.UIInputTfCore;
//import process.DescisionInput;
import tstool.process.DescisionMultipleInput;


class IsSerialNumberCorrect extends DescisionMultipleInput
{
	public function new()
	{
		super(
		[
		{
			ereg: new EReg("^(SFAA)?[0-9]{8}$","gi"),
			input:{
				width:150,
				prefix:"Serial N°",
				position:[bottom, left]
			}
	}]);
		//super(150, "Serial N°",~/^(SFAA)?[0-9]{8}$/gi);
	}
	override public function create()
	{
		this._nextYesProcesses = [new _EnsureNoLanLoop()];
		this._nextNoProcesses = [new _SwapBox()];
		super.create();
	}
}