package;

import openfl.display.Bitmap;
import openfl.display.BitmapData;
import openfl.display.Sprite;
import openfl.events.MouseEvent;
import openfl.text.TextField;
import openfl.text.TextFieldAutoSize;
import openfl.text.TextFormat;
import openfl.text.TextFormatAlign;

/**
 * Modified version of default button
 * @author Manno
 */
class Button extends Sprite
{
	// Button custom text
	public var buttonText:String;
	
	public function new(buttonImage:BitmapData, buttonText:String, callback:MouseEvent -> Void) 
	{
		super();
		
		this.buttonText = buttonText;
		
		// Background image
		var image:Bitmap = new Bitmap(buttonImage);
		// Custom text field
		var text:TextField = new TextField();
		
		text.y = 10;
		text.width = image.width;
		text.height = image.height;
		
		text.selectable = false;
		text.defaultTextFormat = new TextFormat("_sans", 20, 0x000000, false, false, false, null, null, TextFormatAlign.CENTER);
		
		text.text = buttonText;
		
		// Add background first then text
		addChild(image);
		addChild(text);
		
		addEventListener(MouseEvent.CLICK, callback);
	}
}