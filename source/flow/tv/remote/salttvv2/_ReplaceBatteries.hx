package flow.tv.remote.salttvv2;
import tstool.process.Action;

/**
 * ...
 * @author bb
 */
class _ReplaceBatteries extends Action
{

	override public function onClick():Void
	{
		this._nexts = [{step: _CreateSOTicketSaltTV, params: []}];
		super.onClick();
	}
}