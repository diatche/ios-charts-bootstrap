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

    ChartDataBootstrap *dataBootstrap = [ChartDataBootstrap new];
    dataBootstrap.xValues = @[@1, @2, @3, @4];
    dataBootstrap.yLineValues = @[@3, @2, @3, @4];
    dataBootstrap.yBarValues = @[@1, @1.5, @4, @3];

    self.chartView.data = dataBootstrap.combinedData;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
