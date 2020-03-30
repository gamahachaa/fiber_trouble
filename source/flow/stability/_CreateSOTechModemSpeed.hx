package flow.stability;

import flow.all.vti._AddMemoVti;
import process.ActionMail;

/**
 * ...
 * @author bb
 */
class _CreateSOTechModemSpeed extends ActionMail 
{
	public function new() 
	{
		super(Main.FIX_525);
	}
	override public function create():Void
	{
		this._nextProcesses = [new _AddMemoVti()];
		super.create();
	}
}