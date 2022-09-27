package flow.phone;

import tstool.process.Triplet;

/**
 * ...
 * @author bb
 */
class WhichCallsAreImpacted extends Triplet 
{

	override public function onYesClick():Void
	{
		this._nexts = [{step: ProvideSamples, params: []}];
		super.onYesClick();
	}
	
	
	override public function onNoClick():Void
	{
		this._nexts = [{step: ProvideSamples, params: []}];
		super.onNoClick();
	}
	
	override public function onMidClick():Void
	{
		this._nexts = [{step: ProvideSamples, params: []}];
		super.onMidClick();
	}
	
}