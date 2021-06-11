package flow.ftth.pluginuse;

//import tstool.process.Process;
import tstool.process.DescisionTemplate;
import tstool.process.Process;
//import tstool.process.TripletTemplate;
import tstool.salt.SOTemplate;
//import tstool.salt.TemplateMail;

/**
 * ...
 * @author bb
 */
class _SendPluginUseTemplate extends DescisionTemplate 
{

	public function new() 
	{
		super(SOTemplate.FIX_381, EMAIL);
		
	}
	//override public function onClick():Void
	//{
		//this._nexts = [{step: _InformPluginUse, params: []}];
		//super.onClick();
	//}
	override public function onYesClick():Void
	{
		this._nexts = [{step: getNext(), params: []}];
		super.onYesClick();
	}
	
	
	override public function onNoClick():Void
	{
		this._nexts = [{step: getNext(), params: []}];
		super.onNoClick();
	}
	 override inline function getNext():Class<Process>{
		return _InformPluginUse;
	}
	//override public function onMidClick():Void
	//{
		//this._nexts = [{step: _InformPluginUse, params: []}];
		//super.onMidClick();
	//}
}