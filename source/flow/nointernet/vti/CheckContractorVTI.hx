package flow.nointernet.vti;

using string.StringUtils;
using StringTools;

import dir.Params;
import dir.Results;
import flow.activation.IsFiberOrMultisurf;
import flow.all.customer.IsSlowOrKaput;
import flow.all.fiberbox.WhatBoxIsIt.Box;
import flow.nointernet.customer.BielIncidentInQoof;
import flow.tv.WhatIStheTVIssue;
import haxe.Json;
import regex.ExpReg;
import tstool.layout.History.Interactions;
import tstool.utils.CsvFetcher;
//import flow.all.fiberbox.WhatBoxIsIt;
import flow.ftth.IsRedStep;
import flow.nointernet.so.IsTicketOpened;
import flow.phone.WhatIsthePhoneISsue;
import js.Browser;
import tstool.MainApp;
//import tstool.layout.History.Snapshot;
import tstool.layout.History.ValueReturn;
import tstool.layout.UI;
import tstool.process.Process;
import tstool.process.TripletMultipleInput;
import xapi.Agent;
import xapi.Verb;

import tstool.salt.Balance;
import tstool.salt.Contractor;
import tstool.salt.Role;
import tstool.utils.VTIdataParser;

import Main;

/**
 * ...
 * @author
 */
//class CheckContractorVTI extends DescisionMultipleInput
class CheckContractorVTI extends TripletMultipleInput
{
	var parser:tstool.utils.VTIdataParser;
	var sagem:String;
	var is_sagem:Bool;
	var mainIssue:ValueReturn;
	var fetcher:CsvFetcher;
	var incidentFilesContractor:Array<IncidentContractors>;
	var incidentLocation:String;
	public static inline var BIEL_INCIDENT_LOCATION:String = "incidident_location";
	//static inline var VTI_VIOP_WITH_CHEATING:String = "^(?!41[0-9]{2}0000000)(41\d{9}|00000000000)$";
	public static inline var BLANK_VOIP:String = "0000000000";
	public static inline var CONTRACTOR_ID:String = "Contractor ID";
	public static inline var VOIP_NUMBER:String = "VoIP Number";
	public static inline var CONTACT_NUMBER:String = "Contact Number";
	public static inline var CUST_DATA_PRODUCT:String = "PRODUCTS";
	public static inline var CUST_DATA_PRODUCT_BOX:String = "BOX";
	public static inline var SAGEM:String = "Sagem";
	public static inline var ARCADYAN:String = "Arcadyan";
	public static inline var GIGABOX:String = "Gigabox";
	public static inline var B2B_expl_BIEL:String = "31194459";
	public static inline var B2C_ACRADAYN_expl_BIEL:String = "31194414";
	

	//public static inline var GIGABOX:String = "Gigabox";

