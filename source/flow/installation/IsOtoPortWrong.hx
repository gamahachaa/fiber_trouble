package flow.installation;

//import flow.nointernet.so._CreateTicketModemCNX;
import firetongue.Replace;
import flow.nointernet.customer.FiberCableChanged;
//import tstool.layout.History.Snapshot;
import tstool.process.Descision;
import tstool.process.Process;

/**
 * ...
 * @author bb
 */
class IsOtoPortWrong extends Descision 
{
	override public function create():Void
	{
		this._titleTxt = Replace.flags(_titleTxt, ["<OTO_PORT>"], [getPort()] );
		super.create();
	}
	override public function onYesClick():Void
	{
		
		this._nexts = [{step: getNExt(), params: []}];
		super.onYesClick();
	}
	override public function onNoClick():Void
	{
		this._nexts = [{step: getNExt(), params: []}];
		super.onNoClick();
	}
	inline function getPort():String
	{
		
		//return Main.HISTORY.findFirstStepsClassInHistory(_EnsureCorrectPortPlug).values.get(_EnsureCorrectPortPlug.PORT_PLUGED);
		return Main.HISTORY.findValueOfFirstClassInHistory(_EnsureCorrectPortPlug, _EnsureCorrectPortPlug.PORT_PLUGED).value;
		
	}
	inline function getNExt():Class<Process>
	{
		return Main.HISTORY.isClassInteractionInHistory(FiberCableChanged, No)? OTOPlugDamagedNotClicking : _CheckSFP;
	}
}