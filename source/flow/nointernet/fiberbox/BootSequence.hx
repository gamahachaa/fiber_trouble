package flow.nointernet.fiberbox;

import flow._AddMemoVti;
import flow.nointernet.customer.FiberCableChanged;
import tstool.process.Descision;

/**b1368316-4ace-4646-a34b-733a2da68efd
 * ...
 * @author ...
 */
class BootSequence extends Descision
{
	override public function onYesClick():Void
	{
		this._nexts = [{step: FiberCableChanged, params: []}];
		super.onYesClick();
	}
	override public function onNoClick():Void
	{
		this._nexts = [{step: _AddMemoVti, params: []}];
		super.onNoClick();
	}

}