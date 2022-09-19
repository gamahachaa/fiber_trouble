package flow.nointernet.postLedChecks;

import flow.installation._EnsureNoLanLoop;
import flow.nointernet.so.tckets._SwapBox;
import flow.tickets.CustomerInstruction;
import format.csv.Data.Record;
import format.csv.Reader;
import lime.utils.Assets;
//import tstool.layout.UIInputTfCore;
import tstool.process.DescisionMultipleInput;
import regex.ExpReg;


class IsSerialNumberCorrect extends DescisionMultipleInput
{
	//static inline var BOX_SERIAL:String = "^(SFAA|GFAB)?[0-9]{8}$";
	static inline var SERIAL_PREFIX:String = "Serial Nb";
	//var snsTab:Array<String>;
	var vals:Map<String,String>;
	//var snsTabRecord:Array<Record>;
	public function new()
	{
		super(
		[
		{
			ereg: new EReg(ExpReg.BOX_SERIAL,"gi"),
			input:{
				width:150,
				prefix:SERIAL_PREFIX,
				debug: "SFAA12345678",
				position:[bottom, left]
			}
	}]);
	//var sns = Assets.getText("assets/data/fab_UMC_only.csv");
	//snsTabRecord = Reader.parseCsv(sns);
	//snsTab = Lambda.map(snsTabRecord, (e:Record)->(return e[0]));
		//super(150, "Serial N°",~/^(SFAA)?[0-9]{8}$/gi);
	}
	override public function onYesClick():Void
	{
		checkSN();
		this._nexts = [{step: _EnsureNoLanLoop, params: []}];
		super.onYesClick();
	}
	override public function onNoClick():Void
	{
		//this._nexts = [{step: _SwapBox, params: []}];
		checkSN();
		this._nexts = [{step: CustomerInstruction, params: [
													{step: _SwapBox},
													{step: _SwapBox}
												]
			}];
		super.onNoClick();
	}
	function checkSN()
	{
		vals = [for (k => v in multipleInputs.inputs) k => v.getInputedText()];
		var _index = Main.SN_TAB.lastIndexOf(multipleInputs.inputs.get(SERIAL_PREFIX).getInputedText()) ;
		if (_index > -1){
			vals.set("Chipset", Main.snTabRecord[_index][1]);
		}
	}
	override function pushToHistory( buttonTxt:String, interactionType:tstool.layout.History.Interactions,?values:Map<String,Dynamic>=null)
	{
		super.pushToHistory( buttonTxt, interactionType, vals);
	}
}