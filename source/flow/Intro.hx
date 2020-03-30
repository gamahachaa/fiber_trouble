package flow;

import flow.nointernet.vti.CheckContractorVTI;
import flow.wifi.WifiOnInDashboard;
import process.Descision;
import process.Process;
//import lime.app.Event;
//import openfl.desktop.Clipboard as OPCLIP;
//import lime.system.Clipboard;
//import openfl.desktop.ClipboardFormats;
//import openfl.desktop.ClipboardTransferMode;
import process.Action;
//import process.Process;

class Intro extends Action
{
	override public function create():Void
	{
		Process.INIT();


		//this._nextYesProcesses = [new CheckContractorVTI()];
		//this._nextNoProcesses = [new CheckContractorVTI()];
		this._nextProcesses = [new CheckContractorVTI()];
		//trace(OPCLIP.generalClipboard.getData(ClipboardFormats.TEXT_FORMAT, ClipboardTransferMode.CLONE_PREFERRED));
		//var e = new Event<Void->Void>();
		//lime.system.Clipboard.onUpdate = e;
		//e.add(function(){trace("CLIPBOARD " + lime.system.Clipboard.text); });
		//lime.system.Clipboard.text = "YO";
		//e.dispatch();
 		super.create();

	}
	
	
}