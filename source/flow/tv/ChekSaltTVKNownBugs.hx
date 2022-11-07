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

		#if debug
		trace('flow.tv.ChekSaltTVKNownBugs::ChekSaltTVKNownBugs::MainApp.translator.locale ${MainApp.translator.locale}');
		trace("/var/www/html/owncloud/data/bbaudry/files/qook/06.Salt_Fiber/03.Bug/03.Services/01.Salt_TV_Known_Bugs/myfile.csv".urlEncode());
		#end
		//knownBugsCsv;
		fetcher = new CsvFetcher();
		var qookLang = MainApp.translator.getPreferedQookLang();
		fetcher.onData = ondata;
		#if debug
		fetcher.addParameter(TEMP_OUTAGES, FILES_ROOT_DEV+"06.Salt_Fiber/03.Bug/03.Services/01.Salt_TV_Known_Bugs/myfile.csv".urlEncode());
		var csv2 = FILES_ROOT_DEV+'06.Salt_Fiber/03.Bug/03.Services/01.Salt_TV_Known_Bugs/known_tvbugs_$qookLang.csv';
		#else
		fetcher.addParameter(TEMP_OUTAGES, FILES_ROOT_PROD+"06.Salt_Fiber/03.Bug/03.Services/01.Salt_TV_Known_Bugs/myfile.csv".urlEncode());
		var csv2 =FILES_ROOT_PROD+ '06.Salt_Fiber/03.Bug/03.Services/01.Salt_TV_Known_Bugs/known_tvbugs_$qookLang.csv';
		#end
		fetcher.addParameter(KNOWN_BUGs, csv2.urlEncode());
	}

	function ondata(d:String)
	{
		var j:Dynamic = Json.parse(d);
		var tmp = "";
		if (j.status == Results.SUCCESS_VALUE)
		{
			#if debug
			trace("flow.tv.ChekSaltTVKNownBugs::ondata::j", j );
			#end
			tvOutages = Reflect.field(j.values.data, TEMP_OUTAGES).additional.trim().replace('"', "");
			try
			{

				var t = Reader.parseCsv(tvOutages,";");
				//trace(t);
				#if debug
				trace("flow.tv.ChekSaltTVKNownBugs::ondata::t", t );
				#end
				var tab:Array<Record> = t.filter((e)->(Std.string(e[STATUS].toUpperCase()).indexOf(OPEN_STATUS) >-1));
				//trace(tab);
				#if debug
				trace("flow.tv.ChekSaltTVKNownBugs::ondata::tab", tab );
				#end
				if (tab.length > 0)
				{
					tmp += "<b>TV channel outages :<b>" ;
					var dte:DateTimeUtc;
					for (i in tab)
					{
						tmp += "\n\t - " + i[CHANNELS] + " : " + i[IMPACT];
						#if debug
						//trace("flow.tv.ChekSaltTVKNownBugs::ondata::ExpReg.PARSABLE_DATE.match(i[START_DATE])", ExpReg.PARSABLE_DATE.match(i[START_DATE]) );
						#end
						if (ExpReg.PARSABLE_DATE.match(i[START_DATE]))
						{
							#if debug
							trace("flow.tv.ChekSaltTVKNownBugs::ondata::ExpReg.PARSABLE_DATE.matched(0,1)", ExpReg.PARSABLE_DATE.matched(0), ExpReg.PARSABLE_DATE.matched(1) );
							#end
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
				//trace(t);
				var tab2:Array<Record> = t.filter((e)->(Std.string(e[3].toUpperCase()).indexOf(OPEN_STATUS) >-1));
				//trace(tab2);
				tmp += "\n\n<b>Know bugs :<b>" ;
				//var dte:DateTimeUtc;
				for (i in tab2)
				{

					//dte = DateTimeUtc.fromString(i[2]);
					tmp += "\n\t - " + i[0] + " (" + i[2] +")";
					//this._detailTxt += "\n\t - " + i[CHANNELS] + " : " + i[IMPACT] + " (" + dte.getDate() +"."+ dte.getMonth() +"."+ dte.getFullYear() +" @" + dte.getHours() +":"+ dte.getMinutes() +")";
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
		this._nexts = [{step: _InformSaltIsFixing, params: []}];
		super.onYesClick();
	}
	override public function onNoClick():Void
	{
		this._nexts = [{step: _QuitAndRelaunchSaltTV, params: []}];
		super.onNoClick();
	}
	override public function create():Void
	{
		fetcher.request();
	}
}