package salt;

/**
 * ...
 * @author bb
 */
class SOTickets 
{
	public var domain(get, null):String;
	public var number(get, null):String;
	public var queue(get, null):String;
	public var desc(get, null):String;
	public var email(get, null):String;
	
	///////// statics //////
	public static var FIX_511:SOTickets = new SOTickets('FIX', '511','FIBER_WRONG_OTO_SO', '5.Technical 1.Optical connection / OTO 1.Wrong OTO connected', 'fiber.tech.qtool@salt.ch');
	public static var FIX_521:SOTickets = new SOTickets('FIX', '521','FIBER_TECH_SO', '5.Technical 2.Modem - Router 1.Modem connection', 'fiber.tech.qtool@salt.ch');
	public static var FIX_321:SOTickets = new SOTickets('FIX', '321','FIBER_FINANCIAL_SO', '3.Billing 2.Compensation 1.*Request for Compensation', 'fiber.tech.qtool@salt.ch');
	public static var FIX_522:SOTickets = new SOTickets('FIX', '522','FIBER_LOW_PRIO_TECH_SO', '5.Technical 2.Modem - Router 2.Problème de Wifi / Wlan', 'fiber.tech.qtool.low@salt.ch');
	public static var FIX_523:SOTickets = new SOTickets('FIX', '523','FIBER_TECH_SO', '5.Technical 2.Modem - Router 3.Box Swap Request (under condition)', 'fiber.tech.qtool@salt.ch');
	public static var FIX_526:SOTickets = new SOTickets('FIX', '526','FIBER_PARTS_REQUEST_SO', '5.Technical 2.Modem - Router 6.New Fibre Cable request (send by post)', 'fiber.tech.qtool@salt.ch');
	public static var FIX_541:SOTickets = new SOTickets('FIX', '541','FIBER_LOW_PRIO_TECH_SO', '5.Technical 4.TV and Video Services 1.Salt TV problem', 'fiber.tech.qtool.low@salt.ch');
	public static var FIX_531:SOTickets = new SOTickets('FIX', '531','FIBER_LOW_PRIO_TECH_SO', '5.Technical 3.Voip Telephony 1.Voip Calls', 'fiber.tech.qtool@salt.ch');
	public static var FIX_524:SOTickets = new SOTickets('FIX', '524','FIBER_TECH_SO', '5.Technical 2.Modem - Router 4.WWW LED OFF', 'fiber.tech.qtool@salt.ch');
	public static var FIX_525:SOTickets = new SOTickets('FIX', '525','FIBER_LOW_PRIO_TECH_SO', '5.Technical 2.Modem - Router 5.Internet check et Speed test', 'fiber.tech.qtool@salt.ch');
	public static var FIX_532:SOTickets = new SOTickets('FIX', '532','FIBER_LOW_PRIO_TECH_SO', '5.Technical 3.Voip Telephony 2.VTI Voice Service', 'fiber.tech.qtool@salt.ch');
	public static var FIX_542:SOTickets = new SOTickets('FIX', '542','FIBER_LOW_PRIO_TECH_SO', '5.Technical 4.TV and Video Services 2.Salt VOD problem', 'fiber.tech.qtool@salt.ch');
	public static var FIX_125:SOTickets = new SOTickets('FIX', '125','FIBER_LOW_PRIO_TECH_SO', '10.Escalation (Only for Backoffice) 2.Admin (Backoffice Internal only) 5.Termination - TECH Reason (only Backoffice)', 'fiber.tech.qtool@salt.ch');
	public static var FIX_527:SOTickets = new SOTickets('FIX', '527','FIBER_LOW_PRIO_TECH_SO', '5.Technical 2.Modem - Router 7. IP Option Management', 'fiber.tech.qtool@salt.ch');
	public static var FIX_351:SOTickets = new SOTickets('FIX', '351', 'FIBER_FINANCIAL_SO', '3.Billing 5.Bill & charging content 1.Contestation of content', 'fiber.tech.qtool@salt.ch');
	public static var FIX_416:SOTickets = new SOTickets('FIX', '416', 'FIBER_DELEGATE_BACKOFFICE_SO', '4.Order 1.Order Process 6.Order Status check request', 'fiber.tech.qtool@salt.ch');
	public static var FIX_421:SOTickets = new SOTickets('FIX', '421','FIBER_LOGISTICS_SO', '4.Order 2.Logistics 1.Equipement delivery', 'fiber.tech.qtool@salt.ch');
	public function new(domain:String,number:String,queue:String,desc:String,email:String) 
	{
		this.email = email;
		this.desc = desc;
		this.queue = queue;
		this.number = number;
		this.domain = domain;
		
	}
	//////////////////// GETTERS ///////////////////////////
	function get_domain():String 
	{
		return domain;
	}
	
	function get_number():String 
	{
		return number;
	}
	
	function get_queue():String 
	{
		return queue;
	}
	
	function get_desc():String 
	{
		return desc;
	}
	
	function get_email():String 
	{
		return email;
	}
}