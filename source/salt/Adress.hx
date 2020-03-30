package salt;

/**
 * ...
 * @author bb
 */
class Adress 
{
	@:isVar public var _co(get, set):String;
	@:isVar public var _street(get, set):String;
	@:isVar public var _number(get, set):String;
	@:isVar public var _zip(get, set):String;
	@:isVar public var _city(get, set):String;

	public function new(?street:String="", ?number:String, ?zip:String="", ?city:String="", ?co:String="") 
	{
		_co = co;
		_street = street;
		_number = number;
		_city = city;
		_zip = zip;
	}
	
	function get__street():String 
	{
		return _street;
	}
	
	function set__street(value:String):String 
	{
		return _street = value;
	}
	
	function get__number():String 
	{
		return _number;
	}
	
	function set__number(value:String):String 
	{
		return _number = value;
	}
	
	function get__zip():String 
	{
		return _zip;
	}
	
	function set__zip(value:String):String 
	{
		return _zip = value;
	}
	
	function get__city():String 
	{
		return _city;
	}
	
	function set__city(value:String):String 
	{
		return _city = value;
	}
	
	function get__co():String 
	{
		return _co;
	}
	
	function set__co(value:String):String 
	{
		return _co = value;
	}
	
}