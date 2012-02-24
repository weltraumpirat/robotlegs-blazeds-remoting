package com.tobiasgoeschel.helloworld.data
{
	[RemoteClass(alias="com.tobiasgoeschel.MessageDTO")]
	public class MessageDTO
	{
		private var _message : String;

		public function get message () : String
		{
			return _message;
		}

		public function set message ( message : String ) : void
		{
			_message = message;
		}
	}
}
