package flow.tv.remote.salttvv2;

import tstool.process.Descision;

/**
 * ...
 * @author bb
 */
class CanPair extends Descision 
{

	override public function onYesClick():Void
	{
		this._nexts = [{step: IsIssueWithGuide, params: []}];
		super.onYesClick();
	}
	override public function onNoClick():Void
	{
		this._nexts = [{step: IsPairingSuccessfull, params: []}];
		super.onNoClick();
	}
	
}