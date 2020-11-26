package flow.nointernet.postLedChecks;

import process.ActionInput;

class _ReadSerialNumber extends ActionInput
{

	public function new()
	{
		super(150, "Serial N°");
	}
	override public function create():Void
	{
		this._nextProcesses = [new IsSerialNumberCorrect()];

		super.create();
	}
}