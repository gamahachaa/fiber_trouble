package flow.all.fiberbox;

import flow.nointernet.so.IsTicketOpened;
import flow.nointernet.vti.CheckContractorVTI;
import tstool.process.Descision;
import tstool.process.Process;
import tstool.process.Triplet;
import tstool.salt.Contractor;

/**
 * ...
 * @author bb
 */
enum Box{
	Sagem;
	Arcadyan;
	Fwa;
}
class WhatBoxIsIt extends Triplet
{

	override public function onYesClick():Void
	{
		setCustomerProfile(false);
		this._nexts = [{step: IsTicketOpened, params: []}];
		super.onYesClick();
	}
	override public function onNoClick():Void
	{
		setCustomerProfile(true);
		this._nexts = [{step: IsTicketOpened, params: []}];
		super.onNoClick();
	}
	
	override public function create():Void
	{
		super.create();
		if (!Main.HISTORY.isClassInteractionInHistory(Intro, No))
		{
			this.btnMid.visible = false;
		}
	}
	override public function onMidClick():Void
	{
		this._nexts = [{step: IsTicketOpened, params: []}];
		super.onMidClick();
	}
	function setCustomerProfile(arcadyan:Bool)
	{
		Main.customer.iri = arcadyan ? Main.customer.voIP : Main.customer.contract.contractorID;
		Main.customer.dataSet.set(CheckContractorVTI.CUST_DATA_PRODUCT, [CheckContractorVTI.CUST_DATA_PRODUCT_BOX => (arcadyan?CheckContractorVTI.ARCADYAN: CheckContractorVTI.SAGEM)]);
		Process.STORAGE.set("BOX", arcadyan ?CheckContractorVTI.ARCADYAN:  (Main.customer.contract.service == Gigabox ? Std.string(Gigabox) : CheckContractorVTI.SAGEM));
	}

}