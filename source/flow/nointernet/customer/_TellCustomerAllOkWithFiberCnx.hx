package flow.nointernet.customer;


import flow.salttv.IsAppleTVvisibleOnTVScreen;
import flow.stability._OpenSpeedTest;
import process.Action;

/**
 * ...
 * @author ...
 */
class _TellCustomerAllOkWithFiberCnx extends Action
{
	override public function create():Void
	{
		if (Main.HISTORY.isInHistory("flow.Intro", No))//TV
		{
			this._nextProcesses = [new IsAppleTVvisibleOnTVScreen()];
		}
		else if (Main.HISTORY.isInHistory("flow.Intro", Yes))
		{
			if (Main.HISTORY.isInHistory("flow.all.customer.IsSlowOrKaput", Yes))
			{
				// slow internet
				this._nextProcesses = [new _OpenSpeedTest()];
			}
			else{
				this._nextProcesses = [new ConnectionType()];
			}
		}
		super.create();
	}
}