	public function new()
	{
		super(
			[
		{
			ereg:new EReg(ExpReg.CONTRACTOR_EREG,"i"),
			input:{

				width:150,
				debug: "30001047",
				prefix:"Contractor ID",
				position: [bottom, left]
			}
		},
		{
			ereg: new EReg(ExpReg.VTI_VOIP_WITH_NOCHEATING,"i"),
			input:{
				buddy: "Contractor ID",
				width:150,
				debug: "41212180513",
				prefix:"VoIP Number",
				position:[top, right]
			}
		},
		{
			ereg: new EReg(ExpReg.VOIP_WITH_CHEATING,"i"),
			input:{
				buddy: "Contractor ID",
				width:150,
				debug: "41787878814",
				prefix:"Contact Number",
				position:[bottom, left]
			}
		}
			]
		);
		fetcher = new CsvFetcher();
		incidentFilesContractor = [];
		fetcher.onData = onBielIncidentData;
		#if debug
		fetcher.onError = (e)->(trace(e));
		fetcher.onStatus = (e)->(trace(e));
		#end
		var FILES_ROOT = "/var/www/html/qlood/data/qook/files/06.Salt_Fiber/";
		#if debug
		FILES_ROOT = "/var/www/html/owncloud/data/bbaudry/files/qook/06.Salt_Fiber/";
		#end
		fetcher.addParameter(Params.INCIDENT_CSV, FILES_ROOT+"biel/".urlEncode());
		//sagem = Assets.getText("assets/data/sagem_fut.txt");
		is_sagem = false;
		this.yesValidatedSignal.add(canITrack);
		this.midValidatedSignal.add(canITrack);
	}
	override function pushToHistory( buttonTxt:String, interactionType:Interactions,?values:Map<String,Dynamic>= null)
	{
		var v = [for (k => v in multipleInputs.inputs) k => v.getInputedText()];
		if (incidentLocation != "")
		{
			v.set(BIEL_INCIDENT_LOCATION, incidentLocation);
		}
		super.pushToHistory( buttonTxt, interactionType,  values = v);
	}
	function onBielIncidentData(d:String)
	{
		var j:Dynamic = Json.parse(d);
		incidentFilesContractor = [];
		#if debug
		//trace("flow.nointernet.vti.CheckContractorVTI::onBielIncidentData::j", j );
		#end
		if (j.status == Results.SUCCESS_VALUE)
		{
			var list:String = StringTools.urlDecode(j.additional);
			var files:Array<String> = list.split(Params.STICKY_INCIDENT_BIEL_TITLE_SEP);
			for (i in files)
			{
				var split:Array<String> = i.split(Params.STICKY_INCIDENT_BIEL_SUB_SEP);
				incidentFilesContractor.push(
				{
					location: split[0].replace(Params.INCIDENT_CSV,"").replace(".csv",""),
					contractors: split[1].split(Params.STICKY_INCIDENT_BIEL_CONTRACTOR_SEP)
				}
				);
			}
		}
		#if debug
		//trace("flow.nointernet.vti.CheckContractorVTI::onBielIncidentData::incidentFilesContractor", incidentFilesContractor );
		#end
	}
	function setReminder()
	{
		//081 304 10 13
		//var voip = Main.customer.voIP.split("");
		//voip.insert(8, " ");
		//voip.insert(6, " ");
		//voip.insert(3, " ");

		var displayVoip = Main.customer.voIP.phonSpaces();
		var owner = Main.customer.getOwner();
		var mobile = Main.customer.contract.mobile == "" ? "": "(" + Main.customer.contract.mobile + ")";
		var iri  = Main.customer.iri == "" ? "" : "(" + Main.customer.iri + ")";
		//Process.STORAGE.set("reminder", '$displayVoip $iri\n$owner $mobile' );
		Main.STORAGE_DISPLAY.push("CONTRACTOR");
		Main.STORAGE_DISPLAY.push("VOIP");
		Main.STORAGE_DISPLAY.push("OWNER");
		Main.STORAGE_DISPLAY.push("CONTACT");
		Process.STORE("CONTRACTOR", Main.customer.contract.contractorID );
		if (Main.customer.contract.service != Gigabox)
		{
			Process.STORE("VOIP", displayVoip );
		}
		//
		Process.STORE("OWNER", owner );
		Process.STORE("CONTACT", mobile );

		/**
		 * @TODO keep clipboard trick to fill clipboard with data
		 */
		//Browser.document.addEventListener("copy", function(e){e.clipboardData.setData('text/plain', Main.customer.voIP);e.preventDefault();});
	}
	function onVtiAccountParsed(profile:Map<String, Map<String, String>>):Void
	{

		#if debug
		trace("onVtiAccountParsed");
		trace(profile);
		#end
		if (!profile.exists("meta") || !profile.exists("plan")) return;

		var voip:String = profile.get("plan").exists("vtiVoip")? profile.get("plan").get("vtiVoip"): BLANK_VOIP;
		is_sagem = voip.indexOf("-") > -1 || voip == BLANK_VOIP;
		Main.customer.contract = new Contractor(
			profile.get("meta").exists("vtiContractor")? profile.get("meta").get("vtiContractor"):"",
			is_sagem ? StringTools.replace(voip, "- ",""):voip,
			profile.get("plan").exists("vtiFix")? profile.get("plan").get("vtiFix"):"",
			profile.get("plan").exists("vtiMobile")? profile.get("plan").get("vtiMobile"):"",
			profile.get("plan").exists("vtiAdress")? profile.get("plan").get("vtiAdress"):"",
			profile.exists("owner")? new Role(owner,profile.get("owner").get("vtiOwner"),profile.get("owner").get("vtiOwnerEmail")):null,
			profile.exists("payer")? new Role(payer,profile.get("payer").get("vtiPayer"),profile.get("payer").get("vtiPayerEmail")):null,
			new Role(user, profile.get("plan").get("vtiUser"), profile.get("plan").get("vtiUserEmail")),
			profile.exists("owner")? StringTools.trim(profile.get("owner").get("vtiOwnerEmailValidated").toLowerCase()) == "ok":false,
			profile.exists("balance")?new Balance( profile.get("balance").get("vtiBalance"), profile.get("balance").get("vtiOverdue"),
		profile.get("balance").get("vtiOverdueDate")):null,
			(profile.get("plan").exists("plan") ? (profile.get("plan").get("plan").indexOf("Giga")>-1?Gigabox:profile.get("plan").get("plan").indexOf("Office")>-1?Office:Fiber):Fiber)
		);

		var box:String = if (Main.customer.contract.service == Gigabox)
		{
			GIGABOX;
		}
		else if (is_sagem)
		{
			SAGEM;
		}
		else{
			ARCADYAN;
		}
		#if debug
		trace("flow.nointernet.vti.CheckContractorVTI::onVtiAccountParsed::box", box, voip );
		#end
		Main.customer.dataSet.set(
			CheckContractorVTI.CUST_DATA_PRODUCT,
			[CheckContractorVTI.CUST_DATA_PRODUCT_BOX => box]
		);
		#if debug
		trace(Main.customer);
		#end

		//this.question.
		//question.text = question.text + " <em>" + Main.customer.contract.owner.name + "<em>";
		//question.applyMarkup(question.text, [UI.THEME.basicEmphasis]);
		//question.drawFrame();
		//positionThis();
		multipleInputs.inputs.get(CONTRACTOR_ID).inputtextfield.text = Main.customer.contract.contractorID;
		multipleInputs.inputs.get(VOIP_NUMBER).inputtextfield.text = Main.customer.contract.voip;
		multipleInputs.inputs.get(CONTACT_NUMBER).inputtextfield.text = Main.customer.contract.mobile;
		//var p = multipleInputs.positionThis();
		//positionButtons(p);
		//positionBottom(p);
		if ( Main.customer.contract.service == Office )
		{
			this.btnYes.visible = false;
			this.btnMid.visible = true;
		}
		else{
			this.btnYes.visible = true;
			this.btnMid.visible = false;
		}

	}

