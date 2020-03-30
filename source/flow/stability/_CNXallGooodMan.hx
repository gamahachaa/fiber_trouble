package flow.stability;

import flow.all.vti._AddMemoVti;
import process.Action;

/**
 * ...
 * @author ...
 */
class _CNXallGooodMan extends Action
{

	override public function create():Void
	{
		//this._titleTxt = "La connexion fonctionne normalenement";
		//this._detailTxt = "cf Qoof 'Argumentaire - Perception de lenteur de la connexion Internet'\nhttps://qoof.salt.ch/fr/knowledge/technical/wording_tips/wording_poor_internet_speed";
		//this._illustration = "";
		this._nextProcesses = [new _AddMemoVti()];
		super.create();
	}

}