package flow.stability;

import flixel.FlxG;
import flow.salttv._ConnectAppleTVtoOneGhz;
import flow.wifi._ConnectWiFIToFiveGH;
import flow.wifi._ConnectWiFIToTwoDotFourGH;
import layout.History.Snapshot;
import process.Action;
import process.ActionMultipleInput;

/**
 * ...
 * @author ...
 */
class _SelectSaltServer extends ActionMultipleInput
{
	public function new()
	{
		super([
		{
			ereg:~/[\s\S]*/i,
			input:{
				width:200,
				prefix:"Device",
				position:bottom
			}
		},
		{
			ereg:~/^\d{0,4}(\.\d{1,2})?$/,
			input:{
				width:100,
				prefix:"Download",
				position: bottom
			}

		},
		{
			ereg:~/^\d{0,4}(\.\d{1,2})?$/,
			input:{
				width:100,
				prefix:"Upload",
				position: right
			}

		}

		]);
	}
	override public function create():Void
	{
		//this._titleTxt = "Sélectionner le serveur Salt";
		//this._detailTxt = "Préssez le boutton GO au centre de l'écran
		//\nPatientez ~30s que les
		//\ncalculs se fassent
		//\nRépetter une ou deux fois";
		//this._illustration = "";
		//this._nextProcesses = [new LanOrWiFi()];
		//if (Main.HISTORY.isInHistory("flow.wifi._ConnectAppleTVtoOneGhz", Next) )
		//{
		//// check Values
		//var allTests = Main.HISTORY.findStepsInHistory("flow.stability._SelectSaltServer", 3);
		////switch (allTests.length)
		////{
		////case 3 :
		////case 2 :
		////default
		////}
//
		//}
		//if (Main.HISTORY.isInHistory("flow.wifi._ConnectWiFIToFiveGH", Next) )
		//{
		//this._nextProcesses = [new _ConnectAppleTVtoOneGhz()];
		//}
		//else if (Main.HISTORY.isInHistory("flow.stability.HasAppleTV", Yes) || Main.HISTORY.isInHistory("flow.stability.HasLANDevice", Yes))
		//{
		//this._nextProcesses = [new _ConnectWiFIToFiveGH()];
		//}
		if (!Main.HISTORY.isInHistory("flow.wifi._ConnectWiFIToFiveGH", Next) && !Main.HISTORY.isInHistory("flow.wifi._ConnectWiFIToTwoDotFourGH", Next)){
			this._titleTxt += " (LAN speedtest)";
		}
		else if (Main.HISTORY.isInHistory("flow.wifi._ConnectWiFIToFiveGH", Next) && !Main.HISTORY.isInHistory("flow.wifi._ConnectWiFIToTwoDotFourGH", Next)){
			this._titleTxt += " (WiFi 5Ghz speedtest)";
		}
		else if (Main.HISTORY.isInHistory("flow.wifi._ConnectWiFIToFiveGH", Next) && Main.HISTORY.isInHistory("flow.wifi._ConnectWiFIToTwoDotFourGH", Next)){
			this._titleTxt += " (WiFi 2.4Ghz speedtest)";
		}
		
		super.create();
		//FlxG.stage.focus = multipleInputs.first.inputtextfield;
		
	}
	override public function onClick()
	{
		var allTests:Array<Snapshot> = Main.HISTORY.findStepsInHistory("flow.stability._SelectSaltServer", 3, true);
		trace(allTests);
		if (Main.HISTORY.isInHistory("flow.salttv.IsImageJerky", Yes) )
		{
			if (Std.parseFloat(this.multipleInputs.inputs.get("Download").getInputedText()) > 80)
			{
				this._nextProcesses = [new _CNXallGooodMan()];
			}
			else{
				this._nextProcesses = [new _BadOutstandingFlows()];
			}
		}
		else if (Main.HISTORY.isInHistory("flow.wifi._ConnectWiFIToTwoDotFourGH", Next) )
		{
			//compare values
			//this._nextProcesses = [new _ConnectAppleTVtoOneGhz()];
			var twoFourGhz:Float = Std.parseFloat(this.multipleInputs.inputs.get("Download").getInputedText());
			var fiveGhz:Float = 0;
			var lan:Float = 1000;
			if (allTests.length == 2)
			{
				lan = Std.parseFloat(allTests[0].values.get("Download"));
				fiveGhz = Std.parseFloat(allTests[1].values.get("Download"));
			}
			else{
				fiveGhz = Std.parseFloat(allTests[0].values.get("Download"));
			}
			//analyse
			trace("lan",lan);
			trace("fiveGhz",fiveGhz);
			trace("twoFourGhz",twoFourGhz);
			if (lan > 80 && (fiveGhz > 20 || twoFourGhz > 20))
			{
				trace("_CNXallGooodMan");
				this._nextProcesses = [new _CNXallGooodMan()];
			}
			else{
				trace("_BadOutstandingFlows");
				this._nextProcesses = [new _BadOutstandingFlows()];
			}
			
		}
		else if (Main.HISTORY.isInHistory("flow.wifi._ConnectWiFIToFiveGH", Next) )
		{
			this._nextProcesses = [new _ConnectWiFIToTwoDotFourGH()];
		}
		else if (Main.HISTORY.isInHistory("flow.stability.HasAppleTV", Yes) || Main.HISTORY.isInHistory("flow.stability.HasLANDevice", Yes))
		{
			this._nextProcesses = [new _ConnectWiFIToFiveGH()];
		}

		super.onClick();

	}
}