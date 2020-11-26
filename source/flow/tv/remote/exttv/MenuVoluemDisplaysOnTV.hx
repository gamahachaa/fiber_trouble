package flow.tv.remote.exttv;

import flow.tv.ChekSaltTVKNownBugs;
import tstool.process.Descision;

/**
 * ...
 * @author bb
 */
class MenuVoluemDisplaysOnTV extends Descision 
{

	override public function create()
	{
		this._nextNoProcesses =  [new _PressMenuAndOK(), new ChekSaltTVKNownBugs() ];
		this._nextYesProcesses = [new _ClickOKOnRemote()];
		super.create();
	}
	
}