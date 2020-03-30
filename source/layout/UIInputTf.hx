package layout;

//import flixel.FlxBasic;
//import flixel.group.FlxGroup.FlxTypedGroup;
//import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.addons.ui.FlxInputText;
import flixel.effects.FlxFlicker;
import flixel.text.FlxText;
import js.Browser;
import js.html.ClipboardEvent;

import process.Process;

/**
 * ...
 * @author bb
 */
enum Direction{
	left;
	right;
	bottom;
	up;	
}
class UIInputTf
{
	var _autoFocus:Bool;
	public var _label(get, null):String;
	public var _labelValidator(default, set):String;
	public var inputtextfield(get, null):FlxInputText;
	public var imputLabel(get, null):FlxText;
	public function new(textFieldWidth:Int, inputPrefix:String)
	{
		_label = inputPrefix;
		_labelValidator = "";
		imputLabel = new FlxText(0, 0, textFieldWidth, _label + " :", 20);
		imputLabel.setFormat(Main.INTERACTION_FMT.font, Main.INTERACTION_FMT.size-2);
		inputtextfield = new FlxInputText(0, 0, textFieldWidth, 14);
		inputtextfield.focusGained = onFocus;
		inputtextfield.focusLost = onFocusLost;
	}
		
	public function addToParent(parent:Process, ?autoFocus:Bool = true)
	{
		_autoFocus = autoFocus;
		
		parent.add(imputLabel);
		parent.add(inputtextfield);
		if (_autoFocus)
		{
			inputtextfield.hasFocus = true;
			Browser.document.addEventListener("paste", onPaste);
		}
	}
	public function positionMe(parent:FlxSprite, ?padding:Int=20, ?direction:Direction = bottom)
	{
		
		switch (direction)
		{
			case bottom:
				inputtextfield.x  = imputLabel.x = parent.x;
				imputLabel.y = parent.y + parent.height + (padding/4);
				inputtextfield.y = this.imputLabel.y + this.imputLabel.height;
			case up :
				inputtextfield.x  = imputLabel.x = parent.x;
				imputLabel.y = parent.y - (imputLabel.height + inputtextfield.height) + (padding/2);
				inputtextfield.y = this.imputLabel.y + this.imputLabel.height;
			case left:
				inputtextfield.x  = imputLabel.x = parent.x - Math.max(inputtextfield.width, imputLabel.width ) + (padding/2);
				imputLabel.y = parent.y;
				inputtextfield.y = this.imputLabel.y + this.imputLabel.height;
			case right:
				inputtextfield.x  = imputLabel.x = parent.x + parent.width + (padding/2);
				imputLabel.y = parent.y;
				inputtextfield.y = this.imputLabel.y + this.imputLabel.height;
				
		}
		
		
		//
		
		/**
		 * @todo WTF is it doing here ???
		 */
		//Browser.document.addEventListener("paste", onPaste);
	}
	function onPaste(e: ClipboardEvent):Void
	{
		onFocus();
		if (inputtextfield.hasFocus)
		{
			inputtextfield.text = e.clipboardData.getData("text/plain");
			e.stopPropagation();
		}
		
	}
	function get_inputtextfield():FlxInputText
	{
		return inputtextfield;
	}

	function get_imputLabel():FlxText
	{
		return imputLabel;
	}
	function onFocus()
	{
		if (!_autoFocus){
			Browser.document.addEventListener("paste", onPaste);
		}
		if (FlxFlicker.isFlickering(imputLabel))
		{
			blink(false);
		}
	}
	function onFocusLost() 
	{
		if (!_autoFocus){
			Browser.document.removeEventListener("paste", onPaste);
		}
	}
	public function setStyle()
	{
		imputLabel.color = Main.THEME.meta;
	}

	public function clearText()
	{
		var t = inputtextfield.text.split("");
		t.pop();
		inputtextfield.text = t.join("");
		inputtextfield.caretIndex = t.length;
		inputtextfield.draw();
		inputtextfield.drawFrame(true);
	}
	public function blink( start:Bool )
	{
		if (start){
			_labelValidator != "" ? imputLabel.text = _labelValidator : _label;
			FlxFlicker.flicker(imputLabel, 0, .5);
		}
		else{
			imputLabel.text = _label;
			FlxFlicker.stopFlickering(imputLabel);
		}
		
	}
	
	function get__label():String 
	{
		return _label;
	}
	
	public function getInputedText()
	{
		return inputtextfield.text;
	}
	
	function set__labelValidator(value:String):String 
	{
		return _labelValidator = value;
	}
	public function hasFocus():Bool
	{
		return this.inputtextfield.hasFocus;
	}
	public function toggleFocus()
	{
		this.inputtextfield.hasFocus = !this.inputtextfield.hasFocus;
	}
}