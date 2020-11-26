package flow.tv.install;
import tstool.process.Descision;

/**
 * ...
 * @author bb
 */
class HasSwissAppleID extends Descision
{
	override public function create()
	{
		//this._nextNoProcesses = [new _CreateAppleIDorBypass()];
		this._nextNoProcesses = [new WantToChangeToSwiss()];
		this._nextYesProcesses = [new _LogInWithSwissAppleID()];
		super.create();
	}
}