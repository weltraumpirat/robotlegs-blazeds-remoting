package com.tobiasgoeschel.rpc.conf
{
	import com.tobiasgoeschel.rpc.error.RemoteObjectRegistrationException;

	import flash.display.LoaderInfo;
	import flash.net.registerClassAlias;
	import flash.utils.describeType;
	import flash.utils.getDefinitionByName;

	import mx.core.mx_internal;
	import mx.messaging.config.LoaderConfig;

	use namespace mx_internal;
	public class RpcBootstrapHelper
	{
		public function initalizeRPC ( loaderInfo : LoaderInfo ) : void
		{
			LoaderConfig._url = loaderInfo.url;
			LoaderConfig._parameters = loaderInfo.parameters;
		}

		public function registerRemoteClassAliases ( bundle : Object ) : void
		{
			if (bundle) parseBundleAndProcessClasses ( bundle );
			else throw new RemoteObjectRegistrationException ( "You must pass a bundle object to registerRemoteClassAliasForClasses." );
		}

		private function parseBundleAndProcessClasses ( bundle : Object ) : void
		{
			for each (var field : XML in getFieldDescriptions ( bundle ))
				registerRemoteClassAliasOrThrowException ( field );
		}

		private function getFieldDescriptions ( obj : Object ) : XMLList
		{
			var description : XML = describeType ( obj );
			return description..variable;
		}

		private function registerRemoteClassAliasOrThrowException ( field : XML ) : void
		{
			try
			{
				registerRemoteClassAlias ( field );
			}
			catch (e : Error)
			{
				throw new RemoteObjectRegistrationException ( "Could not register class alias for type:" + field + " due to:" + e.message );
			}
		}

		private function registerRemoteClassAlias ( field : XML ) : void
		{
			var cls : Class = getTargetClass ( field );
			var remote : String = getRemoteClassNameFromType ( cls );
			registerClassAlias ( remote, cls );
		}

		private function getTargetClass ( field : XML ) : Class
		{
			var className : String = getTargetClassName ( field );
			return getDefinitionByName ( className ) as Class;
		}

		private function getTargetClassName ( field : XML ) : String
		{
			return toQualifiedName ( field.@type.toString () );
		}

		private function toQualifiedName ( typeName : String ) : String
		{
			return typeName.replace ( "::", "." );
		}

		private function getRemoteClassNameFromType ( cls : Class ) : String
		{
			var type : XML = describeType ( new cls () );
			return getRemoteClassNameFromDescription ( type );
		}

		private function getRemoteClassNameFromDescription ( type : XML ) : String
		{
			return type.metadata.(@name == "RemoteClass").arg.@value.toString ();
		}
	}
}
