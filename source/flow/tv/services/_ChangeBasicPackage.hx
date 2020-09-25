package flow.tv.services;

import flow._AddMemoVti;
import tstool.process.Action;

/**
 * ...
 * @author bb
 */
class _ChangeBasicPackage extends Action 
{

	override public function create()
	{
		this._nextProcesses = [new _AddMemoVti()];
		super.create();
	}
	
}