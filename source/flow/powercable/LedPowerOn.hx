package flow.powercable;

import flow.nointernet.fiberbox.BoxLedStatus;
//import flow.nointernet.fiberbox._IsBootAbnormal;
import flow.nointernet.so.tckets._SwapBox;
import flow.tickets.CustomerInstruction;
import tstool.process.Descision;

/**
 * @todo ARCHIVE
 * @author ...
 */
class LedPowerOn extends Descision 
{

	//override public function create():Void
	//{
		//this._nextYesProcesses = [new _IsBootAbnormal()];
		//this._nextNoProcesses = [new _SwapBox()];
		//super.create();
	//}
	  override public function onYesClick():Void
	  {
		  this._nexts = [{step: BoxLedStatus, params: []}];
		  super.onYesClick();
	  }
	  override public function onNoClick():Void
	  {
		  this._nexts = [{step: CustomerInstruction, params: [{step: _SwapBox},{step: _SwapBox}]}];
		  super.onNoClick();
	  }
}