//
//  ObjcUtilsTests.m
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

#import <XCTest/XCTest.h>
#import "JFAppInfo.h"
#import "JFFileUtil.h"

@interface ObjcUtilsTests : XCTestCase

@end

@implementation ObjcUtilsTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testJFAppInfo {
    NSString *appName = [JFAppInfo appName];
    XCTAssertEqualObjects(appName, @"ObjcUtils");
    
    NSString *releaseVersion = [JFAppInfo releaseVersion];
    XCTAssertEqualObjects(releaseVersion, @"1.0.0");
    
    NSString *debugVersion = [JFAppInfo debugVersion];
    XCTAssertEqualObjects(debugVersion, @"1");
    
    NSString *bundleIdentifier = [JFAppInfo bundleIdentifier];
    XCTAssertEqualObjects(bundleIdentifier, @"com.jumpingfrog0.ObjcUtils");
    
    NSString *appScheme = [JFAppInfo appScheme];
    XCTAssertEqualObjects(appScheme, @"objcutils://");
    
    NSString *executableName = [JFAppInfo executableName];
    XCTAssertEqualObjects(executableName, @"ObjcUtils");
}

@end
