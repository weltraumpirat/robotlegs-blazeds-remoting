package com.tobiasgoeschel.helloworld.event
{
	import flash.events.Event;

	public class HelloWorldServiceEvent extends Event
	{
		public static const MESSAGE_RECEIVED : String = "MESSAGE_RECEIVED";

		public static const ERROR_OCCURRED : String = "ERROR_OCCURED";

		public var message : String;


		public function HelloWorldServiceEvent ( type : String, bubbles : Boolean = false, cancelable : Boolean = false )
		{
			super ( type, bubbles, cancelable );
		}
	}
}
