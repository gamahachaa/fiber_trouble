package flow.stability;

import tstool.process.Triplet;

/**
 * ...
 * @author bb
 */
class _WhitWhatKindOfSite extends Triplet 
{
	override public function onYesClick():Void
	{
		this._nexts = [{step: _WhatToolItOccursWith, params: []}];
		super.onYesClick();
	}
	
	
	override public function onNoClick():Void
	{
		this._nexts = [{step: _WhatToolItOccursWith, params: []}];
		super.onNoClick();
	}
	
	override public function onMidClick():Void
	{
		this._nexts = [{step: _WhatToolItOccursWith, params: []}];
		super.onMidClick();
	}
}