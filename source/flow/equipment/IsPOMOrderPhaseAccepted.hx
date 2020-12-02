package flow.equipment;

import tstool.process.Descision;

/**
 * ...
 * @author bb
 */
class IsPOMOrderPhaseAccepted extends Descision 
{
	override public function onYesClick():Void
	{
		this._nexts = [{step: VtiTrackParcelVisible, params: []}];
		super.onYesClick();
	}
	override public function onNoClick():Void
	{
		this._nexts = [{step: _SoOrderProcessStatusCheck, params: []}];
		super.onNoClick();
	}
}