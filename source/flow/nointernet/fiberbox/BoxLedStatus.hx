package flow.nointernet.fiberbox;

//import flixel.addons.ui.FlxUIRadioGroup;
//import flixel.text.FlxText;
import flow.nointernet.customer.DidJustMoved;
import flow.powercable.LedPowerOn;
//import flow.nointernet.customer.FiberCableChanged;
import flow.nointernet.postLedChecks.IsSerialNumberCorrect;
//import flow.nointernet.so._CreateTicketModemCNX;
import flow.nointernet.so.tckets._SwapBox;
import flow.nointernet.vti.CheckContractorVTI;
//import flow.swapcable.SwapFiberCable;
import flow.tickets.CustomerInstruction;
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

	/***************************************
	 * COLORS
	/***************************************/
	static inline var _off:String = "Off";
	static inline var _whiteStable:String= "White Stable";
	static inline var _whiteBlink:String = "White Blink";
	
	public static inline var _greenStable:String= "Green stable";
	static inline var _greenBlink:String= "Green Blink";
	static inline var _redBlink:String = "Red Blink";
	static inline var _alternateBlink:String = "Green Blink 30s Red stable 3s";
	static inline var _redStable:String= "Red stable";
	static inline var _blink:String= "Blink";
	static inline var _blueBlink:String= "Blue Blink";
	static inline var _blueStable:String= "Blue stable";
	static inline var _normal:String= "Normal";
	static inline var _allGreen:String = "All green";
	
	/****************************************
	 * LEDS
	/****************************************/
	
	static inline var POWER_TITLE:String = "1.POWER";
	public static inline var FIBER_TITLE:String = "2.FIBER";
	static inline var WWW_TITLE:String = "3.WWW";
	static inline var WLAN_TITLE:String = "4.WLAN";
	static inline var WPS_TITLE:String = "5.WPS";
	static inline var PHONE_TITLE:String = "6.PHONE";
	static inline var LAN_TITLE:String = "7.LAN (REAR)";
	// Sagem
	public static inline var FIBER_SAGEM_TITLE:String = "2.FIBRE";
	static inline var INTERNET_TITLE:String = "3.INTERNET";
	static inline var WIFI_TITLE:String = "5.WIFI";
	static inline var PHONE_SAGEM_TITLE:String = "4.PHONE";
	static inline var COMBO_TITLE:String = "6.+(WPS/DECT)";
	var sagem:Bool;
	

	public function new ()
	{
		
		if (chekcIfSagem())
		{
			super(
			[
				{
					title: POWER_TITLE,
					hasTranslation:true,
					values: [_off, _whiteStable, _redBlink]
				},
				{
					title: FIBER_SAGEM_TITLE,
					hasTranslation:true,
					values: [_off, _whiteStable, _whiteBlink,_redStable, _redBlink]
				},
				{
					title: INTERNET_TITLE,
					hasTranslation:true,
					values: [_off, _whiteStable, _redStable]
				}
				,
				{
					title: PHONE_SAGEM_TITLE,
					hasTranslation:true,
					values: [_off, _whiteStable, _whiteBlink, _redStable]
				},
				{
					title: WIFI_TITLE,
					hasTranslation:true,
					values: [_off, _whiteStable]
				},
				{
					title: COMBO_TITLE,
					hasTranslation:true,
					values: [_off, _whiteStable]
				}
			]);
		}
		else
		{
			super(
			[
				{
					title: POWER_TITLE,
					hasTranslation:true,
					values:[_off, _greenStable, _blink]
				},
				{
					title: FIBER_TITLE,
					hasTranslation:true,
					values: [_off, _greenStable, _redStable, _greenBlink, _redBlink, _alternateBlink]
				},
				{
					title: WWW_TITLE,
					hasTranslation:true,
					values: [_off, _greenStable, _blink]
				},
				{
					title: WLAN_TITLE,
					hasTranslation:true,
					values: [_off, _greenStable, _blink]
				},
				{
					title: WPS_TITLE,
					hasTranslation:true,
					values: [_off, _greenStable, _blink]
				},
				{
					title: PHONE_TITLE,
					hasTranslation:true,
					values: [_off, _greenStable, _greenBlink, _blueStable, _blueBlink]
				},
				{
					title: LAN_TITLE,
					hasTranslation:true,
					values: [_normal, _allGreen]
				}
			]);
		}
		
		
	}

	/****************************
	* Needed only for validation
	*****************************/
	
	override public function onClick():Void
	{
		if (validate())
		{
			this._nexts = [getNext()];
			super.onClick();
		}
		
	}
	inline function chekcIfSagem()
	{
		if (Main.customer.dataSet != null)
		{
			if (Main.customer.dataSet.exists(CheckContractorVTI.CUST_DATA_PRODUCT))
			{
				if (Main.customer.dataSet.get(CheckContractorVTI.CUST_DATA_PRODUCT).exists(CheckContractorVTI.CUST_DATA_PRODUCT_BOX))
				{
					return Main.customer.dataSet.get(CheckContractorVTI.CUST_DATA_PRODUCT).get(CheckContractorVTI.CUST_DATA_PRODUCT_BOX) == CheckContractorVTI.SAGEM;
				}
				else return false;
			}
			else return false;
		}
		else return false;
	}
	
	override public function create()
	{
		super.create();
		/**
		 * @todo remove sagem exception
		 */
		
		if ( chekcIfSagem() ) {
			ui.loadIllustrationGraphics("box/led_status/led_status_sagem");
			sagem = true;
		}
		else sagem = false;
		
	}
	
	
	inline function getNext():ProcessContructor
	{
		
		var next:ProcessContructor = null;
		var powerLED = status.get(POWER_TITLE);
		var fiberLED = sagem ? status.get(FIBER_SAGEM_TITLE) : status.get(FIBER_TITLE);
		
		var wwwLED = sagem ? status.get(INTERNET_TITLE) : status.get(WWW_TITLE);
		var rearLanLED = sagem ? "" : status.get(LAN_TITLE);
		var wlanLED = sagem ? status.get(WIFI_TITLE) : status.get(WLAN_TITLE);
		var wpsLED = status.get(WPS_TITLE);
		var phoneLED =  sagem ? status.get(PHONE_SAGEM_TITLE): status.get(PHONE_TITLE);
		
		
		//SAME
		next = if (powerLED == _off && fiberLED == _off && wwwLED == _off )
		{
			{step: LedPowerOn};
		
		}
		else if (powerLED == _greenStable || powerLED == _whiteStable) // COMMON
		{
			if (fiberLED == _redStable){
				if (rearLanLED == _allGreen){
					//_SwapBox;
					{step: CustomerInstruction, params: [
													{step: _SwapBox},
													{step: _SwapBox}
												]
			};
				}
				else{
					{step:SendSMSReadRxTX};
				}
			}
			else if (fiberLED == _greenStable || fiberLED == _whiteStable){
				if (wwwLED == _greenStable || wwwLED == _whiteStable )
					//DidJustMoved;
					{step:DidJustMoved};
				else{
					//IsSerialNumberCorrect;
					{step:IsSerialNumberCorrect};
				}
			}
			else if (fiberLED ==  _greenBlink || fiberLED == _whiteBlink || fiberLED == _alternateBlink){
				//IsSerialNumberCorrect;
				{step:IsSerialNumberCorrect};
			}
			else{
				{step:SendSMSReadRxTX};
			}
		}
		else if (
			(powerLED == _blink || powerLED == _redBlink) &&
			( fiberLED == _greenBlink || fiberLED == _redBlink ||  fiberLED == _whiteBlink ) &&
			(wwwLED == _blink || wwwLED == _redStable) &&
			( phoneLED == _greenBlink || phoneLED == _blueBlink || phoneLED ==_whiteBlink)
		){
			{step: CustomerInstruction, params: [
													{step: _SwapBox},
													{step: _SwapBox}
												]
			};
			//_SwapBox;
			
		}
		else{
			{step:SendSMSReadRxTX};
		}
		return next;
	}
	
}