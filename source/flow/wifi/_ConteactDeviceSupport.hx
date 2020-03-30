package flow.wifi;

import process.Action;

/**
 * ...
 * @author ...
 */
class _ConteactDeviceSupport extends Action
{

	override public function create():Void
	{
		//this._titleTxt = "Contacter le support technique de l'appareil";
		//this._detailTxt = "";
		//this._illustration = "box/box_reset";
		this._nextProcesses = [new Intro()];
		super.create();
	}

}