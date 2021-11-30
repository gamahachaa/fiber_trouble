package flow.nointernet.fiberbox;
import flow.nointernet.so._CreateTicketModemCNX;
import flow.swapcable.SwapFiberCable;
import tstool.process.DescisionTemplate;
import tstool.process.Process;
import tstool.salt.SOTemplate;

/**
 * ...
 * @author bb
 */
class SendSMSReadRxTX extends DescisionTemplate
{

	public function new() 
	{
		super(SOTemplate.FIX_608,SMS);
	}
	
	override public function onYesClick():Void
	{
		this._nexts = [{step: getNext(), params: []}];
		super.onYesClick();
	}
	
	
	override public function onNoClick():Void
	{
		this._nexts = [{step: getNext(), params: []}];
		super.onNoClick();
	}
	override inline function getNext():Class<Process>{
		return NormalRxValues;
	}
}