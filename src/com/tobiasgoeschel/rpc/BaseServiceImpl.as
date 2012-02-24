package com.tobiasgoeschel.rpc
{
	import com.tobiasgoeschel.rpc.error.ServiceConfigurationException;

	import mx.rpc.events.FaultEvent;
	import mx.rpc.remoting.RemoteObject;

	import flash.events.IEventDispatcher;

	public class BaseServiceImpl
	{
		[Inject]
		public var dispatcher : IEventDispatcher;

		protected var remoteObject : RemoteObject;


		protected function onFault ( event : FaultEvent ) : void
		{
			throw new ServiceConfigurationException ( "You must override the 'onFault' event handler!" );
		}

		public function BaseServiceImpl ( endPoint : String, destination : String )
		{
			if (!endPoint) throw new ServiceConfigurationException ( "Missing value for 'endPoint'!" );
			if (!destination) throw new ServiceConfigurationException ( "Missing value for 'destination!" );

			remoteObject = new RemoteObject ();
			remoteObject.destination = destination;
			remoteObject.endpoint = endPoint;
			remoteObject.addEventListener ( FaultEvent.FAULT, onFault );
		}
	}
}
