package flow.tv.sound;

//import tstool.process.Action;
import tstool.process.Descision;

/**
 * ...
 * @author bb
 */
class _TryNewHDMICable extends Descision 
{
	override public function onYesClick():Void
	{
		this._nexts = [{step: _TryAnotherHDMIPort, params: []}];
		super.onYesClick();
	}
	override public function onNoClick():Void
	{
		this._nexts = [{step: _TryAnotherHDMIPort, params: []}];
		super.onNoClick();
	}
}