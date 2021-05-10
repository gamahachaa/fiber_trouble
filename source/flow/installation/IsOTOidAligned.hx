package flow.installation;

import flow.nointernet.so.tckets._WrongOTO;
import tstool.process.Descision;
import tstool.process.DescisionMultipleInput;

class IsOTOidAligned extends DescisionMultipleInput 
{
	public function new ()
	{
		super(
		[{
			ereg: new EReg("^(A|B)\\.[0-9]{3}\\.[0-9]{3}\\.[0-9]{3}(\\.[0-9X])?$","i"),
			input:{
				width:300,
				prefix:"OTO ID on plug at home",
				debug: "A.123.456.789.X",
				position: [bottom, left]
			}
		}]
		);
	}
	/****************************
	* Needed for validation
	*****************************/
	override public function onYesClick():Void
	{
		if (validateYes())
		{
			this._nexts = [{step: _EnsureCorrectPortPlug, params: []}];
			super.onYesClick();
		}
	}
	/*override public function validateYes():Bool
	{
		return true;
	}*/
	
	override public function onNoClick():Void
	{
		if (validateNo())
		{
			this._nexts = [{step: _WrongOTO, params: []}];
			super.onNoClick();
		}
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