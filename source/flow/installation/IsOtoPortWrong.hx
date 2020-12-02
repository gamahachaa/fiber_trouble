package flow.installation;

//import flow.nointernet.so._CreateTicketModemCNX;
import tstool.process.Descision;

/**
 * ...
 * @author bb
 */
class IsOtoPortWrong extends Descision 
{
	override public function onYesClick():Void
	{
		this._nexts = [{step: OTOPlugDamagedNotClicking, params: []}];
		super.onYesClick();
	}
	override public function onNoClick():Void
	{
		this._nexts = [{step: OTOPlugDamagedNotClicking, params: []}];
		super.onNoClick();
	}
}