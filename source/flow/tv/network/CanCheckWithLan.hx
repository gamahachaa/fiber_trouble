package flow.tv.network;

import flow.all.fiberbox._AdvicePutOpenSpace;
import flow.all.fiberbox._WhereIsBoxPlaced;
import flow.tickets.CustomerInstruction;
import flow.tv._CreateSOTicketSaltTV;
import tstool.layout.History.ValueReturn;
import tstool.process.Descision;

/**
 * ...
 * @author bb
 */
class CanCheckWithLan extends Descision 
{
	override public function onYesClick():Void
	{
		this._nexts = [{step: _EnsureLanCableWellPlugged, params: []}];
		super.onYesClick();
	}
	override public function onNoClick():Void
	{
		var whereIsBoxPlaced:ValueReturn = Main.HISTORY.findValueOfFirstClassInHistory(_WhereIsBoxPlaced, _WhereIsBoxPlaced.TITLE);
		this._nexts = if (whereIsBoxPlaced.exists && whereIsBoxPlaced.value != _WhereIsBoxPlaced.ONE_OPENED){
			  [{step: _AdvicePutOpenSpace }];
		}else{
			 [{step: CustomerInstruction, params: [{step: _CreateSOTicketSaltTV},{step: _CreateSOTicketSaltTV}]}];
		}
		super.onNoClick();
	}
}