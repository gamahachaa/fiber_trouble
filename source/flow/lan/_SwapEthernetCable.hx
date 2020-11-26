package flow.lan;

import tstool.process.Action;

/**
 * ...
 * @author ...
 */
class _SwapEthernetCable extends Action
{

	override public function create():Void
	{
		//this._titleTxt = "Essayer avec un autre câble Ethernet";
		//this._detailTxt = "Et refaire les tests";
		//this._illustration = "";
		this._nextProcesses = [new LanConnectionOK()];
		super.create();
	}
}