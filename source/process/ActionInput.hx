package process;
import flixel.FlxG;
import flixel.effects.FlxFlicker;
import flixel.util.FlxSignal.FlxTypedSignal;
import layout.History.Interactions;
//import layout.UIInputTf;

/**
 * ...
 * @author bb
 */
class ActionInput extends Action
{
	//var inputtextfield:flixel.addons.ui.FlxInputText;
	
	var validator:EReg;
	var singleInput:SingleInput;
	var textFieldWidth:Int;
	var inputPrefix:String;
	public var nextValidatedSignal(get, null):FlxTypedSignal<Bool->Void>;
	public function new(textFieldWidth:Int, inputPrefix:String, ?validator:EReg=null)
	{
		super();
		nextValidatedSignal = new FlxTypedSignal<Bool->Void>();
		
		this.inputPrefix = inputPrefix;
		this.textFieldWidth = textFieldWidth;
		
		//_textFieldWidth = textFieldWidth;
		//_inputPrefix = inputPrefix;
		this.validator = validator == null ? ~/[\s\S]*/i: validator;
	}

	override public function create( ):Void
	{
		//uiInput = new UIInputTf(_textFieldWidth, _inputPrefix);
		//
		//uiInput.addToParent(this);
		singleInput = new SingleInput(this, textFieldWidth, inputPrefix);
		singleInput.create();
		super.create();
		
	}
	override public function update(elapsed)
	{
		super.update(elapsed);
		//if (FlxG.keys.justReleased.BACKSPACE && uiInput.hasFocus())
		//{
			//uiInput.clearText();
		//}
		singleInput.update(elapsed);
	}
	override public function onClick():Void
	{
		#if debug
		super.onClick(); // test only
		#else 
		if (validate())
		{
			nextValidatedSignal.dispatch(true);
			super.onClick();
		}
		nextValidatedSignal.dispatch(false);
		#end
	}
	override function positionThis()
	{
		super.positionThis();
		singleInput.positionThis();
	}
	override public function setStyle()
	{
		super.setStyle();
		singleInput.setStyle();
	}
	override function pushToHistory(buttonTxt:String, interactionType:Interactions)
	{
		var inputDisplay = singleInput.uiInput.getInputedText().length>0?" (" + singleInput.uiInput._label + " " + singleInput.uiInput.getInputedText() + ")":"";
		super.pushToHistory( inputDisplay, interactionType);
	}
	
	function get_nextValidatedSignal():FlxTypedSignal<Bool->Void> 
	{
		return nextValidatedSignal;
	}
	
	function validate()
	{
		if (!validator.match(singleInput.uiInput.getInputedText()))
		{
			singleInput.uiInput._labelValidator = Main.tongue.get("$" + this._name + "_MID", "validators");
			singleInput.uiInput.blink(true);
			return false;
		}
		return true;
	}
}