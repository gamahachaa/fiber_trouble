package flow.collection;

import flixel.addons.ui.FlxInputText;
import process.Action;

/**
 * ...
 * @author ...
 */
class _ExplainReasons extends Action 
{

	override public function create():Void
	{
		//this._titleTxt = "Expliquer les raisons";
		//this._detailTxt = "";
		//this._illustration = "";
		var reasonsInput = new FlxInputText(0,0,600,12);
		super.create();
		this._nextProcesses = [ new _SoTicketTreeTwoOne() ];
		add(reasonsInput);
		reasonsInput.x = this._padding;
		reasonsInput.y = this.details.y + this.details.height + this._padding/2;

	}
	
}