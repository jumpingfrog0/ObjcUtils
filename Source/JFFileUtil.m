//
//  JFFileUtil.m
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

#import "JFFileUtil.h"

@implementation JFFileUtil

+ (NSString *)appHomeDirectory {
    return NSHomeDirectory();
}

+ (NSString *)appDocumentDirectory {
    return [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
}

+ (NSString *)appLibraryDirectory {
    return [NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES) objectAtIndex:0];
}

+ (NSString *)appCacheDirectory {
    return [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) objectAtIndex:0];
}

+ (NSString *)appTempDirectory {
    return NSTemporaryDirectory();
}

+ (NSString *)appBundlePath {
    return [[NSBundle mainBundle] bundlePath];
}

+ (NSString *)appResourcePath {
    return [[NSBundle mainBundle] resourcePath];
}

+ (NSString *)pathForBundleResource:(NSString *)res ofType:(NSString *)type{
    return [[NSBundle mainBundle] pathForResource:res ofType:type];
}

+ (NSString *)pathForBundleResource:(NSString *)res {
    return [[self appResourcePath] stringByAppendingPathComponent:res];
}

+ (NSURL *)fileURLForBundleResource:(NSString *)res ofType:(NSString *)type {
    return [NSURL fileURLWithPath:[self pathForBundleResource:res ofType:type] isDirectory:NO];
}

+ (NSURL *)fileURLForBundleResource:(NSString *)res {
    return [NSURL fileURLWithPath:[self pathForBundleResource:res] isDirectory:NO];
}

+ (NSString *)pathInDocumentForResource:(NSString *)res {
    return [[self appDocumentDirectory] stringByAppendingPathComponent:res];
}

+ (NSURL *)fileURLInDocumentForResource:(NSString *)res {
    return [NSURL fileURLWithPath:[self pathInDocumentForResource:res]];
}

+ (NSURL *)fileURLInDocumentForResource:(NSString *)res isDirectory:(BOOL)isDirectory {
    return [NSURL fileURLWithPath:[self pathInDocumentForResource:res] isDirectory:isDirectory];
}

+ (NSString *)pathInCacheForResource:(NSString *)res {
    return [[self appCacheDirectory] stringByAppendingPathComponent:res];
}

+ (NSURL *)fileURLInCacheForResource:(NSString *)res {
    return [NSURL fileURLWithPath:[self pathInCacheForResource:res]];
}

+ (NSURL *)fileURLInCacheForResource:(NSString *)res isDirectory:(BOOL)isDirectory {
    return [NSURL fileURLWithPath:[self pathInCacheForResource:res] isDirectory:isDirectory];
}

+ (BOOL)createDirectory:(NSString *)directory {
    // Check if the directory already exists
    if (![[NSFileManager defaultManager] fileExistsAtPath:directory]) {
        
        // Directory does not exist so create it
        NSLog(@"Create directory successfully: %@", directory);
        
        NSError* error = nil;
        BOOL result = [[NSFileManager defaultManager] createDirectoryAtPath:directory withIntermediateDirectories:YES attributes:nil error:&error];
        if (result == NO){
            NSLog(@"Create directory (%@) failed, error: (%@)", directory, [error description]);
        }
        
        return result;
    }
    else{
        return YES;
    }
}

+ (BOOL)fileExists:(NSString *)path {
    return [[NSFileManager defaultManager] fileExistsAtPath:path];
}

@end
