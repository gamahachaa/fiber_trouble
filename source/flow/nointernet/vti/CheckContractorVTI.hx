package flow.nointernet.vti;

import flixel.FlxG;
import flow.activation.IsFiberOrMultisurf;
import flow.equipment.IsWhishDateWayAhead;
import flow.nointernet.customer.HasCustomerLEXnetworkIssue;
import flow.nointernet.so.IsTicketOpened;
import layout.UIInputTf;
import process.DescisionInput;

/**
 * ...
 * @author
 */
class CheckContractorVTI extends DescisionInput
{
	var contractorEreg:EReg;
	var vtiContractorUI:UIInputTf;
	var inputs:Array<UIInputTf>;

	public function new()
	{
		var regY:EReg = ~/^41\d{9}$/i;
		//super(270, "VoIP N°");
		inputs = [];
		super(150, "VoIP N°",regY);
	}
	override public function update(elapsed)
	{
		super.update(elapsed);
		var i = 0;
		if (FlxG.keys.justReleased.BACKSPACE)
		{
			
			i = whoHasFocus();
			
			if(i > -1) inputs[i].clearText();
		}
		if (FlxG.keys.justReleased.TAB)
		{
			i = whoHasFocus();
			
			inputs[i].toggleFocus();
			inputs[(++i == inputs.length ? 0 : i)].toggleFocus();
		}
	}
	override public function create():Void
	{
		Main.customer.reset();
		vtiContractorUI = new UIInputTf(150, "Contractor ID");
		
		contractorEreg = ~/^3\d{7}$/g;
		vtiContractorUI.addToParent(this, false);
		//this._nextYesProcesses = [new IsTicketOpened()];
		if (Main.HISTORY.isInHistory("flow.Intro", Mid))
		{
			this._nextYesProcesses = [new IsWhishDateWayAhead()];
		}
		else
			this._nextYesProcesses = [new HasCustomerLEXnetworkIssue()];
		this._nextNoProcesses = [new IsFiberOrMultisurf()];
		
		super.create();
		inputs = [this.singleInput.uiInput, vtiContractorUI];
	}
	override public function onYesClick():Void
	{
		var cID = vtiContractorUI.getInputedText();
		var voipVTI = this.singleInput.uiInput.inputtextfield.text;
		var voipSO = "0" + voipVTI.substr(2);
		
		#if debug
			Main.customer.iri = cID == "" ? "39999999": cID;
			Main.customer.voIP = voipVTI == "" ? "0200000000": voipSO;
		#else
			Main.customer.iri = cID;
			Main.customer.voIP = voipSO;
		#end
		super.onYesClick();
	}
	override public function setStyle()
	{
		super.setStyle();
		vtiContractorUI.setStyle();
	}
	override function validateYes()
	{
		#if debug
			return true;
		#end
		if (!contractorEreg.match( vtiContractorUI.getInputedText() ) )
		{
			//vtiContractorUI._labelValidator = Main.tongue.get("$" + this._name + "_YES", "validators");
			vtiContractorUI.blink(true);
			return false;
		}
		else{
			return super.validateYes();
		}
	}
	override function positionThis()
	{
		super.positionThis();
		vtiContractorUI.positionMe(this.singleInput.uiInput.inputtextfield, 4, bottom);
	}
	function whoHasFocus():Int
	{
		for (i in 0...inputs.length )
		{
			
			if (inputs[i].hasFocus()) return i;
		}
		return -1;
	}
}