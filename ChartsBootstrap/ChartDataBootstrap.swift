//
//  ChartDataBootstrap.swift
//  ChartsBootstrap
//
//  Created by Pavel Diatchenko on 27/06/2015.
//  Copyright (c) 2015 Pavel Diatchenko. All rights reserved.
//

import Foundation
import Charts

@objc public class ChartDataBootstrap: NSObject {
    public var xValues: [AnyObject] = []

    public var xStringValues: [String] {
        return xValues.map { x -> String in
            if let printable = x as? Printable {
                return printable.description
            } else {
                return ""
            }
        }
    }

    public var yLineValues: [Float] = []
    public var yBarValues: [Float] = []

    public var colors = [
        UIColor(red: 0.282, green: 0.631, blue: 0.867, alpha: 1.00),
        UIColor(red: 0.180, green: 0.773, blue: 0.667, alpha: 1.00)
    ]

    public var combinedData: CombinedChartData {
        var combinedData = CombinedChartData(xVals: xStringValues)

        if yLineValues.count != 0 {
            var lineData = LineChartData()
            var entries: [ChartDataEntry] = []

            for (index, value) in enumerate(yLineValues) {
                entries.append(ChartDataEntry(value: value, xIndex: index))
            }

            var dataSet = LineChartDataSet(yVals: entries, label: "")
            dataSet.drawValuesEnabled = false
            dataSet.colors = [colors[0]]
            dataSet.lineWidth = 1.5
            dataSet.circleColors = dataSet.colors
            dataSet.circleRadius = 5
            dataSet.drawCircleHoleEnabled = false

            lineData.addDataSet(dataSet)
            combinedData.lineData = lineData
        }

        if yBarValues.count != 0 {
            var barData = BarChartData()
            var barEntries: [BarChartDataEntry] = []

            for (index, value) in enumerate(yBarValues) {
                barEntries.append(BarChartDataEntry(value: value, xIndex: index))
            }

            var dataSet = BarChartDataSet(yVals: barEntries, label: "")
            dataSet.drawValuesEnabled = false
            dataSet.barSpace = 0.45
            dataSet.colors = [colors[1]]

            barData.addDataSet(dataSet)
            combinedData.barData = barData
        }

        return combinedData
    }
}