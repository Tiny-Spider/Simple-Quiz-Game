package screens;

import openfl.display.Sprite;

/**
 * Base class for the screens
 * @author Tavi
 */
class Screen extends Sprite
{
	// Main reference
	var main:Main;

	/**
	 * Create the scene
	 * @param	main
	 */
	public function new(main:Main)
	{
		super();

		this.main = main;
	}

	/**
	 * Draw the screen
	 */
	public function drawScreen()
	{
		removeChildren();
	}
}