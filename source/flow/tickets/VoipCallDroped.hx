package flow.tickets;
import tstool.salt.SOTickets;

/**
 * ...
 * @author bb
 */
class VoipCallDroped extends ActionTicketFiberTrouble 
{

	public function new() 
	{
		//super("5.2.1 :: Technical - Modem-Router - Modem Connection", Main.TECH_HIGH);
		super(SOTickets.FIX_531_CallDropped);
		//mail.setSubject("LanIssue", this);
	}
	override public function onClick():Void
	{
		this._nexts = [{step: _AddMemoVti, params: []}];
		super.onClick();
	}
	
}