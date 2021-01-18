package flow.nointernet.vti;

//import flixel.FlxG;
import flow.activation.IsFiberOrMultisurf;
import flow.all.customer.IsSlowOrKaput;
import tstool.layout.UI;
import tstool.process.Process;
//import flow.equipment.IsWhishDateWayAhead;
import flow.equipment.OTOidVisibleInOfferManagement;
//import flow.nointernet.customer.HasCustomerLEXnetworkIssue;
import flow.nointernet.so.IsTicketOpened;
import tstool.salt.Balance;
import tstool.salt.Contractor;
import tstool.salt.Role;
import tstool.utils.VTIdataParser;
//import layout.UIInputTf;
//import lime.math.Rectangle;
import tstool.process.DescisionMultipleInput;
import Main;
//import tstool.utils.XapiTracker;

/**
 * ...
 * @author
 */
class CheckContractorVTI extends DescisionMultipleInput
{
	var parser:tstool.utils.VTIdataParser;

	public function new()
	{
		super(
			[
				{
					ereg:new EReg("^3\\d{7}$","i"),
					input:{
						width:150,
						debug: "30000000",
						prefix:"Contractor ID",
						position: [bottom, left]
					}
				},
				{
					ereg: new EReg("^41\\d{9}$","i"),
					input:{
						buddy: "Contractor ID",
						width:150,
						debug: "41780000000",
						prefix:"VoIP Number",
						position:[top, right]
					}
				},
				{
					ereg: new EReg("^41\\d{9}$","i"),
					input:{
						buddy: "Contractor ID",
						width:150,
						debug: "41780000000",
						prefix:"Contact Number",
						position:[bottom, left]
					}
				}
			]
		);
		
		this.yesValidatedSignal.add(canITrack);
	}
	function setReminder()
	{
		//081 304 10 13
			var voip = Main.customer.voIP.split("");
			voip.insert(8, " ");
			voip.insert(6, " ");
			voip.insert(3, " ");
			
			var displayVoip = voip.join("");
			var owner = Main.customer.contract.owner == null? "": Main.customer.contract.owner.name == null?"":Main.customer.contract.owner.name;
			var mobile = Main.customer.contract.mobile == "" ? "": "(" + Main.customer.contract.mobile + ")";
			var iri  = Main.customer.iri == "" ? "" : "(" + Main.customer.iri + ")";
			//Process.STORAGE.set("reminder", '$displayVoip $iri\n$owner $mobile' );
			Process.STORAGE.set("CONTRACTOR", iri );
			Process.STORAGE.set("VOIP", displayVoip );
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
			trace(profile);
		#end
		if (!profile.exists("meta") || !profile.exists("plan")) return;
		else 
		Main.customer.contract = new Contractor(
			profile.get("meta").exists("vtiContractor")? profile.get("meta").get("vtiContractor"):"",
			profile.get("plan").exists("vtiVoip")? StringTools.replace(profile.get("plan").get("vtiVoip"), "- ",""):"",
			profile.get("plan").exists("vtiFix")? profile.get("plan").get("vtiFix"):"",
			profile.get("plan").exists("vtiMobile")? profile.get("plan").get("vtiMobile"):"",
			profile.get("plan").exists("vtiAdress")? profile.get("plan").get("vtiAdress"):"",
			profile.exists("owner")? new Role(owner,profile.get("owner").get("vtiOwner"),profile.get("owner").get("vtiOwnerEmail")):null,
			profile.exists("payer")? new Role(payer,profile.get("payer").get("vtiPayer"),profile.get("payer").get("vtiPayerEmail")):null,
			new Role(user, profile.get("plan").get("vtiUser"), profile.get("plan").get("vtiUserEmail")),
			profile.exists("owner")? StringTools.trim(profile.get("owner").get("vtiOwnerEmailValidated").toLowerCase()) == "ok":false,
			profile.exists("balance")?new Balance( profile.get("balance").get("vtiBalance"), profile.get("balance").get("vtiOverdue"), profile.get("balance").get("vtiOverdueDate")):null
		);
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
			this._nexts = [{step: Main.HISTORY.isClassInteractionInHistory( Intro, Mid) ? OTOidVisibleInOfferManagement : IsTicketOpened }];
			this.parser.destroy();
			var contractorID = multipleInputs.inputs.get("Contractor ID").getInputedText();
			var voipVTI = multipleInputs.inputs.get("VoIP Number").getInputedText();
			var contactNB = multipleInputs.inputs.get("Contact Number").getInputedText();
			var voipSO = "0" + voipVTI.substr(2);
			Main.customer.iri = contractorID;
			Main.customer.voIP = voipSO;
			Main.customer.contract.mobile = contactNB;
			/*
			#if debug
			Main.customer.iri = contractorID == "" ? "39999999": contractorID;
			Main.customer.voIP = voipVTI == "" ? "0200000000": voipSO;
			Main.customer.contract.mobile == "" ? "41787878673": contactNB;
			#else
			if (Main.DEBUG && Main.user.isAdmin)
			{
				Main.customer.iri = contractorID == "" ? "39999999": contractorID;
				Main.customer.voIP = voipVTI == "" ? "0200000000": voipSO;
				Main.customer.contract.mobile = contactNB == "" ? "41787878673": contactNB;
			}
			else{
				
			}
			#end
			*/
			setReminder();
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
		if (Main.HISTORY.isClassInteractionInHistory(Intro, Mid)){
			Main.track.setActivity("equipment");
		}
		else if (Main.HISTORY.isClassInteractionInHistory(Intro, No)){
			Main.track.setActivity("tv");
		}
		else if (Main.HISTORY.isClassInteractionInHistory(IsSlowOrKaput, No)){
			Main.track.setActivity("no-internet");
		}
		else if (Main.HISTORY.isClassInteractionInHistory(flow.all.customer.IsSlowOrKaput, Yes) || Main.HISTORY.isClassInteractionInHistory(flow.all.customer.IsSlowOrKaput, Mid))
		{
			Main.track.setActivity("slow-internet"); 
		}
		else{
			Main.track.setActivity("");
		}		
	}
	
}