package com.tobiasgoeschel.helloworld.conf
{
	import com.tobiasgoeschel.helloworld.GetHelloWorldMessageCommand;
	import com.tobiasgoeschel.helloworld.HelloWorldMediator;
	import com.tobiasgoeschel.helloworld.HelloWorldService;
	import com.tobiasgoeschel.helloworld.HelloWorldServiceImpl;
	import com.tobiasgoeschel.helloworld.HelloWorldView;
	import com.tobiasgoeschel.helloworld.event.HelloWorldEvent;
	import com.tobiasgoeschel.rpc.conf.RpcBootstrapHelper;

	import org.swiftsuspenders.Injector;

	import robotlegs.bender.extensions.eventCommandMap.api.IEventCommandMap;
	import robotlegs.bender.extensions.mediatorMap.api.IMediatorMap;
	import robotlegs.bender.framework.context.api.IContext;
	import robotlegs.bender.framework.context.api.IContextConfig;

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
			commandMap.map ( HelloWorldEvent.CREATION_COMPLETE ).toCommand ( GetHelloWorldMessageCommand );
			mediatorMap.mapView ( HelloWorldView ).toMediator ( HelloWorldMediator );

			rpcHelper.registerRemoteClassAliases ( new HelloWorldDtoBundle () );

			var service : HelloWorldService = new HelloWorldServiceImpl ( "http://localhost:8080/blazeexample/messagebroker/amf", "helloworld" );
			injector.injectInto ( service );
			injector.map ( HelloWorldService ).toValue ( service );
		}
	}
}
