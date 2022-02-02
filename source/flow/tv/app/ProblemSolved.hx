package flow.tv.app;
import flow.tickets.CustomerInstruction;
import flow.tv._CreateSOTicketSaltTV;
//import flow.tv.install._ResetAppleTV;
import tstool.process.Descision;
import tstool.process.Process;

/**
 * ...
 * @author bb
 */
class ProblemSolved extends Descision 
{

	//override public function create()
	//{
		//var nextNo:Process = null;
		//if (Main.HISTORY.isProcessInHistory("flow.tv.app._CheckIfAppleTVNeedsUpdate"))
		//{
			//nextNo = new _CreateSOTicketSaltTV();	
		//}
		//else if (Main.HISTORY.isProcessInHistory("flow.tv.app._RebootAppleTV"))
		//{
			 //nextNo = new _CheckIfAppleTVNeedsUpdate();
		//}
		//else if (Main.HISTORY.isProcessInHistory("flow.tv.app._CheckIfSaltTVNeedsUpdate"))
		//{
			 //nextNo = new _RebootAppleTV();
		//}
		//else{
			 //nextNo = new _CheckIfSaltTVNeedsUpdate();
		//}
		//this._nextNoProcesses = [nextNo];
		//super.create();
	//}
	override public function onYesClick():Void
	{
		this._nexts = [{step: _AddMemoVti, params: []}];
		super.onYesClick();
	}
	override public function onNoClick():Void
	{
		var nextNo:ProcessContructor;
		if (Main.HISTORY.isClassInHistory(flow.tv.app._CheckIfAppleTVNeedsUpdate))
		{
			/***********************
			 * N°4 - ticket
			/***********************/
			nextNo =  {step: CustomerInstruction, params: [{step: _CreateSOTicketSaltTV}, {step: _CreateSOTicketSaltTV}]};
		}
		else if (Main.HISTORY.isClassInHistory(flow.tv.app._RebootAppleTV))
		{
			/***********************
			 * N°3
			/***********************/
			 nextNo = {step:_CheckIfAppleTVNeedsUpdate};
		}
		else if (Main.HISTORY.isClassInHistory(flow.tv.app._CheckIfSaltTVNeedsUpdate))
		{
			/***********************
			 * N°2
			/***********************/
			 nextNo = {step:_RebootAppleTV};
		}
		else{
			/***********************
			 * First time
			/***********************/
			 nextNo = {step:_CheckIfSaltTVNeedsUpdate};
		}
		this._nexts = [nextNo];
		super.onNoClick();
	}
}