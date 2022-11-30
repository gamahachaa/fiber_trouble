package flow.tv.remote.siri;

import tstool.process.Action;

/**
 * ...
 * @author bb
 */
class _GetCloseToAppleTV extends Action 
{
	override public function onClick():Void
	{

		this._nexts = [{step: 
			switch (Main.HISTORY.findValueOfFirstClassInHistory( WichRemote, WichRemote.REMOTE_VERSION).value)
			{
				case WichRemote.SIRI_V2 : _PressBackAndVolUp ;
				case _ : _PressMenuAndPlus;
			}
		}];
		super.onClick();
	}
}