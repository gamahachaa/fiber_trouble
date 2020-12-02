package flow.nointernet.fiberbox;

//import flixel.addons.ui.FlxUIRadioGroup;
//import flixel.text.FlxText;
import flow.nointernet.postLedChecks.IsSerialNumberCorrect;
import flow.nointernet.so._CreateTicketModemCNX;
import flow.nointernet.so.tckets._SwapBox;
import flow.swapcable.SwapFiberCable;
import tstool.process.Process;
//import tstool.layout.RadioTitle;
//import tstool.process.Action;
import tstool.process.ActionRadios;
//import tstool.process.Triplet;

/**
 * ...
 * @author bb
 */
class BoxLedStatus extends ActionRadios
{

	static inline var _off:String = "Off";
	static inline var _greenStable:String= "Green stable";
	static inline var _greenBlink:String= "Green Blink";
	static inline var _redBlink:String = "Red Blink";
	static inline var _redStable:String= "Red stable";
	static inline var _blink:String= "Blink";
	static inline var _blueBlink:String= "Blue Blink";
	static inline var _blueStable:String= "Blue stable";
	static inline var _normal:String= "Normal";
	static inline var _allGreen:String= "All green";
	static inline var POWER_TITLE:String = "POWER";
	static inline var FIBER_TITLE:String = "FIBER";
	static inline var WWW_TITLE:String = "WWW";
	static inline var WLAN_TITLE:String = "WLAN";
	static inline var WPS_TITLE:String = "WPS";
	static inline var PHONE_TITLE:String = "PHONE";
	static inline var LAN_TITLE:String = "LAN (REAR)";
	

	public function new ()
	{
		super(
			[
		{
			title: POWER_TITLE,
			values: [_off, _greenStable, _blink]
		},
		{
			title: FIBER_TITLE,
			values: [_off, _greenStable, _redStable, _greenBlink, _redBlink]
		},
		{
			title: WWW_TITLE,
			values: [_off, _greenStable, _blink]
		},
		{
			title: WLAN_TITLE,
			values: [_off, _greenStable, _blink]
		},
		{
			title: WPS_TITLE,
			values: [_off, _greenStable, _blink]
		},
		{
			title: PHONE_TITLE,
			values: [_off, _greenStable, _greenBlink, _blueStable, _blueBlink]
		},
		{
			title: LAN_TITLE,
			values: [_normal, _allGreen]
		}
			]
		);
	}

	/****************************
	* Needed only for validation
	*****************************/
	
	override public function onClick():Void
	{
		var next:Class<Process> = null;
		if (validate())
		{
			var powerLED = status.get(POWER_TITLE);
			var fiberLED = status.get(FIBER_TITLE);
			var wwwLED = status.get(WWW_TITLE);
			var rearLanLED = status.get(LAN_TITLE);
			var wlanLED = status.get(WLAN_TITLE);
			var wpsLED = status.get(WPS_TITLE);
			var phoneLED = status.get(PHONE_TITLE);
			
			next = if (Main.HISTORY.isClassInteractionInHistory(flow.nointernet.customer.FiberCableChanged, No)){
				SwapFiberCable;
			}
			else{
				_CreateTicketModemCNX;
			}
			
			next = if (powerLED == _off && fiberLED == _off && wwwLED == _off ){
				_SwapBox;
			}
			else if (powerLED == _greenStable ){
				if (fiberLED == _redStable){
					if (rearLanLED == _allGreen){
						_SwapBox;
					}
					else{
						next;
					}
				}
				else if (fiberLED ==  _greenStable){
					if (wwwLED ==  _greenStable)
						IsBoxReachable;
					else{
						IsSerialNumberCorrect;
					}
				}
				else if (fiberLED ==  _greenBlink){
					IsSerialNumberCorrect;
				}
				else{
					next;
				}
			}
			else if (
				powerLED == _blink &&
				( fiberLED == _greenBlink || fiberLED == _redBlink  ) &&
				wwwLED == _blink &&
				wlanLED == _blink &&
				wpsLED == _blink &&
				( phoneLED == _greenBlink || phoneLED == _blueBlink )
			){
				_SwapBox;
			}
			else{
				next;
			}
			this._nexts = [{step: next, params: []}];
			//trace("flow.nointernet.fiberbox.BoxLedStatus::onClick::this._nexts", this._nexts );
			super.onClick();
		}
		
	}
	
}