package flow.equipment;


import flow._AddMemoVti;
import tstool.process.Triplet;

/**
 * ...
 * @author bb
 */
class DidCustomerSendProffCancel extends Triplet 
{

	override public function create()
	{
		var next = new _SoPluginUseInfo();
		this._nextNoProcesses = [ new _AddMemoVti()];
		this._nextYesProcesses = [next];
		this._nextMidProcesses= [next];
		super.create();
	}
	
}