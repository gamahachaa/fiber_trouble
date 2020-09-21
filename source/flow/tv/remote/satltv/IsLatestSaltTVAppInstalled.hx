package flow.tv.remote.satltv;

import flow.tv.app._CheckIfAppNeedsUpdate;
import flow.tv.install.IsSaltIconVisibleOnAppleTV;
import flow.tv.remote.DoesAppleTVLedBlinks;
import tstool.process.Descision;

/**
 * ...
 * @author bb
 */
class IsLatestSaltTVAppInstalled extends Descision 
{
	override public function create()
	{
		this._nextNoProcesses = [new _CheckIfAppNeedsUpdate()];
		this._nextYesProcesses = [new DoesAppleTVLedBlinks(new IsSaltIconVisibleOnAppleTV(), new _SteupSaltTVRemoteWithRegularTV())];
		super.create();
	}
}