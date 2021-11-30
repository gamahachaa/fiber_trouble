package flow.nointernet.fiberbox;

import flow.installation.OTOPlugDamagedNotClicking;
import flow.nointernet.so._CreateTicketModemCNX;
import flow.swapcable.SwapFiberCable;
import tstool.process.DescisionMultipleInput;
import tstool.process.Process;
//import flow.installation._EnsureCorrectPortPlug;
import flow.nointernet.customer._TellCustomerAllOkWithFiberCnx;
import tstool.process.DescisionMultipleInput;
//import tstool.layout.UIInputTfCore;
/**
 * @todo ARCHIVE
 * @author ...
 Changesd title to "RX values are normal ?"
 */
class NormalRxValues extends DescisionMultipleInput
{
	static inline var BOX_RX:String = "Customer Box RX";
	public function new() 
	{
		super([
		{
			ereg: new EReg("(^-[0-9]{1,2}((,|.)[0-9]{1,3})?$)", "i"),
			hasTranslation:true,
			input:{
				width:200,
				prefix:BOX_RX,
				
				debug: "-12",
				position:[bottom, left]
			}
		}]);
	}
	override public function onYesClick(){
		this._nexts = [{step: getNext(), params: []}];
		if (valueInRange(true)) super.onYesClick();
	}
	override public function onNoClick(){
		this._nexts = [{step: getNext(), params: []}];
		if (valueInRange(false)) super.onNoClick();
	}
	function valueInRange( waitingFor:Bool )
	{
		var valueInputField = this.multipleInputs.inputs.get(BOX_RX);
		var rxString = valueInputField.getInputedText();
		var rxFloat = Std.parseFloat(rxString);
		#if debug
			trace(rxFloat, (rxFloat > -21.00));
		#end
		valueInputField.blink(true);
		if (rxFloat == Math.NaN || (rxFloat > -21 && !waitingFor ) || (rxFloat < -21 && waitingFor )) {
			//valueInputField.blink(true);
			return false;
		}
		return true;
	}
	inline function getNext() : Class<Process>
	{
		return if (Main.HISTORY.isClassInteractionInHistory(flow.nointernet.customer.FiberCableChanged, No)){
			
			SwapFiberCable;
		}
		else{
			_CreateTicketModemCNX;
		} 
	}
}