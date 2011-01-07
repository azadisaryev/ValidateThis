<cfcomponent output="false" hint="My App Configuration">
<cfscript>
// Configure ColdBox Application
function configure(){

	// coldbox directives
	coldbox = {
		//Application Setup
		appName 				= "ValidateThisDemo",
		
		//Development Settings
		debugMode				= false,
		debugPassword			= "",
		reinitPassword			= "",
		handlersIndexAutoReload = true,
		configAutoReload		= false,
		
		//External locations
		/*
		Instead of copying the validatethis/extras/ValidateThisCB3Plugin.cfc plugin to the plugins
		directory of this ColdBox app I'm going to use the pluginsExternalLocation so that if I update
		ValidateThis, the plugin will be the correct version. 
		If you prefer to copy the plugin to the /plugins/ directory of your application then you don't 
		need to set the pluginsExternalLocation setting.
		*/
		pluginsExternalLocation		= "validatethis.extras",
		
		//Implicit Events
		defaultEvent			= "general.index",
		requestStartHandler		= "main.requeststart",
		requestEndHandler		= "",
		applicationStartHandler = "",
		applicationEndHandler	= "",
		sessionStartHandler 	= "",
		sessionEndHandler		= "",
		missingTemplateHandler	= "",
		
		//Error/Exception Handling
		exceptionHandler		= "",
		onInvalidEvent			= "",
		customErrorTemplate		= "",
			
		//Application Aspects
		handlerCaching 			= false,
		eventCaching			= true
	};
	
	//Layout Settings
	layoutSettings = {
		defaultLayout = "Layout.Main.cfm"
	};
	
	// custom settings
	settings = {
		ValidateThisConfig = {
			// Tell VT that I will include Javascript libraries myself (optional)
			JSIncludes=false,
			// Tell VT that I want to use a customised version of ValidateThis.util.Result (optional)
			ResultPath="model.ValidationResult",
			// Tell VT that I want to use a customised version of ValidateThis.core.BOValidator (optional)
			boValidatorPath="model.BOValidator"
		}
	};
	
	//Register interceptors as an array, we need order
	interceptors = [
		//Autowire
		{
			class="coldbox.system.interceptors.Autowire"
		}
	];	
}
	
</cfscript>
</cfcomponent>