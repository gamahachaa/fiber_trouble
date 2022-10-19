package flow.vti;

import flow.nointernet.so._CreateTicketModemCNX;
import regex.ExpReg;
import tstool.process.ActionMultipleInput;
import tstool.process.Process;
import tstool.utils.VTIdataParser;

/**
 * ...
 * @author bb
 */
class ParseVTIHealthCheck extends ActionMultipleInput 
{

	public function new ()
	{
		super(
		[
		{
			ereg: new EReg(ExpReg.LEX_ID,"i"),
			input:{
				debug: "69VAE",
				mustValidate: [Next],
				width:80,
				prefix: VTIdataParser.lexId,
				//buddy: VTIdataParser.otoId,
				position: [bottom, left]
			}
		},
		{
			ereg: new EReg(ExpReg.OLT_NAME,"i"),
			input:{
				debug: "01",
				mustValidate: [Next],
				width:80,
				prefix: VTIdataParser.oltName,
				buddy: VTIdataParser.lexId,
				position: [top, right]
			}
		},
		{
			ereg: new EReg(ExpReg.PORTS_ID,"i"),
			input:{
				debug: "1",
				mustValidate: [Next],
				width:80,
				prefix: VTIdataParser.oltBoard,
				buddy: VTIdataParser.oltName,
				position: [top, right]
			}
		}/*,
		{
			ereg: new EReg(ExpReg.PORTS_ID,"i"),
			input:{
				debug: "0",
				mustValidate: [Next],
				width:80,
				prefix: VTIdataParser.ponPort,
				buddy: VTIdataParser.oltBoard,
				position: [top, right]
			}
		}*/
		,
		{
			ereg: new EReg(ExpReg.BREAKOUT_CABLE,"i"),
			input:{
				debug: "KP100314-C0001",
				mustValidate: [Next],
				width:170,
				prefix: VTIdataParser.breakoutCableId,
				buddy: VTIdataParser.lexId,
				position: [bottom, left]
			}
		},
		{
			ereg: new EReg(ExpReg.PORTS_ID,"i"),
			input:{
				debug: "1",
				mustValidate: [Exit],
				width:130,
				prefix: VTIdataParser.fiberNumber,
				buddy: VTIdataParser.breakoutCableId,
				position: [top, right]
			}
		},
		{
			ereg: new EReg(ExpReg.OLT_OBJECT,"i"),
			input:{
				debug: "VD_9210-69VAE-OLT1:1-1-1",
				mustValidate: [Exit],
				width:200,
				prefix: VTIdataParser.oltObject,
				buddy: VTIdataParser.fiberNumber,
				position: [top, right]
			}
		},{
			ereg: new EReg(ExpReg.OTO_REG,"i"),
			input:{
				debug: "B.111.092.567.0",
				mustValidate: [Exit],
				width:100,
				buddy: VTIdataParser.breakoutCableId,
				prefix: VTIdataParser.otoId,
				position: [bottom, left]
			}
		},
		{
			ereg: new EReg(ExpReg.OTO_PORT,"i"),
			input:{
				debug: "2",
				mustValidate: [Exit],
				width:80,
				prefix: VTIdataParser.otoPortId,
				buddy: VTIdataParser.otoId,
				position: [top, right]
			}
		},
		{
			ereg: new EReg(ExpReg.BOX_SERIAL_HEALTH,"i"),
			input:{
				debug: "SFAA80501062",
				mustValidate: [Exit],
				width:200,
				prefix: VTIdataParser.routerSerialNumber,
				buddy: VTIdataParser.otoPortId,
				position: [top, right]
			}
		}
		]
		);
		
	}
	
	override public function create():Void
	{
		super.create();var parser = new VTIdataParser(events);
		//parser.signal.add( (profile)->trace(profile) );
		parser.signal.add( onVtiAccountParsed );
	}
	override public function onClick():Void
	{
		if (validate())
		{
			this._nexts = [{step: getNext(), params: []}];
			super.onClick();
		}
	}
	function onVtiAccountParsed(profile:Map<String, Map<String, String>>):Void
	{
		#if debug
		trace('void::onVtiAccountParsed::profile', profile);
		#end
		 for (k => v in profile.get(VTIdataParser.FIBER_FLL))
		 {
			 if(multipleInputs.inputs.exists(k)) multipleInputs.inputs.get(k).inputtextfield.text = v;
		 }
	}
	inline function getNext():Class<Process>{
		return _CreateTicketModemCNX;
	}
	/****************************
	* Needed only for validation
	*****************************/
	/*
	override public function validate():Bool
	{
		return true;
	}
	*/
	
}