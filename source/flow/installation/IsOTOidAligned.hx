package flow.installation;

import flow.nointernet.so.tckets._WrongOTO;
import flow.vti.ParseVTIHealthCheck;
//import tstool.process.Descision;
import tstool.process.DescisionMultipleInput;
import tstool.utils.VTIdataParser;

class IsOTOidAligned extends DescisionMultipleInput 
{
	static inline var OTO_ID_PREFIX:String = "OTO ID on plug at home";
	var vtiOTO:String;
	public function new ()
	{
		super(
		[{
			ereg: new EReg("^(A|B)\\.[0-9]{3}\\.[0-9]{3}\\.[0-9]{3}(\\.[0-9X])?$","i"),
			input:{
				width:300,
				prefix:OTO_ID_PREFIX,
				debug: "A.123.456.789.X",
				position: [bottom, left]
			}
		}]
		);
		var values = Main.HISTORY.findAllValuesOffOfFirstClassInHistory(ParseVTIHealthCheck);
		vtiOTO =  values.get(VTIdataParser.otoId);
		_detailTxt = StringTools.replace(_detailTxt, "<OTO>",vtiOTO);
	}
	/****************************
	* Needed for validation
	*****************************/
	override public function onYesClick():Void
	{
		var otoid = this.multipleInputs.getText( OTO_ID_PREFIX );
		if (validateYes() && sameOTO() )
		{
			this._nexts = [{step: _EnsureCorrectPortPlug, params: []}];
			super.onYesClick();
		}
		else{
			this.multipleInputs.inputs.get(OTO_ID_PREFIX).blink(true);
		}
	}
	/*override public function validateYes():Bool
	{
		return true;
	}*/
	
	override public function onNoClick():Void
	{
		if (validateNo() && !sameOTO() )
		{
			this._nexts = [{step: _WrongOTO, params: []}];
			super.onNoClick();
		}
		else{
			this.multipleInputs.inputs.get(OTO_ID_PREFIX).blink(true);
		}
	}
	inline function sameOTO():Bool
	{
		return  this.multipleInputs.getText( OTO_ID_PREFIX ) == vtiOTO;
	}
	/*override public function validateNo():Bool
	{
		return true;
	}*/
	/**/
    /*override public function create():Void
        {
            //this._nextYesProcesses = [new FiberCableIsSalt()];
            //this._nextYesProcesses = [new _CheckSFP()];
            this._nextYesProcesses = [new _EnsureCorrectPortPlug()];
            this._nextNoProcesses = [new _WrongOTO()];
            super.create();
        }*/
}