	override public function update(elapsed)
	{
		super.update(elapsed);

	}
	override public function create():Void
	{
		Main.customer.reset();

		super.create();
		mainIssue = Main.HISTORY.findValueOfFirstClassInHistory(Intro, Intro.ISSUE);

		parser = new VTIdataParser(account);
		parser.signal.add( onVtiAccountParsed );
		fetcher.request();
	}

	override public function onYesClick():Void
	{
		if (validateYes())
		{
			prepareAndMove(false);
			super.onYesClick();
		}

	}
	override public function onMidClick():Void
	{
		if (validateMid())
		{
			prepareAndMove(true);
			Main.customer.contract.service=Office;
			super.onMidClick();
		}

	}
	function prepareAndMove(b2bChosen:Bool)
	{
		this.parser.destroy();
		var contractorID = multipleInputs.inputs.get(CONTRACTOR_ID).getInputedText();
		var voipVTI = multipleInputs.inputs.get(VOIP_NUMBER).getInputedText();
		var contactNB = multipleInputs.inputs.get(CONTACT_NUMBER).getInputedText();
		var voipSO = "0" + voipVTI.substr(2);
		Main.customer.contract.contractorID = contractorID;
		Main.customer.contract.voip = voipSO;
		Main.customer.contract.fix = voipVTI;

		Main.customer.iri = (is_sagem || Main.customer.contract.service == Gigabox || Main.customer.contract.service == Office) ? contractorID : voipSO;
		Main.customer.contract.mobile = contactNB;

		incidentLocation = checkIfIncidentForTheContractor(Main.customer.contract.contractorID);
		if (mainIssue.value == Intro.order)
		{
			this._nexts = [ {step: IsRedStep }];
		}
		else if (
			incidentLocation == ""
			|| (
				!Main.HISTORY.isClassInteractionInHistory(IsSlowOrKaput, No)
				&&
				!(Main.HISTORY.findValueOfFirstClassInHistory(WhatIsthePhoneISsue,WhatIsthePhoneISsue.ISSUE).value == WhatIsthePhoneISsue.no_calls)
				&&
				!Main.HISTORY.isClassInteractionInHistory(WhatIStheTVIssue, Mid)
			)
		)

		{
			this._nexts = [ {step: IsTicketOpened }];
		}
		else
		{
			this._nexts = [ {step: BielIncidentInQoof }];
		}
		if (b2bChosen)
		{
			Main.customer.dataSet.set(
				CheckContractorVTI.CUST_DATA_PRODUCT,
				[CheckContractorVTI.CUST_DATA_PRODUCT_BOX => SAGEM]);
		}

		setReminder();

		#if debug
		trace("flow.nointernet.vti.CheckContractorVTI::prepareAndMove::Main.customer", Main.customer );
		#end

		//return b2bChosen && Main.customer.contract.service == Office;
	}

