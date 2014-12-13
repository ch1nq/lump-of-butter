import lime.Assets;
#if !macro


class ApplicationMain {
	
	
	public static var config:lime.app.Config;
	public static var preloader:openfl.display.Preloader;
	
	private static var app:lime.app.Application;
	
	
	public static function create ():Void {
		
		app = new openfl.display.Application ();
		app.create (config);
		
		var display = new com.haxepunk.Preloader ();
		
		preloader = new openfl.display.Preloader (display);
		preloader.onComplete = init;
		preloader.create (config);
		
		#if js
		var urls = [];
		var types = [];
		
		
		urls.push ("graphics/debug/console_debug.png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("graphics/debug/console_hidden.png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("graphics/debug/console_logo.png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("graphics/debug/console_output.png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("graphics/debug/console_pause.png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("graphics/debug/console_play.png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("graphics/debug/console_step.png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("graphics/debug/console_visible.png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("graphics/preloader/haxepunk.png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("font/04B_03__.ttf");
		types.push (AssetType.FONT);
		
		
		urls.push ("font/04B_03__.ttf.png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("graphics/Background.png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("graphics/ball-gfx.png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("graphics/Bar.png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("graphics/Dog-sheet.png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("graphics/game-gfx-2.png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("graphics/game-gfx.png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("graphics/GameOver.png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("graphics/GameOverDOG.png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("graphics/GameOverP1.png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("graphics/GameOverP2.png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("graphics/GameOverSINGLE.png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("graphics/shadow.png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("graphics/Splash.png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("graphics/target.png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("audio/EndGame.ogg");
		types.push (AssetType.SOUND);
		
		
		urls.push ("audio/huuang.ogg");
		types.push (AssetType.SOUND);
		
		
		urls.push ("audio/Pickup.ogg");
		types.push (AssetType.SOUND);
		
		
		urls.push ("audio/splat.ogg");
		types.push (AssetType.SOUND);
		
		
		urls.push ("audio/StartGame.ogg");
		types.push (AssetType.SOUND);
		
		
		urls.push ("audio/theme.ogg");
		types.push (AssetType.MUSIC);
		
		
		urls.push ("font/04B_03__.ttf");
		types.push (AssetType.FONT);
		
		
		
		preloader.load (urls, types);
		#end
		
		var result = app.exec ();
		
		#if sys
		Sys.exit (result);
		#end
		
	}
	
	
	public static function init ():Void {
		
		var loaded = 0;
		var total = 0;
		var library_onLoad = function (_) {
			
			loaded++;
			
			if (loaded == total) {
				
				start ();
				
			}
			
		}
		
		
		
		if (loaded == total) {
			
			start ();
			
		}
		
	}
	
	
	public static function main () {
		
		config = {
			
			antialiasing: Std.int (0),
			background: Std.int (3355443),
			borderless: false,
			depthBuffer: false,
			fps: Std.int (60),
			fullscreen: false,
			height: Std.int (800),
			orientation: "",
			resizable: false,
			stencilBuffer: false,
			title: "Ludum Dare 31",
			vsync: false,
			width: Std.int (1000),
			
		}
		
		#if js
		#if munit
		flash.Lib.embed (null, 1000, 800, "333333");
		#end
		#else
		create ();
		#end
		
	}
	
	
	public static function start ():Void {
		
		openfl.Lib.current.stage.align = openfl.display.StageAlign.TOP_LEFT;
		openfl.Lib.current.stage.scaleMode = openfl.display.StageScaleMode.NO_SCALE;
		
		var hasMain = false;
		
		for (methodName in Type.getClassFields (Main)) {
			
			if (methodName == "main") {
				
				hasMain = true;
				break;
				
			}
			
		}
		
		if (hasMain) {
			
			Reflect.callMethod (Main, Reflect.field (Main, "main"), []);
			
		} else {
			
			var instance:DocumentClass = Type.createInstance (DocumentClass, []);
			
			if (Std.is (instance, openfl.display.DisplayObject)) {
				
				openfl.Lib.current.addChild (cast instance);
				
			}
			
		}
		
		openfl.Lib.current.stage.dispatchEvent (new openfl.events.Event (openfl.events.Event.RESIZE, false, false));
		
	}
	
	
	#if neko
	@:noCompletion public static function __init__ () {
		
		var loader = new neko.vm.Loader (untyped $loader);
		loader.addPath (haxe.io.Path.directory (Sys.executablePath ()));
		loader.addPath ("./");
		loader.addPath ("@executable_path/");
		
	}
	#end
	
	
}


#if flash @:build(DocumentClass.buildFlash())
#else @:build(DocumentClass.build()) #end
@:keep class DocumentClass extends Main {}


#else


import haxe.macro.Context;
import haxe.macro.Expr;


class DocumentClass {
	
	
	macro public static function build ():Array<Field> {
		
		var classType = Context.getLocalClass ().get ();
		var searchTypes = classType;
		
		while (searchTypes.superClass != null) {
			
			if (searchTypes.pack.length == 2 && searchTypes.pack[1] == "display" && searchTypes.name == "DisplayObject") {
				
				var fields = Context.getBuildFields ();
				
				var method = macro {
					
					this.stage = flash.Lib.current.stage;
					super ();
					dispatchEvent (new openfl.events.Event (openfl.events.Event.ADDED_TO_STAGE, false, false));
					
				}
				
				fields.push ({ name: "new", access: [ APublic ], kind: FFun({ args: [], expr: method, params: [], ret: macro :Void }), pos: Context.currentPos () });
				
				return fields;
				
			}
			
			searchTypes = searchTypes.superClass.t.get ();
			
		}
		
		return null;
		
	}
	
	
	macro public static function buildFlash ():Array<Field> {
		
		var classType = Context.getLocalClass ().get ();
		var searchTypes = classType;
		
		while (searchTypes.superClass != null) {
			
			if (searchTypes.pack.length == 2 && searchTypes.pack[1] == "display" && searchTypes.name == "DisplayObject") {
				
				var fields = Context.getBuildFields ();
				var method = macro {
					return flash.Lib.current.stage;
				}
				
				fields.push ({ name: "get_stage", access: [ APrivate ], meta: [ { name: ":getter", params: [ macro stage ], pos: Context.currentPos() } ], kind: FFun({ args: [], expr: method, params: [], ret: macro :flash.display.Stage }), pos: Context.currentPos() });
				return fields;
				
			}
			
			searchTypes = searchTypes.superClass.t.get ();
			
		}
		
		return null;
		
	}
	
	
}


#end