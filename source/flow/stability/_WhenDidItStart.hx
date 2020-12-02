package flow.stability;

import tstool.process.ActionMultipleInput;

/**
 * ...
 * @author bb
 */
class _WhenDidItStart extends ActionMultipleInput 
{

	public function new() 
	{
		super([
		{
			ereg:~/[\s\S]*$/i,
			input:{
				width:200,
				prefix:"Start date",
				debug:"Start date ...",
				position:[bottom, left]
			}
		}
		]);
	}
	
	override public function onClick():Void
	{
		this._nexts = [{step: _AtWhatTimeDoesItOccurs, params: []}];
		super.onClick();
	}
}