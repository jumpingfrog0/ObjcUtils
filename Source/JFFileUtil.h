//
//  JFFileUtil.h
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

#import <Foundation/Foundation.h>

@interface JFFileUtil : NSObject
+ (NSString *)appHomeDirectory;
+ (NSString *)appDocumentDirectory;
+ (NSString *)appLibraryDirectory;
+ (NSString *)appCacheDirectory;
+ (NSString *)appTempDirectory;
+ (NSString *)appBundlePath;

+ (NSString *)pathForBundleResource:(NSString *)res ofType:(NSString *)type;
+ (NSString *)pathForBundleResource:(NSString *)res;
+ (NSURL *)fileURLForBundleResource:(NSString *)res ofType:(NSString *)type;
+ (NSURL *)fileURLForBundleResource:(NSString *)res;

+ (NSString *)pathInDocumentForResource:(NSString *)res;
+ (NSURL *)fileURLInDocumentForResource:(NSString *)res;
+ (NSURL *)fileURLInDocumentForResource:(NSString *)res isDirectory:(BOOL)isDirectory;

+ (NSString *)pathInCacheForResource:(NSString *)res;
+ (NSURL *)fileURLInCacheForResource:(NSString *)res;
+ (NSURL *)fileURLInCacheForResource:(NSString *)res isDirectory:(BOOL)isDirectory;

+ (BOOL)createDirectory:(NSString *)directory;

+ (BOOL)fileExists:(NSString *)path;
@end
