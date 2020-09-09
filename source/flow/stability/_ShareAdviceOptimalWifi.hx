package flow.stability;
import tstool.process.Action;

/**
 * ...
 * @author bb
 */
class _ShareAdviceOptimalWifi extends Action
{

	override public function create()
	{
		this._nextProcesses = [new IsAnyServiceImpactedForNormalUse()];
		super.create();
	}
	
}