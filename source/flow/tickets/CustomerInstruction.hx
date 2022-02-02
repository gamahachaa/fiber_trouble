package flow.tickets;
import tstool.process.DescisionMultipleInputLoop;
import tstool.process.Process.ProcessContructor;
import tstool.utils.ExpReg;

/**
 * ...
 * @author bb
 */
class CustomerInstruction extends DescisionMultipleInputLoop
{
	public static inline var CONTACT_NUMBER:String = "Contact number";

	
	override public function new( ?nextYes:ProcessContructor, ?nextNo:ProcessContructor)
	{
		#if debug
		trace("flow.tickets.CustomerInstruction::CustomerInstruction::nextYes", nextYes );
		trace("flow.tickets.CustomerInstruction::CustomerInstruction::nextNo", nextNo );
		#end
		super(
		[{
			ereg: new EReg(ExpReg.MISIDN_UNIVERAL,"gi"),
			hasTranslation:true,
			input:{
				width:300,
				prefix: CONTACT_NUMBER,
				debug: "0787871234",
				position: [bottom, left]
			}
		}],
		nextYes, nextNo);
	}
}