package com.tobiasgoeschel.rpc.error
{
	public class RemoteObjectRegistrationException extends Error
	{
		public function RemoteObjectRegistrationException ( message : * = "", id : * = 0 )
		{
			super ( message, id );
		}
	}
}
