package flow.stability;
import tstool.process.Action;

/**
 * ...
 * @author bb
 */
class _ShareAdviceOptimalWifi extends Action
{
	override public function onClick():Void
	{
		this._nexts = [{step: IsAnyServiceImpactedForNormalUse, params: []}];
		super.onClick();
	}
}