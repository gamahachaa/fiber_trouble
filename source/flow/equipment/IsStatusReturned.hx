package flow.equipment;

//import tstool.process.Action;
import tstool.process.Descision;

/**
 * ...
 * @author bb
 */
class IsStatusReturned extends Descision 
{
	override public function onYesClick():Void
	{
		this._nexts = [{step: IsVTILaposteSendBoxMsgVisible, params: []}];
		super.onYesClick();
	}
	override public function onNoClick():Void
	{
		this._nexts = [{step: WasParcelInRothenbug, params: []}];
		super.onNoClick();
	}
}