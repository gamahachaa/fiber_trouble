package utils;
import flixel.util.FlxSignal.FlxTypedSignal;
import haxe.Http;
import haxe.Json;
import js.Browser;
import layout.History.Snapshot;
import process.Process;
import Main;
import salt.SOTickets;
/**
 * ...
 * @author bbaudry
 */
enum Parameters
{
	subject;
	from_email;
	from_full_name;
	to_email;
	to_full_name;
	cc_email;
	cc_full_name;
	bcc_email;
	bcc_full_name;
	body;
}
typedef Result =
{
	var status:String;
	var error:String;
	var additional:String;
}
typedef MailReciepient =
{
	var to:String;
	var fullName:String;
}
class Mail
{
	var http:Http;
	var _mailSubject:String;
	//var _queue:String;
	var _ticket:SOTickets;
	var _currentProcess(default, set):Process;
	public var successSignal(get, null):FlxTypedSignal<Result->Void>;
	public var statusSignal(get, null):FlxTypedSignal<Int->Void>;
	public var errorSignal(get, null):FlxTypedSignal<Dynamic->Void>;

	@:isVar public var params(get, set):haxe.ds.Map<Parameters,Dynamic>;

	public function new(ticket:SOTickets, currentProcess:Process)
	{
		_ticket = ticket;

		//_mailSubject = ticket.desc;
		_currentProcess = currentProcess;
		successSignal = new FlxTypedSignal<Result->Void>();
		statusSignal = new FlxTypedSignal<Int->Void>();
		errorSignal = new FlxTypedSignal<Dynamic->Void>();
		//params = new Map<Parameters,String>();
		params = new Map<Parameters,Dynamic>();
		//setSubject(mailSubject, currentProcess);

		//trace(params.get(subject));
		//trace(params.get(body));
		#if debug
		params.set(to_email, "superofficetest@salt.ch"); // Test on cs-sit.test

		//params.set(to_email, ticket.email); // Test on SO prod cs.salt.ch
		#else
		if (Main.DEBUG)
		{
			params.set(to_email, ticket.email);
			//params.set(to_email, "Giuliano.Rappazzo@salt.ch");
			//params.set(to_email, "bruno.baudry@salt.ch");
			//params.set(to_full_name, "Giuliano Rappazzo");
			//params.set(to_full_name, "Bruno Baudry");
			params.set(cc_email, '${Main.user.iri},Fiber.TechSupport@salt.ch,Giuliano.Rappazzo@salt.ch');
			
			//params.set(bcc_email, "qook@salt.ch");
			//params.set(bcc_full_name, "qook");
			//params.set(cc_full_name, (Main.user.sirName + " " + Main.user.firstName) );
		}
		else
		{
			params.set(to_email, ticket.email);
			//params.set(to_full_name, to.fullName);

			params.set(cc_email, '${Main.user.iri},Fiber.TechSupport@salt.ch,Giuliano.Rappazzo@salt.ch');
			//params.set(cc_full_name, (Main.user.sirName + " " + Main.user.firstName) );
		}
		params.set(bcc_email, "qook@salt.ch");
		//params.set(bcc_full_name, "qook");
		#end
		//params.set(subject, '[${Main.customer.iri}] $mailSubject' );


		http = new Http(Browser.location.origin + Browser.location.pathname+ "php/mail/index.php" );
		http.async = true;
		http.onData = onData;
		http.onError = onError;
		http.onStatus = onStatus;
		//trace(Browser.location.origin + Browser.location.pathname+ "php/mail/index.php" );
	}
	function setSubject()
	{
		// test GIT DEV
		var _queue = "";
		#if debug
			//_queue =_ticket.queue + "_EN" ;
			_queue =_ticket.queue + "_"; // Nico change 24.03.2020
		#else
			//_queue =_ticket.queue + "_" + Main.user.mainLanguage.substr(0, 2).toUpperCase(); 
			_queue =_ticket.queue + "_"; // Nico change 25.03.2020
		#end
		_mailSubject = _ticket.domain + "-" + _ticket.number + " " + _ticket.desc;
		params.set(subject, '[${Main.customer.voIP}][$_queue] $_mailSubject' );
	}

