package flow.activation;

import flow.End;
import tstool.process.Action;

/**
 * ...
 * @author bbaudry
 */
class SendTicketToTLPool extends Action 
{
	override public function onClick():Void
	{
		this._nexts = [{step: End, params: []}];
		super.onClick();
	}
}