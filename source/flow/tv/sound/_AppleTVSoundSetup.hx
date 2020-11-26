package flow.tv.sound;

import tstool.process.ActionMultipleInput;

/**
 * ...
 * @author bb
 */
class _AppleTVSoundSetup extends ActionMultipleInput 
{

	public function new ()
	{
		super(
		[
		{
			ereg: new EReg("[\\s\\S]*","i"),
			input:{
				width:250,
				prefix:"Audio Output",
				debug:"Audio Output",
				position: [bottom, left]
			}
		},
		{
			ereg: new EReg("[\\s\\S]*","i"),
			input:{
				buddy:"Audio Output",
				width:250,
				debug:"Audio Format",
				prefix:"Audio Format",
				position: [top, right]
			}
		},
		{
			ereg: new EReg("[\\s\\S]*","i"),
			input:{
				buddy:"Audio Output",
				width:250,
				debug:"Reduce Loud Sound",
				prefix:"Reduce Loud Sound",
				position: [bottom, left]
			}
		},
		{
			ereg: new EReg("[\\s\\S]*","i"),
			input:{
				buddy:"Reduce Loud Sound",
				width:250,
				debug:"Audio Mode",
				prefix:"Audio Mode",
				position: [top, right]
			}
		}
		
		]
		);
	}
	override public function create()
	{
		this._nextProcesses = [new _SaltTVDetails()];
		super.create();
	}
}