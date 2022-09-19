package flow.tv.sound;

//import flow.lan._CreateLanIssueTicket;
import tstool.process.ActionMultipleInput;

/**
 * ...
 * @author bb
 */
class _SaltTVDetails extends ActionMultipleInput 
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
				debug:"Channels impacted...",
				position: [bottom, left]
			}
		},
		{
			ereg: new EReg("[\\s\\S]*","i"),
			input:{
				buddy:"Channels impacted", 
				width:250,
				prefix:"Program name",
				debug:"Program name ...",
				position: [top, right]
			}
		},
		{
			ereg: new EReg("[\\s\\S]*","i"),
			input:{
				buddy:"Channels impacted",
				width:250,
				debug:"01.01.2020 @ 00h",
				prefix:"Time and date (01.01.1999)",
				position: [bottom, left]
			}
		}
		]
		);
	}
	//override public function create()
	//{
		//this._nextProcesses = [new _IssueDescription()];
		//super.create();
	//}
	override public function onClick():Void
	{
		this._nexts = [{step: _IssueDescription, params: []}];
		super.onClick();
	}
}