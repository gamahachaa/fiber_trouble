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
	override public function onYesClick():Void
	{
		this._nexts = [{step: CanExploreMenu, params: []}];
		super.onYesClick();
	}
	override public function onNoClick():Void
	{
		this._nexts = [{step: _TesLanCableWithComputer, params: []}];
		super.onNoClick();
	}
}