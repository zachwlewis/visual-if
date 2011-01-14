package  
{
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Text;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	import net.flashpunk.World;
	/**
	 * ...
	 * @author Zachary Weston Lewis
	 */
	public class GameWorld extends World
	{
		protected var textOutput:Text;
		protected var textInput:Text;
		protected var command:String;
		protected var rooms:Vector.<Room>;
		protected var currentRoom:uint;
		public function GameWorld() 
		{
			
		}
		
		override public function begin():void 
		{
			// Set our text to a proper size.
			Text.size = 8;
			
			// Set up our rooms.
			rooms = new Vector.<Room>();
			rooms.push(new Room());
			rooms[0].Description = "You are in a damp cave. The room glows with unnatural light. There are no exits.";
			currentRoom = 0;
			command = "";
			var t:String = "THE DARKENED MAW\n\n\tYour head is screaming with pain. The last thing you can remember is the cracking sound of dry branches and falling. You open your eyes and are surprised by your surroundings.";
			textOutput = new Text("", 0, 10, FP.screen.width, FP.screen.height - 24);
			textOutput.wordWrap = true;
			textOutput.vAlign = "bottom";
			textOutput.resizable = false;
			textOutput.text = t;
			textInput = new Text("> ", 0, FP.screen.height - 10, FP.screen.width);
			addGraphic(textOutput);
			addGraphic(textInput);
			super.begin();
		}
		
		override public function update():void 
		{
			if (Input.pressed(Key.ANY))
			{
				var t:String = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
				var i:Array = t.match(Key.name(Input.lastKey));
				if (i != null) command += i[0];
				
				switch(Key.name(Input.lastKey))
				{
					case "SPACE":
						command += " ";
						break;
					case "ENTER":
						submitCommand();
						break;
					case "BACKSPACE":
						if (command.length > 0)
						{
							command = command.slice(0, command.length - 1);
						}
						break;
					default:
						break;
				}
			}
			textInput.text = "> " + command;
			super.update();
		}
		
		protected function submitCommand():void
		{
			// Stuff will happen here.
			textOutput.text += "\n> " + command;
			textOutput.text += "\n" + rooms[currentRoom].issueCommand(command);
			
			command = "";
		}
	}

}