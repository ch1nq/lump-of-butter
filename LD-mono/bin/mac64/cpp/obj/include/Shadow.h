#ifndef INCLUDED_Shadow
#define INCLUDED_Shadow

#ifndef HXCPP_H
#include <hxcpp.h>
#endif

#include <com/haxepunk/Entity.h>
HX_DECLARE_CLASS0(Shadow)
HX_DECLARE_CLASS2(com,haxepunk,Entity)
HX_DECLARE_CLASS2(com,haxepunk,Graphic)
HX_DECLARE_CLASS2(com,haxepunk,Tweener)
HX_DECLARE_CLASS3(com,haxepunk,graphics,Image)


class HXCPP_CLASS_ATTRIBUTES  Shadow_obj : public ::com::haxepunk::Entity_obj{
	public:
		typedef ::com::haxepunk::Entity_obj super;
		typedef Shadow_obj OBJ_;
		Shadow_obj();
		Void __construct(::com::haxepunk::Entity parent);

	public:
		inline void *operator new( size_t inSize, bool inContainer=true)
			{ return hx::Object::operator new(inSize,inContainer); }
		static hx::ObjectPtr< Shadow_obj > __new(::com::haxepunk::Entity parent);
		static Dynamic __CreateEmpty();
		static Dynamic __Create(hx::DynamicArray inArgs);
		//~Shadow_obj();

		HX_DO_RTTI;
		static void __boot();
		static void __register();
		void __Mark(HX_MARK_PARAMS);
		void __Visit(HX_VISIT_PARAMS);
		::String __ToString() const { return HX_CSTRING("Shadow"); }

		::com::haxepunk::graphics::Image sprite;
		::com::haxepunk::Entity p;
		virtual Void updatePos( Float newX,Float newY);
		Dynamic updatePos_dyn();

		virtual Void update( );

};


#endif /* INCLUDED_Shadow */ 