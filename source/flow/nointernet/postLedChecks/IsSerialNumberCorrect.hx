package flow.nointernet.postLedChecks;

import flow.installation._EnsureNoLanLoop;
import flow.nointernet.so.tckets._SwapBox;
import flow.tickets.CustomerInstruction;
import tstool.process.DescisionMultipleInput;
import tstool.utils.ExpReg;


class IsSerialNumberCorrect extends DescisionMultipleInput
{
	//static inline var BOX_SERIAL:String = "^(SFAA|GFAB)?[0-9]{8}$";
	static inline var SERIAL_PREFIX:String = "Serial Nb";
	public function new()
	{
		super(
		[
		{
			ereg: new EReg(ExpReg.BOX_SERIAL,"gi"),
			input:{
				width:150,
				prefix:SERIAL_PREFIX,
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
		//this._nexts = [{step: _SwapBox, params: []}];
		this._nexts = [{step: CustomerInstruction, params: [
													{step: _SwapBox},
													{step: _SwapBox}
												]
			}];
		super.onNoClick();
	}
}