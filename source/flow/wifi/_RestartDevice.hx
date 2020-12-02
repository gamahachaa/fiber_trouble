package flow.wifi;
import tstool.process.Action;

/**
 * ...
 * @author ...
 */
class _RestartDevice extends Action 
{
	override public function onClick():Void
	{
		this._nexts = [{step: WifiVisibleOnDevice, params: []}];
		super.onClick();
	}
}