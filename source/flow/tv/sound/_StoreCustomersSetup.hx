package flow.tv.sound;

import tstool.process.ActionMultipleInput;
import tstool.process.DescisionMultipleInput;

/**
 * ...
 * @author bb
 */
class _StoreCustomersSetup extends ActionMultipleInput 
{

	public function new ()
	{
		super(
		[{
			ereg: new EReg("[\\s\\S]*","i"),
			input:{
				width:900,
				prefix:"Set up",
				position: [bottom, left]
			}
		}]
		);
	}
	override public function create()
	{
		this._nextProcesses = [new _AppleTVSoundSetup()];
		super.create();
	}
}