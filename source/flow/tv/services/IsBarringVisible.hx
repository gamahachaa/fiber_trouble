package flow.tv.services;

import flow.salttv._ActivateTVServicesVTI;
import tstool.process.Descision;

/**
 * ...
 * @author bb
 */
class IsBarringVisible extends Descision 
{
	override public function create()
	{
		this._nextNoProcesses = [new IsBasicTvPackageVisible()];
		this._nextYesProcesses = [new _ActivateTVServicesVTI()];
		super.create();
	}
	
}