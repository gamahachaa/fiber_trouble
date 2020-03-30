package process;
import layout.History.Interactions;

/**
 * ...
 * @author bb
 */
class TripletInput extends Triplet 
{
	var yesValidator:EReg;
	var noValidator:EReg;
	var midValidator:EReg;
	
	var singleInput:process.SingleInput;
	public function new(textFieldWidth:Int, inputPrefix:String, ?yesValidator:EReg=null, ?noValidator:EReg=null, ?midValidator:EReg=null) 
	{
		super();
		singleInput = new SingleInput(this, textFieldWidth, inputPrefix);
		this.noValidator = noValidator == null ? ~/[\s\S]*/i: noValidator;
		this.yesValidator = yesValidator == null ? ~/[\s\S]*/i: yesValidator;
		this.midValidator = midValidator == null ? ~/[\s\S]*/i: midValidator;
	}
	override public function create( ):Void
	{
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
		override function positionThis()
	{
		super.positionThis();
		singleInput.positionThis();
	}
	override function pushToHistory( buttonTxt:String, interactionType:Interactions)
	{
		var inputDisplay = singleInput.uiInput.getInputedText().length>0?" (" + singleInput.uiInput._label + " " + singleInput.uiInput.getInputedText() + ")":"";
		super.pushToHistory( buttonTxt + inputDisplay, interactionType);
	}
	override public function onYesClick():Void
	{
		#if debug
		super.onYesClick(); // test only
		#else
		if (validateYes())
		{
			super.onYesClick();
		}
		#end
	}
	override public function onNoClick():Void
	{
		#if debug
		super.onNoClick(); // test only
		#else
		if (validateNo())
		{
			super.onNoClick();
		}
		
		#end
	}
	override public function onMidClick():Void
	{
		#if debug
		super.onMidClick(); // test only
		#else
		if (validateMid())
		{
			super.onMidClick();
		}
		
		#end
	}
	function validateMid()
	{
		if (!midValidator.match(singleInput.uiInput.getInputedText()))
		{
			singleInput.uiInput._labelValidator = Main.tongue.get("$" + this._name + "_MID", "validators");
			singleInput.uiInput.blink(true);
			return false;
		}
		return true;
		//return false;
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