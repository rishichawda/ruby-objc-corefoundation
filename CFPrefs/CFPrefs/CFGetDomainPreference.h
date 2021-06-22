//
//  CFGetDomainPreference.h
//  CFPrefs
//
//  Created by Rishi Kumar Chawda on 18/06/21.
//

#import <Foundation/Foundation.h>
#import <CoreFoundation/CoreFoundation.h>
#import <Ruby/ruby.h>
#import "RubyHelpers.h"

NS_ASSUME_NONNULL_BEGIN

@interface CFGetDomainPreference : NSObject
-(RubyData *)GetPreferenceValue:(char *)key
                     domain:(char *) domain
                   username:(char *) username
                   hostname:(char *) hostname
                       type:(char *) type;
@end

NS_ASSUME_NONNULL_END
