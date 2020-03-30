package flow;

import process.Action;

class TutoTwo extends Action
{
	override public function create():Void
	{
		//Process.INIT();
		this._detailTxt = "Si tu as accès à cet outil c'est que tu as été choisi pour le tester\n";

		this._detailTxt += "\n";
		this._detailTxt += "Je serais reconnaissant que tu me fasse des feedbacks bruno.baudry@salt.ch\n";
		this._detailTxt += "\t- Contenu (procédures, instructions, formulations, typos, images etc.)\n";
		this._detailTxt += "\t- Utilisabilité (lisibilié, interactivité etc.)\n";
		this._detailTxt += "\n";
		this._detailTxt += "Le mieux c'est de faire des copies d'écran\n";
		this._detailTxt += "(incluant le petit bout de code vert ci dessus pour que je m'y retrouve facilement)\n";
		this._detailTxt += "\n";
		this._detailTxt += "Pour le contenu text: un format de text editable (Word)\n";
		this._detailTxt += "\t- Utilisabilié\n";
		this._detailTxt += "\t- 'Collection path'\n";
		this._detailTxt += "\t- 'Activtion issue'\n";
		this._detailTxt += "\t- 'Trouble soot stability'\n";
		this._detailTxt += "\t- 'Escalation (Recaller)'\n";
		this._detailTxt += "\t- 'MiFi'\n";
		this._detailTxt += "Ce qui est PAS mappé: \n";
		this._detailTxt += "\t- 'Power cable'\n";
		this._detailTxt += "\t- 'Tout le reste'\n";

		//this._detailTxt += "\t\t- Historique interactif, quand tu cliques sur une entrée tu repars de là.\n (Pour l'instant il faut viser les pixels du texte)";
		this._titleTxt = "Etat.";
		//this._illustration = "default";
		this._nextProcesses = [new TutoTree()];
		//this._nextProcesses = [new WifiOnInDashboard()];
		super.create();
		//trace(Main.tongue.get("$" + this._name));
		//$type(Main.tongue.get("$" + this._name));
	}

}