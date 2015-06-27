//
//  ChartView.swift
//  ChartsBootstrap
//
//  Created by Pavel Diatchenko on 27/06/2015.
//  Copyright (c) 2015 Pavel Diatchenko. All rights reserved.
//

import Foundation
import Charts

class ChartDataBootstrap {
    var xValues: [AnyObject] = []

    var xValuesAreDates = false
    var xDateValues: [NSDate]? {
        get {
            return xValuesAreDates ? xValues as? [NSDate] : nil
        }
        set(oValues) {
            if let values = oValues {
                xValues = values as [AnyObject]
            } else {
                xValues = []
            }
            xValuesAreDates = true
        }
    }

    var xStringValues: [String] {
        return xValues.map { x -> String in
            if let printable = x as? Printable {
                return printable.description
            } else {
                return ""
            }
        }
    }

    var yLineValues: [Float] = []
    var yBarValues: [Float] = []

    var combinedData: CombinedChartData {
        var combinedData = CombinedChartData(xVals: xStringValues)

        if yLineValues.count != 0 {
            var lineData = LineChartData()
            var entries: [ChartDataEntry] = []

            for (index, yLineValue) in enumerate(yLineValues) {
                entries.append(ChartDataEntry(value: yLineValue, xIndex: index))
            }

            lineData.addDataSet(LineChartDataSet(yVals: entries, label: ""))
            combinedData.lineData = lineData
        }

        if yBarValues.count != 0 {
            var barData = BarChartData()
            var barEntries: [BarChartDataEntry] = []

            for (index, yLineValue) in enumerate(yLineValues) {
                barEntries.append(BarChartDataEntry(value: yLineValue, xIndex: index))
            }

            barData.addDataSet(BarChartDataSet(yVals: barEntries, label: ""))
            combinedData.barData = barData
        }

        return combinedData
    }
}