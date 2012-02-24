package com.tobiasgoeschel.helloworld
{
	import com.tobiasgoeschel.helloworld.data.MessageDTO;
	import com.tobiasgoeschel.helloworld.event.HelloWorldServiceEvent;
	import com.tobiasgoeschel.rpc.BaseServiceImpl;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;


	public class HelloWorldServiceImpl extends BaseServiceImpl implements HelloWorldService
	{
		public function getMessage () : void
		{
			remoteObject.getMessage ();
		}

		private function onGetMessageResult ( event : ResultEvent ) : void
		{
			var messageDTO : MessageDTO = event.result as MessageDTO;
			var ev : HelloWorldServiceEvent = new HelloWorldServiceEvent ( HelloWorldServiceEvent.MESSAGE_RECEIVED );
			ev.message = messageDTO.message;
			dispatcher.dispatchEvent ( ev );
		}

		override protected function onFault ( event : FaultEvent ) : void
		{
			var ev : HelloWorldServiceEvent = new HelloWorldServiceEvent ( HelloWorldServiceEvent.ERROR_OCCURRED );
			ev.message = "Invocation failed:" + event.fault.message;
			dispatcher.dispatchEvent ( ev );
		}

		public function HelloWorldServiceImpl ( endPoint : String, destination : String )
		{
			super ( endPoint, destination );
			remoteObject.addEventListener ( ResultEvent.RESULT, onGetMessageResult );
		}
	}
}
