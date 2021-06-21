//
//  CFGetDomainPreference.m
//  CFPrefs
//
//  Created by Rishi Kumar Chawda on 18/06/21.
//

#import "CFGetDomainPreference.h"

@implementation CFGetDomainPreference
- (const char *)GetPreferenceValue:(char *)key domain:(char *)domain username:(char *)username hostname:(char *)hostname type:(char *)type{
    CFStringRef keyRef = CFStringCreateWithCString(kCFAllocatorDefault, key, kCFStringEncodingUTF8);
    CFStringRef domainRef = CFStringCreateWithCString(kCFAllocatorDefault, domain, kCFStringEncodingUTF8);
    CFPropertyListRef valueRef;
    if([[NSString stringWithUTF8String:type] isEqualToString:@"system"]) {
        CFStringRef usernameRef = CFStringCreateWithCString(kCFAllocatorDefault, username, kCFStringEncodingUTF8);
        CFStringRef hostnameRef = CFStringCreateWithCString(kCFAllocatorDefault, hostname, kCFStringEncodingUTF8);
        valueRef = CFPreferencesCopyValue(keyRef, domainRef, usernameRef, hostnameRef);
    } else {
        valueRef = CFPreferencesCopyAppValue(keyRef, domainRef);
    }
    if(CFNumberGetTypeID() == CFGetTypeID(valueRef)) {
        int num;
        CFNumberGetValue(valueRef, kCFNumberIntType, &num);
        NSString *str = [NSString stringWithFormat:@"%d", num];
        return [str UTF8String];
    } else {
        return CFStringGetCStringPtr(valueRef, kCFStringEncodingUTF8);
    }
}
@end
