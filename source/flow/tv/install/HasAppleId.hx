package flow.tv.install;
import tstool.process.Descision;

/**
 * ...
 * @author bb
 */
class HasAppleId extends Descision
{
	override public function create()
	{
		//this._nextNoProcesses = [new _CreateAppleIDorBypass()];
		this._nextNoProcesses = [new CanCreateAppleAccount()];
		this._nextYesProcesses = [new HasSwissAppleID()];
		super.create();
	}
}