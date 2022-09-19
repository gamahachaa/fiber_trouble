package flow.swapcable;

//import process.ActionAdress;
import flixel.FlxSubState;
import regex.ExpReg;
import tstool.salt.Role;
//import tstool.process.ActionMultipleInput;
import tstool.process.DescisionMultipleInput;
import tstool.salt.Adress;


/**
 * ...
 * @author bb
 */
class _InputShipingAdress extends DescisionMultipleInput
{
	static inline var STREET:String = "Street";
	static inline var ZIP:String = "Zip";
	static inline var NUMBER:String = "Nbr";
	static inline var CITY:String = "City";
	static inline var USER:String = "User";
	static inline var CO:String = " c/o";
	public function new()
	{
		//CO = (Main.customer.contract.owner == null ?"": Main.customer.contract.owner.name ) + " c/o";
		//CO = (Main.customer.contract.owner == null ?"": Main.customer.contract.owner.name ) + " c/o";
		super(
			[
				{
					ereg:ExpReg.STRING_TO_REG(ExpReg.NAME_FULL,"ui"),
					input:
					{
						width:400,
						prefix: USER,
						debug: "Peggy",
						position: [bottom, left]
					}
				},
				{
					ereg:~/[\s\S]*/i,
					input:
					{
						width:200,
						prefix: CO,
						buddy: USER,
						debug: "chez Ernest & Bart",
						position: [bottom, left]
					}
				},
				{
					ereg:~/.{2,}/ig,
					input:
					{
						buddy: CO,
						width:200,
						prefix:STREET,
						debug: "Sesame",
						position:[bottom, left]
					}
				},
				{
					ereg:~/\d+\w?/g,
					input:
					{
						buddy: STREET,
						width:50,
						prefix:NUMBER,
						debug: "69",
						position:[top, right]
					}
				},
				{
					ereg:~/^\d{4}$/g,
					input:
					{
						buddy:STREET,
						width:50,
						prefix:ZIP,
						debug: "2502",
						position:[bottom, left]
					}
				},
				{
					ereg:~/\w+[a-z 0-9.éàèüöäâêô!ï()\/\-']+/i,
					input:
					{
						buddy: ZIP,
						width:140, 
						prefix:CITY,
						debug: "Montcuq",
						position:[top, right]
					}
				}
			]
		);
	}
	override public function create()
	{
		/**
		 * @KEEP
		 */
		super.create();
		if (Main.customer.contract.address!= null)
		{
			multipleInputs.setInputDefault(STREET, Main.customer.contract.address._street);
			multipleInputs.setInputDefault(NUMBER, Main.customer.contract.address._number);
			multipleInputs.setInputDefault(ZIP, Main.customer.contract.address._zip);
			multipleInputs.setInputDefault(CITY, Main.customer.contract.address._city);
		}
		if (Main.customer.getOwner() != "")
			multipleInputs.setInputDefault(USER,  Main.customer.getOwner());
		
	}
	override public function onYesClick():Void
	{
		if (validateYes())
		{
			setCustomerShipingAdress();
			this._nexts = [{step: _FiberCableByPost, params: []}];
			super.onYesClick();
		}
	}
	override public function onNoClick():Void
	{
		if (validateNo())
		{
			setCustomerShipingAdress();
			this._nexts = [{step: _FiberCableByPost, params: []}];
			super.onNoClick();
		}
		
	}
	function setCustomerShipingAdress()
	{
		Main.customer.shipingAdress = new Adress(
				this.multipleInputs.getText(STREET),
				this.multipleInputs.getText(NUMBER),
				this.multipleInputs.getText(ZIP),
				this.multipleInputs.getText(CITY),
				this.multipleInputs.getText(CO)
			);
		Main.customer.contract.owner = new Role(owner,this.multipleInputs.getText(USER) ,this.multipleInputs.getText(USER));
	}
	/*override public function validateNo():Bool
	{
		return true;
	}*/
}