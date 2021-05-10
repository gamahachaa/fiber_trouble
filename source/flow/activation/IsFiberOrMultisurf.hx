package flow.activation;

import flow.End;
import tstool.process.Descision;

/**
 * ...
 * @author bb
 */
class IsFiberOrMultisurf extends Descision 
{

	//override public function create()
	//{
		//this._nextYesProcesses = [new _GetAdresAndElligibility()];
		//this._nextNoProcesses = [new flow.End()];
		//super.create();
	//}
	override public function onYesClick():Void
	{
		this._nexts = [{step: _GetAdresAndElligibility, params: []}];
		super.onYesClick();
	}
	override public function onNoClick():Void
	{
		this._nexts = [{step: End, params: []}];
		super.onNoClick();
	}
}