//
//  RubyHelpers.m
//  CFPrefs
//
//  Created by Rishi Kumar Chawda on 22/06/21.
//

#import "RubyHelpers.h"

@implementation RubyHelpers
// Return integer constant after comparison.
// NOTE: This is not needed. Just replace switch case with if else.
+ (PropertyType)GetConstantForPropertyType:(CFPropertyListRef)valueRef{
    CFTypeID typeID = CFGetTypeID(valueRef);
    if(typeID == CFNumberGetTypeID()){
        return CFNUMBER_TYPE;
    } else if(typeID == CFDataGetTypeID()) {
        return CFDATA_TYPE;
    } else if(typeID == CFArrayGetTypeID()) {
        return CFARRAY_TYPE;
    } else if(typeID == CFDictionaryGetTypeID()){
        return CFDICTIONARY_TYPE;
    } else if(typeID == CFStringGetTypeID()) {
        return CFSTRING_TYPE;
    } else {
        return 10;
    }
}
+ (const char *)GetRubyArrFromCFArr:(CFArrayRef)valueRef{
    VALUE rubyArray = rb_ary_new();
    for (int i=0; i < CFArrayGetCount(valueRef); i++) {
        RubyData *rbvalue = [RubyHelpers GetRubyDataFromCFData:CFArrayGetValueAtIndex(valueRef, (long)i)];
        rb_ary_push(rubyArray, RSTRING(rbvalue.value));
    }
    return RSTRING_PTR(rb_inspect(rubyArray));
}
+ (const char *)GetRubyStrFromCFStr:(CFStringRef)valueRef{
    const char * cstring = CFStringGetCStringPtr(valueRef, kCFStringEncodingUTF8);
//    VALUE rubyArray = rb_ary_new();
//    rb_ary_push(rubyArray, *cstring);
    return cstring;
}
+ (const char *)GetRubyNumFromCFNum:(CFNumberRef)valueRef{
    int num;
    CFNumberGetValue(valueRef, kCFNumberIntType, &num);
    NSString *str = [NSString stringWithFormat:@"%d", num];
    return [str UTF8String];
//    VALUE rubyArray = rb_ary_new();
//    rb_ary_push(rubyArray, *[str UTF8String]);
//    return &rubyArray;
}
+ (RubyData *)GetRubyDataFromCFData:(CFPropertyListRef)valueRef{
    PropertyType valueType = [RubyHelpers GetConstantForPropertyType:valueRef];
    RubyData *result = [[RubyData alloc] init];
    switch (valueType) {
        case CFNUMBER_TYPE: {
            [result setDataType:"num"];
            [result setValue:[RubyHelpers GetRubyNumFromCFNum:valueRef]];
            break;
        }
        case CFSTRING_TYPE: {
            [result setDataType:"str"];
            [result setValue:[RubyHelpers GetRubyStrFromCFStr:valueRef]];
            break;
        }
        case CFARRAY_TYPE: {
            [result setDataType:"arr"];
            [result setValue:[RubyHelpers GetRubyArrFromCFArr:valueRef]];
            break;
        }
        default: {
            [result setDataType:"err"];
            [result setValue:"Unrecognized data type"];
            break;
        }
    }
    return result;
}
@end
