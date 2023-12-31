package;

import flixel.FlxG;
import flixel.FlxState;
import flow.Intro;
import format.csv.Data.Record;
import format.csv.Reader;
import lime.utils.Assets;
import tstool.MainApp;
import tstool.process.Process;
import tstool.layout.History;
import tstool.utils.XapiTracker;
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
	//public static var _mainDebug:Bool;
	public static inline var DEBUG_LEVEL:Int = 0;

	static public var STORAGE_DISPLAY:Array<String> = [];
	public static var LAST_STEP:Class<FlxState> = flow._AddMemoVti;
	#if DEMO
	public static inline var START_STEP:Class<Process> = HasCustomerLEXnetworkIssue;
	#elseif debug
	public static inline var START_STEP:Class<Process> = Intro;
	#else
	public static inline var START_STEP:Class<Process> = Intro;
	#end
	public static var snTabRecord:Array<Record>;
	public static var SN_TAB:Array<String>;

	public function new()
	{
		super();
		DEBUG = MainApp.debug;
        /**
         * this static object hold the steps history
         */
		HISTORY = MainApp.stack;
		/**
		 * this helper tracks xAPI activity streams to QAST
		 */
		trackH =  MainApp.xapiHelper;
		
		/**
		 * helper service check the versio nupdates to reload the app
		 */
		VERSION_TRACKER = MainApp.versionTracker;
		/**
		 * customer oject
		 */
		customer = MainApp.cust;
		initScreen();

		/**
		 * @todo remove
		 */
		snTabRecord = Reader.parseCsv(Assets.getText("assets/data/fab_UMC_only.csv"));
		SN_TAB = Lambda.map( snTabRecord, (e:Record)->(return e[0]));

	}
	static public function MOVE_ON(?old:Bool=false)
	{
		var next:Process;
		var tuto:Process = new flow.TutoTree();
		MainApp.setUpSystemDefault(true);
		next = Type.createInstance(Main.START_STEP, []);
		#if debug
		/**
		* USe this  to debug a slide
		*/
		next = new flow.Intro();
		//next = new ChekSaltTVKNownBugs();
		
		
		#else
		#if DEMO
		//next = new HasCustomerLEXnetworkIssue();
		#else
		
		#end
		#end
		MainApp.translator.initialize(MainApp.agent.mainLanguage, ()->(FlxG.switchState( old ? next : tuto)) );
	}

}