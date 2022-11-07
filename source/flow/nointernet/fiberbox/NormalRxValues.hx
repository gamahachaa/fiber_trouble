package flow.nointernet.fiberbox;

//import flow.installation.OTOPlugDamagedNotClicking;
import flow.nointernet.so._CreateTicketModemCNX;
import flow.nointernet.vti.CheckContractorVTI;
import flow.swapcable.SwapFiberCable;
import flow.tickets.CustomerInstruction;
import tstool.MainApp;
//import flow.vti.ParseVTIHealthCheck;
import regex.ExpReg;
import tstool.process.TripletMultipleInput;
//import tstool.process.DescisionMultipleInput;
import tstool.process.Process;
//import flow.installation._EnsureCorrectPortPlug;
//import flow.nointernet.customer._TellCustomerAllOkWithFiberCnx;
//import tstool.process.DescisionMultipleInput;
//import tstool.layout.UIInputTfCore;
/**
 * @todo ARCHIVE
 * @author ...
 Changesd title to "RX values are normal ?"
 */
class NormalRxValues extends TripletMultipleInput
{
	static inline var BOX_RX:String = "Customer Box RX";
	static inline var BOX_TX:String = "Customer Box TX";
	static inline var JUSTIFICATION:String = "justification";
	public function new() 
	{
		super([
		{
			ereg: new EReg(ExpReg.RX, "i"),
			hasTranslation:true,
			input:{
				width:200,
				prefix:BOX_RX,
				debug: "-12",
				position:[bottom, left],
				mustValidate: [Yes,No]
			}
		},
		{
			ereg: new EReg(ExpReg.TX, "i"),
			hasTranslation:true,
			input:{
				width:200,
				prefix:BOX_TX,
				buddy: BOX_RX,
				debug: "4",
				position:[bottom, left],
				mustValidate: [Yes,No]
			}
		},
		{
			ereg:new EReg(ExpReg.MINIMAL_3WORDS,"i"),
			input:{
				width:450,
				prefix: JUSTIFICATION,
				buddy: BOX_TX,
				position: [bottom, left],
				mustValidate: [Mid]
			}
		}]);
	}
	override public function onYesClick(){
		this._nexts = [getNext()];
		if (valueInRange(true)) super.onYesClick();
	}
	override public function onNoClick(){
		this._nexts = [getNext()];
		if (valueInRange(false)) super.onNoClick();
	}
	override public function onMidClick(){
		if (validateMid())
		{
			this._nexts = [getNext()];
			super.onMidClick();
		}
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
	inline function getNext() :ProcessContructor
	{
		var is_sagem:Bool = Main.customer.dataSet.get(CheckContractorVTI.CUST_DATA_PRODUCT).get(CheckContractorVTI.CUST_DATA_PRODUCT_BOX) == CheckContractorVTI.SAGEM;
		var fiberLedArcadyan:String = if (is_sagem)
		{
			Main.HISTORY.findValueOfFirstClassInHistory(BoxLedStatus, BoxLedStatus.FIBER_SAGEM_TITLE).value;
		}else{
			Main.HISTORY.findValueOfFirstClassInHistory(BoxLedStatus, BoxLedStatus.FIBER_TITLE).value;
		}
		return if (Main.HISTORY.isClassInteractionInHistory(flow.nointernet.customer.FiberCableChanged, No) && fiberLedArcadyan != BoxLedStatus._greenStable){
			
			{step: SwapFiberCable};
		}
		else{
			//_CreateTicketModemCNX;
			{step: CustomerInstruction, params: [
													{step: _CreateTicketModemCNX},
													{step: _CreateTicketModemCNX}
												]
			};
		} 
	}
	//override function validateMid()
	//{
		//return true;
	//}
	override public function create():Void 
	{
		super.create();
		var justification = MainApp.translator.get("$justification_UI1", "meta") +" (" + this._buttonMidTxt +")";
		/**
		 * @todo refactor to text field
		 */
		this.multipleInputs.inputs.get(JUSTIFICATION).imputLabel.text = justification;
	}
}