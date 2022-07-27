package flow.tv.remote.siri;

import tstool.process.Action;
import tstool.process.Descision;

/**
 * ...
 * @author bb
 */
class DifficultiesWithUsingSiri extends Action 
{
	override public function onClick():Void
	{
		this._nexts = [{step: _AddMemoVti, params: []}];
		super.onClick();
	}
}