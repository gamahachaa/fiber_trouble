package flow.tv.sound;

import flow.lan._CreateLanIssueTicket;
import tstool.process.ActionMultipleInput;

/**
 * ...
 * @author bb
 */
class SaltTVDetails extends ActionMultipleInput 
{

	public function new ()
	{
		super(
		[
		{
			ereg: new EReg("[\\s\\S]*","i"),
			input:{
				width:250,
				prefix:"Channels impacted",
				position: [bottom, left]
			}
		},
		{
			ereg: new EReg("[\\s\\S]*","i"),
			input:{
				width:250,
				prefix:"Program name",
				position: [top, right]
			}
		},
		{
			ereg: new EReg("[\\s\\S]*","i"),
			input:{
				width:250,
				prefix:"Time and date (01.01.1999)",
				position: [bottom, left]
			}
		}
		]
		);
	}
	override public function create()
	{
		this._nextProcesses = [new _IssueDescription()];
		super.create();
	}
}