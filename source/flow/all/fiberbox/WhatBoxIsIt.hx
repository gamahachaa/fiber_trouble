package flow.all.fiberbox;

import flow.nointernet.so.IsTicketOpened;
import flow.nointernet.vti.CheckContractorVTI;
//import tstool.process.Descision;
import tstool.process.Process;
import tstool.process.Triplet;


/**
 * ...
 * @author bb
 */
enum Box{
	Sagem;
	Arcadyan;
	Gigabox;
}
class WhatBoxIsIt extends Triplet
{

	override public function onYesClick():Void
	{
		setCustomerProfile(Sagem);
		this._nexts = [{step: _WhereIsBoxPlaced, params: []}];
		super.onYesClick();
	}
	override public function onNoClick():Void
	{
		setCustomerProfile(Arcadyan);
		this._nexts = [{step: _WhereIsBoxPlaced, params: []}];
		super.onNoClick();
	}
	
	override public function create():Void
	{
		super.create();
		if (Main.customer.contract.service == Office)
		{
			this.btnMid.visible = false;
			this.btnNo.visible = false;
		}
	}
	override public function onMidClick():Void
	{
		setCustomerProfile(Gigabox);
		this._nexts = [{step: _WhereIsBoxPlaced, params: []}];
		super.onMidClick();
	}
	function setCustomerProfile(box:Box)
	{
		Main.customer.iri = box == Arcadyan ? Main.customer.voIP : Main.customer.contract.contractorID;
		Main.customer.dataSet.set(
			CheckContractorVTI.CUST_DATA_PRODUCT, 
			[CheckContractorVTI.CUST_DATA_PRODUCT_BOX => Std.string(box)]
		);
		Process.STORAGE.set(
			CheckContractorVTI.CUST_DATA_PRODUCT_BOX,  Std.string(box)
			//arcadyan ? CheckContractorVTI.ARCADYAN: 
				//(Main.customer.contract.service == Gigabox ? Std.string(Gigabox) : CheckContractorVTI.SAGEM)
		);
	}

}