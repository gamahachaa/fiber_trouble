package flow.tv.hardware;

import flow.tv.install.IsSaltIconVisibleOnAppleTV;
import tstool.process.Descision;
import tstool.process.Process;

/**
 * ...
 * @author bb
 */
class IsAppleTVvisibleOnTVScreen extends Descision
{
	override public function onYesClick():Void
	{
		this._nexts = [{step: IsSaltIconVisibleOnAppleTV, params: []}];
		super.onYesClick();
	}
	override public function onNoClick():Void
	{
		var nextNo:Class<Process> = 
		if (Main.HISTORY.isClassInteractionInHistory(flow.tv.hardware._MakeSurePowerCableWellPlugged, Next ))
		{
			/*******************************
			 * N°2
			/*******************************/
			 _RepairProcess;
		}
		else
		{
			/*******************************
			 * N°1
			/*******************************/
			_MakeSurePowerCableWellPlugged;
		}
		this._nexts = [{step: nextNo, params: []}];
		super.onNoClick();
	}
}