package flow.tv.network;

//import flow.all.fiberbox._AdvicePutOpenSpace;
//import flow.all.fiberbox._WhereIsBoxPlaced;
import flow.tickets.CustomerInstruction;
import flow.tv._CreateSOTicketSaltTV;
import tstool.layout.History.ValueReturn;
import tstool.process.Action;

/**
 * ...
 * @author bb
 */
class _TesLanCableWithComputer extends Action 
{
	override public function onClick():Void
	{
		//var whereIsBoxPlaced:ValueReturn = Main.HISTORY.findValueOfFirstClassInHistory(_WhereIsBoxPlaced, _WhereIsBoxPlaced.TITLE);
		//this._nexts = if (whereIsBoxPlaced.exists && whereIsBoxPlaced.value != _WhereIsBoxPlaced.ONE_OPENED){
			  //[{step: _AdvicePutOpenSpace }];
		//}else{
			 //[{step: CustomerInstruction, params: [{step: _CreateSOTicketSaltTV},{step: _CreateSOTicketSaltTV}]}];
		//}
		this._nexts = [{step: CustomerInstruction, params: [{step: _CreateSOTicketSaltTV}, {step: _CreateSOTicketSaltTV}]}];
		super.onClick();
	}
}