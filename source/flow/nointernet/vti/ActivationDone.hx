package flow.nointernet.vti;


import flow.powercable.LedPowerOn;
import process.Descision;

/**
 * ...
 * @author ...
 */
class ActivationDone extends Descision
{

	override public function create():Void
	{
		//this._titleTxt = "Le provisioning de la commande est OK ?";
		//this._detailTxt = "";
		//this._illustration = "";
		// this._nextYesProcesses = [new InstallationOk()];
		this._nextYesProcesses = [new IsBarred()];
		this._nextNoProcesses = [new _TroubleShootActivation()];
		super.create();
	}
	
}