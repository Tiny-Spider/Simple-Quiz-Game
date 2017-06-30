package screens;

import openfl.Assets;
import openfl.events.MouseEvent;
import openfl.text.TextField;
import openfl.text.TextFieldType;
import openfl.text.TextFormat;
import openfl.text.TextFormatAlign;
import sys.db.ResultSet;

/**
 * The game screen
 * @author Tavi
 */
class Game extends Screen
{
	// Current values
	var score:Int = 0;
	var scene:Scene = null;

	// Input UI values
	var inputTitle:TextField = new TextField();
	var input:TextField = new TextField();

	/**
	 * Create the game scene
	 * @param	main
	 */
	public function new(main:Main)
	{
		super(main);

		showScene(1);
	}

	/**
	 * Add or remove score
	 * @param	score
	 */
	public function addScore(score:Int)
	{
		this.score += score;
	}

	/**
	 * Show the scene and if id is 0 or less it will show the input screen
	 * @param	id
	 */
	public function showScene(id:Int)
	{
		// If id is below 0 we show enter name for highscore
		if (id <= 0)
		{
			scene = null;
			drawScreen();
			return;
		}

		var sceneDatas:ResultSet = Database.getSceneData(id);

		// Scene values
		var question:String = "";
		var image:String = "";
		var options:Map<String, Int> = new Map<String, Int>();
		var score:Int = 0;

		for (sceneData in sceneDatas)
		{
			question = sceneData.question;
			image = sceneData.image;
			score = sceneData.score;

			// Check if each option is not null and add it
			if (sceneData.optionOneText != null)
			{
				options.set(sceneData.optionOneText, sceneData.optionOneScene);
			}
			if (sceneData.optionTwoText != null)
			{
				options.set(sceneData.optionTwoText, sceneData.optionTwoScene);
			}
			if (sceneData.optionThreeText != null)
			{
				options.set(sceneData.optionThreeText, sceneData.optionThreeScene);
			}
		}

		// Set the scene
		scene = new Scene(question, image, options, score, this);
		
		// Add scene score and draw the screen
		addScore(score);
		drawScreen();
	}

	/**
	 * Draw the current screen
	 */
	override public function drawScreen()
	{
		super.drawScreen();

		if (scene != null)
		{
			scene.drawScene();
			addChild(scene);
		}
		else
		{
			// Input title
			inputTitle.y = 150;
			inputTitle.x = 350;
			inputTitle.width = 200;
			inputTitle.height = 30;

			inputTitle.text = "Your name:";
			inputTitle.selectable = false;
			inputTitle.defaultTextFormat = new TextFormat("_sans", 20, 0x000000, false, false, false, null, null, TextFormatAlign.JUSTIFY);

			addChild(inputTitle);

			// Input
			input.y = 200;
			input.x = 350;
			input.width = 200;
			input.height = 40;

			input.border = true;
			input.borderColor = 0xFFFFFF;
			input.type = TextFieldType.INPUT;
			input.defaultTextFormat = new TextFormat("_sans", 20, 0x000000, false, false, false, null, null, TextFormatAlign.JUSTIFY);

			addChild(input);

			// Submit
			var submitButton:Button = new Button(Assets.getBitmapData("img/button.png"), "Submit", onSubmitClick);

			submitButton.y = 250;
			submitButton.x = 350;

			addChild(submitButton);
		}
	}

	/**
	 * Try to submit the scores, will not work when input is empty
	 * @param	event
	 */
	function onSubmitClick(event:MouseEvent)
	{
		var name:String = input.text;

		if (name != null && name != "")
		{
			Database.addLeaderboard(input.text, score);

			main.showMenu();
		}
	}
}