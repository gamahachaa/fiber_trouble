package layout;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.FlxSubState;
import flixel.addons.ui.FlxUIButton;
import flixel.addons.ui.FlxUIInputText;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.util.FlxColor;
import flixel.util.FlxSave;
import flow.TutoTree;
import haxe.Http;
import haxe.Json;
import haxe.crypto.Base64;
import haxe.io.Bytes;
import js.Browser;
import js.html.ClipboardEvent;
import js.html.Event;
import js.html.Permissions;
import lime.system.Clipboard;
import salt.Agent;

//@:bitmap("assets/images/CustomPreload/default.png") class LogoImage extends BitmapData { }
/**
 * ...
 * @author bbaudry
 */

class Login extends FlxState
{
	//var location:js.html.Location;
	var username:flixel.addons.ui.FlxUIInputText;
	var pwd:flixel.addons.ui.FlxUIInputText;
	var _padding:Int = 20;
	var lang:String;
	var logo:FlxSprite;
	var loginTxt:flixel.text.FlxText;
	var pwdTxt:flixel.text.FlxText;
	var pwdTxtInfo:flixel.text.FlxText;
	override public function create()
	{
		super.create();
		Main.COOKIE = new FlxSave();
		Main.COOKIE.bind("nointernet-20200311.user");
		lang = "en-EN"; // default
		if (Main.COOKIE.data.user != null)
		{
			
			Main.user = Main.COOKIE.data.user;
			#if debug
			trace(Main.user.mainLanguage);
			#end
			if (Main.user.mainLanguage == null || Main.user.mainLanguage == "")
			{
				Main.user.mainLanguage = lang;
			}
			moveOn(); // launch APP
		}
		else
		{
			var testFormat:FlxTextFormat = new FlxTextFormat(SaltColor.ORANGE, true);
			var markerFormat = new FlxTextFormatMarkerPair( testFormat, "<b>");
			var logo = new FlxSprite(0, 0, "assets/images/" + "default" + ".png");
			var showPwd:FlxUIButton = new FlxUIButton(0, 0, "", onShowPwd);
			showPwd.loadGraphic("assets/images/ui/showPwd.png", true, 40, 40);
			showPwd.has_toggle = true;
			
			//location = Browser.location;
			logo.centerOrigin();
			logo.screenCenter();
			logo.x = FlxG.width/2 - logo.width/2;
			logo.y = 50;
			loginTxt = new FlxText(0, 0, 100, "USERNAME",14);
			pwdTxt = new FlxText(0, 0, 100, "PASSWORD", 14);

			pwdTxtInfo = new FlxText(0, 0, 1280, "(copy paste your <b>password<b> from somewhere if you use special caracters like '+' as we have local keyboard layout issue)", 14);
			pwdTxtInfo.applyMarkup("(copy paste your <b>password<b> from somewhere if you use special caracters like '+' as we have local keyboard layout issue)", [markerFormat]);

			pwdTxtInfo.alignment = "center";
			username = new FlxUIInputText();
			pwd = new FlxUIInputText();
			pwd.passwordMode = true;
			loginTxt.screenCenter();
			username.screenCenter();
			pwdTxt.screenCenter();
			pwdTxtInfo.screenCenter();
			pwd.screenCenter();
			add( loginTxt );
			add( username );
			add( pwdTxt );
			add( pwdTxtInfo  );
			add( pwd );
			add( logo );
			add( showPwd );

			var submitButton = new FlxButton(0, 0, "LET'S GO", onSubmit);

			submitButton.screenCenter();

			username.y = loginTxt.y + _padding;
			pwdTxt.y = username.y + _padding;
			pwd.y = pwdTxt.y + _padding;
			showPwd.y = pwdTxt.y + (_padding/3);
			showPwd.x = pwd.x + pwd.width + (_padding/2);
			submitButton.y = pwd.y + _padding * 2;

			pwdTxtInfo.y = submitButton.y + (_padding * 2);
			pwdTxtInfo.color = SaltColor.LIGHT_BLUE;

			add(submitButton);
			username.hasFocus = true;
			pwd.hasFocus = false;
			// listen to paste event
			Browser.document.addEventListener("paste", onPaste);

		}

	}
	
	function onShowPwd() 
	{
		pwd.passwordMode = !pwd.passwordMode;
		//tf.updateHitbox();
		pwd.hasFocus = true;
		pwd.drawFrame(true);
	}

	override public function update(elapsed:Float):Void
	{
		var _focused = username.hasFocus ? username:pwd.hasFocus?pwd:null;
		if ( FlxG.keys.justReleased.TAB)
		{
			username.hasFocus = !username.hasFocus;
			pwd.hasFocus = !pwd.hasFocus;
		}
		else if (FlxG.keys.justReleased.BACKSPACE && _focused != null)
		{
			var t = _focused.text.split("");
			t.pop();
			_focused.text = t.join("");
			_focused.caretIndex = t.length;
			_focused.draw();
			_focused.drawFrame(true);
		}
		else if (FlxG.keys.justReleased.ENTER)
		{
			onSubmit();
		}
		super.update(elapsed);
	}
	function onPaste(e):Void
	{
		var tIn:FlxUIInputText = username.hasFocus ? username:pwd;
		tIn.text = e.clipboardData.getData("text/plain");

	}
	function onData(data:String)
	{
		//trace(data);

		var d = Json.parse(data);
		//trace(d);
		if (d.authorized)
		{
			Main.user = new Agent(d);
			#if debug
			trace(Main.user);
			#end
			Main.COOKIE.data.user = Main.user;
			
			if (Main.user.mainLanguage == null || Main.user.mainLanguage == "")
			{
				Main.user.mainLanguage = lang;
			}
			Main.COOKIE.flush();
			moveOn(); // launch APP
		}
		else
		{
			pwdTxtInfo.text += "\n\n"+ d.status;
			#if debug
			trace("Not authorized");
			#end
			//this.subState = new FlxSubState(FlxColor.RED);
			//this.openSubState(new FlxSubState());
		}
	}
	function moveOn()
	{
		Main.track.setActor(); 
		Main.tongue.init(Main.user.mainLanguage, ()->(FlxG.switchState(new TutoTree()) ) );
	}
	function onSubmit()
	{
		var u = new Http(Main.LOCATION.origin + Main.LOCATION.pathname+ "php/login/index.php" );
		//trace(location);
		u.setParameter("username", username.text);
		u.setParameter("pwd",  Base64.encode(Bytes.ofString(pwd.text)));
		u.async = true;
		u.onData = onData;
		u.onError = onError;
		u.onStatus = onStatus;
		//#if debug
		//Main.tongue.init(lang, ()->(FlxG.switchState(new TutoTree())) );
		//#else
		//
		//#end
		u.request(true);
		//u.request(true);
	}

	function onStatus(s:Int):Void
	{
		//trace(s);
		//@todo deal with http statuses
		#if debug
		trace(s);
		#end
	}

	function onError(e:Dynamic):Void
	{
		//trace(e);
		//@todo deal with http errors
		#if debug
		trace(e);
		#end
		pwdTxtInfo.text += "\n\n"+ e;
	}
}