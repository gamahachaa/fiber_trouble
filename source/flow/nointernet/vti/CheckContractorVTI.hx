package flow.nointernet.vti;

import flixel.FlxG;
import flow.activation.IsFiberOrMultisurf;
import flow.equipment.IsWhishDateWayAhead;
import flow.nointernet.customer.HasCustomerLEXnetworkIssue;
import flow.nointernet.so.IsTicketOpened;
import salt.Balance;
import salt.Contractor;
import salt.Role;
import utils.VTIdataParser;
//import layout.UIInputTf;
import lime.math.Rectangle;
import process.DescisionMultipleInput;
import Main;
import utils.XapiTracker;

/**
 * ...
 * @author
 */
class CheckContractorVTI extends DescisionMultipleInput
{
	var parser:utils.VTIdataParser;
	//var contractorEreg:EReg;
	//var vtiContractorUI:UIInputTf;
	//var inputs:Array<UIInputTf>;

	public function new()
	{
		super(
			[
				{
					ereg:new EReg("^3\\d{7}$","i"),
					input:{
						width:150,
						prefix:"Contractor ID",
						position: bottom
					}
				},
				{
					ereg: new EReg("^41\\d{9}$","i"),
					input:{
						width:150,
						prefix:"VoIP Number",
						position:right
					}
				},
			]
		);
		
		this.yesValidatedSignal.add(canITrack);
	}
	
	function onVtiAccountParsed(profile:Map<String, Map<String, String>>):Void 
	{
		//trace("onVtiAccountParsed");
		//trace(profile);
		if (!profile.exists("meta") || !profile.exists("plan")) return;
		else 
		Main.customer.contract = new Contractor(
			profile.get("meta").exists("vtiContractor")? profile.get("meta").get("vtiContractor"):"",
			profile.get("plan").exists("vtiVoip")? profile.get("plan").get("vtiVoip"):"",
			profile.get("plan").exists("vtiFix")? profile.get("plan").get("vtiFix"):"",
			profile.get("plan").exists("vtiMobile")? profile.get("plan").get("vtiMobile"):"",
			profile.get("plan").exists("vtiAdress")? profile.get("plan").get("vtiAdress"):"",
			profile.exists("owner")? new Role(owner,profile.get("owner").get("vtiOwner"),profile.get("owner").get("vtiOwnerEmail")):null,
			profile.exists("payer")? new Role(payer,profile.get("payer").get("vtiPayer"),profile.get("payer").get("vtiPayerEmail")):null,
			new Role(user, profile.get("plan").get("vtiUser"), profile.get("plan").get("vtiUserEmail")),
			profile.exists("owner")? StringTools.trim(profile.get("owner").get("vtiOwnerEmailValidated").toLowerCase()) == "ok":false,
			profile.exists("balance")?new Balance( profile.get("balance").get("vtiBalance"), profile.get("balance").get("vtiOverdue"), profile.get("balance").get("vtiOverdueDate")):null
		);
		multipleInputs.inputs.get("Contractor ID").inputtextfield.text = Main.customer.contract.contractorID;
		multipleInputs.inputs.get("VoIP Number").inputtextfield.text = Main.customer.contract.voip;
		
	}
	override public function update(elapsed)
	{
		super.update(elapsed);
	}
	override public function create():Void
	{
		Main.customer.reset();

		if (Main.HISTORY.isInHistory("flow.Intro", Mid))
		{
			this._nextYesProcesses = [new IsWhishDateWayAhead()];
			Main.track.setActivity("equipment");
		}
		else
		{
			if (Main.HISTORY.isInHistory("flow.Intro", No))
			{
				Main.track.setActivity("tv");
			}
			else if (Main.HISTORY.isInHistory("flow.all.customer.IsSlowOrKaput", No))
			{
				Main.track.setActivity("no-internet");
			}
			else if (Main.HISTORY.isInHistory("flow.all.customer.IsSlowOrKaput", Yes) || Main.HISTORY.isInHistory("flow.all.customer.IsSlowOrKaput", Mid))
			{
				Main.track.setActivity("slow-internet");
			}
			else{
				Main.track.setActivity("");
			}
			this._nextYesProcesses = [new HasCustomerLEXnetworkIssue()];
		}
		this._nextNoProcesses = [new IsFiberOrMultisurf()];

		super.create();
		parser = new VTIdataParser(account);
		parser.signal.add( onVtiAccountParsed );
		//inputs = [this.singleInput.uiInput, vtiContractorUI];
	}
	override public function onYesClick():Void
	{
		//var contractorID = vtiContractorUI.getInputedText();
		if (validateYes())
		{
			this.parser.destroy();
			var contractorID = multipleInputs.inputs.get("Contractor ID").getInputedText();
			//var voipVTI = this.singleInput.uiInput.inputtextfield.text;
			var voipVTI = multipleInputs.inputs.get("VoIP Number").getInputedText();
			var voipSO = "0" + voipVTI.substr(2);

			#if debug
			Main.customer.iri = contractorID == "" ? "39999999": contractorID;
			Main.customer.voIP = voipVTI == "" ? "0200000000": voipSO;
			#else
			if (Main.DEBUG && Main.user.isAdmin)
			{
				Main.customer.iri = contractorID == "" ? "39999999": contractorID;
				Main.customer.voIP = voipVTI == "" ? "0200000000": voipSO;
			}
			else{
				Main.customer.iri = contractorID;
				Main.customer.voIP = voipSO;
			}
			#end
			
			super.onYesClick();
		}
		
	}
	override function validateYes()
	{
		#if debug
		//return true;
		trace("validateYes");
		#end
		//if (Main.DEBUG && Main.user.isAdmin) return true;
		if (false) return true;
		else
		{
			#if debug
			//return true;
			trace("validateYes");
			#end
			return super.validateYes();
		}
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
}