package flow.activation;
//import tstool.layout.UIInputTfCore;
import tstool.process.DescisionMultipleInput;

/**
 * ...
 * @author bb
 */
class WhereWasOrderDone extends DescisionMultipleInput 
{
	
	public function new() 
	{
		//super(280, "Store");
		super([
		{
			ereg: new EReg("[\\s\\S]*","i"),
			input:{
				width:200,
				prefix:"Store name",
				debug: "Store grindenwald, Gel !",
				position:[bottom, left]
			}
		}
		]);
	}
	//override public function create()
	//{
		//this._nextNoProcesses = [new SendTicketToTLPool()];
		//this._nextYesProcesses = [new SendTicketToTLPool()];
		//super.create();
	//}
	
	
	/****************************
	* Needed for validation
	*****************************/
	override public function onYesClick():Void
	{
		if (validateYes()){
			this._nexts = [{step: SendTicketToTLPool, params: []}];
			super.onYesClick();
		}	
	}
	override public function onNoClick():Void
	{
		if (validateNo()){
			this._nexts = [{step: SendTicketToTLPool, params: []}];
			super.onNoClick();
		}
	}
	/*
	override public function validateYes():Bool
	{
		return true;
	}
	*/
	/*
	override public function validateNo():Bool
	{
		return true;
	}
	*/
}