package com.tobiasgoeschel.helloworld.conf
{
	import robotlegs.bender.extensions.eventCommandMap.api.IEventCommandMap;
	import robotlegs.bender.extensions.mediatorMap.api.IMediatorMap;
	import robotlegs.bender.framework.context.api.IContext;
	import robotlegs.bender.framework.context.api.IContextConfig;

	import com.tobiasgoeschel.helloworld.GetHelloWorldMessageCommand;
	import com.tobiasgoeschel.helloworld.HelloWorldMediator;
	import com.tobiasgoeschel.helloworld.HelloWorldService;
	import com.tobiasgoeschel.helloworld.HelloWorldServiceImpl;
	import com.tobiasgoeschel.helloworld.HelloWorldView;
	import com.tobiasgoeschel.helloworld.event.HelloWorldEvent;
	import com.tobiasgoeschel.rpc.conf.RpcBootstrapHelper;

	import org.swiftsuspenders.Injector;

	import mx.rpc.remoting.RemoteObject;

	public class HelloWorldConfig implements IContextConfig
	{
		[Inject]
		public var injector : Injector;

		[Inject]
		public var commandMap : IEventCommandMap;

		[Inject]
		public var mediatorMap : IMediatorMap;

		[Inject]
		public var rpcHelper : RpcBootstrapHelper;


		public function configureContext ( context : IContext ) : void
		{
			context.injector.injectInto ( this );
			mapCommands ();
			mapViews ();

			rpcHelper.registerRemoteClassAliases ( new HelloWorldDtoBundle () );

			mapRemoteObject ( "http://localhost:8080/blazeexample/messagebroker/amf", "helloworld" );
			mapService ();
		}

		private function mapViews () : void
		{
			mediatorMap.mapView ( HelloWorldView ).toMediator ( HelloWorldMediator );
		}

		private function mapCommands () : void
		{
			commandMap.map ( HelloWorldEvent.CREATION_COMPLETE ).toCommand ( GetHelloWorldMessageCommand );
		}

		private function mapRemoteObject ( endpoint : String, destination : String ) : void
		{
			var remoteObject : RemoteObject = new RemoteObject ();
			remoteObject.endpoint = endpoint;
			remoteObject.destination = destination;
			injector.map ( RemoteObject, destination ).toValue ( remoteObject );
		}

		private function mapService () : void
		{
			var service : HelloWorldService = new HelloWorldServiceImpl ();
			injector.injectInto ( service );
			injector.map ( HelloWorldService ).toValue ( service );
		}
	}
}
