package flow.tv.app;
import flow.tv._CreateSOTicketSaltTV;
import flow.tv.install._ResetAppleTV;
import tstool.process.Descision;
import tstool.process.Process;

/**
 * ...
 * @author bb
 */
class ProblemSolved extends Descision 
{

	override public function create()
	{
		
		var nextNo:Process = null;
		if (Main.HISTORY.isProcessInHistory("flow.tv.app._CheckIfAppleTVNeedsUpdate"))
		{
			/***********************
			 * N°4 - ticket
			/***********************/
			nextNo = new _CreateSOTicketSaltTV();
			
			/*if (Main.HISTORY.isInHistory("flow.tv.WhatIStheTVIssue", Yes))
			{
				 nextNo = new WhatAppleTVcnxType();
			}
			else{
			
				 nextNo = new _CreateSOTicketSaltTV();
			}*/
			
		}
		else if (Main.HISTORY.isProcessInHistory("flow.tv.app._RebootAppleTV"))
		{
			/***********************
			 * N°3
			/***********************/
			 nextNo = new _CheckIfAppleTVNeedsUpdate();
		}
		else if (Main.HISTORY.isProcessInHistory("flow.tv.app._CheckIfSaltTVNeedsUpdate"))
		{
			/***********************
			 * N°2
			/***********************/
			 nextNo = new _RebootAppleTV();
		}
		else{
			/***********************
			 * First time
			/***********************/
			 nextNo = new _CheckIfSaltTVNeedsUpdate();
		}
		this._nextNoProcesses = [nextNo];
		this._nextYesProcesses = [new flow._AddMemoVti()];
		super.create();
	}
	
}