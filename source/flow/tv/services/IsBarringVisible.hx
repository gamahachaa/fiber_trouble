package flow.tv.services;

//import flow.salttv._ActivateTVServicesVTI;
import flow.collection._VerifyCollectionStep;
//import tstool.process.Descision;
import tstool.process.Triplet;

/**
 * ...
 * @author bb
 */
class IsBarringVisible extends Triplet 
{
	override public function create()
	{
		this._nextNoProcesses = [new IsBasicTvPackageVisible()];
		this._nextYesProcesses = [new _ActivateTVServicesVTI()];
		this._nextMidProcesses = [new _VerifyCollectionStep()]; //Collection
		super.create();
	}
	
}