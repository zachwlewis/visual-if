package 
{
	import net.flashpunk.Engine;
	import net.flashpunk.FP;

	/**
	 * ...
	 * @author Zachary Weston Lewis
	 */
	[Frame(factoryClass="Preloader")]
	public class Main extends Engine 
	{

		public function Main():void 
		{
			super(320, 240);
			FP.screen.scale = 2;
		}

		override public function init():void 
		{
			FP.world = new GameWorld;
			super.init();
		}

	}

}