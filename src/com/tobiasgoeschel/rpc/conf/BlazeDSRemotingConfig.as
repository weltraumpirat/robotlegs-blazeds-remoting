package com.tobiasgoeschel.rpc.conf
{
	import robotlegs.bender.framework.context.api.IContext;
	import robotlegs.bender.framework.context.api.IContextConfig;

	import org.swiftsuspenders.Injector;

	import mx.logging.LogEventLevel;

	import flash.display.DisplayObjectContainer;

	public class BlazeDSRemotingConfig implements IContextConfig
	{
		[Inject]
		public var contextView : DisplayObjectContainer;

		[Inject]
		public var injector : Injector;

		[Inject]
		public var rpcHelper : RpcBootstrapHelper;


		public function configureContext ( context : IContext ) : void
		{
			context.injector.map ( RpcBootstrapHelper ).toSingleton ( RpcBootstrapHelper );
			context.injector.injectInto ( this );

			FlexLoggingBootstrapUtil.initializeLogging ( LogEventLevel.ERROR );

			rpcHelper.initalizeRPC ( contextView.loaderInfo );
			rpcHelper.registerRemoteClassAliases ( new RequiredRemoteFlexClassesBundle () );
		}
	}
}
