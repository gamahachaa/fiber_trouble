package flow.installation;

import flow.all.fiberbox._LoopResetFiberBox;
import flow.nointernet.fiberbox.BoxLedStatus;
import flow.nointernet.fiberbox._RebootBox;
import flow.nointernet.vti.CheckContractorVTI;
import tstool.process.Action;
import flow.all.fiberbox.WhatBoxIsIt;

/**
 * ...
 * @author bb
 */
class _CheckSFP extends Action 
{
	override public function onClick():Void
	{
		//this._nexts = [{
			//step: _RebootBox, 
			//params: [
				//{step: BoxLedStatus},
				//{step: BoxLedStatus}
			//]	
		//}];
		this._nexts = [{
			step: _RebootBox, 
			params: [
				{step: _LoopResetFiberBox, params: [{step: BoxLedStatus},{step: BoxLedStatus}]},
				{step: _LoopResetFiberBox, params: [{step: BoxLedStatus},{step: BoxLedStatus}]}
			]	
		}];
		super.onClick();
	}
	override public function create():Void 
	{
		var is_sagem:Bool = Main.customer.dataSet.get(CheckContractorVTI.CUST_DATA_PRODUCT).get(CheckContractorVTI.CUST_DATA_PRODUCT_BOX) == Std.string(Sagem) ;
		var isOffice = Main.customer.contract.service == Office;
		if(is_sagem || isOffice)
			this._illustration = this._illustration + "_x6";
		super.create();
	}
}