package flow.stability;

import flow.nointernet.so._CreateTicketModemCNX;
import process.Action;

/**
 * ...
 * @author ...
 */
class _BadOutstandingFlows extends Action
{

	override public function create():Void
	{
		//this._titleTxt = "Les flux sont anormalement lents";
		//this._detailTxt = "Rebbot BOX\nSuivre la séquence de led pour voir si tout est ok ouvrir Box Admin\nNoter RX/TX";
		//this._illustration = "";
		this._nextProcesses = [new _CreateTicketModemCNX()];
		super.create();
	}

}