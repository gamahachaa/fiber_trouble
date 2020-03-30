package flow.activation;

import flow.End;
import process.Descision;

/**
 * ...
 * @author bb
 */
class IsFiberOrMultisurf extends Descision 
{

	override public function create()
	{
		this._nextYesProcesses = [new _GetAdresAndElligibility()];
		this._nextNoProcesses = [new End()];
		super.create();
	}
}