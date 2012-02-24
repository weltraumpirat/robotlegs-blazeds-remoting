package com.tobiasgoeschel.helloworld.event
{
	import flash.events.Event;

	public class HelloWorldEvent extends Event
	{
		public static const CREATION_COMPLETE : String = "CREATION_COMPLETE";


		public function HelloWorldEvent ( type : String, bubbles : Boolean = false, cancelable : Boolean = false )
		{
			super ( type, bubbles, cancelable );
		}
	}
}
