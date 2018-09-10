//
//  AppDelegate.h
//  Demo_TableView
//
//  Created by TW on 2018/9/10.
//  Copyright © 2018年 TW. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "TableviewController.h"
@interface AppDelegate : NSObject <NSApplicationDelegate>
@property (nonatomic, strong) NSWindowController *mainWindowController;
@property (nonatomic, strong) TableviewController *tableVC;
@end

