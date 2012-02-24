package com.tobiasgoeschel.helloworld
{
	import com.tobiasgoeschel.helloworld.event.HelloWorldEvent;
	import com.tobiasgoeschel.helloworld.event.HelloWorldServiceEvent;
	import robotlegs.bender.bundles.classic.impl.Mediator;

	public class HelloWorldMediator extends Mediator
	{
		[Inject]
		public var view : HelloWorldView;
	
		override public function initialize () : void
		{
			super.initialize ();
		
			addContextListener ( HelloWorldServiceEvent.ERROR_OCCURRED, onErrorOccurred, HelloWorldServiceEvent);
			addContextListener ( HelloWorldServiceEvent.MESSAGE_RECEIVED, onMessageReceived, HelloWorldServiceEvent);
			
			dispatch (new HelloWorldEvent (HelloWorldEvent.CREATION_COMPLETE));
		}
		
		private function onMessageReceived ( event : HelloWorldServiceEvent ) : void
		{
			view.display ( event.message );
		}

		private function onErrorOccurred ( event : HelloWorldServiceEvent ) : void
		{
			view.alert ( event.message );
		}

		override public function destroy () : void
		{
			super.destroy ();
		}

	}
}
