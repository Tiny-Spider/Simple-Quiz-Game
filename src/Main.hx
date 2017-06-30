package;

import openfl.display.Sprite;
import screens.Game;
import screens.Leaderboard;
import screens.Menu;
import screens.Screen;

/**
 * Main class of the game
 * @author Tavi
 */
class Main extends Sprite
{
	// Current screen
	var screen:Screen;

	public function new()
	{
		super();

		showMenu();
	}

	/**
	 * Show the menu screen
	 */
	public function showMenu()
	{
		screen = new Menu(this);
		drawScreendffdssdf();
	}

	/**
	 * Show the game screen
	 */
	public function showGame()
	{
		screen = new Game(this);
		drawScreen();
	}

	/**
	 * Show the leaderboard screen
	 */
	public function showLeaderboard()
	{
		screen = new Leaderboard(this);
		drawScreen();
	}

	/**
	 * Add and draw the current screen
	 */
	function drawScreen()
	{
		removeChildren();
		addChild(screen);
		screen.drawScreen();
	}
}