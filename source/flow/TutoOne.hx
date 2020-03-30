package flow;

import flixel.FlxG;
import flow.nointernet.vti.CheckContractorVTI;
import flow.wifi.WifiOnInDashboard;
import haxe.Http;
import haxe.Json;
import haxe.crypto.Base64;
import haxe.ds.StringMap;
import haxe.io.Bytes;
import js.html.UnknownElement;
import process.Action;
import process.Process;

class TutoOne extends Action
{
	override public function create():Void
	{
		Process.INIT();
		this._nextProcesses = [new TutoTree()];
		super.create();
		this.details.text = Main.user.firstName + ",\n\n" + this._detailTxt;
	}
	function onData(data:String)
	{
		var d = Json.parse(data);
		trace(d);
	}
}