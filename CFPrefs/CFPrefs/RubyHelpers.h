//
//  RubyHelpers.h
//  CFPrefs
//
//  Created by Rishi Kumar Chawda on 22/06/21.
//

#import <Foundation/Foundation.h>
#import <CoreFoundation/CoreFoundation.h>
#import <Ruby/ruby.h>
#import "RubyData.h"

NS_ASSUME_NONNULL_BEGIN

@interface RubyHelpers : NSObject
typedef enum PropertyListRefTypes {
    CFNUMBER_TYPE,
    CFDATA_TYPE,
    CFDICTIONARY_TYPE,
    CFARRAY_TYPE,
    CFSTRING_TYPE,
} PropertyType;
+(PropertyType)GetConstantForPropertyType:(CFPropertyListRef)valueRef;
+(const char *)GetRubyArrFromCFArr:(CFArrayRef)valueRef;
+(const char *)GetRubyNumFromCFNum:(CFNumberRef)valueRef;
+(const char *)GetRubyStrFromCFStr:(CFStringRef)valueRef;
+(RubyData *)GetRubyDataFromCFData:(CFPropertyListRef)valueRef;
@end

NS_ASSUME_NONNULL_END
