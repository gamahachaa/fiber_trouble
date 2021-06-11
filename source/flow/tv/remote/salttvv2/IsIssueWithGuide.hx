package flow.tv.remote.salttvv2;

import tstool.process.Descision;

/**
 * ...
 * @author bb
 */
class IsIssueWithGuide extends Descision 
{

	override public function onYesClick():Void
	{
		this._nexts = [{step: ChekSaltTVKNownBugs, params: []}];
		super.onYesClick();
	}
	override public function onNoClick():Void
	{
		this._nexts = [{step: _CollectIssue, params: []}];
		super.onNoClick();
	}
	
}