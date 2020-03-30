package;

import firetongue.FireTongue;
import flixel.FlxG;
import flixel.FlxGame;
import flixel.input.keyboard.FlxKey;
import flixel.text.FlxText.FlxTextFormat;
import flixel.text.FlxText.FlxTextFormatMarkerPair;
import flixel.util.FlxColor;
import flixel.util.FlxSave;
import flow.Intro;
import flow.nointernet.customer._TellCustomerAllOkWithFiberCnx;
import flow.nointernet.fiberbox.FiberLedGreenStable;
import flow.nointernet.postLedChecks._ReadRXValues;
import flow.nointernet.vti.CheckContractorVTI;
import flow.nointernet.vti.IconStatusBoxManagement;
import flow.salttv.IsTVServicesActiveVTI;
import flow.swapcable.SwapFiberCable;
import flow.swapcable._InputShipingAdress;
import haxe.Http;
import js.Browser;
import js.html.Location;
import layout.History;
import layout.Login;
import layout.SaltColor;
import openfl.display.Sprite;
import process.ActionAdress;
import process.Triplet;
import salt.Agent;
import salt.Customer;
import utils.Mail.MailReciepient;
//import openfl.text.TextFormat;
typedef BasicFormat =
{
	var font:String;
	var size:Int;
}
typedef ThemeColor =
{
	var title:FlxColor;
	var basic:FlxColor;
	var basicStrong:FlxTextFormatMarkerPair;
	var basicEmphasis:FlxTextFormatMarkerPair;
	var meta:FlxColor;
	var interaction:FlxColor;
	var bg:FlxColor;
}
typedef Ticket = {
	var domain:String;
	var number:String;
	var queue:String;
	var desc:String;
	var email:String;
}
class Main extends Sprite
{
	public static var HISTORY:History = new History();
	public static var tongue:FireTongue = new FireTongue();
	public static var user:Agent;
	public static var customer:Customer;
	static inline var TITLE_FONT:String = "assets/fonts/Lato-Black.ttf";
	static inline var BASIC_FONT:String = "assets/fonts/Lato-Regular.ttf";
	
	public static var TITLE_FMT:BasicFormat = {font:TITLE_FONT, size:24};
	public static var BASIC_FMT:BasicFormat = {font:BASIC_FONT, size:16};
	public static var META_FMT:BasicFormat = {font:TITLE_FONT, size:16};
	public static var INTERACTION_FMT:BasicFormat = {font:TITLE_FONT, size:20};
	public static var TECH_LOW:MailReciepient = {to:"fiber.tech.qtool.low@salt.ch", fullName:"FIBER_LOW_TECH"};
	public static var TECH_HIGH:MailReciepient = {to:"fiber.tech.qtool@salt.ch", fullName:"FIBER_TECH"};
	
