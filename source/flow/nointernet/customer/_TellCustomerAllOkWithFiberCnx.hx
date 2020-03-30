package flow.nointernet.customer;


import process.Action;

/**
 * ...
 * @author ...
 */
class _TellCustomerAllOkWithFiberCnx extends Action
{
	override public function create():Void
	{
		//this._titleTxt = "Dire au client que tout fonctionne correctement avec la connexion de Fibre optique";
		//this._detailTxt = "";
		//this._illustration = "";
		
		this._nextProcesses = [new ConnectionType()];
		super.create();
	}

}