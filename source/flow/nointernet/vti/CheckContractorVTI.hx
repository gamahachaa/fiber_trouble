package flow.nointernet.vti;

using tstool.utils.StringUtils;

import flow.activation.IsFiberOrMultisurf;
import flow.all.customer.IsSlowOrKaput;
import flow.all.fiberbox.WhatBoxIsIt;
import flow.ftth.IsRedStep;
import tstool.layout.UI;
import tstool.process.Process;

import flow.nointernet.so.IsTicketOpened;
import tstool.salt.Balance;
import tstool.salt.Contractor;
import tstool.salt.Role;
import tstool.utils.VTIdataParser;
import tstool.process.DescisionMultipleInput;
import Main;

/**
 * ...
 * @author
 */
class CheckContractorVTI extends DescisionMultipleInput
{
	var parser:tstool.utils.VTIdataParser;
	var sagem:String;
	var is_sagem:Bool;
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
		#if debug
		trace("onVtiAccountParsed");
		//trace(profile);
		#end
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
				(profile.get("plan").exists("plan") ? (profile.get("plan").get("plan").indexOf("Giga")>-1?Gigabox:Fiber):Fiber)
			);

		}
		#if debug
		trace(Main.customer);
		#end
		question.text = question.text + " <em>" + Main.customer.contract.owner.name + "<em>";
		question.applyMarkup(question.text, [UI.THEME.basicEmphasis]);
		question.drawFrame();
		positionThis();
		multipleInputs.inputs.get("Contractor ID").inputtextfield.text = Main.customer.contract.contractorID;
		multipleInputs.inputs.get("VoIP Number").inputtextfield.text = Main.customer.contract.voip;
		multipleInputs.inputs.get("Contact Number").inputtextfield.text = Main.customer.contract.mobile;
		var p = multipleInputs.positionThis();
		positionButtons(p);
		positionBottom(p);

	}
	override public function update(elapsed)
	{
		super.update(elapsed);
	}
	override public function create():Void
	{
		Main.customer.reset();
		prepareXAPIMainActivity();

		super.create();
		parser = new VTIdataParser(account);
		parser.signal.add( onVtiAccountParsed );
	}

	override public function onYesClick():Void
	{
		//var contractorID = vtiContractorUI.getInputedText();
		if (validateYes())
		{
			//this._nexts = [{step: Main.HISTORY.isClassInteractionInHistory( Intro, Mid ) ? IsRedStep : IsTicketOpened }];
			this._nexts = [ {step: Main.HISTORY.isClassInteractionInHistory( Intro, Mid ) ? IsRedStep : WhatBoxIsIt }];
			this.parser.destroy();
			var contractorID = multipleInputs.inputs.get("Contractor ID").getInputedText();
			var voipVTI = multipleInputs.inputs.get("VoIP Number").getInputedText();
			var contactNB = multipleInputs.inputs.get("Contact Number").getInputedText();
			var voipSO = "0" + voipVTI.substr(2);
			//var is_sagem = isSagem(contractorID);
			Main.customer.contract.contractorID = contractorID;
			Main.customer.contract.voip = voipSO;
			Main.customer.contract.fix = voipVTI;
			//Main.customer.voIP = voipSO;
			Main.customer.iri = is_sagem || Main.customer.contract.service == Gigabox ? contractorID : voipSO;
			Main.customer.contract.mobile = contactNB;

			setReminder();
			//setReminder(is_sagem?SAGEM:  (Main.customer.contract.service == Gigabox ? Std.string(Gigabox) : ARCADYAN));
			super.onYesClick();
		}

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
	function isSagem(contrator:String)
	{
		return sagem.indexOf(contrator) >-1;
	}
	function canITrack(go:Bool)
	{
		if (go)
		{
			Main.track.setVerb("initialized");
			Main.track.setStatementRef(null);
			Main.track.setCustomer();
			Main.track.send();
			Main.track.setVerb("resolved");
		}

	}

	function prepareXAPIMainActivity()
	{
		if (Main.HISTORY.isClassInteractionInHistory(Intro, Mid))
		{
			Main.track.setActivity("equipment");
		}
		else if (Main.HISTORY.isClassInteractionInHistory(Intro, No))
		{
			Main.track.setActivity("tv");
		}
		else if (Main.HISTORY.isClassInteractionInHistory(IsSlowOrKaput, No))
		{
			Main.track.setActivity("no-internet");
		}
		else if (Main.HISTORY.isClassInteractionInHistory(flow.all.customer.IsSlowOrKaput, Yes) || Main.HISTORY.isClassInteractionInHistory(flow.all.customer.IsSlowOrKaput, Mid))
		{
			Main.track.setActivity("slow-internet");
		}
		else
		{
			Main.track.setActivity("");
		}
	}

}