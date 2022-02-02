package flow.installation;

//import flow.nointernet.so._CreateTicketModemCNX;
//import tstool.process.Descision;
import tstool.process.Triplet;

/**
 * ...
 * @author bb
 */
class OTOPlugDamagedNotClicking extends Triplet 
{
	override public function onYesClick():Void
	{
		this._nexts = [{step: IsOTODamagedByCust, params: []}];
		super.onYesClick();
	}
	override public function onNoClick():Void
	{
		this._nexts = [{step: _CheckSFP, params: []}];
		super.onNoClick();
	}
	override public function onMidClick():Void
	{
		this._nexts = [{step: SendOTOPrortCloggedSOTemplate, params: []}];
		super.onMidClick();
	}
}