package flow.nointernet.postLedChecks;


import flow.installation._EnsureNoLanLoop;
import flow.nointernet.so.tckets._SwapBox;
import flow.nointernet.customer.FiberCableChanged;
import process.DescisionInput;

class IsSerialNumberCorrect extends DescisionInput {
	public function new()
	{
		super(150, "Serial N° : SFAA...",~/^(SFAA)?[0-9]{8}$/gi);
	}
    override public function create()
        {
            this._nextYesProcesses = [new _EnsureNoLanLoop()];
            this._nextNoProcesses = [new _SwapBox()];
            super.create();
        }
}