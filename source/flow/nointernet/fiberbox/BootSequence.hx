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

	override public function create():Void
	{
		//this._titleTxt = "La sequence de boot est elle :?";
		//this._detailTxt = "\t- Fiber LED RED (steady/blinking),\n\t - Fiber LED GREEN BLINKING,\n WWW OFF,\n Fiber LED OFF";
		//this._illustration = "";
		this._nextYesProcesses = [new FiberCableChanged()];
		this._nextNoProcesses = [new flow._AddMemoVti()];
		super.create();
	}

}