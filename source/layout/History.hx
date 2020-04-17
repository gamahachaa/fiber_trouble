package layout;
import flixel.FlxSprite;

/**
 * ...
 * @author ...
 */
typedef Snapshot =
{
	var processName: String;
	var interaction: Interactions;
	var processTitle:String;
	var iteractionTitle:String;
	var start:Date;
}
enum Interactions{
	Yes;
	No;
	Mid;
	Next;
	Exit;
}
class History
{
	public var history(get, null):Array<Snapshot>;
	var stack:FlxSprite;

	public function new()
	{
		//super();
		history = new Array<Snapshot>();
		//stack = new FlxSprite();
	}
	public function add( process:String, interaction:Interactions, title:String, iteractionTitle:String)
	{
		history.push(
			{
				processName : process, 
				interaction: interaction, 
				processTitle:title, 
				iteractionTitle:iteractionTitle,
				start: Date.now()
			}
		);
	}

	public function init():Void
	{
		history = [];
	}
	public function clearHistoryFrom(index:Int){
		#if debug
			trace(index);
			trace(history.length);
			trace(history.length - index -1);
		#end
		var old = history.splice(index, history.length - index);
		return Type.createInstance( Type.resolveClass( old[0].processName), [] );
	}
	public function onStepBack(){
		var last = history.pop();
		return Type.createInstance( Type.resolveClass( last.processName), [] );
	}
	public function getIterations(processName:String, ?interaction:Interactions):Int
	{
		var count = 0;
		for ( i in history )
		{
			if ((interaction == null && i.processName == processName) || (interaction == i.interaction && i.processName == processName) )
			{
				count++;
			}
			
		}
		return count;
	}
	inline function getPreviousProcess()
	{
		return history[history.length - 1];
	}

	
	inline public function getPreviousInstance()
	{
		return Type.createInstance( Type.resolveClass( getPreviousProcess().processName), [] );
	}
	
	function get_history():Array<Snapshot>
	{
		return history;
	}
	public function getFirst()
	{
		return history[0];
	}
	public function getLast()
	{
		return history[history.length-1];
	}
	public function isInHistory(processName:String, interaction:Interactions)
	{
		for ( i in history )
		{
			if (interaction == i.interaction && i.processName == processName ) 
			{
				return true;
			}
			
		}
		return false;
	}
	public function getRawSteps()
	{
		var t = [];
		var s = 0;
		for (i in history)
		{
			t.push({nb:s++, step:i.processName, interaction: i.iteractionTitle});
		}
		return t;
	}
}