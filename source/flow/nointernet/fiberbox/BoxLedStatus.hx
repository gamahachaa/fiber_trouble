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
		var next:Process;
		if (validate())
		{
			/**
			 * @todo String to Class<Process> / isInHistory
			 */
			if (Main.HISTORY.isInHistory("flow.nointernet.customer.FiberCableChanged", No))
			{
				next = new SwapFiberCable();
			}
			else
			{
				next = new _CreateTicketModemCNX();
			}
			if (status.get(POWER_TITLE) == _off && status.get(FIBER_TITLE) == _off && status.get(WWW_TITLE) == _off )
			{
				this._nextProcesses = [new _SwapBox()];
			}
			else if (status.get(POWER_TITLE) == _greenStable )
			{
				if (status.get(FIBER_TITLE) == _redStable)
				{
					if (status.get(LAN_TITLE) == _allGreen)
					{
						this._nextProcesses = [new _SwapBox()];
					}
					else
					{
						this._nextProcesses = [next];
					}
				}
				else if (status.get(FIBER_TITLE) ==  _greenStable)
				{
					if (status.get(WWW_TITLE) ==  _greenStable)
						this._nextProcesses = [new IsBoxReachable()];
					else
					{
						this._nextProcesses = [new IsSerialNumberCorrect()];
					}
				}
				else if (status.get(FIBER_TITLE) ==  _greenBlink)
				{
					this._nextProcesses = [new IsSerialNumberCorrect()];
				}
				else
				{
					this._nextProcesses = [next];
				}
			}
			else if (
				status.get(POWER_TITLE) == _blink &&
				( status.get(FIBER_TITLE) == _greenBlink || status.get(FIBER_TITLE) == _redBlink  ) &&
				status.get(WWW_TITLE) == _blink &&
				status.get(WLAN_TITLE) == _blink &&
				status.get(WPS_TITLE) == _blink &&
				( status.get(PHONE_TITLE) == _greenBlink || status.get(PHONE_TITLE) == _blueBlink )
			)
			{
				this._nextProcesses = [new _SwapBox()];
			}
			else
			{
				this._nextProcesses = [next];
			}
		}
		super.onClick();
	}
}