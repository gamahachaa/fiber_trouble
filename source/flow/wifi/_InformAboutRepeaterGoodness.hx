package flow.wifi;

import flow.all.fiberbox._AdvicePutOpenSpace;
import flow.all.fiberbox._WhereIsBoxPlaced;
import flow.stability._TestSpeed;
import tstool.layout.History.ValueReturn;
//import tstool.process.Action;
import tstool.process.Descision;

/**
 * ...
 * @author bb
 */

class _InformAboutRepeaterGoodness extends Descision 
{

	override public function onYesClick():Void
	{
		this._nexts = [{step: SendRepeaterSOTemplate, params: []}];
		super.onYesClick();
	}
	override public function onNoClick():Void
	{
		var whereIsBoxPlaced:ValueReturn = Main.HISTORY.findValueOfFirstClassInHistory(_WhereIsBoxPlaced, _WhereIsBoxPlaced.TITLE);
		this._nexts = if (whereIsBoxPlaced.exists && whereIsBoxPlaced.value == _WhereIsBoxPlaced.TREE_MULTIMEDIA){
			  [{step: _AdvicePutOpenSpace, params: []}];
		}
		else{
			[{step: _TestSpeed, params: []}];
			
		}
		super.onNoClick();
	}
	
}