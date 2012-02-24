package com.tobiasgoeschel.helloworld
{
	public class GetHelloWorldMessageCommand
	{
		[Inject]
		public var service : HelloWorldService;
		
		public function execute () : void
		{
			service.getMessage();
		}
	}
}
