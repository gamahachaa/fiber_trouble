package kornok;

import kornok.KornokIsExmoore;
import process.Action;
import process.Process;

/**
 * ...
 * @author ...
 */
class IntroKornok extends Action 
{

	override public function create():Void
	{
		Process.INIT();
		this._detailTxt = "Chez moi il faut s'attacher les fers";
		this._titleTxt = "Bienvenue chez Kornok.";
		this._illustration = "kornok/image01";
		this._nextProcesses = [new KornokIsExmoore()];
		super.create();
	}

	
}