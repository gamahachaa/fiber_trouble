package flow.tv.sound;

//import tstool.process.Action;
import tstool.process.Descision;

/**
 * ...
 * @author bb
 */
class _TryAnotherHDMIPort extends Descision 
{
	override public function onYesClick():Void
	{
		this._nexts = [{step: _TryAnotherTV, params: []}];
		super.onYesClick();
	}
	override public function onNoClick():Void
	{
		this._nexts = [{step: _TryAnotherTV, params: []}];
		super.onNoClick();
	}
}