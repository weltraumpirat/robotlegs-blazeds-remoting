package com.tobiasgoeschel.helloworld
{
	import com.tobiasgoeschel.helloworld.data.MessageDTO;
	import com.tobiasgoeschel.helloworld.event.HelloWorldServiceEvent;

	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	import mx.rpc.remoting.RemoteObject;

	import flash.events.IEventDispatcher;

	public class HelloWorldServiceImpl implements HelloWorldService
	{
		[Inject]
		public var dispatcher : IEventDispatcher;

		[Inject(name="helloworld")]
		public var remoteObject : RemoteObject;


		public function getMessage () : void
		{
			remoteObject.addEventListener ( ResultEvent.RESULT, onGetMessageResult );
			remoteObject.addEventListener ( FaultEvent.FAULT, onFault );
			remoteObject.getMessage ();
		}

		private function onGetMessageResult ( event : ResultEvent ) : void
		{
			clearListeners();
			
			var messageDTO : MessageDTO = event.result as MessageDTO;
			var ev : HelloWorldServiceEvent = new HelloWorldServiceEvent ( HelloWorldServiceEvent.MESSAGE_RECEIVED );
			ev.message = messageDTO.message;
			dispatcher.dispatchEvent ( ev );
		}

		private function onFault ( event : FaultEvent ) : void
		{
			clearListeners();
			
			var ev : HelloWorldServiceEvent = new HelloWorldServiceEvent ( HelloWorldServiceEvent.ERROR_OCCURRED );
			ev.message = "Invocation failed:" + event.fault.message;
			dispatcher.dispatchEvent ( ev );
		}

		private function clearListeners () : void
		{
			remoteObject.removeEventListener ( FaultEvent.FAULT, onFault );
			remoteObject.removeEventListener ( ResultEvent.RESULT, onGetMessageResult );
		}
	}
}
