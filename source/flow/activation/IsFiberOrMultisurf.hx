package flow.activation;

import flow.End;
import tstool.process.Descision;

/**
 * ...
 * @author bb
 */
class IsFiberOrMultisurf extends Descision 
{

	override public function create()
	{
		this._nextYesProcesses = [new _GetAdresAndElligibility()];
		this._nextNoProcesses = [new flow.End()];
		super.create();
	}
}