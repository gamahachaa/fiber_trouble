package flow.tv.network;

import flow._AddMemoVti;
import flow.tv.CanExploreMenu;
import tstool.process.Descision;

/**
 * ...
 * @author bb
 */
class DidnetworkSolved extends Descision 
{

	override public function create()
	{
		this._nextNoProcesses = [ new _TesLanCableWithComputer()];
		this._nextYesProcesses = [new CanExploreMenu()];
		super.create();
	}
	
}