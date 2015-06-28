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

    public func bootstrap(combinedChart chart: CombinedChartView) {
        chart.drawBarShadowEnabled = false
        chart.drawValueAboveBarEnabled = false
        chart.maxVisibleValueCount = 60
        chart.pinchZoomEnabled = false
        chart.drawGridBackgroundEnabled = false
        chart.drawBordersEnabled = false

        chart.descriptionText = ""
        chart.legend.enabled = false

        var xAxis = chart.xAxis
        xAxis.labelPosition = ChartXAxis.XAxisLabelPosition.Bottom
        xAxis.drawGridLinesEnabled = false
        xAxis.drawAxisLineEnabled = false
        xAxis.spaceBetweenLabels = 2

        var rightAxis = chart.rightAxis
        rightAxis.drawGridLinesEnabled = false
        rightAxis.drawAxisLineEnabled = false
        rightAxis.drawLabelsEnabled = false

        var leftAxis = chart.leftAxis
        leftAxis.drawGridLinesEnabled = true
        leftAxis.drawAxisLineEnabled = false
        leftAxis.drawLabelsEnabled = true

        chart.data = self.data.combinedData
    }
}