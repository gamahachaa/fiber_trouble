package flow.lan;

import flow.lan.CanCheckWithAppleTVorOtherDevice;
import process.Action;

/**
 * ...
 * @author ...
 */
class _SwapEthernetPort extends Action 
{

	override public function create():Void
		{
			//this._titleTxt = "Essayer sur un autre port Ethernet";
			//this._detailTxt = "";
			//this._illustration = "";
			this._nextProcesses = [new LanConnectionOK()];
			super.create();
		}
	
}