//
//  ChartViewBootstrap.swift
//  ChartsBootstrap
//
//  Created by Pavel Diatchenko on 28/06/2015.
//  Copyright (c) 2015 Pavel Diatchenko. All rights reserved.
//

import Foundation
import Charts

typealias ChartsBootstrap = ChartViewBootstrap

@objc public class ChartViewBootstrap: NSObject {
    public lazy var data = ChartDataBootstrap()

    public func update(combinedChart chart: CombinedChartView) {
        chart.drawBarShadowEnabled = false
        chart.drawValueAboveBarEnabled = false
        chart.maxVisibleValueCount = 60
        chart.pinchZoomEnabled = false
        chart.drawGridBackgroundEnabled = false
        chart.drawBordersEnabled = false

        chart.descriptionText = ""
        chart.legend.enabled = false
        chart.rightAxis.enabled = false;

        var xAxis = chart.xAxis
        xAxis.labelPosition = ChartXAxis.XAxisLabelPosition.Bottom
        xAxis.drawGridLinesEnabled = false
        xAxis.drawAxisLineEnabled = false
        xAxis.spaceBetweenLabels = 0
        xAxis.labelFont = UIFont.preferredFontForTextStyle(UIFontTextStyleFootnote)

        var yAxis = chart.leftAxis
        yAxis.drawGridLinesEnabled = true
        yAxis.drawAxisLineEnabled = false
        yAxis.drawLabelsEnabled = true
        yAxis.startAtZeroEnabled = true
        yAxis.spaceTop = 0.1
        yAxis.gridColor = UIColor(white: 0.851, alpha: 1)
        yAxis.labelFont = UIFont.preferredFontForTextStyle(UIFontTextStyleFootnote)
        yAxis.valueFormatter = NSNumberFormatter()
        yAxis.valueFormatter?.alwaysShowsDecimalSeparator = false

        chart.data = self.data.combinedData
    }
}