//
//  Pie.swift
//  WidgetTest
//
//  Created by JotaroSugiyama on 2020/10/04.
//

import Charts
import SwiftUI

struct Pie : UIViewRepresentable {
    var entries : [PieChartDataEntry]
    func makeUIView(context: Context) -> PieChartView {
        let chart = PieChartView()
        chart.data = addData()
        chart.highlightPerTapEnabled = false
        chart.dragDecelerationEnabled = false
        chart.rotationEnabled = false
        chart.holeColor = UIColor.systemBackground
        chart.transparentCircleRadiusPercent = 0
        return chart
    }
    
    func updateUIView(_ uiView: PieChartView, context: Context) {
        
    }
    
    func addData() -> PieChartData{
        let data = PieChartData()
        let dataSet = PieChartDataSet(entries: entries)
        dataSet.valueTextColor = UIColor.label
        dataSet.entryLabelColor = UIColor.label
        dataSet.valueFormatter = PieChartValueFormatter()
        dataSet.colors = [.green,.blue]
//        dataSet.highlightEnabled = false
//        dataSet.drawIconsEnabled = false
//        dataSet.drawValuesEnabled = false
        data.addDataSet(dataSet)
        return data
    }
    
    typealias UIViewType = PieChartView
}

struct Pie_Previews: PreviewProvider {
    static var previews: some View {
        Pie(entries: [
            PieChartDataEntry(value: 20),
            PieChartDataEntry(value: 15)
        ])
        .environment(\.sizeCategory, .small)
    }
}

public class PieChartValueFormatter: NSObject, IValueFormatter{
    public func stringForValue(_ value: Double, entry: ChartDataEntry, dataSetIndex: Int, viewPortHandler: ViewPortHandler?) -> String{
        return String("\(Int(entry.y))分")
    }
}
