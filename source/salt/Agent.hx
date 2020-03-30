package salt;
import haxe.Json;
import haxe.ds.StringMap;
import process.Actor;

/**
 * ...
 * @author bbaudry
 */
class Agent extends Actor
{

	/***
	{
	authorized : true,
	iri : Bruno.Baudry@salt.ch,
	sAMAccountName : bbaudry,
	firstName : Bruno,
	sirName : Baudry,
	mobile : +41 78 787 8673,
	company : Salt Mobile SA,
	workLocation : Biel,
	division : Customer Operations,
	department : Process & Quality,
	directReports : CN=qook,OU=Users,OU=Domain-Users,DC=ad,DC=salt,DC=ch,
	accountExpires : 0,
	mainLanguage : en-GB,
	title : Manager Knowledge & Learning,
	initials : BB,
	memberOf : {
		ch.salt.ad : {
			Domain-Users.Users : [SG-PasswordSync,Customer Operations - Knowledge - Management,Customer Operations - Direct Reports,Customer Operations - Fiber Back Office,DOLPHIN_REC,Application-GIT_SALT-Visitor,Application-GIT_SALT-Operator,SG-OCH-WLAN_Users,SG-OCH-EnterpriseVault_DefaultProvisioningGroup,Entrust_SMS,MIS Mobile Users,GI-EBU-OR-CH-MobileUsers],
			Domain-Security-Groups : [RA-EasyConnect-Web-Mobile-Qook,Exchange_Customer Operations Management_ud,Exchange_CustomerCareServiceDesign_ud],
			Domain-Distribution-Groups : [Exchange_CO_KnowledgeAndTranslationMgmt_gd,Exchange_co training admin_ud,Exchange_Floor Marshalls Biel_gd]
		}
	}
	**/

	public var sAMAccountName(get, null):String;
	public var firstName(get, null):String;
	public var sirName(get, null):String;
	public var mobile(get, null):String;
	public var company(get, null):String;
	public var workLocation(get, null):String;
	public var division(get, null):String;
	public var department(get, null):String;
	public var directReports(get, null):String;
	public var accountExpires(get, null):String; //@todo Date

	public var title(get, null):String;
	public var initials(get, null):String;
	public var memberOf(get, null):StringMap<StringMap<Array<String>>>;
	@:isVar public var canDispach(get, set):Bool;
	@:isVar public var mainLanguage(get, set):String;

	public function new(?jsonUser:Dynamic=null)
	{
		canDispach = true;
		if (jsonUser != null )
		{
			super(jsonUser.attributes.mail, jsonUser.authorized);
			sAMAccountName = jsonUser.attributes.samaccountname ==null?"":jsonUser.attributes.samaccountname ;
			firstName = jsonUser.attributes.givenname  == null ? "":jsonUser.attributes.givenname ;
			sirName = jsonUser.attributes.sn == null ? "" :jsonUser.attributes.sn;
			mobile = jsonUser.attributes.mobile == null ? "": jsonUser.attributes.mobile;
			company = jsonUser.attributes.company == null ? "" : jsonUser.attributes.company;
			workLocation = jsonUser.attributes.l == null ? "": jsonUser.attributes.l;
			division = jsonUser.attributes.division == null ? "": jsonUser.attributes.division;
			department = jsonUser.attributes.department = null ? "": jsonUser.attributes.department;
			directReports = jsonUser.attributes.directreports == null ? "": jsonUser.attributes.directreports;
			accountExpires = jsonUser.attributes.accountexpires == null ? "": jsonUser.attributes.accountexpires; //@todo Date
			mainLanguage = jsonUser.attributes.msexchuserculture  == null ? "": jsonUser.attributes.msexchuserculture;
			title = jsonUser.attributes.title == null ? "" : jsonUser.attributes.title;
			initials = jsonUser.attributes.initials == null ? "": jsonUser.attributes.initials;
			memberOf = jsonUser.attributes.memberof == null ? new StringMap<StringMap<Array<String>>>(): jsonUser.attributes.memberof ;
		}
		else{
			#if debug
				trace("jsonUser is null");
			#end
		}
	}

	function get_sAMAccountName():String
	{
		return sAMAccountName;
	}

	function get_firstName():String
	{
		return firstName;
	}

	function get_sirName():String
	{
		return sirName;
	}

	function get_mobile():String
	{
		return mobile;
	}

	function get_company():String
	{
		return company;
	}

	function get_workLocation():String
	{
		return workLocation;
	}

	function get_division():String
	{
		return division;
	}

	function get_department():String
	{
		return department;
	}

	function get_directReports():String
	{
		return directReports;
	}

	function get_mainLanguage():String
	{
		return mainLanguage;
	}

	function set_mainLanguage(value:String):String
	{
		return mainLanguage = value;
	}

	function get_title():String
	{
		return title;
	}

	function get_initials():String
	{
		return initials;
	}

	function get_memberOf():StringMap<StringMap<Array<String>>>
	{
		return memberOf;
	}

	function get_accountExpires():String
	{
		return accountExpires;
	}
	
	function get_canDispach():Bool 
	{
		return canDispach;
	}
	
	function set_canDispach(value:Bool):Bool 
	{
		return canDispach = value;
	}

}