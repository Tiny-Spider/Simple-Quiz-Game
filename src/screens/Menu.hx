package screens;

import openfl.display.Bitmap;
import openfl.events.MouseEvent;
import openfl.utils.Assets;
import screens.Screen;

/**
 * The menu screen
 * @author Tavi
 */
class Menu extends Screen
{

	/**
	 * Create the menu scene
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
		
		// Title
		var titleImage:Bitmap = new Bitmap(Assets.getBitmapData("img/title.png"));

		titleImage.x = 300;
		titleImage.y = 20;
		titleImage.width = 300;
		titleImage.height = 150;

		addChild(titleImage);

		// Start button
		var startButton:Button = new Button(Assets.getBitmapData("img/button.png"), "Start", onStartButtonClick);

		startButton.x = 350;
		startButton.y = 200;

		addChild(startButton);

		// Leaderboard button
		var leaderboardButton:Button = new Button(Assets.getBitmapData("img/button.png"), "Leaderboard", onLeaderboardButtonClick);

		leaderboardButton.x = 350;
		leaderboardButton.y = 275;

		addChild(leaderboardButton);
	}

	/**
	 * Show the game screen
	 * @param	event
	 */
	function onStartButtonClick(event:MouseEvent)
	{
		main.showGame();
	}

	/**
	 * Show the leaderboard scene
	 * @param	event
	 */
	function onLeaderboardButtonClick(event:MouseEvent)
	{
		main.showLeaderboard();
	}
}