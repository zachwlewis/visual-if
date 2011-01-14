package  
{
	/**
	 * ...
	 * @author Zachary Weston Lewis
	 */
	public class Room
	{
		protected var components:Vector.<Component>;
		protected var description:String;
		public function Room() 
		{
			components = new Vector.<Component>();
			description = "";
		}
		
		public function set Description(value:String):void
		{
			description = value;
		}
		
		public function issueCommand(s:String):String
		{
			if (s.substr(0, 8).match("LOOK AT "))
			{
				return "There is no " + s.substr(8, s.length) + " to look at.";
			}
			else if (s.substr(0,4).match("LOOK"))
			{
				return description;
			}
			else if (s.substr(0, 4).match("HELP"))
			{
				return "Some useful commands are: LOOK, LOOK AT";
			}
			else
			{
				return "I don't understand " + s + ". Type HELP to get available commands.";
			}
		}
		
	}

}