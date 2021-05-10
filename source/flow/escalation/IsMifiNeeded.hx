package flow.escalation;

import flow.escalation._SendMifiMail;
import tstool.process.Action;
import tstool.process.Descision;

/**
 * ...
 * @author ...
 */
class IsMifiNeeded extends Descision
{
	/*
	override public function create():Void
	{
		this._nextYesProcesses = [new _SendMifiMail()];
		this._nextNoProcesses = [new _VerifyContactDetails()];
		super.create();
	}*/
	override public function onYesClick():Void
	{
		this._nexts = [{step: _SendMifiMail, params: []}];
		super.onYesClick();
	}
	override public function onNoClick():Void
	{
		this._nexts = [{step: _VerifyContactDetails, params: []}];
		super.onNoClick();
	}
}