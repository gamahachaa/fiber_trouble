package flow.nointernet.fiberbox;

import regex.ExpReg;
import tstool.MainApp;
import tstool.process.Action;
//import tstool.process.DescisionLoop;
import tstool.process.DescisionMultipleInputLoop;
import tstool.process.Process;

/**
 * ...
 * @author ...
 */
//class _RebootBox extends DescisionLoop{}
class _RebootBox extends DescisionMultipleInputLoop
{
	static inline var JUSTIFICATION:String = "justification";
	override public function new( ?nextYes:ProcessContructor, ?nextNo:ProcessContructor )
	{
		super(
			[
		{
			ereg:new EReg(ExpReg.MINIMAL_3WORDS,"i"),
			input:{
				width: 450 ,
				prefix: JUSTIFICATION,
				position: [bottom, left],
				mustValidate: [No]
			}
		}
			],
		nextYes, nextNo);
	}
	override public function create():Void
	{
		super.create();
		var justification = MainApp.translator.get("$justification_UI1", "meta") +" (" + this._buttonNoTxt +")";
		/**
		 * @todo refactor to text field
		 */
		this.multipleInputs.inputs.get( JUSTIFICATION ).imputLabel.text = justification;
	}
}