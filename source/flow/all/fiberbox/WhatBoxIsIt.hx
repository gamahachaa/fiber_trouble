package flow.all.fiberbox;

import flixel.addons.ui.ButtonLabelStyle;
import flow.all.customer.IsSlowOrKaput;
import flow.nointernet.fiberbox.IsBoxReachable;
import flow.nointernet.so._CreateTicketModemCNX;
import flow.nointernet.vti.CheckContractorVTI;
import flow.phone.HowIsDeviceConnected;
import flow.phone.IsTheDeviceWorking;
import flow.phone.WhatIsthePhoneISsue;
import flow.tickets.CustomerInstruction;
import flow.tv.WhatIStheTVIssue;
import flow.tv.hardware.IsAppleTVvisibleOnTVScreen;
import flow.tv.hardware.IsAppleTVFourthGen;
import flow.tv.sound._MakeSureHDMIWellConnected;
import flow.vti.SerialVTI;
import flow.vti._RXfromVTI;
import tstool.layout.Alert;
import tstool.layout.ClosableSubState;
import tstool.layout.History.ValueReturn;
import tstool.layout.SaltColor;
import tstool.layout.UI;

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
	var box:Box;
	inline function openAlert(message:Map<String,String>)
	{
		var alert:Alert = new AlertBadVoip(message);
		alert.signal.add(closeAlert);
		openSubState( alert );
	}
	inline function closeAlert()
	{
		closeSubState();
		this._nexts = [ {step: CheckContractorVTI, params: []}];
		super.onNoClick();
	}
	override public function create():Void
	{
		super.create();
		#if debug
		trace("flow.all.fiberbox.WhatBoxIsIt::create::Main.customer.dataSet", Main.customer.dataSet );
		#end
		box = Type.createEnum(Box,Main.customer.dataSet.get(
			CheckContractorVTI.CUST_DATA_PRODUCT).get(CheckContractorVTI.CUST_DATA_PRODUCT_BOX)
							 );
		#if debug
		trace("flow.all.fiberbox.WhatBoxIsIt::create::box", box );
		#end
		mainIssue = Main.HISTORY.findValueOfFirstClassInHistory(Intro, Intro.ISSUE);
		if (Main.customer.contract.service == Office)
		{
			this.btnMid.visible = false;
			this.btnNo.visible = false;
		}
	}
	override public function onYesClick():Void
	{
		if (checkBox(Sagem))
		{
			setCustomerProfile(Sagem);
			getNext(Sagem);
			super.onYesClick();
		}
	}
	override public function onNoClick():Void
	{
		if (checkBox(Arcadyan))
		{
			getNext(Arcadyan);
			super.onNoClick();
		}
	}

	override public function onMidClick():Void
	{
		//Gigabox

		if (checkBox(Gigabox))
		{
			getNext(Gigabox);
			super.onMidClick();
		}
		//else{
		//openAlert(["<ID>" => Main.customer.voIP, "<IDNAME>" => "Voip Number", "<PRODUCT>"=>"Gigabox"]);
		//}
	}
	function checkBox(boxClicked:Box)
	{
		if (box == boxClicked) return true;
		openAlert(["<ID>" => Main.customer.voIP, "<IDNAME>" => "Voip Number", "<PRODUCT>" => Std.string(boxClicked)]);
		return false;

	}
	function setCustomerProfile(box:Box, ?fake:Bool=false )
	{
		Main.customer.iri = (box != Arcadyan || fake) ? Main.customer.contract.contractorID : Main.customer.voIP;

		Main.STORAGE_DISPLAY.push(CheckContractorVTI.CUST_DATA_PRODUCT_BOX);
		Process.STORE(
			CheckContractorVTI.CUST_DATA_PRODUCT_BOX,  Std.string(box)
		);
		#if debug
		trace( Main.customer.dataSet );
		#end
	}
	function getNext(box:Box):Void
	{
		var mainIssue = Main.HISTORY.findValueOfFirstClassInHistory(Intro, Intro.ISSUE);
		var phoneIssue = Main.HISTORY.findValueOfFirstClassInHistory(WhatIsthePhoneISsue, WhatIsthePhoneISsue.ISSUE);
		if (box == Arcadyan)
			setCustomerProfile(Arcadyan, Main.customer.voIP == CheckContractorVTI.BLANK_VOIP);
		else{
			setCustomerProfile(box);
		}

		if ( box == Gigabox )
		{
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
					[ {step: _MakeSureHDMIWellConnected }];
				}
				else
				{
					// remote
					[ {step: IsAppleTVFourthGen }];
				}
			}
			else
			{
				[
				{
					step: CustomerInstruction, params: [
					{step: _CreateTicketModemCNX},
					{step: _CreateTicketModemCNX}
					]
				}];
			}
		}
		else{
			if (Main.HISTORY.isClassInteractionInHistory(IsSlowOrKaput, No))
			{
				// NO INTERNET
				this._nexts = [ {step:IsBoxReachable}];
			}
			else if (mainIssue.value == Intro.phone )
			{
				// PHONE
				if (phoneIssue.value == WhatIsthePhoneISsue.drop_calls)
				{
					this._nexts = [ {step:IsTheDeviceWorking}];
				}
				else if (phoneIssue.value == WhatIsthePhoneISsue.caller_id || phoneIssue.value == WhatIsthePhoneISsue.sound_quality)
				{
					this._nexts = [ {step: HowIsDeviceConnected}];
				}
				else
				{
					this._nexts = [ {step:IsBoxReachable}];
				}
			}
			else {
				// stability
				if (box == Arcadyan) this._nexts = [{step:SerialVTI}];
				else this._nexts = [{step:_RXfromVTI}];// Sagem
			}
		}

	}
}
/*class AlertBadVoip extends Alert
{
	public function new(m:Map<String,String>)
	{
		super(m);
	}
}*/
