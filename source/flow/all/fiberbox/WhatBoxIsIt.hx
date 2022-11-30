package flow.all.fiberbox;

//import flow.nointernet.so.IsTicketOpened;
//import flixel.FlxG;
//import flixel.text.FlxText;
import flixel.addons.ui.ButtonLabelStyle;
import flow.nointernet.so._CreateTicketModemCNX;
import flow.nointernet.vti.CheckContractorVTI;
import flow.tickets.CustomerInstruction;
import flow.tv.WhatIStheTVIssue;
import flow.tv.hardware.IsAppleTVvisibleOnTVScreen;
import flow.tv.hardware.IsAppleTVFourthGen;
import flow.tv.sound._MakeSureHDMIWellConnected;
import tstool.layout.Alert;
import tstool.layout.ClosableSubState;
import tstool.layout.History.ValueReturn;
import tstool.layout.SaltColor;
import tstool.layout.UI;
//import flow.tv.remote.WichRemote;
//import flow.tv.sound._StoreCustomersSetup;
//import tstool.process.Descision;
import tstool.process.Process;
import tstool.process.Triplet;

/**
 * ...
 * @author bb
 */
enum Box
{
	Sagem;
	Arcadyan;
	Gigabox;
}
class WhatBoxIsIt extends Triplet
{
	var mainIssue:ValueReturn;

	override public function onYesClick():Void
	{
		setCustomerProfile(Sagem);
		this._nexts = [{step: _WhereIsBoxPlaced, params: []}];
		super.onYesClick();
	}
	override public function onNoClick():Void
	{
		if (Main.customer.voIP == CheckContractorVTI.BLANK_VOIP)
		{
			//openAlert(["<ID>" => Main.customer.voIP, "<IDNAME>" => "Voip Number", "<PRODUCT>" => "Arcadyan box"]);
			setCustomerProfile(Arcadyan, true);
		}
		else{
			setCustomerProfile(Arcadyan);
		}
		this._nexts = [{step: _WhereIsBoxPlaced, params: []}];
		super.onNoClick();
	}
	inline function openAlert(message:Map<String,String>)
	{
		var alert:Alert = new AlertBadVoip(message);
		alert.signal.add(closeAlert);
		openSubState( alert );
	}
	inline function closeAlert()
	{
		closeSubState();
		this._nexts = [{step: CheckContractorVTI, params: []}];
		super.onNoClick();
	}
	override public function create():Void
	{
		super.create();
		mainIssue = Main.HISTORY.findValueOfFirstClassInHistory(Intro, Intro.ISSUE);
		if (Main.customer.contract.service == Office)
		{
			this.btnMid.visible = false;
			this.btnNo.visible = false;
		}
	}
	override public function onMidClick():Void
	{
		if (Main.customer.voIP == CheckContractorVTI.BLANK_VOIP)
		{
			setCustomerProfile(Gigabox);
			//this._nexts = [{step: _WhereIsBoxPlaced, params: []}];
			//this._nexts = if (Main.HISTORY.isClassInteractionInHistory(Intro, No))
			this._nexts = if (mainIssue.value == Intro.tv)
			{
				if (Main.HISTORY.isClassInteractionInHistory(WhatIStheTVIssue, Mid))
				{
					//tv
					[ {step:  IsAppleTVvisibleOnTVScreen}];
				}
				else if (Main.HISTORY.isClassInteractionInHistory(WhatIStheTVIssue, No))
				{
					//sound
					//[ {step: _StoreCustomersSetup }];
					[ {step: _MakeSureHDMIWellConnected }];
				}
				else
				{
					// remote
					//[ {step: WichRemote }];
					[ {step: IsAppleTVFourthGen }];
				}

			}
			else{
				[ {
					step: CustomerInstruction, params: [
					{step: _CreateTicketModemCNX},
					{step: _CreateTicketModemCNX}
					]
				}];
			}

			super.onMidClick();
		}else{
			openAlert(["<ID>" => Main.customer.voIP, "<IDNAME>" => "Voip Number", "<PRODUCT>"=>"Gigabox"]);
		}
	}
	function setCustomerProfile(box:Box, ?fake:Bool=false )
	{
		Main.customer.iri = (box != Arcadyan || fake) ? Main.customer.contract.contractorID : Main.customer.voIP;
		Main.customer.dataSet.set(
			CheckContractorVTI.CUST_DATA_PRODUCT,
			[CheckContractorVTI.CUST_DATA_PRODUCT_BOX => Std.string(box)]
		);
		Main.STORAGE_DISPLAY.push(CheckContractorVTI.CUST_DATA_PRODUCT_BOX);
		Process.STORE(
			CheckContractorVTI.CUST_DATA_PRODUCT_BOX,  Std.string(box)
			//arcadyan ? CheckContractorVTI.ARCADYAN:
			//(Main.customer.contract.service == Gigabox ? Std.string(Gigabox) : CheckContractorVTI.SAGEM)
		);
		#if debug
		trace( Main.customer.dataSet );
		#end
	}

}
class AlertBadVoip extends Alert
{
	public function new(m:Map<String,String>)
	{
		 super(m);
	}
}
