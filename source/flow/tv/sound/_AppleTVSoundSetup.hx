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
				position: [bottom, left]
			}
		},
		{
			ereg: new EReg("[\\s\\S]*","i"),
			input:{
				width:250,
				prefix:"Audio Format",
				position: [top, right]
			}
		},
		{
			ereg: new EReg("[\\s\\S]*","i"),
			input:{
				width:250,
				prefix:"Reduce Loud Sound",
				position: [bottom, left]
			}
		},
		{
			ereg: new EReg("[\\s\\S]*","i"),
			input:{
				width:250,
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