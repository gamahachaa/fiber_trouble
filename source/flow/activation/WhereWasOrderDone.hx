package flow.activation;
import layout.UIInputTfCore;
import process.DescisionMultipleInput;

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
				position:bottom
			}
		}
		]);
	}
	override public function create()
	{
		this._nextNoProcesses = [new SendTicketToTLPool()];
		this._nextYesProcesses = [new SendTicketToTLPool()];
		super.create();
	}
	
}