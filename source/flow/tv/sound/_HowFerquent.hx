package flow.tv.sound;

import tstool.process.ActionMultipleInput;

/**
 * ...
 * @author bb
 */
class _HowFerquent extends ActionMultipleInput 
{

	public function new ()
	{
		super(
		[{
			ereg: new EReg("[\\s\\S]*","i"),
			input:{
				width:250,
				prefix:"Frequency",
				debug:"all the time",
				position: [bottom, left]
			}
		}]
		);
	}
	override public function create()
	{
		this._nextProcesses = [new IsSameIssueWithOtherApps()];
		super.create();
	}
	
}