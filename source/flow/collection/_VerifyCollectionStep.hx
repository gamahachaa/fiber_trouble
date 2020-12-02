package flow.collection;

import tstool.process.Action;

/**
 * ...
 * @author ...
 */
class _VerifyCollectionStep extends Action 
{
	override public function onClick():Void
	{
		this._nexts = [{step: IsSaltMistake, params: []}];
		super.onClick();
	}
}