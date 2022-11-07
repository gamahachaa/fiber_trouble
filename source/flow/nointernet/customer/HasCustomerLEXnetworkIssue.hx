package flow.nointernet.customer;

import dir.Results;
import dir.Params;
import flow._AddMemoVti;
import flow.vti.ParseVTIHealthCheck;
import haxe.Json;
import regex.ExpReg;
import string.StringUtils;
import tstool.MainApp;
import tstool.utils.CsvFetcher;
import tstool.utils.VTIdataParser;
//import flow.nointernet.so.IsTicketOpened;
import tstool.process.Descision;
using StringTools;

/**
 * ...
 * @author bb
 */
class HasCustomerLEXnetworkIssue extends Descision
{
	var fetcher:tstool.utils.CsvFetcher;
	var knownBugsCsv:String;
	var outages:String;
	static inline var TEMP_OUTAGES:String = Params.MODULAR_MDS + "1";
	static inline var TEMP_STICKIES:String = Params.MODULAR_MDS + "2";
	
	var stickiesKey:String;
	var values:Map<String, Dynamic>;
	static inline var FILES_ROOT_DEV:String = "/var/www/html/owncloud/data/bbaudry/files/qook/";
	static inline var FILES_ROOT_PROD:String = "/var/www/html/qlood/data/qook/files/";
	//var FRONTMATTER_IN_MD:EReg;
	public function new()
	{
		super();
		//FRONTMATTER_IN_MD = ~/---[\s\S]+---/gim;
		fetcher = new CsvFetcher();
		fetcher.onData = ondata;
		stickiesKey = TEMP_STICKIES + 'lang${MainApp.translator.getPreferedQookLang()}';
		#if debug
		fetcher.addParameter(TEMP_OUTAGES, FILES_ROOT_DEV+"06.Salt_Fiber/03.Bug/03.Services/00.services_major_incidents".urlEncode());
		fetcher.addParameter(stickiesKey, FILES_ROOT_DEV+"06.Salt_Fiber/home".urlEncode());
		#else
		fetcher.addParameter(TEMP_OUTAGES, FILES_ROOT_PROD+"06.Salt_Fiber/03.Bug/03.Services/00.services_major_incidents".urlEncode());
		fetcher.addParameter(stickiesKey, FILES_ROOT_PROD+"06.Salt_Fiber/home".urlEncode());
		#end
	}

	override public function onYesClick():Void
	{
		this._nexts = [{step: _AddMemoVti, params: []}];
		super.onYesClick();
	}
	override public function onNoClick():Void
	{
		this._nexts = [{step: FiberCableChanged, params: []}];
		super.onNoClick();
	}
	function ondata(d:String)
	{
		var lexID = values.get(VTIdataParser.lexId);	var j:Dynamic = Json.parse(d);
		//var tmp = "";
		outages = "";
		if (j.status == Results.SUCCESS_VALUE) 
		{
			//
			//#if debug
			//trace("flow.nointernet.customer.HasCustomerLEXnetworkIssue::ondata::j", j.values.data );
			//#end
			var majorIncidents:String = Reflect.field(j.values.data, TEMP_OUTAGES).additional.trim();
			var stickyNotes:String = Reflect.field(j.values.data, stickiesKey).additional.trim();
			//#if debug
			//trace("flow.nointernet.customer.HasCustomerLEXnetworkIssue::ondata::majorIncidents.toLowerCase().lastIndexOf(end)", majorIncidents.toLowerCase(), majorIncidents.toLowerCase().lastIndexOf("end") );
			//trace(outages);
			//#end
			var hasOutages = false;
			if ( majorIncidents.indexOf(Results.NO_INCIDENT) == -1)
			{
				hasOutages = true;
				outages = "<b>Major incidents<b>" + StringUtils.removeBlankLines(majorIncidents);
				outages = outages.substr(0,outages.toLowerCase().lastIndexOf("end"));
				outages = ExpReg.FRONTMATTER_IN_MD.replace(outages, "");
			}
			if ( stickyNotes.indexOf(Results.NO_INCIDENT) == -1)
			{ 
				outages += hasOutages ? StringUtils.LINEFEEDS_N +  StringUtils.LINEFEEDS_N : "";
				outages += "<b>Qoof's Stiky<b>" + StringUtils.LINEFEEDS_N;
				
				
				while (getTags(stickyNotes,"span").start != -1)
				{
					var tmpSub = getTags(stickyNotes,"span");
					stickyNotes = stickyNotes.replace(stickyNotes.substring(tmpSub.start, tmpSub.end),"");
				}
				outages += StringUtils.removeBlankLines(StringUtils.removeBlankLines(stickyNotes));
			}
			#if debug
			trace("flow.nointernet.customer.HasCustomerLEXnetworkIssue::ondata::outages", outages );
			#end

			this._detailTxt = outages.replace(lexID, '<em>$lexID<em>');
			this._detailTxt = outages.replace("###", '<b>###<b>');
			//this._detailTxt =  _detailTxt.;

			_titleTxt = _titleTxt.replace("<OLT>", values.get(VTIdataParser.oltObject));
			_titleTxt = _titleTxt.replace("<LEX>", '<em>$lexID<em>');
			//this._titleTxt += " (LEX : " + values.get(VTIdataParser.lexId) + ")";
			//#if debug
			//trace('flow.nointernet.customer.HasCustomerLEXnetworkIssue::ondata::_titleTxt ${_titleTxt}');
			//#end
			super.create();
			//if (outages == Params.NO_INCIDENT)
			//{
				//onNoClick();
			//}
		}
		else{
			trace(j);
		}
	}
	override public function create():Void
	{
		values = Main.HISTORY.findAllValuesOffOfFirstClassInHistory(ParseVTIHealthCheck);

		#if debug
		if (!Main.DEBUG)
			ondata('{"status":"success","error":"","additional":"","values":{"data":{"modular_1":{"status":"success","error":"","additional":"### RESOLVED - Major Incident FR_9213-FFR-GVIL-ASR1\r\n\r\nImpact: Fixnet unavailable\r\n\r\nLEX impacted: FR_9213-FFR-GVIL-ASR1 + 69VAE + FR_9213-FFR-GVIL-OLT1 + FR_9210-FFR-ALBV-OLT1 + FR_9217-FFR-PRGY-OLT1\r\n\r\nStart: 01.01.2022 01:45\r\n\r\nEnd: 01.01.2022 09:32\r\n\r\nReference Ticket Incident : HD0000000107728\r\n\r\n108 impacted customers"},"$stickiesKey":{"status":"success","error":"","additional":"### Rue Le Corbusier 8, 1208 Genf\r\n\r\nSalt Home Dienste sind f\u00fcr [9 Haushalte](list.xlsx) aufgrund eines besch\u00e4digten Glasfaserkabels nicht verf\u00fcgbar.\r\n\r\n- Kein technisches Ticket erstellen.\r\n- In SuperOffice pr\u00fcfen, ob ein."}}}}');
		else fetcher.request();
		#else
		fetcher.request();
		#end
	}
	inline function getTags(s:String, tag:String):Dynamic
	{
		return {start:s.indexOf('<$tag>'),end:s.indexOf('</$tag>')+'</$tag>'.length}
	}
}