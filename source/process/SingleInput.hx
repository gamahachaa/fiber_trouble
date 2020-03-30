package process;
import flixel.FlxG;
import layout.UIInputTf;

/**
 * ...
 * @author bb
 */
class SingleInput
{
	var _inputPrefix:String;
	var _textFieldWidth:Int;
	public var uiInput(get, null):UIInputTf;
	var parent:Process;
	public function new(parent:Process, textFieldWidth:Int, inputPrefix:String) 
	{
		this.parent = parent;
		_textFieldWidth = textFieldWidth;
		_inputPrefix = inputPrefix;
	}
	public function create():Void
	{
		uiInput = new UIInputTf(_textFieldWidth, _inputPrefix);
		uiInput.addToParent(this.parent);
	}
	public function update(elapsed)
	{
		if (FlxG.keys.justReleased.BACKSPACE && uiInput.hasFocus())
		{
			uiInput.clearText();
		}
		
	}
	public function positionThis()
	{
		uiInput.positionMe(this.parent.question, this.parent._padding);
	}
	
	function get_uiInput():UIInputTf 
	{
		return uiInput;
	}
	
	public function setStyle()
	{
		uiInput.setStyle();
	}
}