	public static var FIX_511:Ticket = {domain:'FIX', number:'511',queue:'FIBER_WRONG_OTO_SO', desc:'5.Technical 1.Optical connection / OTO 1.Wrong OTO connected', email:'fiber.tech.qtool@salt.ch'};
	public static var FIX_521:Ticket = {domain:'FIX', number:'521',queue:'FIBER_TECH_SO', desc:'5.Technical 2.Modem - Router 1.Modem connection', email:'fiber.tech.qtool@salt.ch'};
	public static var FIX_321:Ticket = {domain:'FIX', number:'321',queue:'FIBER_FINANCIAL_SO', desc:'3.Billing 2.Compensation 1.*Request for Compensation', email:'fiber.tech.qtool@salt.ch'};
	public static var FIX_522:Ticket = {domain:'FIX', number:'522',queue:'FIBER_LOW_PRIO_TECH_SO', desc:'5.Technical 2.Modem - Router 2.Problème de Wifi / Wlan', email:'fiber.tech.qtool.low@salt.ch'};
	public static var FIX_523:Ticket = {domain:'FIX', number:'523',queue:'FIBER_TECH_SO', desc:'5.Technical 2.Modem - Router 3.Box Swap Request (under condition)', email:'fiber.tech.qtool@salt.ch'};
	public static var FIX_526:Ticket = {domain:'FIX', number:'526',queue:'FIBER_PARTS_REQUEST_SO', desc:'5.Technical 2.Modem - Router 6.New Fibre Cable request (send by post)', email:'fiber.tech.qtool@salt.ch'};
	public static var FIX_541:Ticket = {domain:'FIX', number:'541',queue:'FIBER_LOW_PRIO_TECH_SO', desc:'5.Technical 4.TV and Video Services 1.Salt TV problem', email:'fiber.tech.qtool.low@salt.ch'};
	public static var FIX_531:Ticket = {domain:'FIX', number:'531',queue:'FIBER_LOW_PRIO_TECH_SO', desc:'5.Technical 3.Voip Telephony 1.Voip Calls', email:'fiber.tech.qtool@salt.ch'};
	public static var FIX_524:Ticket = {domain:'FIX', number:'524',queue:'FIBER_TECH_SO', desc:'5.Technical 2.Modem - Router 4.WWW LED OFF', email:'fiber.tech.qtool@salt.ch'};
	public static var FIX_525:Ticket = {domain:'FIX', number:'525',queue:'FIBER_LOW_PRIO_TECH_SO', desc:'5.Technical 2.Modem - Router 5.Internet check et Speed test', email:'fiber.tech.qtool@salt.ch'};
	public static var FIX_532:Ticket = {domain:'FIX', number:'532',queue:'FIBER_LOW_PRIO_TECH_SO', desc:'5.Technical 3.Voip Telephony 2.VTI Voice Service', email:'fiber.tech.qtool@salt.ch'};
	public static var FIX_542:Ticket = {domain:'FIX', number:'542',queue:'FIBER_LOW_PRIO_TECH_SO', desc:'5.Technical 4.TV and Video Services 2.Salt VOD problem', email:'fiber.tech.qtool@salt.ch'};
	public static var FIX_125:Ticket = {domain:'FIX', number:'125',queue:'FIBER_LOW_PRIO_TECH_SO', desc:'10.Escalation (Only for Backoffice) 2.Admin (Backoffice Internal only) 5.Termination - TECH Reason (only Backoffice)', email:'fiber.tech.qtool@salt.ch'};
	public static var FIX_527:Ticket = {domain:'FIX', number:'527',queue:'FIBER_LOW_PRIO_TECH_SO', desc:'5.Technical 2.Modem - Router 7. IP Option Management', email:'fiber.tech.qtool@salt.ch'};
	public static var FIX_351:Ticket = {domain:'FIX', number:'351', queue:'FIBER_FINANCIAL_SO', desc:'3.Billing 5.Bill & charging content 1.Contestation of content', email:'fiber.tech.qtool@salt.ch'};
	public static var FIX_416:Ticket = {domain:'FIX', number:'416', queue:'FIBER_DELEGATE_BACKOFFICE_SO', desc:'4.Order 1.Order Process 6.Order Status check request', email:'fiber.tech.qtool@salt.ch'};
	public static var FIX_421:Ticket = {domain:'FIX', number:'421',queue:'FIBER_LOGISTICS_SO', desc:'4.Order 2.Logistics 1.Equipement delivery', email:'fiber.tech.qtool@salt.ch'};

