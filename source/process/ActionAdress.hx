package process;
import flixel.FlxG;
import flixel.addons.ui.FlxInputText;
import flixel.text.FlxText;
import layout.History.Interactions;
import layout.UIInputTf;

/**
 * ...
 * @author bb
 */
typedef ValidatedUI = {
	var ui:UIInputTf;
	var reg:EReg;
}
class ActionAdress extends Action 
{

	var _streetEREG:EReg;
	var _numberEREG:EReg;
	var _zipEREG:EReg;
	var _cityEreg:EReg;
	var _coEREG:EReg;
	
	var _careOfInput:FlxInputText;
	var _careOfLabel:FlxText;
	var streetUI:UIInputTf;
	var numStreetUI:UIInputTf;
	var zipUI:UIInputTf;
	var careOfUI:UIInputTf;
	var cityUI:UIInputTf;
	var inputs:Array<ValidatedUI>;

	
	override public function create()
	{
		inputs = [];
		//this.question.text = "TEST";
		streetUI = new UIInputTf(200, "Street");
		_streetEREG = ~/.{2,}/ig;
		streetUI.addToParent(this);
		inputs.push({ui: streetUI, reg: _streetEREG});
		
		//_streetLabel = new FlxText(0, 0, 150, "Street");
		//_streetInput = new FlxInputText(0, 0, 150);
		numStreetUI = new UIInputTf(50, "N°");
		_numberEREG = ~/\d+\w?/g;
		numStreetUI.addToParent(this, false);
		inputs.push({ui: numStreetUI, reg: _numberEREG});
		//_numberLabel = new FlxText(0, 0, 150, "N°");
		//_numberInput =  new FlxInputText(0, 0, 150);
		zipUI = new UIInputTf(80, "zip");
		zipUI.addToParent(this, false);
		_zipEREG = ~/^\d{4}$/g;
		inputs.push({ui: zipUI, reg: _zipEREG});
		//_zipLabel = new FlxText(0, 0, 150, "Zip");
		//_zipInput =  new FlxInputText(0, 0, 150);
		//
		cityUI = new UIInputTf(150, "city");
		cityUI.addToParent(this, false);
		_cityEreg = ~/\w+[a-z 0-9.éàèüöäâêô!ï()\/\-']+/i;
		inputs.push({ui: cityUI, reg: _cityEreg});
		//_cityLabel = new FlxText(0, 0, 150, "City");
		//_cityInput = new FlxInputText(0, 0, 150);
		//
		careOfUI = new UIInputTf(200, "c/o");
		careOfUI.addToParent(this, false);
		_coEREG = null;
		inputs.push({ui: careOfUI, reg: _coEREG});
		//_careOfLabel = new FlxText(0, 0, 150, "c/o");
		//_careOfInput = new FlxInputText(0, 0, 150);
		
		super.create();
	}
	override public function onClick():Void
	{
		//#if debug
		//super.onClick(); // test only
		//#else 
		if (validate())
		{
			super.onClick();
		}
		//#end
	}
	override function positionThis()
	{
		super.positionThis();
		streetUI.positionMe(this.question, this._padding);
		numStreetUI.positionMe(streetUI.imputLabel , this._padding, right);
		zipUI.positionMe(numStreetUI.imputLabel , this._padding, right);
		cityUI.positionMe(zipUI.imputLabel , this._padding, right);
		careOfUI.positionMe(streetUI.inputtextfield , this._padding, bottom);
		
	}
	override public function setStyle()
	{
		super.setStyle();
		for (i in inputs)
		{
			i.ui.setStyle();
		}
		//uiInput.setStyle();
	}
	override public function update(elapsed)
	{
		super.update(elapsed);
		var i = 0;
		this.isFocused = whoHasFocus() > -1;
		if (FlxG.keys.justReleased.BACKSPACE)
		{
			i = whoHasFocus();
		
			if(i > -1) inputs[i].ui.clearText();
		}
		if (FlxG.keys.justReleased.TAB)
		{
			i = whoHasFocus();
			
			inputs[i].ui.toggleFocus();
			inputs[(++i == inputs.length ? 0 : i)].ui.toggleFocus();
			
		}
	}
	function validate()
	{
		for (i in inputs)
		{
			if (i.reg == null) continue;
			else if (!i.reg.match( i.ui.getInputedText())){
				i.ui.blink(true);
				return false;
			}
		}
		return true;
	}
	function whoHasFocus():Int
	{
		for (i in 0...inputs.length )
		{
			if (inputs[i].ui.hasFocus()) return i;
		}
		return -1;
	}
}