package flow.phone;

import flow.all.customer._ExplainMainSteps;
import tstool.process.ActionRadios;
import tstool.process.Process;

/**
 * ...
 * @author bb
 */
class WhatIsthePhoneISsue extends ActionRadios 
{
	public static inline var ISSUE:String = "ISSUE";
	public static inline var no_calls:String = "no_calls";
	public static inline var caller_id:String = "caller_id";
	public static inline var drop_calls:String = "drop_calls";
	public static inline var sound_quality:String = "sound_quality";
	public function new() 
	{
		super(
		[
			{
				title: ISSUE,
				hasTranslation:true,
				values: [no_calls, caller_id, drop_calls, sound_quality]
			}
		]
		);
		
	}
	override public function onClick():Void
	{
		this._nexts = [{step:  getNext(), params: []}];
		super.onClick();
	}
	inline function getNext():Class<Process>{
		return _ExplainMainSteps;
	}
	
}