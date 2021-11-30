package flow.tv.remote.salttvv2;

import tstool.process.ActionMultipleInput;

/**
 * ...
 * @author bb
 */
class _CollectIssue extends ActionMultipleInput 
{
	static inline var ISSUE_DESC:String = "DESC";
	public function new ()
	{
		super(
		[{
			ereg: new EReg("[\\s\\S]*","i"),
			input:{
				width:900,
				prefix:ISSUE_DESC,
				position: [bottom, left]
			}
		}]
		);
	}
	
	override public function onClick():Void
	{
		this._nexts = [{step: _CreateSOTicketSaltTV, params: []}];
		super.onClick();
	}
}