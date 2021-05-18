package;

//import firetongue.CSV;
//import firetongue.FireTongue;
import flixel.FlxG;
import flixel.FlxGame;
import flixel.FlxState;
import flixel.input.keyboard.FlxKey;
import flixel.system.FlxAssets;
import flixel.text.FlxText.FlxTextFormat;
import flixel.text.FlxText.FlxTextFormatMarkerPair;
import flixel.util.FlxColor;
import flixel.util.FlxSave;
import flow.End;
import flow.Intro;
import flow.nointernet.customer.FiberCableChanged;
import flow.nointernet.so._CreateTicketModemCNX;
import flow.nointernet.vti.CheckContractorVTI;
import flow.tv.remote.satltv._EnsureAppleTVInVisualRangeOfRemote;
import tstool.MainApp;
import tstool.process.Process;
//import flow.nointernet.customer.FiberCableChanged;
//import flow.tv.remote.satltv.IsAppleTVFourthGen;

import js.Browser;
import js.html.Location;
import tstool.layout.History;
import tstool.layout.Login;
import tstool.layout.SaltColor;
//import tstool.utils.Mail;
import tstool.utils.Translator;
import tstool.utils.XapiTracker;
import openfl.Assets;
import openfl.display.Sprite;
//import tstool.process.Triplet;
import tstool.salt.Agent;
import tstool.salt.Customer;
//import tstool.utils.Mail.MailReciepient;
import tstool.utils.Csv;
import tstool.utils.VersionTracker;


class Main extends MainApp
{
	public static var LIB_FOLDER:String;
	public static inline var LIB_FOLDER_LOGIN:String = "/commonlibs/";
	//public static var MAIL_WRAPPER_URL:String = LIB_FOLDER + "php/mail/index.php";
	
	public static var HISTORY:History;
	public static var adminFile:tstool.utils.Csv;
	public static var tongue:Translator;
	//public static var user:Agent;
	public static inline var DEBUG_LEVEL = 0;
	public static var customer:Customer;
	public static var track:XapiTracker;
	public static var VERSION:String;
	public static var VERSION_TRACKER:VersionTracker;
	public static var LOCATION:Location;
	public static var DEBUG:Bool;
	//public static var COOKIE: FlxSave;
		//public static inline var LAST_STEP:Class<FlxState> = End;
	//public static inline var START_STEP:Class<Process> = Intro;
	public static var LAST_STEP:Class<FlxState> = flow._AddMemoVti;
	public static inline var START_STEP:Class<Process> = Intro;
	public static var LANGS = ["fr-FR", "de-DE", "en-GB", "it-IT"];
	public static inline var INTRO_PIC:String = "default.png";
	
	public function new()
	{
		super({
				cookie:"nointernet_20210205.user",
				scriptName:"nointernet",
				libFolder: LIB_FOLDER_LOGIN
				
		});
		LIB_FOLDER = "../trouble/";
		tongue = MainApp.translator;
		//COOKIE = save;
		HISTORY = MainApp.stack;
		LOCATION = MainApp.location;
		track =  MainApp.xapiTracker;
		DEBUG = MainApp.debug;
		VERSION_TRACKER = MainApp.versionTracker;
		customer = MainApp.cust;
		
		if (Browser.navigator.userAgent.indexOf("Firefox") == -1)
		{
			Browser.window.alert("This tool is only fully tested with Firefox...\n\nSome funcitonalities does not work with your browser " + Browser.navigator.userAgent);
		}
		addChild(new FlxGame(1400, 880, Login, 1, 30, 30, true, true));

	}

	static public function setUpSystemDefault(?block:Bool = false )
	{
		FlxG.sound.soundTrayEnabled = false;
		FlxG.mouse.useSystemCursor = block;
		FlxG.keys.preventDefaultKeys = block ? [FlxKey.BACKSPACE, FlxKey.TAB] : [FlxKey.TAB];
		//FlxG.keys.preventDefaultKeys = [FlxKey.TAB];
	}
    static public function MOVE_ON(?old:Bool=false)
	{
		var next:Process;
		var tuto:Process = new flow.TutoTree();
		setUpSystemDefault(true);
		#if !debug
		Main.track.setActor();
		#end
		#if debug
			/**
			 * USe this  to debug a slide
			 */
			next = new flow.Intro();
		#else
			//next = new Main.START_STEP();
			next = new flow.Intro();
		#end
		tongue.initialize(MainApp.agent.mainLanguage, ()->(FlxG.switchState( old ? next : tuto)) );
	}

}