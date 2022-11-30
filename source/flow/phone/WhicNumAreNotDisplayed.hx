package flow.phone;
import tstool.process.Descision;
import tstool.process.Process;

/**
 * ...
 * @author bb
 */
class WhicNumAreNotDisplayed extends Descision
{

	override public function onYesClick():Void
	{
		//all
		this._nexts = [{step: getNext(), params: []}];
		super.onYesClick();

	}
	override public function onNoClick():Void
	{
		//specific
		this._nexts = [{step: getNext(), params: []}];
		super.onNoClick();

	}
	inline function getNext():Class<Process>
	{
		return ProvideSamples;
	}
	/****************************
	* Needed only for validation
	*****************************/
	/*
	override public function validate():Bool
	{
		return true;
	}
	*/

}