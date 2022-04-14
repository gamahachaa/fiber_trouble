package flow.installation;

import flow.nointernet.fiberbox.SendSMSReadRxTX;
import tstool.process.Action;


class _EnsureNoLanLoop extends Action 
{
	override public function onClick():Void
	{	
		this._nexts = [{step: SendSMSReadRxTX}];
		super.onClick();
	}
}