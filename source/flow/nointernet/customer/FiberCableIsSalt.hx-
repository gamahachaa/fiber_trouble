package flow.nointernet.customer;

//import flow.nointernet.postLedChecks.WasInternetWorkingBefore;
import flow.swapcable.SwapFiberCable;
import tstool.process.Descision;

/**
 * @todo ARCHIVE
 * @author ...
 */
class FiberCableIsSalt extends Descision
{

	override public function onYesClick():Void
	{
		this._nexts = [{step: SwapFiberCable, params: []}];
		super.onYesClick();
	}
	override public function onNoClick():Void
	{
		this._nexts = [{step: SwapFiberCable, params: []}];
		super.onNoClick();
}
}