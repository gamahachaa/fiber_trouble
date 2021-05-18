package flow.ftth.delegate;
import firetongue.Replace;
import tstool.process.Action;

/**
 * ...
 * @author bb
 */
class _UpdateSOTicketWithOTO extends Action
{
	override public function create()
	{
		var oto = Main.HISTORY.findValueOfFirstClassInHistory(CanGiveOTOid, CanGiveOTOid.OTO_ID).value;
		this._detailTxt = Replace.flags( _detailTxt , ["<OTOID>"], [oto]);
		super.create();
		
	}
	override public function onClick():Void
	{
		this._nexts = [{step: _AddMemoVti, params: []}];
		super.onClick();
	}
	
}