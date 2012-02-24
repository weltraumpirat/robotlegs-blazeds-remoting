package com.tobiasgoeschel.rpc.conf
{
	import mx.logging.Log;
	import mx.logging.targets.TraceTarget;

	public class FlexLoggingBootstrapUtil
	{
		public static function initializeLogging ( logLevel:int) : void {
			var target : TraceTarget = new TraceTarget ();
			target.level = logLevel;
			Log.addTarget ( target );
		}
	}
}
