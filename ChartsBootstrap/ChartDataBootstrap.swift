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

    public var combinedData: CombinedChartData {
        var combinedData = CombinedChartData(xVals: xStringValues)

        if yLineValues.count != 0 {
            var lineData = LineChartData()
            var entries: [ChartDataEntry] = []

            for (index, value) in enumerate(yLineValues) {
                entries.append(ChartDataEntry(value: value, xIndex: index))
            }

            lineData.addDataSet(LineChartDataSet(yVals: entries, label: ""))
            combinedData.lineData = lineData
        }

        if yBarValues.count != 0 {
            var barData = BarChartData()
            var barEntries: [BarChartDataEntry] = []

            for (index, value) in enumerate(yBarValues) {
                barEntries.append(BarChartDataEntry(value: value, xIndex: index))
            }

            barData.addDataSet(BarChartDataSet(yVals: barEntries, label: ""))
            combinedData.barData = barData
        }

        return combinedData
    }
}