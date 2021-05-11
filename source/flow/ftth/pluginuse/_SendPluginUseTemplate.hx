package flow.ftth.pluginuse;

//import tstool.process.Process;
import tstool.process.TripletTemplate;
import tstool.salt.SOTemplate;
//import tstool.salt.TemplateMail;

/**
 * ...
 * @author bb
 */
class _SendPluginUseTemplate extends TripletTemplate 
{

	public function new() 
	{
		super(SOTemplate.FIX_381);
		
	}
	//override public function onClick():Void
	//{
		//this._nexts = [{step: _InformPluginUse, params: []}];
		//super.onClick();
	//}
	override public function onYesClick():Void
	{
		this._nexts = [{step: _InformPluginUse, params: []}];
		super.onYesClick();
	}
	
	
	override public function onNoClick():Void
	{
		this._nexts = [{step: _InformPluginUse, params: []}];
		super.onNoClick();
	}
	
	override public function onMidClick():Void
	{
		this._nexts = [{step: _InformPluginUse, params: []}];
		super.onMidClick();
	}
}