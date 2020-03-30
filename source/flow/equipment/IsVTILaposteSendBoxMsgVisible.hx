package flow.equipment;

import process.Descision;

/**
 * ...
 * @author bb
 */
class IsVTILaposteSendBoxMsgVisible extends Descision 
{

	override public function create()
	{
		this._nextNoProcesses = [new _TellCustWeSendParcelBackAgain()];
		this._nextYesProcesses = [new _ParcelIsBackToSalt()];
		super.create();
	}
	
}