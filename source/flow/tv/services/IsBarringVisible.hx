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
	override public function onYesClick():Void
	{
		this._nexts = [{step: _ActivateTVServicesVTI, params: []}];
		super.onYesClick();
	}	
	override public function onNoClick():Void
	{
		this._nexts = [{step: IsBasicTvPackageVisible, params: []}];
		super.onNoClick();
	}
	
	override public function onMidClick():Void
	{
		this._nexts = [{step: _VerifyCollectionStep, params: []}];
		super.onMidClick();
	}
}