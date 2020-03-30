package flow.swapcable;

import process.Descision;

/**
 * ...
 * @author bb
 */
class IsShipingToAnotherAdress extends Descision 
{

	override public function create()
	{
		this._nextNoProcesses = [new _FiberCableByPost()];
		this._nextYesProcesses = [ new _InputShipingAdress()];
		super.create();
	}
	
}