package flow.tv.remote.salttvv2;

import tstool.process.Descision;

/**
 * ...
 * @author bb
 */
class IsPairingSuccessfull extends Descision 
{

	override public function onNoClick():Void
	{
		this._nexts = [{step: _ReplaceBatteries, params: []}];
		super.onNoClick();
	}
	override public function onYesClick():Void
	{
		this._nexts = [{step: ChekSaltTVKNownBugs, params: []}];
		super.onYesClick();
	}
}