//
//  main.m
//  CFPrefs
//
//  Created by Rishi Kumar Chawda on 18/06/21.
//

#import "CFGetDomainPreference.h"

int main(int argc, const char * argv[]) {
    return 0;
}

extern const char * GetPreferencesValue(char * key, char * domain, char * user, char * hostname, char * type){
    @autoreleasepool {
        CFGetDomainPreference *getPref = [[CFGetDomainPreference alloc] init];
        return [getPref GetPreferenceValue:key domain:domain username:user hostname:hostname type:type];
    }
}
