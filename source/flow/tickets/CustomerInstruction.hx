package flow.tickets;
import tstool.process.DescisionMultipleInputLoop;
import tstool.process.Process.ProcessContructor;
import regex.ExpReg;
import tstool.layout.History.Interactions;

/**
 * ...
 * @author bb
 */
class CustomerInstruction extends DescisionMultipleInputLoop
{
	public static inline var CONTACT_NUMBER:String = "Contact number";
	public static inline var CONTACT_NUMBER_2ND:String = "Alt. Contact number";
	public static inline var CONTACT_EMAIL:String = "Contact email";
	public static inline var CONTACT_EMAIL_2ND:String = "Alt. Contact email";

	
	override public function new( ?nextYes:ProcessContructor, ?nextNo:ProcessContructor )
	{
		
		#if debug
		//trace("flow.tickets.CustomerInstruction::CustomerInstruction::nextYes", nextYes );
		//trace("flow.tickets.CustomerInstruction::CustomerInstruction::nextNo", nextNo );
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
		},
		{
			ereg: new EReg(ExpReg.MISIDN_UNIVERAL,"gi"),
			hasTranslation:true,
			input:{
				width:300,
				buddy:CONTACT_NUMBER,
				prefix: CONTACT_NUMBER_2ND,
				debug: "0787871234",
				mustValidate: [Exit],
				position: [top, right]
			}
		},
		{
			ereg: new EReg(ExpReg.EMAIL,"gi"),
			hasTranslation:true,
			input:{
				width:300,
				prefix: CONTACT_EMAIL,
				debug: "test@salt.ch",
				buddy:CONTACT_NUMBER, 
				position: [bottom, left]
			}
		},
		{
			ereg: new EReg(ExpReg.EMAIL,"gi"),
			hasTranslation:true,
			input:{
				width:300,
				prefix: CONTACT_EMAIL_2ND,
				debug: "test@salt.ch",
				mustValidate: [Exit],
				buddy:CONTACT_NUMBER_2ND, 
				position: [bottom, left]
			}
		}
		],
		nextYes, nextNo);
	}
}