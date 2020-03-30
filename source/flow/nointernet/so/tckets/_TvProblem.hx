package flow.nointernet.so.tckets;

import process.ActionMail;

/**
 * ...
 * @author bb
 */
class _TvProblem extends ActionMail 
{
	public function new() 
	{
		//super("5.4.1 :: Technical - TV and Video Services - Salt TV problem", Main.TECH_LOW);
		super(Main.FIX_541);
	}

	override public function create()
	{
		this._nextProcesses = [];
		super.create();
	}
	
}