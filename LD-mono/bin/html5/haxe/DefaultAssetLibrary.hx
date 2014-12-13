package;


import haxe.Timer;
import haxe.Unserializer;
import lime.app.Preloader;
import lime.audio.openal.AL;
import lime.audio.AudioBuffer;
import lime.graphics.Font;
import lime.graphics.Image;
import lime.utils.ByteArray;
import lime.utils.UInt8Array;
import lime.Assets;

#if sys
import sys.FileSystem;
#end

#if flash
import flash.display.Bitmap;
import flash.display.BitmapData;
import flash.display.Loader;
import flash.events.Event;
import flash.media.Sound;
import flash.net.URLLoader;
import flash.net.URLRequest;
#end


class DefaultAssetLibrary extends AssetLibrary {
	
	
	public var className (default, null) = new Map <String, Dynamic> ();
	public var path (default, null) = new Map <String, String> ();
	public var type (default, null) = new Map <String, AssetType> ();
	
	private var lastModified:Float;
	private var timer:Timer;
	
	
	public function new () {
		
		super ();
		
		#if flash
		
		className.set ("graphics/debug/console_debug.png", __ASSET__graphics_debug_console_debug_png);
		type.set ("graphics/debug/console_debug.png", AssetType.IMAGE);
		className.set ("graphics/debug/console_hidden.png", __ASSET__graphics_debug_console_hidden_png);
		type.set ("graphics/debug/console_hidden.png", AssetType.IMAGE);
		className.set ("graphics/debug/console_logo.png", __ASSET__graphics_debug_console_logo_png);
		type.set ("graphics/debug/console_logo.png", AssetType.IMAGE);
		className.set ("graphics/debug/console_output.png", __ASSET__graphics_debug_console_output_png);
		type.set ("graphics/debug/console_output.png", AssetType.IMAGE);
		className.set ("graphics/debug/console_pause.png", __ASSET__graphics_debug_console_pause_png);
		type.set ("graphics/debug/console_pause.png", AssetType.IMAGE);
		className.set ("graphics/debug/console_play.png", __ASSET__graphics_debug_console_play_png);
		type.set ("graphics/debug/console_play.png", AssetType.IMAGE);
		className.set ("graphics/debug/console_step.png", __ASSET__graphics_debug_console_step_png);
		type.set ("graphics/debug/console_step.png", AssetType.IMAGE);
		className.set ("graphics/debug/console_visible.png", __ASSET__graphics_debug_console_visible_png);
		type.set ("graphics/debug/console_visible.png", AssetType.IMAGE);
		className.set ("graphics/preloader/haxepunk.png", __ASSET__graphics_preloader_haxepunk_png);
		type.set ("graphics/preloader/haxepunk.png", AssetType.IMAGE);
		className.set ("font/04B_03__.ttf", __ASSET__font_04b_03___ttf);
		type.set ("font/04B_03__.ttf", AssetType.FONT);
		className.set ("font/04B_03__.ttf.png", __ASSET__font_04b_03___ttf_png);
		type.set ("font/04B_03__.ttf.png", AssetType.IMAGE);
		className.set ("graphics/Background.png", __ASSET__graphics_background_png);
		type.set ("graphics/Background.png", AssetType.IMAGE);
		className.set ("graphics/ball-gfx.png", __ASSET__graphics_ball_gfx_png);
		type.set ("graphics/ball-gfx.png", AssetType.IMAGE);
		className.set ("graphics/Bar.png", __ASSET__graphics_bar_png);
		type.set ("graphics/Bar.png", AssetType.IMAGE);
		className.set ("graphics/Dog-sheet.png", __ASSET__graphics_dog_sheet_png);
		type.set ("graphics/Dog-sheet.png", AssetType.IMAGE);
		className.set ("graphics/game-gfx-2.png", __ASSET__graphics_game_gfx_2_png);
		type.set ("graphics/game-gfx-2.png", AssetType.IMAGE);
		className.set ("graphics/game-gfx.png", __ASSET__graphics_game_gfx_png);
		type.set ("graphics/game-gfx.png", AssetType.IMAGE);
		className.set ("graphics/GameOver.png", __ASSET__graphics_gameover_png);
		type.set ("graphics/GameOver.png", AssetType.IMAGE);
		className.set ("graphics/GameOverDOG.png", __ASSET__graphics_gameoverdog_png);
		type.set ("graphics/GameOverDOG.png", AssetType.IMAGE);
		className.set ("graphics/GameOverP1.png", __ASSET__graphics_gameoverp1_png);
		type.set ("graphics/GameOverP1.png", AssetType.IMAGE);
		className.set ("graphics/GameOverP2.png", __ASSET__graphics_gameoverp2_png);
		type.set ("graphics/GameOverP2.png", AssetType.IMAGE);
		className.set ("graphics/GameOverSINGLE.png", __ASSET__graphics_gameoversingle_png);
		type.set ("graphics/GameOverSINGLE.png", AssetType.IMAGE);
		className.set ("graphics/shadow.png", __ASSET__graphics_shadow_png);
		type.set ("graphics/shadow.png", AssetType.IMAGE);
		className.set ("graphics/Splash.png", __ASSET__graphics_splash_png);
		type.set ("graphics/Splash.png", AssetType.IMAGE);
		className.set ("graphics/target.png", __ASSET__graphics_target_png);
		type.set ("graphics/target.png", AssetType.IMAGE);
		className.set ("audio/EndGame.ogg", __ASSET__audio_endgame_ogg);
		type.set ("audio/EndGame.ogg", AssetType.SOUND);
		className.set ("audio/huuang.ogg", __ASSET__audio_huuang_ogg);
		type.set ("audio/huuang.ogg", AssetType.SOUND);
		className.set ("audio/Pickup.ogg", __ASSET__audio_pickup_ogg);
		type.set ("audio/Pickup.ogg", AssetType.SOUND);
		className.set ("audio/splat.ogg", __ASSET__audio_splat_ogg);
		type.set ("audio/splat.ogg", AssetType.SOUND);
		className.set ("audio/StartGame.ogg", __ASSET__audio_startgame_ogg);
		type.set ("audio/StartGame.ogg", AssetType.SOUND);
		className.set ("audio/theme.ogg", __ASSET__audio_theme_ogg);
		type.set ("audio/theme.ogg", AssetType.MUSIC);
		className.set ("font/04B_03__.ttf", __ASSET__font_5);
		type.set ("font/04B_03__.ttf", AssetType.FONT);
		
		
		#elseif html5
		
		var id;
		id = "graphics/debug/console_debug.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "graphics/debug/console_hidden.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "graphics/debug/console_logo.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "graphics/debug/console_output.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "graphics/debug/console_pause.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "graphics/debug/console_play.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "graphics/debug/console_step.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "graphics/debug/console_visible.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "graphics/preloader/haxepunk.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "font/04B_03__.ttf";
		className.set (id, __ASSET__font_04b_03___ttf);
		
		type.set (id, AssetType.FONT);
		id = "font/04B_03__.ttf.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "graphics/Background.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "graphics/ball-gfx.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "graphics/Bar.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "graphics/Dog-sheet.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "graphics/game-gfx-2.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "graphics/game-gfx.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "graphics/GameOver.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "graphics/GameOverDOG.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "graphics/GameOverP1.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "graphics/GameOverP2.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "graphics/GameOverSINGLE.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "graphics/shadow.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "graphics/Splash.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "graphics/target.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "audio/EndGame.ogg";
		path.set (id, id);
		
		type.set (id, AssetType.SOUND);
		id = "audio/huuang.ogg";
		path.set (id, id);
		
		type.set (id, AssetType.SOUND);
		id = "audio/Pickup.ogg";
		path.set (id, id);
		
		type.set (id, AssetType.SOUND);
		id = "audio/splat.ogg";
		path.set (id, id);
		
		type.set (id, AssetType.SOUND);
		id = "audio/StartGame.ogg";
		path.set (id, id);
		
		type.set (id, AssetType.SOUND);
		id = "audio/theme.ogg";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		id = "font/04B_03__.ttf";
		className.set (id, __ASSET__font_5);
		
		type.set (id, AssetType.FONT);
		
		
		#else
		
		#if openfl
		
		
		
		
		
		
		
		
		
		
		openfl.text.Font.registerFont (__ASSET__font_04b_03___ttf);
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		openfl.text.Font.registerFont (__ASSET__font_5);
		
		#end
		
		#if (windows || mac || linux)
		
		/*var useManifest = false;
		
		className.set ("graphics/debug/console_debug.png", __ASSET__graphics_debug_console_debug_png);
		type.set ("graphics/debug/console_debug.png", AssetType.IMAGE);
		
		className.set ("graphics/debug/console_hidden.png", __ASSET__graphics_debug_console_hidden_png);
		type.set ("graphics/debug/console_hidden.png", AssetType.IMAGE);
		
		className.set ("graphics/debug/console_logo.png", __ASSET__graphics_debug_console_logo_png);
		type.set ("graphics/debug/console_logo.png", AssetType.IMAGE);
		
		className.set ("graphics/debug/console_output.png", __ASSET__graphics_debug_console_output_png);
		type.set ("graphics/debug/console_output.png", AssetType.IMAGE);
		
		className.set ("graphics/debug/console_pause.png", __ASSET__graphics_debug_console_pause_png);
		type.set ("graphics/debug/console_pause.png", AssetType.IMAGE);
		
		className.set ("graphics/debug/console_play.png", __ASSET__graphics_debug_console_play_png);
		type.set ("graphics/debug/console_play.png", AssetType.IMAGE);
		
		className.set ("graphics/debug/console_step.png", __ASSET__graphics_debug_console_step_png);
		type.set ("graphics/debug/console_step.png", AssetType.IMAGE);
		
		className.set ("graphics/debug/console_visible.png", __ASSET__graphics_debug_console_visible_png);
		type.set ("graphics/debug/console_visible.png", AssetType.IMAGE);
		
		className.set ("graphics/preloader/haxepunk.png", __ASSET__graphics_preloader_haxepunk_png);
		type.set ("graphics/preloader/haxepunk.png", AssetType.IMAGE);
		
		className.set ("font/04B_03__.ttf", __ASSET__font_04b_03___ttf);
		type.set ("font/04B_03__.ttf", AssetType.FONT);
		
		className.set ("font/04B_03__.ttf.png", __ASSET__font_04b_03___ttf_png);
		type.set ("font/04B_03__.ttf.png", AssetType.IMAGE);
		
		className.set ("graphics/Background.png", __ASSET__graphics_background_png);
		type.set ("graphics/Background.png", AssetType.IMAGE);
		
		className.set ("graphics/ball-gfx.png", __ASSET__graphics_ball_gfx_png);
		type.set ("graphics/ball-gfx.png", AssetType.IMAGE);
		
		className.set ("graphics/Bar.png", __ASSET__graphics_bar_png);
		type.set ("graphics/Bar.png", AssetType.IMAGE);
		
		className.set ("graphics/Dog-sheet.png", __ASSET__graphics_dog_sheet_png);
		type.set ("graphics/Dog-sheet.png", AssetType.IMAGE);
		
		className.set ("graphics/game-gfx-2.png", __ASSET__graphics_game_gfx_2_png);
		type.set ("graphics/game-gfx-2.png", AssetType.IMAGE);
		
		className.set ("graphics/game-gfx.png", __ASSET__graphics_game_gfx_png);
		type.set ("graphics/game-gfx.png", AssetType.IMAGE);
		
		className.set ("graphics/GameOver.png", __ASSET__graphics_gameover_png);
		type.set ("graphics/GameOver.png", AssetType.IMAGE);
		
		className.set ("graphics/GameOverDOG.png", __ASSET__graphics_gameoverdog_png);
		type.set ("graphics/GameOverDOG.png", AssetType.IMAGE);
		
		className.set ("graphics/GameOverP1.png", __ASSET__graphics_gameoverp1_png);
		type.set ("graphics/GameOverP1.png", AssetType.IMAGE);
		
		className.set ("graphics/GameOverP2.png", __ASSET__graphics_gameoverp2_png);
		type.set ("graphics/GameOverP2.png", AssetType.IMAGE);
		
		className.set ("graphics/GameOverSINGLE.png", __ASSET__graphics_gameoversingle_png);
		type.set ("graphics/GameOverSINGLE.png", AssetType.IMAGE);
		
		className.set ("graphics/shadow.png", __ASSET__graphics_shadow_png);
		type.set ("graphics/shadow.png", AssetType.IMAGE);
		
		className.set ("graphics/Splash.png", __ASSET__graphics_splash_png);
		type.set ("graphics/Splash.png", AssetType.IMAGE);
		
		className.set ("graphics/target.png", __ASSET__graphics_target_png);
		type.set ("graphics/target.png", AssetType.IMAGE);
		
		className.set ("audio/EndGame.ogg", __ASSET__audio_endgame_ogg);
		type.set ("audio/EndGame.ogg", AssetType.SOUND);
		
		className.set ("audio/huuang.ogg", __ASSET__audio_huuang_ogg);
		type.set ("audio/huuang.ogg", AssetType.SOUND);
		
		className.set ("audio/Pickup.ogg", __ASSET__audio_pickup_ogg);
		type.set ("audio/Pickup.ogg", AssetType.SOUND);
		
		className.set ("audio/splat.ogg", __ASSET__audio_splat_ogg);
		type.set ("audio/splat.ogg", AssetType.SOUND);
		
		className.set ("audio/StartGame.ogg", __ASSET__audio_startgame_ogg);
		type.set ("audio/StartGame.ogg", AssetType.SOUND);
		
		className.set ("audio/theme.ogg", __ASSET__audio_theme_ogg);
		type.set ("audio/theme.ogg", AssetType.MUSIC);
		
		className.set ("font/04B_03__.ttf", __ASSET__font_5);
		type.set ("font/04B_03__.ttf", AssetType.FONT);
		*/
		var useManifest = true;
		
		if (useManifest) {
			
			loadManifest ();
			
			if (Sys.args ().indexOf ("-livereload") > -1) {
				
				var path = FileSystem.fullPath ("manifest");
				lastModified = FileSystem.stat (path).mtime.getTime ();
				
				timer = new Timer (2000);
				timer.run = function () {
					
					var modified = FileSystem.stat (path).mtime.getTime ();
					
					if (modified > lastModified) {
						
						lastModified = modified;
						loadManifest ();
						
						if (eventCallback != null) {
							
							eventCallback (this, "change");
							
						}
						
					}
					
				}
				
			}
			
		}
		
		#else
		
		loadManifest ();
		
		#end
		#end
		
	}
	
	
	public override function exists (id:String, type:String):Bool {
		
		var requestedType = type != null ? cast (type, AssetType) : null;
		var assetType = this.type.get (id);
		
		if (assetType != null) {
			
			if (assetType == requestedType || ((requestedType == SOUND || requestedType == MUSIC) && (assetType == MUSIC || assetType == SOUND))) {
				
				return true;
				
			}
			
			#if flash
			
			if ((assetType == BINARY || assetType == TEXT) && requestedType == BINARY) {
				
				return true;
				
			} else if (path.exists (id)) {
				
				return true;
				
			}
			
			#else
			
			if (requestedType == BINARY || requestedType == null || (assetType == BINARY && requestedType == TEXT)) {
				
				return true;
				
			}
			
			#end
			
		}
		
		return false;
		
	}
	
	
	public override function getAudioBuffer (id:String):AudioBuffer {
		
		#if flash
		
		var buffer = new AudioBuffer ();
		buffer.src = cast (Type.createInstance (className.get (id), []), Sound);
		return buffer;
		
		#elseif js
		
		return null;
		//return new Sound (new URLRequest (path.get (id)));
		
		#else
		
		return AudioBuffer.fromFile (path.get (id));
		//if (className.exists(id)) return cast (Type.createInstance (className.get (id), []), Sound);
		//else return new Sound (new URLRequest (path.get (id)), null, type.get (id) == MUSIC);
		
		#end
		
	}
	
	
	public override function getBytes (id:String):ByteArray {
		
		#if flash
		
		return cast (Type.createInstance (className.get (id), []), ByteArray);
		
		#elseif js
		
		var bytes:ByteArray = null;
		var data = Preloader.loaders.get (path.get (id)).data;
		
		if (Std.is (data, String)) {
			
			bytes = new ByteArray ();
			bytes.writeUTFBytes (data);
			
		} else if (Std.is (data, ByteArray)) {
			
			bytes = cast data;
			
		} else {
			
			bytes = null;
			
		}
		
		if (bytes != null) {
			
			bytes.position = 0;
			return bytes;
			
		} else {
			
			return null;
		}
		
		#else
		
		//return null;
		//if (className.exists(id)) return cast (Type.createInstance (className.get (id), []), ByteArray);
		//else 
		return ByteArray.readFile (path.get (id));
		
		#end
		
	}
	
	
	public override function getFont (id:String):Dynamic /*Font*/ {
		
		// TODO: Complete Lime Font API
		
		#if openfl
		#if (flash || js)
		
		return cast (Type.createInstance (className.get (id), []), openfl.text.Font);
		
		#else
		
		if (className.exists (id)) {
			
			var fontClass = className.get (id);
			openfl.text.Font.registerFont (fontClass);
			return cast (Type.createInstance (fontClass, []), openfl.text.Font);
			
		} else {
			
			return new openfl.text.Font (path.get (id));
			
		}
		
		#end
		#end
		
		return null;
		
	}
	
	
	public override function getImage (id:String):Image {
		
		#if flash
		
		return Image.fromBitmapData (cast (Type.createInstance (className.get (id), []), BitmapData));
		
		#elseif js
		
		return Image.fromImageElement (Preloader.images.get (path.get (id)));
		
		#else
		
		return Image.fromFile (path.get (id));
		
		#end
		
	}
	
	
	/*public override function getMusic (id:String):Dynamic {
		
		#if flash
		
		return cast (Type.createInstance (className.get (id), []), Sound);
		
		#elseif openfl_html5
		
		//var sound = new Sound ();
		//sound.__buffer = true;
		//sound.load (new URLRequest (path.get (id)));
		//return sound;
		return null;
		
		#elseif js
		
		return null;
		//return new Sound (new URLRequest (path.get (id)));
		
		#else
		
		return null;
		//if (className.exists(id)) return cast (Type.createInstance (className.get (id), []), Sound);
		//else return new Sound (new URLRequest (path.get (id)), null, true);
		
		#end
		
	}*/
	
	
	public override function getPath (id:String):String {
		
		//#if ios
		
		//return SystemPath.applicationDirectory + "/assets/" + path.get (id);
		
		//#else
		
		return path.get (id);
		
		//#end
		
	}
	
	
	public override function getText (id:String):String {
		
		#if js
		
		var bytes:ByteArray = null;
		var data = Preloader.loaders.get (path.get (id)).data;
		
		if (Std.is (data, String)) {
			
			return cast data;
			
		} else if (Std.is (data, ByteArray)) {
			
			bytes = cast data;
			
		} else {
			
			bytes = null;
			
		}
		
		if (bytes != null) {
			
			bytes.position = 0;
			return bytes.readUTFBytes (bytes.length);
			
		} else {
			
			return null;
		}
		
		#else
		
		var bytes = getBytes (id);
		
		if (bytes == null) {
			
			return null;
			
		} else {
			
			return bytes.readUTFBytes (bytes.length);
			
		}
		
		#end
		
	}
	
	
	public override function isLocal (id:String, type:String):Bool {
		
		var requestedType = type != null ? cast (type, AssetType) : null;
		
		#if flash
		
		if (requestedType != AssetType.MUSIC && requestedType != AssetType.SOUND) {
			
			return className.exists (id);
			
		}
		
		#end
		
		return true;
		
	}
	
	
	public override function list (type:String):Array<String> {
		
		var requestedType = type != null ? cast (type, AssetType) : null;
		var items = [];
		
		for (id in this.type.keys ()) {
			
			if (requestedType == null || exists (id, type)) {
				
				items.push (id);
				
			}
			
		}
		
		return items;
		
	}
	
	
	public override function loadAudioBuffer (id:String, handler:AudioBuffer -> Void):Void {
		
		#if (flash || js)
		
		//if (path.exists (id)) {
			
		//	var loader = new Loader ();
		//	loader.contentLoaderInfo.addEventListener (Event.COMPLETE, function (event) {
				
		//		handler (cast (event.currentTarget.content, Bitmap).bitmapData);
				
		//	});
		//	loader.load (new URLRequest (path.get (id)));
			
		//} else {
			
			handler (getAudioBuffer (id));
			
		//}
		
		#else
		
		handler (getAudioBuffer (id));
		
		#end
		
	}
	
	
	public override function loadBytes (id:String, handler:ByteArray -> Void):Void {
		
		#if flash
		
		if (path.exists (id)) {
			
			var loader = new URLLoader ();
			loader.addEventListener (Event.COMPLETE, function (event:Event) {
				
				var bytes = new ByteArray ();
				bytes.writeUTFBytes (event.currentTarget.data);
				bytes.position = 0;
				
				handler (bytes);
				
			});
			loader.load (new URLRequest (path.get (id)));
			
		} else {
			
			handler (getBytes (id));
			
		}
		
		#else
		
		handler (getBytes (id));
		
		#end
		
	}
	
	
	public override function loadImage (id:String, handler:Image -> Void):Void {
		
		#if flash
		
		if (path.exists (id)) {
			
			var loader = new Loader ();
			loader.contentLoaderInfo.addEventListener (Event.COMPLETE, function (event:Event) {
				
				var bitmapData = cast (event.currentTarget.content, Bitmap).bitmapData;
				handler (Image.fromBitmapData (bitmapData));
				
			});
			loader.load (new URLRequest (path.get (id)));
			
		} else {
			
			handler (getImage (id));
			
		}
		
		#else
		
		handler (getImage (id));
		
		#end
		
	}
	
	
	#if (!flash && !html5)
	private function loadManifest ():Void {
		
		try {
			
			#if blackberry
			var bytes = ByteArray.readFile ("app/native/manifest");
			#elseif tizen
			var bytes = ByteArray.readFile ("../res/manifest");
			#elseif emscripten
			var bytes = ByteArray.readFile ("assets/manifest");
			#else
			var bytes = ByteArray.readFile ("manifest");
			#end
			
			if (bytes != null) {
				
				bytes.position = 0;
				
				if (bytes.length > 0) {
					
					var data = bytes.readUTFBytes (bytes.length);
					
					if (data != null && data.length > 0) {
						
						var manifest:Array<Dynamic> = Unserializer.run (data);
						
						for (asset in manifest) {
							
							if (!className.exists (asset.id)) {
								
								path.set (asset.id, asset.path);
								type.set (asset.id, cast (asset.type, AssetType));
								
							}
							
						}
						
					}
					
				}
				
			} else {
				
				trace ("Warning: Could not load asset manifest (bytes was null)");
				
			}
		
		} catch (e:Dynamic) {
			
			trace ('Warning: Could not load asset manifest (${e})');
			
		}
		
	}
	#end
	
	
	/*public override function loadMusic (id:String, handler:Dynamic -> Void):Void {
		
		#if (flash || js)
		
		//if (path.exists (id)) {
			
		//	var loader = new Loader ();
		//	loader.contentLoaderInfo.addEventListener (Event.COMPLETE, function (event) {
				
		//		handler (cast (event.currentTarget.content, Bitmap).bitmapData);
				
		//	});
		//	loader.load (new URLRequest (path.get (id)));
			
		//} else {
			
			handler (getMusic (id));
			
		//}
		
		#else
		
		handler (getMusic (id));
		
		#end
		
	}*/
	
	
	public override function loadText (id:String, handler:String -> Void):Void {
		
		//#if js
		
		/*if (path.exists (id)) {
			
			var loader = new URLLoader ();
			loader.addEventListener (Event.COMPLETE, function (event:Event) {
				
				handler (event.currentTarget.data);
				
			});
			loader.load (new URLRequest (path.get (id)));
			
		} else {
			
			handler (getText (id));
			
		}*/
		
		//#else
		
		var callback = function (bytes:ByteArray):Void {
			
			if (bytes == null) {
				
				handler (null);
				
			} else {
				
				handler (bytes.readUTFBytes (bytes.length));
				
			}
			
		}
		
		loadBytes (id, callback);
		
		//#end
		
	}
	
	
}


