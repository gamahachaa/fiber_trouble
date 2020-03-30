package flow.nointernet.so;

//import flow.nointernet.so.ModemConnectionTicketOpen;
import process.Action;
//import source.flow.descisions.ModemConnectionTicketOpen;

/**
 * ...
 * @author
 */
class _InformTicketStatus extends Action
{

	override public function create():Void
	{
		//this._titleTxt = "Informer le client sur le status du ticket.";
		//this._detailTxt = "Saisir les infos manquantes si notées dans le ticket.";
		//this._illustration = "general/conversation";
		this._nextProcesses = [new SustomerIsRecaller()];
		super.create();
	}
}