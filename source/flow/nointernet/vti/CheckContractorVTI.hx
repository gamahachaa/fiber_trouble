package flow.nointernet.vti;

import flixel.FlxG;
import flow.activation.IsFiberOrMultisurf;
import flow.equipment.IsWhishDateWayAhead;
import flow.nointernet.customer.HasCustomerLEXnetworkIssue;
import flow.nointernet.so.IsTicketOpened;
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
	//var contractorEreg:EReg;
	//var vtiContractorUI:UIInputTf;
	//var inputs:Array<UIInputTf>;

	public function new()
	{
		super(
			[
				{
					ereg: new EReg("^41\\d{9}$","i"),
					input:{
						width:150,
						prefix:"VoIP N°",
						position:bottom
					}
				},
				{
					ereg:new EReg("^3\\d{7}$","i"),
					input:{
						width:150,
						prefix:"Contractor ID",
						position: bottom
					}
				}
			]
		);
		//var regY:EReg = ~/^41\d {9}$/i;
		//super(270, "VoIP N°");
		//inputs = [];
		//super(150, "VoIP N°", regY);
		this.yesValidatedSignal.add(canITrack);
	}
	override public function update(elapsed)
	{
		super.update(elapsed);
		//var i = 0;
		//if (FlxG.keys.justReleased.BACKSPACE)
		//{
//
			//i = whoHasFocus();
//
			//if (i > -1) inputs[i].clearText();
		//}
		//if (FlxG.keys.justReleased.TAB)
		//{
			//i = whoHasFocus();
//
			//inputs[i].toggleFocus();
			//inputs[(++i == inputs.length ? 0 : i)].toggleFocus();
		//}
	}
	override public function create():Void
	{
		Main.customer.reset();
		//vtiContractorUI = new UIInputTf(150, "Contractor ID");

		//contractorEreg = ~/^3\d{7}$/g;
		//vtiContractorUI.addToParent(this, false);
		//this._nextYesProcesses = [new IsTicketOpened()];
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
		//inputs = [this.singleInput.uiInput, vtiContractorUI];
	}
	override public function onYesClick():Void
	{
		//var contractorID = vtiContractorUI.getInputedText();
		var contractorID = multipleInputs.inputs.get("Contractor ID").getInputedText();
		//var voipVTI = this.singleInput.uiInput.inputtextfield.text;
		var voipVTI = multipleInputs.inputs.get("VoIP N°").getInputedText();
		var voipSO = "0" + voipVTI.substr(2);

		#if debug
		Main.customer.iri = contractorID == "" ? "39999999": contractorID;
		Main.customer.voIP = voipVTI == "" ? "0200000000": voipSO;
		#else
		if (Main.DEBUG && Main.user.isAdmin)
		{
			Main.customer.iri = contractorID == "" ? "39999999": contractorID;
			Main.customer.voIP = voipVTI == "" ? "0200000000": voipSO;
			//Main.customer.iri = contractorID;
			//Main.customer.voIP = voipSO;
		}
		else{
			Main.customer.iri = contractorID;
			Main.customer.voIP = voipSO;
		}
		#end

		super.onYesClick();
	}
	//override public function setStyle()
	//{
		//super.setStyle();
		//vtiContractorUI.setStyle();
	//}
	override function validateYes()
	{
		#if debug
		return true;
		#end
		if (Main.DEBUG && Main.user.isAdmin) return true;
		else
		{
			return super.validateYes();
		}
		//if (!contractorEreg.match( vtiContractorUI.getInputedText() ) )
		//{
			////vtiContractorUI._labelValidator = Main.tongue.get("$" + this._name + "_YES", "validators");
			//vtiContractorUI.blink(true);
			//return false;
		//}
		//else
		//{
			//return super.validateYes();
		//}
	}
	override function validateNo()
	{
		return true;
	}
	//override function positionThis()
	//{
		//super.positionThis();
		//vtiContractorUI.positionMe(
			//new Rectangle(
				//this.singleInput.uiInput.inputtextfield.x,
				//this.singleInput.uiInput.inputtextfield.y,
				//this.singleInput.uiInput.inputtextfield.width,
				//this.singleInput.uiInput.inputtextfield.height), 4);
	//}
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
	//function whoHasFocus():Int
	//{
		//for (i in 0...inputs.length )
		//{
//
			//if (inputs[i].hasFocus()) return i;
		//}
		//return -1;
	//}
}