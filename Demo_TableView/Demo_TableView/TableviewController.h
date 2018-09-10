//
//  TableviewController.h
//  Demo_TableView
//
//  Created by TW on 2018/9/10.
//  Copyright © 2018年 TW. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface TableviewController : NSViewController <NSTableViewDataSource, NSTabViewDelegate>

-(void)doSomething:(NSArray *)files;
@end
