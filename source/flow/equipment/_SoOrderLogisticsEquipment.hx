package flow.equipment;

import process.ActionMail;

/**
 * ...
 * @author bb
 */
class _SoOrderLogisticsEquipment extends ActionMail 
{

	public function new() 
	{
		super(Main.FIX_421);
	}
	override public function create():Void
	{
		this._nextProcesses = [];
		super.create();
	}
	
}