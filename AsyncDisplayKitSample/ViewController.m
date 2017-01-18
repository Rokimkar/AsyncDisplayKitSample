//
//  ViewController.m
//  AsyncDisplayKitSample
//
//  Created by S@nchit on 1/18/17.
//  Copyright © 2017 S@nchit. All rights reserved.
//
#import <AsyncDisplayKit/AsyncDisplayKit.h>
#import "ViewController.h"
#import "TableCell.h"

@interface ViewController () <ASTableDataSource,ASTableDelegate>
@property(strong,nonatomic) ASTableNode *tableNode;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableNode = [[ASTableNode alloc]initWithStyle:UITableViewStylePlain];
    self.tableNode.dataSource = self;
    self.tableNode.delegate = self;
    [self.view addSubnode:self.tableNode];
    [self applyTheme];
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
}

-(void) viewWillLayoutSubviews{
    [super viewWillLayoutSubviews];
    self.tableNode.frame = self.view.bounds;
}

-(void)applyTheme{
    [self.tableNode setBackgroundColor:[UIColor blackColor]];
}

- (NSInteger)tableNode:(ASTableNode *)tableNode numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (ASCellNodeBlock)tableNode:(ASTableView *)tableView nodeBlockForRowAtIndexPath:(NSIndexPath *)indexPath {
    return ^{
        TableCell *cell = [[TableCell alloc]init:@" Dedicate " withDescription:@"Your friend Vikas has just joined Gaana. Dedicate him a song." andImage:[UIImage imageNamed:@"sampleImage"]];
        [cell setBackgroundColor:[UIColor colorWithRed:39/255 green:41/255 blue:49/255 alpha:1.0]];
        return cell;
    };
}

- (ASSizeRange)tableView:(ASTableView *)tableNode
constrainedSizeForRowAtIndexPath:(NSIndexPath *)indexPath {
    CGFloat width = [UIScreen mainScreen].bounds.size.width;
    CGSize min = CGSizeMake(width, 100);
    CGSize max = CGSizeMake(width, INFINITY);
    return ASSizeRangeMake(min, max);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
