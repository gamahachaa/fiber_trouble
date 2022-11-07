package;

import flixel.FlxG;
import flixel.FlxState;
import flow.Intro;
import flow.nointernet.customer.HasCustomerLEXnetworkIssue;
//import flow.nointernet.fiberbox.BoxLedStatus;
import flow.tv.ChekSaltTVKNownBugs;
//import flow.vti.ParseVTIHealthCheck;
import format.csv.Data.Record;
import format.csv.Reader;
//import lime.utils.AssetType;
import lime.utils.Assets;
import tstool.MainApp;
import tstool.process.Process;
import tstool.layout.History;
import tstool.utils.XapiTracker;
//import tstool.utils.XapiHelper;
import tstool.salt.Customer;
import tstool.utils.Csv;
import tstool.utils.VersionTracker;


class Main extends MainApp
{
	public static inline var TMP_FILTER_ASSET_PATH:String = "assets/data/tmp/add_to_email_title/";
	public static var LIB_FOLDER:String;
	
	
	public static var HISTORY:History;
	public static var adminFile:tstool.utils.Csv;
	
	public static var customer:Customer;
	
	public static var trackH:XapiTracker;
	
	public static var VERSION:String;
	public static var VERSION_TRACKER:VersionTracker;
	
	public static var DEBUG:Bool;
	public static var _mainDebug:Bool;
	public static inline var DEBUG_LEVEL:Int = 0;
	
	
	public static var LAST_STEP:Class<FlxState> = flow._AddMemoVti;
	public static inline var START_STEP:Class<Process> = Intro;
	public static var LANGS = ["fr-FR", "de-DE", "en-GB", "it-IT"];
	public static inline var INTRO_PIC:String = "default.png";
	public static inline var LIB_FOLDER_LOGIN:String = "/commonlibs/";
	public static var snTabRecord:Array<Record>;
	public static var SN_TAB:Array<String>;
	
	public function new()
	{
		super({
				cookie:"trouble_20210505.user",
				scriptName:"trouble",
				libFolder: LIB_FOLDER_LOGIN
				
		});
		LIB_FOLDER = "../trouble/";
	
		HISTORY = MainApp.stack;
	
		trackH =  MainApp.xapiHelper;
		DEBUG = MainApp.debug;
		_mainDebug = MainApp.debug;
		VERSION_TRACKER = MainApp.versionTracker;
		customer = MainApp.cust;
		initScreen();
		
		//var sns = ;
		snTabRecord = Reader.parseCsv(Assets.getText("assets/data/fab_UMC_only.csv"));
		SN_TAB = Lambda.map( snTabRecord, (e:Record)->(return e[0]));
		
		#if debug
		var r = "(^-[0-9]{1,2}((,|.)[0-9]{1,3})?$)";
		var reg = new EReg(r,"i");
		trace( reg.match("-40000"));
		#end
	}
    static public function MOVE_ON(?old:Bool=false)
	{
		var next:Process;
		var tuto:Process = new flow.TutoTree();
		MainApp.setUpSystemDefault(true);
		#if debug
			/**
			 * USe this  to debug a slide
			 */
			next = new flow.Intro();
			//next = new ChekSaltTVKNownBugs();
			//next = new HasCustomerLEXnetworkIssue();
		#else
			next = Type.createInstance(Main.START_STEP,[]);
		#end
		MainApp.translator.initialize(MainApp.agent.mainLanguage, ()->(FlxG.switchState( old ? next : tuto)) );
	}

}