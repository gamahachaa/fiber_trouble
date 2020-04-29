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
//import openfl.text.TextField;
//import openfl.text.TextFieldType;

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
	//var username: flixel.addons.ui.FlxUIInputText;
	var username: openfl.text.TextField;
	//var pwd:flixel.addons.ui.FlxUIInputText;
	var pwd: openfl.text.TextField;
	var _padding:Int = 20;
	var lang:String;
	var logo:FlxSprite;
	var loginTxt:flixel.text.FlxText;
	var pwdTxt:flixel.text.FlxText;
	var pwdTxtInfo:flixel.text.FlxText;
	var _focused: openfl.display.InteractiveObject;
	var loginUrl:haxe.Http;
	var markerFormat:FlxTextFormatMarkerPair;
	override public function create()
	{
		super.create();
		loginUrl = new Http(Main.LOCATION.origin + Main.LOCATION.pathname+ "php/login/index.php" );
		Main.setUpSystemDefault(false);
		lang = "en-EN"; // default
		//trace(Main.COOKIE);
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
			moveOn(); // launch APPbbaudry
		}
		else
		{
			var textFieldFormat = new openfl.text.TextFormat( lime.utils.Assets.getFont("assets/fonts/Lato-Regular.ttf").name, 12, 0);
			var testFormat:FlxTextFormat = new FlxTextFormat(SaltColor.ORANGE, true);
			markerFormat = new FlxTextFormatMarkerPair( testFormat, "<b>");
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

			pwdTxtInfo = new FlxText(0, 0, 1280, "", 14);
			pwdTxtInfo.screenCenter();
			

			pwdTxtInfo.alignment = "center";
			username = new openfl.text.TextField();
			username.multiline = true;
			username.type = username.type = openfl.text.TextFieldType.INPUT;
			//tf.autoSize = TextFieldAutoSize.LEFT;
			//username.width = 500;
			username.multiline = false;
			username.height = 16;
			//username.wordWrap = true;
			//username.textWidth = 500;
			username.backgroundColor = SaltColor.WHITE;
			username.textColor = SaltColor.BLACK;
			//username.text = memoDefault;
			username.border = true;
			username.borderColor = SaltColor.BLACK;
			username.background = true;
			//username.defaultTextFormat = textFieldFormat;

			FlxG.stage.focus = username;
			pwd = new openfl.text.TextField();
			pwd.displayAsPassword = true; //pwd.passwordMode = true;

			pwd.type = pwd.type = openfl.text.TextFieldType.INPUT;
			//tf.autoSize = TextFieldAutoSize.LEFT;
			//pwd.width = 500;
			pwd.multiline = false;
			pwd.height = 16;
			//pwd.wordWrap = true;
			//pwd.textWidth = 500;
			pwd.backgroundColor = SaltColor.WHITE;
			pwd.textColor = SaltColor.BLACK;
			//pwd.text = memoDefault;
			pwd.border = true;
			pwd.borderColor = SaltColor.BLACK;
			pwd.background = true;
			//pwd.defaultTextFormat = textFieldFormat;

			username.tabEnabled = true;
			username.tabIndex = 1;
			pwd.tabEnabled = true;
			pwd.tabIndex = 2;

			username.setTextFormat(textFieldFormat);
			pwd.setTextFormat(textFieldFormat);

			loginTxt.screenCenter();
			//username.screenCenter();
			pwdTxt.screenCenter();
			
			//pwd.screenCenter();
			add( loginTxt );
			// special Texfield  positioning
			FlxG.addChildBelowMouse( username );
			//add( username );
			FlxG.addChildBelowMouse( pwd );
			//add( pwd );
			//

			add( pwdTxt );
			add( pwdTxtInfo  );

			add( logo );
			add( showPwd );

			var submitButton = new FlxButton(0, 0, "LET'S GO", onSubmit);

			submitButton.screenCenter();

			username.x = (FlxG.width - username.width) / 2 ;
			pwd.x = (FlxG.width - pwd.width)/ 2 ;

			username.y = loginTxt.y + _padding;
			pwdTxt.y = username.y + _padding;

			pwd.y = pwdTxt.y + _padding;
			showPwd.y = pwdTxt.y + (_padding/3);
			showPwd.x = pwd.x + pwd.width + (_padding/2);
			submitButton.y = pwd.y + _padding * 2;

			pwdTxtInfo.y = submitButton.y + (_padding * 2);
			pwdTxtInfo.color = SaltColor.LIGHT_BLUE;

			add(submitButton);
			//username.hasFocus = true;
			//pwd.hasFocus = false;
			// listen to paste event
			//Browser.document.addEventListener("paste", onPaste);

		}

	}

	function onShowPwd()
	{
		//pwd.passwordMode = !pwd.passwordMode;
		pwd.displayAsPassword = !pwd.displayAsPassword;
		//tf.updateHitbox();
		//pwd.hasFocus = true;
		//pwd.drawFrame(true);
	}

	override public function update(elapsed:Float):Void
	{
		//var _focused = username.hasFocus ? username:pwd.hasFocus?pwd:null;
		if ( FlxG.keys.justReleased.TAB)
		{
			_focused = FlxG.stage.focus;
			FlxG.stage.focus = _focused == pwd ? username :  pwd;
			//trace(_focused == pwd);
			//trace(_focused == username);
			//if()
			//trace(FlxG.stage.focus);
			//username.setSelection(0, 1);
			//username.hasFocus = !username.hasFocus;
			//pwd.hasFocus = !pwd.hasFocus;
		}
		//else if (FlxG.keys.justReleased.BACKSPACE && _focused != null)
		//{
			//var tf:  openfl.text.TextField = cast _focused;
			//var t = tf.text.split("");
			//t.pop();
			//tf.text = t.join("");
			////_focused.caretIndex = t.length;
			////_focused.draw();
			////_focused.drawFrame(true);
		//}
		else if (FlxG.keys.justReleased.ENTER)
		{
			onSubmit();
		}
		super.update(elapsed);
	}
	//function onPaste(e):Void
	//{
	//var tIn:FlxUIInputText = username.hasFocus ? username:pwd;
	//tIn.text = e.clipboardData.getData("text/plain");
