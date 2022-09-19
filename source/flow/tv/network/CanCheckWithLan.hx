package flow.tv.network;

import flow.tickets.CustomerInstruction;
import flow.tv._CreateSOTicketSaltTV;
import tstool.process.Descision;

/**
 * ...
 * @author bb
 */
class CanCheckWithLan extends Descision 
{
	override public function onYesClick():Void
	{
		this._nexts = [{step: _EnsureLanCableWellPlugged, params: []}];
		super.onYesClick();
	}
	override public function onNoClick():Void
	{
		this._nexts = [{step: CustomerInstruction, params: [{step: _CreateSOTicketSaltTV},{step: _CreateSOTicketSaltTV}]}];
		super.onNoClick();
	}
}