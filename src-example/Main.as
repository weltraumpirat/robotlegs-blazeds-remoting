package
{
	import com.tobiasgoeschel.helloworld.conf.HelloWorldConfig;
	import com.tobiasgoeschel.rpc.conf.BlazeDSRemotingConfig;
	import robotlegs.bender.bundles.classic.ClassicRobotlegsBundle;
	import robotlegs.bender.framework.context.impl.Context;

	import com.tobiasgoeschel.helloworld.HelloWorldView;

	import flash.display.Sprite;

	public class Main extends Sprite
	{
		public var context : Context;

		public var view : HelloWorldView;
		
		public function Main ()
		{
			context = new Context ( ClassicRobotlegsBundle, this, BlazeDSRemotingConfig, HelloWorldConfig );
			view = new HelloWorldView;
			addChild ( view );
		}
	}
}
