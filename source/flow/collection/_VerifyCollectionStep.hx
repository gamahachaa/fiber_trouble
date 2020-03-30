package flow.collection;

import process.Action;

/**
 * ...
 * @author ...
 */
class _VerifyCollectionStep extends Action 
{

	override public function create():Void
	{
		//this._titleTxt = "Verifier l'étape de collection ainsi que les raisons";
		//this._detailTxt = "Dans :";
		//this._detailTxt += "- VTI\nCC Dashboard";
		this._nextProcesses = [new IsSaltMistake()];
		super.create();
	}
	
}