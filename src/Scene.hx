package;

import openfl.Assets;
import openfl.display.Bitmap;
import openfl.display.Sprite;
import openfl.events.MouseEvent;
import openfl.text.TextField;
import openfl.text.TextFieldAutoSize;
import openfl.text.TextFormat;
import openfl.text.TextFormatAlign;
import openfl.utils.Assets;
import screens.Game;

/**
 * Question scene class
 * @author Tavi
 */
class Scene extends Sprite
{
	// Score for this scene
	public var score:Int;
	
	// Question values
	var question:String;
	var image:String;
	var options:Map<String, Int>;
	
	// Game reference
	var game:Game;

	/**
	 * Create a new question scene
	 * @param	question
	 * @param	image
	 * @param	options
	 * @param	score
	 * @param	game
	 */
	public function new(question:String, image:String, options:Map<String, Int>, score:Int, game:Game)
	{
		super();

		this.question = question;
		this.image = image;
		this.options = options;
		this.score = score;
		this.game = game;
	}

	/**
	 * Draw the entire scene with the options
	 */
	public function drawScene()
	{
		removeChildren();

		// Scene Image
		if (image != null && image != "")
		{
			var sceneImage:Bitmap = new Bitmap(Assets.getBitmapData(image));

			sceneImage.x = 300;
			sceneImage.y = 20;
			sceneImage.width = 300;
			sceneImage.height = 100;

			addChild(sceneImage);
		}

		// Title
		var questionField:TextField = new TextField();

		questionField.text = question;
		questionField.selectable = false;
		questionField.defaultTextFormat = new TextFormat("_sans", 20, 0x000000, false, false, false, null, null, TextFormatAlign.CENTER);

		questionField.x = 300;
		questionField.y = 150;
		questionField.width = 300;
		questionField.height = 100;

		addChild(questionField);

		// Create option buttons
		var buttonY:Float = 200;

		for (option in options.keys())
		{
			// Prevent empty options
			if (option == null || option == "")
			{
				continue;
			}

			// Option button
			var optionButton:Button = new Button(Assets.getBitmapData("img/button.png"), option, onOptionClick);

			optionButton.x = 350;
			optionButton.y = buttonY;

			addChild(optionButton);
			
			// Add offset for next option
			buttonY += 75;
		}
	}

	/**
	 * Show the next scene if a button is pressed
	 * @param	event
	 */
	function onOptionClick(event:MouseEvent)
	{
		var button:Button = cast(event.currentTarget, Button);
		var buttonText = button.buttonText;
		var nextScene:Int = options.get(buttonText);

		game.showScene(nextScene);
	}
}