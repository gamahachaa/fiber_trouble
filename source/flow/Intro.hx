package flow;

import flow.all.customer.IsSlowOrKaput;
import flow.nointernet.vti.CheckContractorVTI;
import flow.wifi.WifiOnInDashboard;
import process.Descision;
import process.Process;
import process.Action;
import process.Triplet;
//import process.Process;

//class Intro extends Descision
class Intro extends Triplet
{
	override public function create():Void
	{
		Process.INIT();
		trace("WTF"); 
		var next = new CheckContractorVTI();
		this._nextYesProcesses = [new IsSlowOrKaput()];
		this._nextNoProcesses = [ next];
		this._nextMidProcesses = [ next];
		//this._nextProcesses = [new WifiOnInDashboard()];
		//trace(OPCLIP.generalClipboard.getData(ClipboardFormats.TEXT_FORMAT, ClipboardTransferMode.CLONE_PREFERRED));
		//var e = new Event<Void->Void>();
		//lime.system.Clipboard.onUpdate = e;
		//e.add(function(){trace("CLIPBOARD " + lime.system.Clipboard.text); });
		//lime.system.Clipboard.text = "YO";
		//e.dispatch();
 		super.create();

	}
	
	
}