package screens;

import openfl.Assets;
import openfl.events.MouseEvent;
import openfl.text.TextField;
import openfl.text.TextFormat;
import openfl.text.TextFormatAlign;
import sys.db.ResultSet;

/**
 * The leaderboard screen
 * @author Tavi
 */
class Leaderboard extends Screen
{

	/**
	 * Create the leaderboard scene
	 * @param	main
	 */
	public function new(main:Main)
	{
		super(main);
	}

	/**
	 * Draw the current screen
	 */
	override public function drawScreen()
	{
		super.drawScreen();

		// Clear button
		var clearButton:Button = new Button(Assets.getBitmapData("img/button.png"), "Clear", onClearButtonClick);

		clearButton.x = 350;
		clearButton.y = 300;

		addChild(clearButton);

		// Menu button
		var menuButton:Button = new Button(Assets.getBitmapData("img/button.png"), "Menu", onMenuButtonClick);

		menuButton.x = 350;
		menuButton.y = 375;

		addChild(menuButton);

		drawScores();
	}

	/**
	 * Get and show the leaderboard scores
	 */
	function drawScores()
	{
		// Score management
		var scoreText:String = "";
		var scores:ResultSet = Database.getLeaderboard(10);

		for (score in scores)
		{
			var name:String = score.name;
			var score:Int = score.score;

			scoreText += '$name ($score) \n';
		}

		// Show scores in textfield
		var displayText:TextField = new TextField();

		displayText.y = 10;
		displayText.x = 10;
		displayText.width = 880;
		displayText.height = 250;

		displayText.text = scoreText;
		displayText.selectable = false;
		displayText.border = true;
		displayText.borderColor = 0xFFFFFF;

		displayText.defaultTextFormat = new TextFormat("_sans", 20, 0x000000, false, false, false, null, null, TextFormatAlign.CENTER);

		addChild(displayText);
	}

	/**
	 * Show the menu screen
	 * @param	event
	 */
	function onMenuButtonClick(event:MouseEvent)
	{
		main.showMenu();
	}

	/**
	 * Clear the scores from the database and update the screen
	 * @param	event
	 */
	function onClearButtonClick(event:MouseEvent)
	{
		Database.clearLeaderboard();

		drawScreen();
	}

}