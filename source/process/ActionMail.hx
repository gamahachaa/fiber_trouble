package process;
import flixel.FlxG;
import flixel.input.keyboard.FlxKey;
import layout.SaltColor;
import lime.utils.Assets;
import openfl.text.TextField;
import openfl.text.TextFieldType;
import openfl.text.TextFormat;
import utils.Mail;
import Main;
/**
 * ...
 * @author bb
 */
class ActionMail extends Action
{
	inline static var MEMO_DEFAULT:String = "MEMO: ";
	var mail:Mail;
	var ticket:Ticket;
	var tf:TextField;
	public function new(ticket: Ticket)
	{
		super();
		this.ticket = ticket;
		mail = new Mail(ticket, this);
		
		//mail.currentProcess = this;
		//mail.statusSignal.add(onMailStatus);

		//mail.errorSignal.add(onMailError);
	}
	override public function create()
	{
		var textFieldFormat:TextFormat = new TextFormat(Assets.getFont("assets/fonts/Lato-Regular.ttf").name, 12, 0);
		tf = new TextField();
		tf.multiline = true;
		tf.type = tf.type = TextFieldType.INPUT;
		//tf.autoSize = TextFieldAutoSize.LEFT;
		tf.width = 500;
		tf.height = 50;
		tf.wordWrap = true;
		//tf.textWidth = 500;
		tf.backgroundColor = SaltColor.WHITE;
		tf.textColor = SaltColor.BLACK;
		tf.text = MEMO_DEFAULT;
		tf.border = true;
		tf.borderColor = SaltColor.BLACK;
		tf.background = true;
		tf.defaultTextFormat = textFieldFormat;
		FlxG.addChildBelowMouse( tf );
		tf.x = 10;
		tf.y = 10;
		_detailTxt += prepareHistory();
		super.create();
		//FlxG.keys.preventDefaultKeys = [ FlxKey.TAB];
		this.question.text += "\n" + ticket.desc;
		
	}
	override function positionThis()
	{
		super.positionThis();
		this.tf.x = this.question.x;
		this.tf.y = this.question.y + this.question.height + (this._padding*2);
	}
	function onMailError(parameter0:Dynamic):Void
	{
		closeSubState();
		//openSubState(new DataView(0xEE000000, this._name, "\n\nCould not create the ticket !!!\n\nPlease do a print screen of this and send it to qook@salt.ch");
	}

	function onMailSuccess(data:Result):Void
	{
		closeSubState();
		switch data.status {
		case "success" : super.onClick();
			case "failed" : openSubState(new DataView(Main.THEME.bg, this._name, "\n\nCould not create the ticket !!!\n\nPlease do a print screen of this and send it to qook@salt.ch\n"+data.error));
		}
	}

	function onMailStatus(parameter0:Int):Void
	{
		closeSubState();
		if (parameter0 != 200) openSubState(new DataView(Main.THEME.bg, this._name, '\n\nhttp status $parameter0, \n\nCould not create the ticket !!!\nPlease do a print screen of this and send it to qook@salt.ch'));
	}
	override public function onClick()
	{
		tf.visible = false;
		openSubState(new TicketSendSub(Main.THEME.bg));
		mail.successSignal.addOnce(onMailSuccess);
		mail.send( tf.text == MEMO_DEFAULT ?'': tf.text);
	}
	function prepareHistory()
	{
		var hist = Main.HISTORY.history;
		var t = "\n\nSummrary :\n";
		for ( i in hist )
		{
			t += i.processTitle + " :: " + i.iteractionTitle + "\n";
		}
		trace(t);
		return t;
	}
}