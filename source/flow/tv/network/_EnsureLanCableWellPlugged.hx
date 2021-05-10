package flow.tv.network;

import tstool.process.Action;

/**
 * ...
 * @author bb
 */
class _EnsureLanCableWellPlugged extends Action 
{
	override public function onClick():Void
	{
		this._nexts = [{step: DidnetworkSolved, params: []}];
		super.onClick();
	}
}