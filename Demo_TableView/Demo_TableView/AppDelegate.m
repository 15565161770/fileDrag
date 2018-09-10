//
//  AppDelegate.m
//  Demo_TableView
//
//  Created by TW on 2018/9/10.
//  Copyright © 2018年 TW. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
    NSWindow *tableWindow = [NSWindow windowWithContentViewController:self.tableVC];
    self.mainWindowController = [[NSWindowController alloc]initWithWindow:tableWindow];
    [self.mainWindowController.window center];
    [self.mainWindowController.window makeKeyAndOrderFront:self];
}


-(TableviewController *)tableVC {
    if (!_tableVC) {
        _tableVC = [[TableviewController alloc]init];
    }
    return _tableVC;
}

@end
