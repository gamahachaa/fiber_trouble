package process;
import flixel.FlxG;
import flixel.effects.FlxFlicker;
import flixel.util.FlxSignal.FlxTypedSignal;
//import flixel.util.FlxSignal.FlxTypedSignal;
import layout.History.Interactions;
import layout.UIInputTf;
import process.SingleInput;

/**
 * ...
 * @author bb
 */
class DescisionInput extends Descision 
{
	var yesValidator:EReg;
	var noValidator:EReg;
	var singleInput:process.SingleInput;
	var textFieldWidth:Int;
	var inputPrefix:String;
	public var yesValidatedSignal(get, null):FlxTypedSignal<Bool->Void>;
	public var noValidatedSignal(get, null):FlxTypedSignal<Bool->Void>;
	public function new(textFieldWidth:Int, inputPrefix:String, ?yesValidator:EReg=null, ?noValidator:EReg=null)
	{
		super();
		this.yesValidatedSignal = new FlxTypedSignal<Bool->Void>();
		this.noValidatedSignal = new FlxTypedSignal<Bool->Void>();
		this.inputPrefix = inputPrefix;
		this.textFieldWidth = textFieldWidth;
		
		this.noValidator = noValidator == null ? ~/[\s\S]*/i: noValidator;
		this.yesValidator = yesValidator== null ? ~/[\s\S]*/i: yesValidator;

	}
	override public function create( ):Void
	{
		singleInput = new SingleInput(this, textFieldWidth, inputPrefix);
		singleInput.create();
		super.create();
	}
		
		
	override public function update(elapsed)
	{
		super.update(elapsed);
		singleInput.update(elapsed);
	}
	override public function setStyle()
	{
		super.setStyle();
		singleInput.setStyle();
	}
	override public function onYesClick():Void
	{
		//#if debug
		//super.onYesClick(); // test only
		//#else
		if (validateYes())
		{
			yesValidatedSignal.dispatch(true);
			super.onYesClick();
		}
		yesValidatedSignal.dispatch(false);
		//#end
	}
	override public function onNoClick():Void
	{
		//#if debug
		//super.onNoClick(); // test only
		//#else
		if (validateNo())
		{
			noValidatedSignal.dispatch(true);
			super.onNoClick();
		}
		noValidatedSignal.dispatch(true);
		//#end
	}
	override function positionThis()
	{
		super.positionThis();
		singleInput.positionThis();
	}
	override function pushToHistory( buttonTxt:String, interactionType:Interactions)
	{
		var inputDisplay = singleInput.uiInput.getInputedText().length>0?" (" + singleInput.uiInput._label + " " + singleInput.uiInput.getInputedText() + ")":"";
		super.pushToHistory( buttonTxt + inputDisplay, interactionType);
		//super.pushToHistory( buttonTxt + " ("+ singleInput.uiInput._label + " " + singleInput.uiInput.getInputedText()+ ")", interactionType);
	}
	function validateYes()
	{
		if (!yesValidator.match(singleInput.uiInput.getInputedText()))
		{
			singleInput.uiInput._labelValidator = Main.tongue.get("$" + this._name + "_YES", "validators");
			singleInput.uiInput.blink(true);
			return false;
		}
		return true;
		//return false;
	}
	
	function get_yesValidatedSignal():FlxTypedSignal<Bool->Void> 
	{
		return yesValidatedSignal;
	}
	
	function get_noValidatedSignal():FlxTypedSignal<Bool->Void> 
	{
		return noValidatedSignal;
	}
	
	function validateNo()
	{
		if (!noValidator.match(singleInput.uiInput.getInputedText()))
		{
			singleInput.uiInput._labelValidator = Main.tongue.get("$" + this._name + "_NO", "validators");
			singleInput.uiInput.blink(true);
			return false;
		}
		return true;
	}
	
}