#if !display
#if flash

@:keep @:bind #if display private #end class __ASSET__graphics_debug_console_debug_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__graphics_debug_console_hidden_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__graphics_debug_console_logo_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__graphics_debug_console_output_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__graphics_debug_console_pause_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__graphics_debug_console_play_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__graphics_debug_console_step_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__graphics_debug_console_visible_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__graphics_preloader_haxepunk_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__font_04b_03___ttf extends null { }
@:keep @:bind #if display private #end class __ASSET__font_04b_03___ttf_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__graphics_background_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__graphics_ball_gfx_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__graphics_bar_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__graphics_dog_sheet_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__graphics_game_gfx_2_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__graphics_game_gfx_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__graphics_gameover_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__graphics_gameoverdog_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__graphics_gameoverp1_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__graphics_gameoverp2_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__graphics_gameoversingle_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__graphics_shadow_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__graphics_splash_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__graphics_target_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__audio_endgame_ogg extends null { }
@:keep @:bind #if display private #end class __ASSET__audio_huuang_ogg extends null { }
@:keep @:bind #if display private #end class __ASSET__audio_pickup_ogg extends null { }
@:keep @:bind #if display private #end class __ASSET__audio_splat_ogg extends null { }
@:keep @:bind #if display private #end class __ASSET__audio_startgame_ogg extends null { }
@:keep @:bind #if display private #end class __ASSET__audio_theme_ogg extends null { }
@:keep @:bind #if display private #end class __ASSET__font_5 extends null { }


