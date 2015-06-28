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

    bootstrap.data.xValues = [self datesFromDay:18 month:2 count:7];
    bootstrap.data.xDateValueFormatter.dateFormat = @"EEE";

    bootstrap.data.yLineValues = @[@22, @26, @21, @38, @28, @31, @25];
    bootstrap.data.yBarValues = @[@3, @7, @13, @5, @13, @18, @17];

    [bootstrap updateWithCombinedChart:self.chartView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSArray *)datesFromDay:(NSInteger)day month:(NSInteger)month count:(NSInteger)count {
    NSMutableArray *dates = [NSMutableArray new];
    for (NSInteger i = 0; i < count; i++) {
        [dates addObject:[self dateForDay:day + i month:month]];
    }
    return dates;
}

- (NSDate *)dateForDay:(NSInteger)day month:(NSInteger)month {
    NSDateComponents *comps = [NSDateComponents new];
    comps.day = day;
    comps.month = month;
    comps.year = 2015;
    return [[NSCalendar currentCalendar] dateFromComponents:comps];
}

@end
