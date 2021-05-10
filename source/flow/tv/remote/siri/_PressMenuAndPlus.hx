package flow.tv.remote.siri;

//import flow.tv.hardware.IsAppleTVvisibleOnTVScreen;
import flow.tv.hardware._RepairProcess;
import tstool.process.Action;

/**
 * ...
 * @author bb
 */
class _PressMenuAndPlus extends Action 
{

	/*override public function create()
	{
		this._nextProcesses = [new DoesAppleTVLedBlinks( new _AdviceOnSiriRemoteUSage(), new _RepairProcess() )];
		super.create();
	}*/
	override public function onClick():Void
	{
		this._nexts = [{
			step: DoesAppleTVLedBlinks, 
			params: [
				{step: _AdviceOnSiriRemoteUSage},
				{step: _RepairProcess}
			]	
		}];
		super.onClick();
	}
}