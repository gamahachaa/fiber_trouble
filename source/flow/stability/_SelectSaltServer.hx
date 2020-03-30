package flow.stability;

import process.Action;

/**
 * ...
 * @author ...
 */
class _SelectSaltServer extends Action 
{

	override public function create():Void
	{
		//this._titleTxt = "Sélectionner le serveur Salt";
		//this._detailTxt = "Préssez le boutton GO au centre de l'écran
			//\nPatientez ~30s que les
			//\ncalculs se fassent
			//\nRépetter une ou deux fois";
		//this._illustration = "";
		this._nextProcesses = [new LanOrWiFi()];
		super.create();
	}
	
}