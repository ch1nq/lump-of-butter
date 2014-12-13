#ifndef INCLUDED_Main
#define INCLUDED_Main

#ifndef HXCPP_H
#include <hxcpp.h>
#endif

#include <com/haxepunk/Engine.h>
HX_DECLARE_CLASS0(Main)
HX_DECLARE_CLASS2(com,haxepunk,Engine)
HX_DECLARE_CLASS2(com,haxepunk,RenderMode)
HX_DECLARE_CLASS2(com,haxepunk,Sfx)
HX_DECLARE_CLASS3(openfl,_v2,display,DisplayObject)
HX_DECLARE_CLASS3(openfl,_v2,display,DisplayObjectContainer)
HX_DECLARE_CLASS3(openfl,_v2,display,IBitmapDrawable)
HX_DECLARE_CLASS3(openfl,_v2,display,InteractiveObject)
HX_DECLARE_CLASS3(openfl,_v2,display,Sprite)
HX_DECLARE_CLASS3(openfl,_v2,events,EventDispatcher)
HX_DECLARE_CLASS3(openfl,_v2,events,IEventDispatcher)


class HXCPP_CLASS_ATTRIBUTES  Main_obj : public ::com::haxepunk::Engine_obj{
	public:
		typedef ::com::haxepunk::Engine_obj super;
		typedef Main_obj OBJ_;
		Main_obj();
		Void __construct(Dynamic width,Dynamic height,Dynamic frameRate,Dynamic fixed,::com::haxepunk::RenderMode renderMode);

	public:
		inline void *operator new( size_t inSize, bool inContainer=true)
			{ return hx::Object::operator new(inSize,inContainer); }
		static hx::ObjectPtr< Main_obj > __new(Dynamic width,Dynamic height,Dynamic frameRate,Dynamic fixed,::com::haxepunk::RenderMode renderMode);
		static Dynamic __CreateEmpty();
		static Dynamic __Create(hx::DynamicArray inArgs);
		//~Main_obj();

		HX_DO_RTTI;
		static void __boot();
		static void __register();
		void __Mark(HX_MARK_PARAMS);
		void __Visit(HX_VISIT_PARAMS);
		::String __ToString() const { return HX_CSTRING("Main"); }

		::com::haxepunk::Sfx music;
		virtual Void init( );

		virtual Void update( );

		static Void main( );
		static Dynamic main_dyn();

};


#endif /* INCLUDED_Main */ 
