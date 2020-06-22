package flixel.text;
import openfl.text.TextField;

/**
 * ...
 * @author bb
 */
class FlxTextBB extends FlxText 
{

	@:isVar public var tf(get, set):TextField;
	public function new(X:Float=0, Y:Float=0, FieldWidth:Float=0, ?Text:String, Size:Int=8, EmbeddedFont:Bool=true) 
	{
		super(X, Y, FieldWidth);
		this.tf = this.textField;
	}
	
	function get_tf():TextField 
	{
		return tf;
	}
	
	function set_tf(value:TextField):TextField 
	{
		return tf = value;
	}
	
}