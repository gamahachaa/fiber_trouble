package flow.swapcable;


import process.Descision;

/**
 * ...
 * @author ...
 */
class SwapFiberCable extends Descision
{

	override public function create():Void
	{
		//this._titleTxt = "Il faut échanger le câble de Fibre optique.";
		//this._detailTxt = "Cela peut se faire soit dans un Salt store, soit par la poste.";
		//this._buttonYesTxt = "Store";
		//this._buttonNoTxt = "Post";
		//this._illustration = "";
		this._nextYesProcesses = [new _FiberCableByStore()];
		this._nextNoProcesses = [new _InputShipingAdress()];
		super.create();
	}

}