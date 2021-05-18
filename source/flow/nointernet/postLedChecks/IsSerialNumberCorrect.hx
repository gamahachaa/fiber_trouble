package flow.nointernet.postLedChecks;

import flow.installation._EnsureNoLanLoop;
import flow.nointernet.so.tckets._SwapBox;
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
				prefix:"Serial Nb",
				debug: "SFAA12345678",
				position:[bottom, left]
			}
	}]);
		//super(150, "Serial N°",~/^(SFAA)?[0-9]{8}$/gi);
	}
	override public function onYesClick():Void
	{
		this._nexts = [{step: _EnsureNoLanLoop, params: []}];
		super.onYesClick();
	}
	override public function onNoClick():Void
	{
		this._nexts = [{step: _SwapBox, params: []}];
		super.onNoClick();
	}
}