package flow.tv.remote;

//import flow.tv.remote.salttvv2.CanPair;
import flow.tv.remote.DoesAppleTVLedBlinks;
import flow.tv.remote.satltv._EnsureAppleTVInVisualRangeOfRemote;
import flow.tv.remote.siri.ThisAppleRemoteNotFromSalt;
import tstool.process.ActionRadios;
import tstool.process.Process;
//import tstool.process.Triplet;
//import flow.tv.remote.siri.DoesLightningDiodeLids;
import flow.tv.remote.siri._AdviceOnSiriRemoteUSage;
//import flow.tv.remote.siri._RechargeSiriRemote;
//import tstool.process.Descision;

/**
 * ...
 * @author bb
 */
//class WichRemote extends Triplet
class WichRemote extends ActionRadios
{
	public static inline var REMOTE_VERSION:String = "Remote Version";
	public static inline var SIRI_V1:String = "Siri v1";
	public static inline var SIRI_V2:String = "Siri v2";
	public static inline var SALT_V1:String = "Salt TV remote v1";
	public static inline var SALT_V2:String = "Salt TV remote v2";

	/*override public function onYesClick():Void
	{
		this._nexts = [{
			step: DoesAppleTVLedBlinks,
			params: [
				{step: _AdviceOnSiriRemoteUSage},
				{step: _RechargeSiriRemote}]
		}];
		super.onYesClick();
	}
	override public function onNoClick():Void
	{
		this._nexts = [{step: _EnsureAppleTVInVisualRangeOfRemote}];
		super.onNoClick();
	}
	override public function onMidClick():Void
	{
		this._nexts = [{step: CanPair}];
		super.onNoClick();
	}*/
	public function new()
	{
		super(
			[
		{
			title: REMOTE_VERSION,
			values: [SIRI_V1,SIRI_V2,SALT_V1, SALT_V2]
		}
			]
		);

	}
	override public function onClick():Void
	{
		this._nexts = [{step:  getNext(), params: []}];
		super.onClick();
	}
	inline function getNext():Class<Process>
	{
		return switch (status.get(REMOTE_VERSION))
		{
			//case SIRI_V1: DoesAppleTVLedBlinks;
			case SIRI_V2: ThisAppleRemoteNotFromSalt;
			case SALT_V1: _EnsureAppleTVInVisualRangeOfRemote;
			case _: DoesAppleTVLedBlinks;
			
		};
	}
}