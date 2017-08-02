//
//  JFAppInfo.m
//  ObjcUtils
//
//  Created by jumpingfrog0 on 02/08/2017.
//
//
//  Copyright (c) 2017 Jumpingfrog0 LLC
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
//

#import "JFAppInfo.h"

@implementation JFAppInfo

+ (NSString *)appName {
    
    NSString *name = [[[NSBundle mainBundle] infoDictionary] objectForKey:(NSString *)kCFBundleNameKey];
    return name;
}

+ (NSString *)releaseVersion {
    
    // Get version number
    NSString *version = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"];
    return version;
}

+ (NSString *)appScheme {
    
    NSArray *components = [[self bundleIdentifier] componentsSeparatedByString:@"."];
    NSString *lastComponent = [components lastObject];
    
    NSString *scheme = [NSString stringWithFormat:@"%@://", [lastComponent lowercaseString]];
    return scheme;
}

+ (NSString *)debugVersion {
    /* The version number of the bundle.  For Mac OS 9 style version numbers (for example "2.5.3d5"), */
    /* clients can use CFBundleGetVersionNumber() instead of accessing this key directly since that */
    /* function will properly convert the version string into its compact integer representation. */
    NSString *version = [[[NSBundle mainBundle] infoDictionary] objectForKey:(NSString *)kCFBundleVersionKey];
    return version;
}

+ (NSString *)bundleIdentifier {
    /* The bundle identifier (for CFBundleGetBundleWithIdentifier()) */
    NSString *identifier = [[[NSBundle mainBundle] infoDictionary] objectForKey:(NSString *)kCFBundleIdentifierKey];
    return identifier;
}

+ (NSString *)executableName {
    /* The name of the executable in this bundle, if any */
    NSString *name = [[[NSBundle mainBundle] infoDictionary] objectForKey:(NSString *)kCFBundleExecutableKey];
    return name;
}

//* ===================== Standard Info.plist keys ===================== */


// const CFStringRef kCFBundleVersionKey;

// CF_EXPORT
// const CFStringRef kCFBundleDevelopmentRegionKey;
// /* The name of the development language of the bundle. */

// CF_EXPORT
// const CFStringRef kCFBundleNameKey;
// /* The human-readable name of the bundle.  This key is often found in the InfoPlist.strings since it is usually localized. */

// CF_EXPORT
// const CFStringRef kCFBundleLocalizationsKey;
// /* Allows an unbundled application that handles localization itself to specify which localizations it has available. */
@end

