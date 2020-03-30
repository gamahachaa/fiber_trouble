package salt;
import process.Actor;

/**
 * ...
 * @author bbaudry
 */
enum CustomerProcess{
	unknown;
	firstCall;
	recaller;
}

class Customer extends Actor
{
	@:isVar public var products(get, set):Array<String>; // @todo makeit a Type
	@:isVar public var _history(get, set):Array<String>; // make it a type so far just a ticket then maekit a Customer process Type
	@:isVar public var processStage(get, set):CustomerProcess;
	@:isVar public var shipingAdress(get, set):Adress;
	@:isVar public var voIP(get, set):String;
	public static inline var TEST_IRI:String = "3000000000";
	public function new(?uniqueIdentifier:String, ?history:String="") 
	{
		this._history = [history];
		processStage = (history== "") ? firstCall: recaller;
		super(uniqueIdentifier == null ? TEST_IRI : uniqueIdentifier, true); // for now customers are authorized
	}
	public function reset()
	{
		this._history = [];
		this.products = [];
		this.processStage = unknown;
		this.shipingAdress = null;
		this.iri = TEST_IRI;
		this.voIP = "";
	}
	public function isInitial()
	{
		return TEST_IRI == this.iri;
	}
	function get__history():Array<String> 
	{
		return _history;
	}
	
	function set__history(value:Array<String>):Array<String> 
	{
		return _history = value;
	}
	
	function get_products():Array<String> 
	{
		return products;
	}
	
	function set_products(value:Array<String>):Array<String> 
	{
		return products = value;
	}
	
	function get_processStage():CustomerProcess 
	{
		return processStage;
	}
	
	function set_processStage(value:CustomerProcess):CustomerProcess 
	{
		return processStage = value;
	}
	
	function get_shipingAdress():Adress 
	{
		return shipingAdress;
	}
	
	function set_shipingAdress(value:Adress):Adress 
	{
		return shipingAdress = value;
	}
	
	function get_voIP():String 
	{
		return voIP;
	}
	
	function set_voIP(value:String):String 
	{
		return voIP = value;
	}
	
}