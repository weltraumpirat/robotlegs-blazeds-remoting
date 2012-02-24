package com.tobiasgoeschel.helloworld
{
	import flash.display.Sprite;
	import flash.text.TextField;
	import flash.text.TextFormat;

	public class HelloWorldView extends Sprite
	{
		private var textField : TextField;

		private var textFormat : TextFormat;


		public function display ( str : String ) : void
		{
			textField.text = str;
			textFormat.color = 0x000000;
			textField.setTextFormat ( textFormat );
		}

		public function alert ( str : String ) : void
		{
			textField.text = str;
			textFormat.color = 0xFF0000;
			textField.setTextFormat ( textFormat );
		}

		public function HelloWorldView ()
		{
			createTextField ();
		}

		private function createTextField () : void
		{
			textField = new TextField ();
			textField.x = 100;
			textField.y = 100;
			textField.width = 200;
			textField.height = 500;
			textField.multiline = true;
			textField.wordWrap = true;
			textField.embedFonts = false;
			textFormat = new TextFormat ( "Arial", 14, 0, true );
			textField.defaultTextFormat = textFormat;
			textField.setTextFormat ( textFormat );
			addChild ( textField );
		}
	}
}
