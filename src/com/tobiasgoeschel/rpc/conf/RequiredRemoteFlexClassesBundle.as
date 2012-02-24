package com.tobiasgoeschel.rpc.conf
{
	import mx.collections.ArrayCollection;
	import mx.messaging.config.ConfigMap;
	import mx.messaging.messages.AcknowledgeMessage;
	import mx.messaging.messages.AcknowledgeMessageExt;
	import mx.messaging.messages.CommandMessage;
	import mx.messaging.messages.CommandMessageExt;
	import mx.messaging.messages.ErrorMessage;
	import mx.messaging.messages.RemotingMessage;
	import mx.utils.ObjectProxy;

	public class RequiredRemoteFlexClassesBundle
	{
		public var errorMessage : ErrorMessage ;

		public var commandMessage : CommandMessage ;

		public var remotingMessage : RemotingMessage ;

		public var acknowledgeMessage : AcknowledgeMessage ;

		public var commandMessageExt : CommandMessageExt ;

		public var acknowledgeMessageExt : AcknowledgeMessageExt ;

		public var configMap : ConfigMap ;

		public var arrayCollection : ArrayCollection ;

		public var objectProxy : ObjectProxy ;
	}
}
