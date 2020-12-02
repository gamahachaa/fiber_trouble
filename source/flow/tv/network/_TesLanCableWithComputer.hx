package flow.tv.network;

import flow.tv._CreateSOTicketSaltTV;
import tstool.process.Action;

/**
 * ...
 * @author bb
 */
class _TesLanCableWithComputer extends Action 
{
	override public function onClick():Void
	{
		this._nexts = [{step: _CreateSOTicketSaltTV, params: []}];
		super.onClick();
	}
}