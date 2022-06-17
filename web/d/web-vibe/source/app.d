import vibe.core.args : readOption;
import appcontroller : AppController;
import vibe.http.server : listenHTTP, HTTPServerOption, HTTPServerSettings;
import vibe.http.router : URLRouter;
import vibe.web.web : registerWebInterface;
import vibe.core.log : logInfo;
import vibe.core.core : runApplication;

void main()
{
  ushort port = 8080;
  readOption("port|p", &port, "The port to bind to.");

	auto settings = new HTTPServerSettings;
	settings.port = port;
	settings.bindAddresses = ["::", "0.0.0.0"];
  settings.options = HTTPServerOption.reusePort;

  auto router = new URLRouter();
  router.registerWebInterface(new AppController());

	auto listener = listenHTTP(settings, router);
	scope (exit) listener.stopListening();

	logInfo("Please open http://127.0.0.1:8080/ in your browser.");
	runApplication();
}
