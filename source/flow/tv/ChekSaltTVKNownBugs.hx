package flow.tv;

//import tstool.process.Action;
import dir.Params;
import dir.Results;
import flow.tv.app._QuitAndRelaunchSaltTV;
import format.csv.Data.Record;
import format.csv.Reader;
import haxe.Exception;
import haxe.Json;
import regex.ExpReg;
import string.StringUtils;
import thx.DateTimeUtc;
import tstool.MainApp;
import tstool.process.Descision;
import tstool.utils.CsvFetcher;
using StringTools;
using string.StringUtils;
using Lambda;

/**
 * ...
 * @author bb
 */
class ChekSaltTVKNownBugs extends Descision
{
	var fetcher:tstool.utils.CsvFetcher;
	var knownBugsCsv:String;
	static inline var STATUS:Int = 0 ; // "Status";
	static inline var CHANNELS:Int = 1; // "Affected channel(s)";
	static inline var START_DATE:Int= 2; // "Start";
	static inline var ROOT_CAUSE:Int= 3; // "Cause";
	static inline var IMPACT:Int= 4 ; // "Impact";
	static inline var ENDED:Int= 5 ; // "End";
	static inline var OPEN_STATUS:String = "OPEN";
	static inline var TEMP_OUTAGES:String = "csv_1";
	static inline var KNOWN_BUGs:String = "csv_2";
	static inline var FILES_ROOT_DEV:String = "/var/www/html/owncloud/data/bbaudry/files/qook/";
	static inline var FILES_ROOT_PROD:String = "/var/www/html/qlood/data/qook/files/";
	var tvOutages:String;
	public function new()
	{
		super();

		//#if debug
		//trace('flow.tv.ChekSaltTVKNownBugs::ChekSaltTVKNownBugs::MainApp.translator.locale ${MainApp.translator.locale}');
		//trace("/var/www/html/owncloud/data/bbaudry/files/qook/06.Salt_Fiber/03.Bug/03.Services/01.Salt_TV_Known_Bugs/myfile.csv".urlEncode());
		//#end
		//knownBugsCsv;
		var qookLang = MainApp.translator.getPreferedQookLang();
		var root = "";
		fetcher = new CsvFetcher();
		fetcher.onData = ondata;

		#if debug
		root = FILES_ROOT_DEV;
		#else
		root = FILES_ROOT_PROD;

		#end
		fetcher.addParameter(TEMP_OUTAGES, root+"06.Salt_Fiber/03.Bug/03.Services/01.Salt_TV_Known_Bugs/myfile.csv".urlEncode());
		fetcher.addParameter(KNOWN_BUGs, root+ '06.Salt_Fiber/03.Bug/03.Services/01.Salt_TV_Known_Bugs/known_tvbugs_$qookLang.csv'.urlEncode());
	}

	function ondata(d:String)
	{
		var j:Dynamic = Json.parse(d);
		var tmp = "";
		if (j.status == Results.SUCCESS_VALUE)
		{

			tvOutages = Reflect.field(j.values.data, TEMP_OUTAGES).additional.trim().replace('"', "");
			try
			{

				var t = Reader.parseCsv(tvOutages,";");

				var tab:Array<Record> = t.filter((e)->(Std.string(e[STATUS].toUpperCase()).indexOf(OPEN_STATUS) >-1));

				if (tab.length > 0)
				{
					tmp += "<b>TV channel outages :<b>" ;
					var dte:DateTimeUtc;
					for (i in tab)
					{
						tmp += "\n\t - " + i[CHANNELS] + " : " + i[IMPACT];

						if (ExpReg.PARSABLE_DATE.match(i[START_DATE]))
						{
							dte = DateTimeUtc.fromString(ExpReg.PARSABLE_DATE.matched(1));
							tmp += " (" + dte.day + "." + dte.month + "." + dte.year +" @" + dte.hour.zeroLead() +":" + dte.minute.zeroLead() +")";
						}
					}

				}

			}
			catch (e:Exception)
			{
				trace(e);
			}
			knownBugsCsv = Reflect.field(j.values.data, KNOWN_BUGs).additional.trim().replace('"', "");
			try
			{

				var t = Reader.parseCsv(knownBugsCsv,";");

				var tab2:Array<Record> = t.filter((e)->(Std.string(e[3].toUpperCase()).indexOf(OPEN_STATUS) >-1));

				tmp += "\n\n<b>Know bugs :<b>" ;

				for (i in tab2)
				{
					tmp += "\n\t - " + i[0] + " (" + i[2] +")";
				}

			}
			catch (e:Exception)
			{
				trace(e);
			}
		}
		else
		{
			trace(d);
		}
		this._detailTxt = tmp + "\n\n" + _detailTxt;
		super.create();
	}
	override public function onYesClick():Void
	{
		#if DEMO
		this._nexts = [{step: End, params: []}];
		#else
		this._nexts = [{step: _InformSaltIsFixing, params: []}];
		#end
		super.onYesClick();
	}
	override public function onNoClick():Void
	{
		#if DEMO
		this._nexts = [{step: End, params: []}];
		#else
		this._nexts = [{step: _QuitAndRelaunchSaltTV, params: []}];
		#end
		super.onNoClick();
	}
	override public function create():Void
	{
		#if debug
		if (!Main.DEBUG)
			ondata('{"status":"success","error":"","additional":"","values":{"data":{"$TEMP_OUTAGES":{"status":"success","error":"","additional":"### RESOLVED - Major Incident FR_9213-FFR-GVIL-ASR1\r\n\r\nImpact: Fixnet unavailable\r\n\r\nLEX impacted: FR_9213-FFR-GVIL-ASR1 + 69VAE + FR_9213-FFR-GVIL-OLT1 + FR_9210-FFR-ALBV-OLT1 + FR_9217-FFR-PRGY-OLT1\r\n\r\nStart: 01.01.2022 01:45\r\n\r\nEnd: 01.01.2022 09:32\r\n\r\nReference Ticket Incident : HD0000000107728\r\n\r\n108 impacted customers"},"$KNOWN_BUGs":{"status":"success","error":"","additional":"### Rue Le Corbusier 8, 1208 Genf\r\n\r\nSalt Home Dienste sind f\u00fcr [9 Haushalte](list.xlsx) aufgrund eines besch\u00e4digten Glasfaserkabels nicht verf\u00fcgbar.\r\n\r\n- Kein technisches Ticket erstellen.\r\n- In SuperOffice pr\u00fcfen, ob ein."}}}}');
		else fetcher.request();
		#else
		fetcher.request();
		#end
	}
}