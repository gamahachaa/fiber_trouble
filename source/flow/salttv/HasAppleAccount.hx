package flow.salttv;
import process.Descision;

/**
 * ...
 * @author bb
 */
class HasAppleAccount extends Descision
{
	override public function create()
	{
		this._nextNoProcesses = [new _CreateAppleIDorBypass()];
		this._nextYesProcesses = [new IsMessageInvitingToContactCC()];
		super.create();
	}
}