#elseif html5

#if openfl









@:keep #if display private #end class __ASSET__font_04b_03___ttf extends openfl.text.Font { public function new () { super (); fontName = "font/04B_03__.ttf"; } } 





















@:keep #if display private #end class __ASSET__font_5 extends openfl.text.Font { public function new () { super (); fontName = "font/04B_03__.ttf"; } } 

#end

#else

#if openfl
class __ASSET__font_04b_03___ttf extends openfl.text.Font { public function new () { super (); __fontPath = "font/04B_03__"; fontName = "04b03"; }}
class __ASSET__font_5 extends openfl.text.Font { public function new () { super (); __fontPath = "font/04B_03__"; fontName = "04b03"; }}

#end

#if (windows || mac || linux)

//
//@:bitmap("/usr/lib/haxe/lib/HaxePunk/2,5,3/assets/graphics/debug/console_debug.png") class __ASSET__graphics_debug_console_debug_png extends openfl.display.BitmapData {}
//@:bitmap("/usr/lib/haxe/lib/HaxePunk/2,5,3/assets/graphics/debug/console_hidden.png") class __ASSET__graphics_debug_console_hidden_png extends openfl.display.BitmapData {}
//@:bitmap("/usr/lib/haxe/lib/HaxePunk/2,5,3/assets/graphics/debug/console_logo.png") class __ASSET__graphics_debug_console_logo_png extends openfl.display.BitmapData {}
//@:bitmap("/usr/lib/haxe/lib/HaxePunk/2,5,3/assets/graphics/debug/console_output.png") class __ASSET__graphics_debug_console_output_png extends openfl.display.BitmapData {}
//@:bitmap("/usr/lib/haxe/lib/HaxePunk/2,5,3/assets/graphics/debug/console_pause.png") class __ASSET__graphics_debug_console_pause_png extends openfl.display.BitmapData {}
//@:bitmap("/usr/lib/haxe/lib/HaxePunk/2,5,3/assets/graphics/debug/console_play.png") class __ASSET__graphics_debug_console_play_png extends openfl.display.BitmapData {}
//@:bitmap("/usr/lib/haxe/lib/HaxePunk/2,5,3/assets/graphics/debug/console_step.png") class __ASSET__graphics_debug_console_step_png extends openfl.display.BitmapData {}
//@:bitmap("/usr/lib/haxe/lib/HaxePunk/2,5,3/assets/graphics/debug/console_visible.png") class __ASSET__graphics_debug_console_visible_png extends openfl.display.BitmapData {}
//@:bitmap("/usr/lib/haxe/lib/HaxePunk/2,5,3/assets/graphics/preloader/haxepunk.png") class __ASSET__graphics_preloader_haxepunk_png extends openfl.display.BitmapData {}
//@:font("/usr/lib/haxe/lib/HaxePunk/2,5,3/assets/font/04B_03__.ttf") class __ASSET__font_04b_03___ttf extends openfl.text.Font {}
//@:bitmap("/usr/lib/haxe/lib/HaxePunk/2,5,3/assets/font/04B_03__.ttf.png") class __ASSET__font_04b_03___ttf_png extends openfl.display.BitmapData {}
//@:bitmap("assets/graphics/Background.png") class __ASSET__graphics_background_png extends openfl.display.BitmapData {}
//@:bitmap("assets/graphics/ball-gfx.png") class __ASSET__graphics_ball_gfx_png extends openfl.display.BitmapData {}
//@:bitmap("assets/graphics/Bar.png") class __ASSET__graphics_bar_png extends openfl.display.BitmapData {}
//@:bitmap("assets/graphics/Dog-sheet.png") class __ASSET__graphics_dog_sheet_png extends openfl.display.BitmapData {}
//@:bitmap("assets/graphics/game-gfx-2.png") class __ASSET__graphics_game_gfx_2_png extends openfl.display.BitmapData {}
//@:bitmap("assets/graphics/game-gfx.png") class __ASSET__graphics_game_gfx_png extends openfl.display.BitmapData {}
//@:bitmap("assets/graphics/GameOver.png") class __ASSET__graphics_gameover_png extends openfl.display.BitmapData {}
//@:bitmap("assets/graphics/GameOverDOG.png") class __ASSET__graphics_gameoverdog_png extends openfl.display.BitmapData {}
//@:bitmap("assets/graphics/GameOverP1.png") class __ASSET__graphics_gameoverp1_png extends openfl.display.BitmapData {}
//@:bitmap("assets/graphics/GameOverP2.png") class __ASSET__graphics_gameoverp2_png extends openfl.display.BitmapData {}
//@:bitmap("assets/graphics/GameOverSINGLE.png") class __ASSET__graphics_gameoversingle_png extends openfl.display.BitmapData {}
//@:bitmap("assets/graphics/shadow.png") class __ASSET__graphics_shadow_png extends openfl.display.BitmapData {}
//@:bitmap("assets/graphics/Splash.png") class __ASSET__graphics_splash_png extends openfl.display.BitmapData {}
//@:bitmap("assets/graphics/target.png") class __ASSET__graphics_target_png extends openfl.display.BitmapData {}
//@:sound("assets/audio/EndGame.ogg") class __ASSET__audio_endgame_ogg extends openfl.media.Sound {}
//@:sound("assets/audio/huuang.ogg") class __ASSET__audio_huuang_ogg extends openfl.media.Sound {}
//@:sound("assets/audio/Pickup.ogg") class __ASSET__audio_pickup_ogg extends openfl.media.Sound {}
//@:sound("assets/audio/splat.ogg") class __ASSET__audio_splat_ogg extends openfl.media.Sound {}
//@:sound("assets/audio/StartGame.ogg") class __ASSET__audio_startgame_ogg extends openfl.media.Sound {}
//@:sound("assets/audio/theme.ogg") class __ASSET__audio_theme_ogg extends openfl.media.Sound {}
//@:font("assets/font/04B_03__.ttf") class __ASSET__font_5 extends openfl.text.Font {}
//
//

#end

#end
#end

