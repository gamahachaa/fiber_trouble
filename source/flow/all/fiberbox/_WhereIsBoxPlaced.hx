package flow.all.fiberbox;

import flow.nointernet.so.IsTicketOpened;
import tstool.process.ActionRadios;
import tstool.process.Process;

/**
 * ...
 * @author bb
 */
class _WhereIsBoxPlaced extends ActionRadios
{

	static inline var TITLE:String = "Placement";
	static inline var ONE_OPENED:String = "Open space";
	static inline var TWO_CLOSED:String = "Closed space";
	static inline var TREE_MULTIMEDIA:String = "Multimedia";

	public function new()
	{
		super([
		{
			title: TITLE,
			hasTranslation:true,
			values: [ONE_OPENED, TWO_CLOSED, TREE_MULTIMEDIA]
		}
		]);

	}
	
	override public function onClick():Void
	{
		this._nexts = [{step:  getNext(), params: []}];
		if(validate())
			super.onClick();
	}
	inline function getNext():Class<Process>{
		return IsTicketOpened;
	}
}