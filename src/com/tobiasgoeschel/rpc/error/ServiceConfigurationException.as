package com.tobiasgoeschel.rpc.error
{
	/**
	 * @author Tobias Goeschel
	 */
	public class ServiceConfigurationException extends Error
	{
		public function ServiceConfigurationException ( message : * = "", id : * = 0 )
		{
			super ( message, id );
		}
	}
}
