package flow.nointernet.fiberbox;
import process.Descision;
import flow.nointernet.postLedChecks.WasInternetWorkingBefore;

class WhatIsFiberLEDStatus extends Descision{
   override public function create() {
       		//this._titleTxt = "Aucne valeur RX et icon Rouge ?";
		this._nextYesProcesses = [new WasInternetWorkingBefore()];
		this._nextNoProcesses = [new IsWWWLedGreen()];
		super.create();
   }
}