//
	//}
	function ondata(data:String)
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
			//trace(Main.user);
			//trace(Main.COOKIE.data.user);
			if (Main.user.mainLanguage == null || Main.user.mainLanguage == "")
			{
				Main.user.mainLanguage = lang;
			}
			Main.COOKIE.flush();
			
			moveOn(); // launch APP
		}
		else
		{
			pwdTxtInfo.applyMarkup ("\n\nNT login + password <b>did not match<b>.",[markerFormat]);
			#if debug
			trace("Not authorized");
			#end
			//this.subState = new FlxSubState(FlxColor.RED);
			//this.openSubState(new FlxSubState());
		}
	}
	function moveOn()
	{
		Main.setUpSystemDefault(true);
		Main.track.setActor();
		Main.tongue.init(Main.user.mainLanguage, ()->(FlxG.switchState(new TutoTree()) ) );
	}
	function onSubmit()
	{
		
		pwdTxtInfo.text = "";
		if (StringTools.trim(username.text) == "")
		{
			pwdTxtInfo.applyMarkup("Need <b>username<b> (NT login)", [markerFormat]);
			return;
		}
		if (StringTools.trim(pwd.text) == "")
		{
			pwdTxtInfo.applyMarkup("Need <b>password<b> (Same as your NT one)", [markerFormat]);
			return;
		}
		//trace(location);
		loginUrl.setParameter("username", username.text);
		loginUrl.setParameter("pwd",  Base64.encode(Bytes.ofString(pwd.text)));
		loginUrl.async = true;
		loginUrl.onData = ondata;
		loginUrl.onError = onError;
		loginUrl.onStatus = onStatus;
		//#if debug
		//Main.tongue.init(lang, ()->(FlxG.switchState(new TutoTree())) );
		//#else
		//
		//#end
		loginUrl.request(true);
		//u.request(true);
	}

	function onStatus(s:Int):Void
	{
		//trace(s);
		//@todo deal with http statuses
		#if debug
		trace(s);
		#end
		//trace(s);
		pwdTxtInfo.clearFormats();
		if (s == 500)
		{
			pwdTxtInfo.text += "\n\nUnknown user or missing password";
		}
		else if (s == 404)
		{
			pwdTxtInfo.text += "\n\nCannot connect to the directory script";
		}
		else if (s != 200 )
		{
			pwdTxtInfo.text += "\n\nError " + s;
		}
	}

	function onError(e:Dynamic):Void
	{
		//trace(e);
		//@todo deal with http errors
		#if debug
		trace(e);
		#end
		//pwdTxtInfo.text += "\n\n"+ e;
	}
}