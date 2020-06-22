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
	var devicePrefix:String;
	var downloadPrefix:String;
	var uploadPrefix:String;
	public function new()
	{
		devicePrefix = "device";
		downloadPrefix = "download";
		uploadPrefix = "upload";
		super([
		{
			ereg:~/[a-z0-9][\s\S]*$/i,
			input:{
				width:200,
				prefix:devicePrefix,
				position:bottom
			}
		},
		{
			ereg:~/^\d{1,4}(\.\d{1,2})?$/,
			input:{
				width:100,
				prefix:downloadPrefix,
				position: bottom
			}
		},
		{
			ereg:~/^\d{1,4}(\.\d{1,2})?$/,
			input:{
				width:100,
				prefix:uploadPrefix,
				position: right
			}

		}

		]);
	}
	override public function create():Void
	{
		
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
		if (validate())
		{
			var allTests:Array<Snapshot> = Main.HISTORY.findStepsInHistory("flow.stability._SelectSaltServer", 3, true);
			
			if (Main.HISTORY.isInHistory("flow.salttv.IsImageJerky", Yes) )
			{
				if (Std.parseFloat(this.multipleInputs.inputs.get(downloadPrefix).getInputedText()) > 80)
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
				var twoFourGhz:Float = Std.parseFloat(this.multipleInputs.inputs.get(downloadPrefix).getInputedText());
				var fiveGhz:Float = 0;
				var lan:Float = 1000;
				if (allTests.length == 2)
				{
					lan = Std.parseFloat(allTests[0].values.get(downloadPrefix));
					fiveGhz = Std.parseFloat(allTests[1].values.get(downloadPrefix));
				}
				else{
					fiveGhz = Std.parseFloat(allTests[0].values.get(downloadPrefix));
				}
				//analyse
				
				if (lan > 80 && (fiveGhz > 20 || twoFourGhz > 20))
				{
					
					this._nextProcesses = [new _CNXallGooodMan()];
				}
				else{
					
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
		};
	}
}