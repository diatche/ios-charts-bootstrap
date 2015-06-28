//
//  ViewController.m
//  ChartsBootstrapDemo
//
//  Created by Pavel Diatchenko on 28/06/2015.
//  Copyright (c) 2015 Pavel Diatchenko. All rights reserved.
//

#import "ViewController.h"

@import Charts;
@import ChartsBootstrap;

@interface ViewController ()

@property (nonatomic, weak) IBOutlet CombinedChartView *chartView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    ChartViewBootstrap *bootstrap = [ChartViewBootstrap new];
    bootstrap.data.xValues = @[@1, @2, @3, @4, @1, @2, @3];
    bootstrap.data.yLineValues = @[@2, @2.5, @2.8, @2.6, @3, @2.7, @2.5];
    bootstrap.data.yBarValues = @[@1, @1.5, @2, @1.5, @1, @1.5, @1.5];

    [bootstrap bootstrapWithCombinedChart:self.chartView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
