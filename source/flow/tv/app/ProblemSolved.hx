package flow.tv.app;
import flow.tv._CreateSOTicketSaltTV;
import flow.tv.install._ResetAppleTV;
import tstool.process.Descision;

/**
 * ...
 * @author bb
 */
class ProblemSolved extends Descision 
{

	override public function create()
	{
		
		var nextNo = if (Main.HISTORY.isInHistory("flow.tv.app._CheckIfSaltTVNeedsUpdate", Next))
		{
			/***********************
			 * N°3
			/***********************/
			if (Main.HISTORY.isInHistory("flow.tv.WhatIStheTVIssue", Yes))
			{
				/********************************
				 * Feature Issue
				/********************************/
				new WhatAppleTVcnxType();
			}
			else{
				/********************************
				 * Channel Issue
				/********************************/
				new _CreateSOTicketSaltTV();
			}
			
		}
		else if (Main.HISTORY.isInHistory("flow.tv.app._RebootAppleTV", Next))
		{
			/***********************
			 * N°2
			/***********************/
			new _CheckIfSaltTVNeedsUpdate();
		}
		else if (Main.HISTORY.isInHistory("flow.tv.app._CheckIfAppNeedsUpdate", Next))
		{
			/***********************
			 * N°1
			/***********************/
			new _RebootAppleTV();
		}
		else{
			/***********************
			 * First time
			/***********************/
			new _CheckIfAppNeedsUpdate();
		}
		//this._nextNoProcesses = [new _CheckIfAppNeedsUpdate(), new _RebootAppleTV(), new _ResetAppleTV(), new _CreateSOTicketSaltTV()];
		this._nextYesProcesses = [new flow._AddMemoVti()];
		super.create();
	}
	
}