	public function send(memo:String= "")
	{
		setSubject();
		buildCustomerBody(memo);
		buildHistoryBody();
		buildAgentBody();
		for (key => value in params)
		{
			http.setParameter(Std.string(key), value);
			#if debug
			trace(key, value);
			#end
		}
		// do not create ticket in training mode
		if (Main.user.canDispach)
		{
			#if debug
			trace("testing");
			#else
			http.request(true);
			#end
		}
		else
		{
			successSignal.dispatch({status:"success",error:"", additional:"training"});
		}
	}
	function buildCustomerBody(memo:String= "")
	{
		var  b = params.exists(body)?params.get(body):"";
		var bodyList = "";
		#if debug
		trace(Main.customer);
		#end
		try
		{
			//b += '<h1>$_mailSubject</h1>';
			if (memo != "") b += '<p>$memo</p>';
			b += '<h2>CONTRACTOR: ${Main.customer.iri} ';
			b += 'VoIP: ${Main.customer.voIP}';
			b += '</h2>';
			if (Main.customer.shipingAdress != null && Main.customer.shipingAdress._zip != "")
			{
				b += "<h3>Shiping Adress :</h3>";
				b += "<p>";
				if (Main.customer.shipingAdress._co != "")
				{
					b += 'c/o: ${Main.customer.shipingAdress._co}<br/>';
				}
				b += '${Main.customer.shipingAdress._street}, ${Main.customer.shipingAdress._number}<br/>';
				b += '<strong>${Main.customer.shipingAdress._zip}</strong> ${Main.customer.shipingAdress._city}';
				b += "</p>";
			}
		}
		catch (e:Dynamic)
		{
			trace(e);
		}
		params.set(body, b);
	}
	function buildAgentBody()
	{
		var  b = params.exists(body)?params.get(body):"";
		var bodyList = "";
		params.set(from_email, Main.user.iri);
		params.set(from_full_name, Main.user.sAMAccountName);
		//Main.user.firstName;
		#if debug
		trace(Main.user);
		#end
		bodyList += '<li>Agent: ${Main.user.firstName} ${Main.user.sirName} (${Main.user.sAMAccountName}) ${Main.user.title}</li>';
		//bodyList += '<li>NT: </li>';
		//bodyList += '<li>: ${Main.user.mobile} </li>';
		bodyList += '<li>${Main.user.company} | ${Main.user.department} | ${Main.user.division} | ${Main.user.workLocation} </li>';
		bodyList += '<li>Script version : ${Main.VERSION} </li>';

		b += '<h4>Troubleshot in ${Main.user.mainLanguage} by:</h4><ul>$bodyList</ul>';
		params.set(body, b);

	}
	function buildHistoryBody()
	{
		var  b = params.exists(body)?params.get(body):"";
		var bodyList = "";
		var start:Date = Main.HISTORY.getFirst().start;
		var end:Date = Main.HISTORY.getLast().start;
		for (i in Main.HISTORY.history)
		{
			bodyList += "<li>";
			bodyList += '${i.processTitle} : <strong>${i.iteractionTitle}</strong>';
			if (i.values != null) {
				
				bodyList += i.values.toString();
			}
			bodyList += "<br/><em>";
			if(Main.user.mainLanguage != "en-GB") bodyList += getItInEnglsh(i);
			bodyList += "</em></li>";
			//bodyList += Main.tongue.get("$"+i.processName + "_TITLE","data") + " : " + Main.tongue.get(i.processName,"data")}:${i.interaction}</li>';
			
		}
		
		bodyList += "<li><strong>"+_currentProcess.question.text +"</strong></li>";
		b += '<h3>Start: ${start.toString()}</h3><ol>$bodyList</ol><h3>End: ${end.toString()}</h3>';
		params.set(body, b);
	}
	
	function getItInEnglsh(i:Snapshot):String
	{
		Main.tongue.init("en-GB");
		var s = "";
		var interaction = switch(i.interaction){
			case Yes: "RIGHT-BTN";
			case No: "LEFT-BTN";
			case Next: "MID-BTN";
			default: "MID-BTN";
		};
		var interactionEN = Main.tongue.get("$" + i.processName + "_" + interaction, "data");
		if (interactionEN == "" || interactionEN == null || interactionEN.indexOf("$") == 0)
		{
			interactionEN = Main.tongue.get("$defaultBtn_" + switch(i.interaction){
			case Yes: "UI3";
			case No: "UI1";
			case Next: "UI2";
			default: "UI2";
		}, "meta");
		}	
		
		s += Main.tongue.get("$" + i.processName + "_TITLE", "data") + " : " + interactionEN;
		
		Main.tongue.init(Main.user.mainLanguage);
		return s;
	}
	function onStatus(s:Int)
	{
		//trace(s);
		statusSignal.dispatch(s);
	}

	function onError(e:Dynamic):Void
	{
		//trace(e);
		errorSignal.dispatch(e);
	}

	function onData(data:Dynamic)
	{
		//trace(data);
		var s:Result = Json.parse(data);
		successSignal.dispatch(s);
	}

	function get_params():haxe.ds.Map<Parameters, Dynamic>
	{
		return params;
	}

	function get_successSignal():FlxTypedSignal<Result->Void>
	{
		return successSignal;
	}

	function get_statusSignal():flixel.util.FlxSignal.FlxTypedSignal<Int->Void>
	{
		return statusSignal;
	}

	function get_errorSignal():flixel.util.FlxSignal.FlxTypedSignal<Dynamic->Void>
	{
		return errorSignal;
	}

	function set_params(value:haxe.ds.Map<Parameters, Dynamic>):haxe.ds.Map<Parameters, Dynamic>
	{
		return params = value;
	}

	function set__currentProcess(value:Process):Process
	{
		return _currentProcess = value;
	}

}
