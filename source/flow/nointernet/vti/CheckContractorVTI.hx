package flow.nointernet.vti;

using string.StringUtils;

import flow.activation.IsFiberOrMultisurf;
import flow.all.customer.IsSlowOrKaput;
import flow.all.fiberbox.WhatBoxIsIt;
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
	public static inline var CONTRACTOR_ID:String = "Contractor ID";
	public static inline var VOIP_NUMBER:String = "VoIP Number";
	public static inline var CONTACT_NUMBER:String = "Contact Number";
	public static inline var CUST_DATA_PRODUCT:String = "PRODUCTS";
	public static inline var CUST_DATA_PRODUCT_BOX:String = "BOX";
	public static inline var SAGEM:String = "Sagem";
	public static inline var ARCADYAN:String = "Arcadyan";
	
	//public static inline var GIGABOX:String = "Gigabox";

	public function new()
	{
		super(
			[
		{
			ereg:new EReg("^3\\d{7}$","i"),
			input:{
				width:150,
				debug: "30001047",
				prefix:"Contractor ID",
				position: [bottom, left]
			}
		},
		{
			ereg: new EReg("^(41\\d{9}|00000000000)$","i"),
			input:{
				buddy: "Contractor ID",
				width:150,
				debug: "41212180513",
				prefix:"VoIP Number",
				position:[top, right]
			}
		},
		{
			ereg: new EReg("^41\\d{9}$","i"),
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
		//sagem = Assets.getText("assets/data/sagem_fut.txt");
		is_sagem = false;
		this.yesValidatedSignal.add(canITrack);
		this.midValidatedSignal.add(canITrack);
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
		Process.STORAGE.set("CONTRACTOR", Main.customer.contract.contractorID );
		if (Main.customer.contract.service != Gigabox)
		{
			Process.STORAGE.set("VOIP", displayVoip );
		}
		//
		Process.STORAGE.set("OWNER", owner );
		Process.STORAGE.set("CONTACT", mobile );

		/**
		 * @TODO keep clipboard trick to fill clipboard with data
		 */
		//Browser.document.addEventListener("copy", function(e){e.clipboardData.setData('text/plain', Main.customer.voIP);e.preventDefault();});
	}
	function onVtiAccountParsed(profile:Map<String, Map<String, String>>):Void
	{
		//#if debug
		//trace("onVtiAccountParsed");
		////trace(profile);
		//#end
		if (!profile.exists("meta") || !profile.exists("plan")) return;
		else {
			var voip = profile.get("plan").exists("vtiVoip")? profile.get("plan").get("vtiVoip"): "";
			is_sagem = voip.indexOf("-") > -1 || voip=="0000000000";
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
				profile.exists("balance")?new Balance( profile.get("balance").get("vtiBalance"), profile.get("balance").get("vtiOverdue"), profile.get("balance").get("vtiOverdueDate")):null,
				(profile.get("plan").exists("plan") ? (profile.get("plan").get("plan").indexOf("Giga")>-1?Gigabox:profile.get("plan").get("plan").indexOf("Office")>-1?Office:Fiber):Fiber)
			);

		}
		#if debug
		trace(Main.customer);
		#end
		question.text = question.text + " <em>" + Main.customer.contract.owner.name + "<em>";
		question.applyMarkup(question.text, [UI.THEME.basicEmphasis]);
		question.drawFrame();
		positionThis();
		multipleInputs.inputs.get(CONTRACTOR_ID).inputtextfield.text = Main.customer.contract.contractorID;
		multipleInputs.inputs.get(VOIP_NUMBER).inputtextfield.text = Main.customer.contract.voip;
		multipleInputs.inputs.get(CONTACT_NUMBER).inputtextfield.text = Main.customer.contract.mobile;
		var p = multipleInputs.positionThis();
		positionButtons(p);
		positionBottom(p);
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
		
		
        //this._nexts = [ {step: Main.HISTORY.isClassInteractionInHistory( Intro, Mid ) ? IsRedStep : WhatBoxIsIt }];
        //this._nexts = [ {step: Main.HISTORY.isClassInteractionInHistory( Intro, Mid ) ? IsRedStep : IsTicketOpened }];
        this._nexts = [ {step: mainIssue.value == Intro.order ? IsRedStep : IsTicketOpened }];
		setReminder();
		
		return b2bChosen && Main.customer.contract.service == Office;
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
			else{
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

}