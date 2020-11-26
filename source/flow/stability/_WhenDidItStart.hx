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
	override public function create():Void
	{
		this._nextProcesses = [ new _AtWhatTimeDoesItOccurs()];
		super.create();
	}
	
}