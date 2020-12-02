package flow.tv.network;

import flow._AddMemoVti;

import tstool.process.Descision;

/**
 * ...
 * @author bb
 */
class CanReconnectWiFi extends Descision 
{
	override public function onYesClick():Void
	{
		this._nexts = [{step: _AddMemoVti, params: []}];
		super.onYesClick();
	}
	override public function onNoClick():Void
	{
		this._nexts = [{step: CanCheckWithLan, params: []}];
		super.onNoClick();
	}
}