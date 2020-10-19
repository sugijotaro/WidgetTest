//
//  Bar.swift
//  WidgetTest
//
//  Created by JotaroSugiyama on 2020/10/04.
//

import Charts
import SwiftUI

struct Bar : UIViewRepresentable {
    var entries : [BarChartDataEntry]
    func makeUIView(context: Context) -> BarChartView {
        let chart = BarChartView()
        chart.data = addData()
        return chart
    }
    
    func updateUIView(_ uiView: BarChartView, context: Context) {
        
    }
    
    func addData() -> BarChartData{
        let data = BarChartData()
        let dataSet = BarChartDataSet(entries: entries)
        dataSet.colors = [NSUIColor.green]
        data.addDataSet(dataSet)
        return data
    }
    
    typealias UIViewType = BarChartView
}

struct Bar_Previews: PreviewProvider {
    static var previews: some View {
        Bar(entries: [
            BarChartDataEntry(x: 1,y: 1),
            BarChartDataEntry(x: 2,y: 2),
            BarChartDataEntry(x: 3,y: 3),
            BarChartDataEntry(x: 4,y: 4),
            BarChartDataEntry(x: 5,y: 5)
        ])
    }
}
