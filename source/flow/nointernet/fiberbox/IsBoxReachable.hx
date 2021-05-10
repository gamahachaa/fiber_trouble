package flow.nointernet.fiberbox;



import flow.nointernet.vti.ActivationDone;
import flow.nointernet.vti.IsBarred;
import flow.swapcable.SwapFiberCable;
import tstool.process.Descision;

/**
 * ...
 * @author bb
 */
class IsBoxReachable extends Descision 
{
	override public function onYesClick():Void
	{
		this._nexts = [{step: IsBarred, params: []}];
		super.onYesClick();
	}
	override public function onNoClick():Void
	{
		this._nexts = [{step: ActivationDone},{step: SwapFiberCable}];
		super.onNoClick();
	}
}