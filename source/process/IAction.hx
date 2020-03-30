package process;

/**
 * @author 
 */
interface IAction
{
	public function create():Void;
	public function update(elapsed:Float):Void;
	public function onClick():Void;
}