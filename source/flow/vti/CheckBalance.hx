package flow.vti;
import flow.tickets.CreditCheckTicket;
import tstool.process.Descision;

/**
 * ...
 * @author bb
 */
class CheckBalance extends Descision
{
	override public function onYesClick():Void
	{
		this._nexts = [{step: CreditCheckTicket, params: []}];
		super.onYesClick();
	}
	override public function onNoClick():Void
	{
		this._nexts = [{step: _AddMemoVti, params: []}];
		super.onNoClick();
	}
	
}