	public static var VERSION:String;
	static var scriptFileVersion:String;
	public static var LOCATION:Location;
	/**
	 * FORMAT COLOR
	 * */
	public static var DARK_THEME :ThemeColor =
	{
		bg: SaltColor.BLACK_PURE,
		title:SaltColor.WHITE,
		basic:SaltColor.WHITE,
		basicStrong:new FlxTextFormatMarkerPair(new FlxTextFormat(SaltColor.ORANGE,true),"<b>"),
		basicEmphasis:new FlxTextFormatMarkerPair(new FlxTextFormat(SaltColor.ORANGE,false,true),"<em>"),
		meta:SaltColor.MUSTARD,
		interaction: SaltColor.WHITE

	};
	public static var WHITE_THEME :ThemeColor =
	{
		bg: SaltColor.WHITE,
		title:SaltColor.BLACK_PURE,
		basic:SaltColor.BLACK,
		basicStrong:new FlxTextFormatMarkerPair(new FlxTextFormat(SaltColor.RED,true),"<b>"),
		basicEmphasis:new FlxTextFormatMarkerPair(new FlxTextFormat(SaltColor.RED,false,true),"<em>"),
		meta:SaltColor.TUQUOISE,
		interaction: SaltColor.DARK_GRAY

	};

	public static var COOKIE: FlxSave;
	public static var THEME:ThemeColor;

	public function new()
	{
		super();
		LOCATION = Browser.location;

		THEME = DARK_THEME;
		Main.customer = new Customer();
		tongue.init("fr-FR",
					function()
		{
			#if debug
			trace(tongue.get("$flow.nointernet.vti.CheckContractorVTI_UI1", "meta"));
			#end
		}
				   );
		#if debug
		Main.user = new Agent();
		//addChild(new FlxGame(1400, 880, SwapFiberCable, 1, 30, 30, true, true));
		//addChild(new FlxGame(1400, 880, CheckContractorVTI, 1, 30, 30, true, true));
		//addChild(new FlxGame(1400, 880, _InputShipingAdress, 1, 30, 30, true, true));
		//addChild(new FlxGame(1400, 880, IsTVServicesActiveVTI, 1, 30, 30, true, true));
		addChild(new FlxGame(1400, 880, Intro, 1, 30, 30, true, true));
		//addChild(new FlxGame(1400, 880, _ReadRXValues, 1, 30, 30, true, true));
		//addChild(new FlxGame(1400, 880, FiberLedGreenStable, 1, 30, 30, true, true));
		//addChild(new FlxGame(1400, 880, _RebootAppleTV, 1, 30, 30, true, true));
		//trace(VERSION);
		CHECK_NEW_VERSION();
		#else
		//trace("Prod");
		addChild(new FlxGame(1400, 880, Login, 1, 30, 30, true, true));

		#end
		setUpSystemDefault();
	}

	static public function TOGGLE_MAIN_STYLE()
	{
		THEME = THEME == WHITE_THEME ? DARK_THEME: WHITE_THEME;
	}
	static public function CHECK_NEW_VERSION()
	{
		var reg = ~/^\.\/nointernet_(\d{8}_\d{6}).js$/;
		var versionTracker = new Http(LOCATION.origin + LOCATION.pathname+ "php/version/index.php");
		scriptFileVersion = Browser.document.getElementsByTagName("script")[0].attributes.getNamedItem('src').nodeValue;
		#if debug
		trace(scriptFileVersion);
		trace(reg.match(scriptFileVersion));
		#end
		versionTracker.async = true;
		versionTracker.onData = function(data:String)
		{
			if (reg.match(scriptFileVersion))
			{
				VERSION = reg.matched(1);
				if (data > VERSION)
				{
					#if debug
					trace('update $VERSION to $data');
					#end
					Browser.alert(tongue.get("$needUpdate_UI1", "meta"));
				}
				else
				{
					#if debug
					trace('current version $VERSION is aligned with $data');
					#end
				}
			}
			else
			{
				trace(scriptFileVersion + " JS Script doesn't match version format ");
			}

		};
		versionTracker.request();
	}
	function setUpSystemDefault()
	{
		FlxG.sound.soundTrayEnabled = false;
		FlxG.mouse.useSystemCursor = true;
		FlxG.keys.preventDefaultKeys = [FlxKey.BACKSPACE, FlxKey.TAB];
		//FlxG.keys.preventDefaultKeys = [FlxKey.TAB];
	}

}