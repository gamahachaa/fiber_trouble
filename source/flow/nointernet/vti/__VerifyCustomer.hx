package flow.nointernet.vti;
import flixel.FlxG;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import tstool.MainApp;
import tstool.layout.ClosableSubState;
import tstool.layout.Question;
import tstool.layout.SaltColor;
import tstool.layout.UI;

/**
 * ...
 * @author bb
 */
class __VerifyCustomer extends ClosableSubState
{
	var btnNo:FlxButton;
	var btnYes:FlxButton;
	var _buttonNoTxt:String;
	var _buttonYesTxt:String;
	var details:flixel.text.FlxText;
	var question:tstool.layout.Question;
    /**
     * @todo refactor to match unify with Main process
     */
	public function new()
	{
		//var bg = UI.THEME.bg;
		var bg:FlxColor = SaltColor.BLACK_PURE;
		bg.alphaFloat = .8;
		super(bg);
		question = new Question(0, 0, 1000, "", 24, true);
		question.setFormat( UI.TITLE_FMT.font, UI.TITLE_FMT.size);
		details = new FlxText(0, 0,  FlxG.width / 3, "", 16, true);
		details.autoSize = question.autoSize = false;
		// var _buttonYesTxt(default, set):String = "Yes";
		 _buttonYesTxt(default, set):String = MainApp.translator.get("$defaultBtn_UI3","meta");
		// var _buttonNoTxt(default, set):String = "No";Main.tongue.get(
		_buttonNoTxt(default, set):String = MainApp.translator.get("$defaultBtn_UI1","meta");
		//var _nextNoProcesses:Array<Process> = [];
		//var _nextYesProcesses:Array<Process> = [];
		btnNo;
		btnYes;

	}
	override public function create():Void
	{
		_buttonYesTxt = MainApp.translator.translate(_buttonYesTxt, "RIGHT-BTN");
		_buttonNoTxt =  MainApp.translator.translate(_buttonNoTxt, "LEFT-BTN") ;
		super.create();
		btnYes = new FlxButton(0, 0, _buttonYesTxt, onYesClick);
		registerButton(btnYes);
		btnNo = new FlxButton(0, 0, _buttonNoTxt, onNoClick);
		registerButton(btnNo);
		//seperator = new FlxShapeBox(0, 0, FlxG.width, 8, {thickness:4, color: 0x111111}, 0xff0000);
		btnNo.loadGraphic("assets/images/ui/left.png", true, 50, 40);
		btnYes.loadGraphic("assets/images/ui/right.png", true, 50, 40);
		//btnNo.setGraphicSize(50);
		//btnYes.setGraphicSize(50);
		var ptNo:FlxPoint = new FlxPoint( 0, -_padding);
		btnYes.labelOffsets= [ptNo, ptNo, ptNo];
		btnNo.labelOffsets = [ptNo, ptNo, ptNo];
		btnYes.labelAlphas = [1,1,1];
		btnNo.labelAlphas = [1,1,1];
		btnYes.label.setFormat(UI.INTERACTION_FMT.font, UI.INTERACTION_FMT.size);
		btnNo.label.setFormat( UI.INTERACTION_FMT.font, UI.INTERACTION_FMT.size);

		btnNo.label.wordWrap = false;
		btnYes.label.wordWrap = false;
		btnNo.label.autoSize = true;
		btnYes.label.autoSize = true;
		btnYes.updateHitbox();
		btnNo.updateHitbox();
		btnNo.label.color = UI.THEME.interaction;
		btnYes.label.color = UI.THEME.interaction;
		add(btnYes);
		add(btnNo);
	}

}