//
//  TableviewController.m
//  Demo_TableView
//
//  Created by TW on 2018/9/10.
//  Copyright © 2018年 TW. All rights reserved.
//

#import "TableviewController.h"
#import "TableViewDropper.h"
#import "File.h"
#define kMessageTableviewWidth 730

@interface TableviewController ()

@property (nonatomic) TableViewDropper *tableview;
@property (nonatomic) NSScrollView *tableviewScrollView;
@property (nonatomic,strong) NSMutableArray *fileListArray;
@end

@implementation TableviewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do view setup here.
    
    [self addTabelview];
}

-(void)doSomething:(NSArray *)files {
    NSLog(@"do something called");
    for (id file in files) {
        NSLog(@" the file is : %@",file);
        
        File *f = [[File alloc] init];
        [f createFromFilePathString:file];
        
        [self.fileListArray addObject:f];
        [self.tableview reloadData];
    }
}

#pragma mark -- tableView
- (void)addTabelview {
    self.tableviewScrollView = [[NSScrollView alloc]initWithFrame:CGRectMake(0,0, kMessageTableviewWidth, 482)];
    [self.tableviewScrollView setHasVerticalScroller:YES];
    // 创建tableview
    
    self.tableview = [[TableViewDropper alloc]initWithFrame:CGRectMake(0, 0, kMessageTableviewWidth - 3, 482)];
    [self.tableview setAutoresizesSubviews:YES];
    [self.tableview setFocusRingType:NSFocusRingTypeDefault];
    self.tableview.headerView = nil;
    //  创建单元格 这里单元格设置为1个
    NSTableColumn *column1 = [[NSTableColumn alloc]initWithIdentifier:@"name"];
    column1.title = @"";
    column1.width = kMessageTableviewWidth - 3;
    [self.tableview addTableColumn:column1];
    
    self.tableview.delegate = self;
    self.tableview.dataSource = self;
    
    [self.tableviewScrollView setDocumentView:self.tableview];
    [self.view addSubview:self.tableviewScrollView];
}

#pragma mark -- delegate
- (NSInteger)numberOfRowsInTableView:(NSTableView *)tableView{
    if (self.fileListArray.count > 0) {
        return self.fileListArray.count;
    }
    return 0;
}

// 设置某个元素的具体视图
-(NSView *)tableView:(NSTableView *)tableView viewForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row{
    
    File *p = [self.fileListArray objectAtIndex:row];
    NSString *identifier = [tableColumn identifier];
    
    return [p valueForKey:identifier];
}

-(NSMutableArray *)fileListArray {
    if (!_fileListArray) {
        _fileListArray = [NSMutableArray array];
    }
    return _fileListArray;
}
@end