	override public function onNoClick():Void
	{
		this._nexts = [{step: IsFiberOrMultisurf, params: []}];
		super.onNoClick();
	}

	override function validateNo()
	{
		return true;
	}

	/*function isSagem(contrator:String)
	{
		return sagem.indexOf(contrator) >-1;
	}*/
	function canITrack(go:Bool)
	{
		if (go)
		{
			var act = prepareXAPIMainActivity();
			//#if debug

			Main.trackH.setActor(new Agent( MainApp.agent.iri, MainApp.agent.sAMAccountName));
			Main.trackH.setVerb(Verb.initialized);
			//Main.trackH.setStatementRefs(null);
			var extensions:Map<String,Dynamic> = [];
			extensions.set("https://vti.salt.ch/contractor/", Main.customer.contract.contractorID);
			extensions.set("https://vti.salt.ch/voip/", Main.customer.voIP);
			extensions.set(Browser.location.origin +"/troubleshooting/script_version/", Main.VERSION);

			Main.trackH.setActivityObject(act,null,null,"http://activitystrea.ms/schema/1.0/process",extensions);
			//Main.trackH.setCustomer();
			Main.trackH.send();
			Main.trackH.setVerb(Verb.resolved);

		}

	}

	function prepareXAPIMainActivity()
	{
		var phoneIssue:ValueReturn = Main.HISTORY.findValueOfFirstClassInHistory(WhatIsthePhoneISsue, WhatIsthePhoneISsue.ISSUE);
		return if (mainIssue.value == Intro.order)
		{
			"equipment";
		}
		else if (mainIssue.value == Intro.tv)
		{
			"tv";
		}
		else if (mainIssue.value == Intro.internet)
		{
			if (Main.HISTORY.isClassInteractionInHistory(IsSlowOrKaput, No))
			{
				"no-internet";
			}
			else if (Main.HISTORY.isClassInteractionInHistory(flow.all.customer.IsSlowOrKaput, Yes) )
			{
				"slow-internet";
			}
			else
			{
				"cuts-internet";
			}
		}
		else if (phoneIssue.exists)
		{
			phoneIssue.value;
		}
		else
		{
			"uncaught";
		}

	}

	function checkIfIncidentForTheContractor(contractor:String):String
	{
		var location = "";
		if ( incidentFilesContractor.length > 0)
		{
			for (i in this.incidentFilesContractor)
			{
				if (i.contractors.indexOf(contractor) >-1)
				{
					location = (i.location);
				}
			}
		}

		return location;
	}

}
typedef IncidentContractors =
{
	var location:String;
	var contractors:Array<String>;
}