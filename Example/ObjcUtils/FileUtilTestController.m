//
//  FileUtilTestController.m
//  ObjcUtils
//
//  Created by sheldon on 02/08/2017.
//  Copyright © 2017 jumpingfrog0. All rights reserved.
//

#import "FileUtilTestController.h"
#import "JFFileUtil.h"

@interface FileUtilTestController ()

@end

@implementation FileUtilTestController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self testSandboxPath];
    [self testBundleResource];
    [self testDocumentResource];
    [self testCacheResource];
    
    NSString *dictPath = [JFFileUtil pathInDocumentForResource:@"dict.plist"];
    if ([JFFileUtil fileExists:dictPath]) {
        NSLog(@"dict.plist exists");
    }
}

- (void)testCacheResource {
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    dict[@"cache"] = @"cache value";
    NSString *dictPath = [JFFileUtil pathInCacheForResource:@"cache.plist"];
    [dict writeToFile:dictPath atomically:YES];
    
    NSURL *readDictURL = [JFFileUtil fileURLInCacheForResource:@"cache.plist"];
    NSDictionary *readDict = [NSDictionary dictionaryWithContentsOfURL: readDictURL];
    NSLog(@"cache.plist : %@", readDict);
    
    NSString *helloFolder = [[JFFileUtil appCacheDirectory] stringByAppendingPathComponent: @"hello"];
    BOOL succeed = [JFFileUtil createDirectory:helloFolder];
    if (succeed) {
        NSURL *directory = [JFFileUtil fileURLInCacheForResource:helloFolder isDirectory:YES];
        NSLog(@"The path of hello folder in Cache: %@", directory);
    }
}

- (void)testDocumentResource {
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    dict[@"key"] = @"value";
    NSString *dictPath = [JFFileUtil pathInDocumentForResource:@"dict.plist"];
    [dict writeToFile:dictPath atomically:YES];
    
    NSURL *readDictURL = [JFFileUtil fileURLInDocumentForResource:@"dict.plist"];
    NSDictionary *readDict = [NSDictionary dictionaryWithContentsOfURL: readDictURL];
    NSLog(@"dict.plist : %@", readDict);
    
    NSString *helloFolder = [[JFFileUtil appDocumentDirectory] stringByAppendingPathComponent: @"hello"];
    BOOL succeed = [JFFileUtil createDirectory:helloFolder];
    if (succeed) {
        NSURL *directory = [JFFileUtil fileURLInDocumentForResource:helloFolder isDirectory:YES];
        NSLog(@"The path of hello folder in Document: %@", directory);
    }
}

- (void)testBundleResource {
    NSString *path1 = [JFFileUtil pathForBundleResource:@"shit.png"];
    NSLog(@"shit image path: %@", path1);
    
    NSString *path2 = [JFFileUtil pathForBundleResource:@"shit" ofType:@".png"];
    NSLog(@"shit image path(Type): %@", path2);
    
    NSURL *url1 = [JFFileUtil fileURLForBundleResource:@"shit.png"];
    NSLog(@"file URL of shit image: %@", url1);
    
    NSURL *url2 = [JFFileUtil fileURLForBundleResource:@"shit" ofType:@".png"];
    NSLog(@"file URL of shit image(Type): %@", url2);
}

- (void)testSandboxPath {
    NSString *homeDirectory = [JFFileUtil appHomeDirectory];
    NSLog(@"homeDirectory: %@", homeDirectory);
    
    NSString *documentDirectory = [JFFileUtil appDocumentDirectory];
    NSLog(@"documentDirectory: %@", documentDirectory);
    
    NSString *libraryDirectory = [JFFileUtil appLibraryDirectory];
    NSLog(@"libraryDirectory: %@", libraryDirectory);
    
    NSString *cacheDirectory = [JFFileUtil appCacheDirectory];
    NSLog(@"cacheDirectory: %@", cacheDirectory);
    
    NSString *tempDirectory = [JFFileUtil appTempDirectory];
    NSLog(@"tempDirectory: %@", tempDirectory);
    
    NSString *bundlePath = [JFFileUtil appBundlePath];
    NSLog(@"bundlePath: %@", bundlePath);
}

@end
