package flow.phone;

import tstool.process.ActionRadios;
import tstool.process.Process;
import tstool.process.Triplet;

/**
 * ...
 * @author bb
 */
class WhichCallsAreImpacted extends ActionRadios 
{
    public static inline var TYPE:String = "TYPE";
    public static inline var all:String = "all";
    public static inline var incomming:String = "incomming";
    public static inline var outgoing:String = "outgoing";
    public static inline var specific:String = "Specific";
	public function new() 
	{
		super(
		[
			{
				title: TYPE,
				hasTranslation:true,
				values: [all, incomming, outgoing, specific]
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
		return ProvideSamples;
	}
	
}
/*
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
*/