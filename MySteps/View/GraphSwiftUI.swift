//
//  LineChart.swift
//  MySteps
//
//  Created by Branislav on 29/01/2021.
//

import SwiftUI
import Charts

struct GraphSwiftUI: View {
    var body: some View {
        GeometryReader { p in
            VStack {
                LineChartSwiftUI()
                    //use frame to change the graph size within your SwiftUI view
                    .frame(width: p.size.width, height: p.size.height/5, alignment: .center)
            }
        }
    }
}

struct LineChartSwiftUI: UIViewRepresentable {
    let lineChart = LineChartView()
    
    func makeUIView(context: UIViewRepresentableContext<LineChartSwiftUI>) -> LineChartView {
        setUpChart()
        return lineChart
    }
    
    func updateUIView(_ uiView: LineChartView, context: UIViewRepresentableContext<LineChartSwiftUI>) {
        
    }
    
    func setUpChart() {
        lineChart.noDataText = "No Data Available"
        lineChart.leftAxis.drawLabelsEnabled = false
        lineChart.xAxis.drawGridLinesEnabled = false
        lineChart.leftAxis.drawGridLinesEnabled = false
        lineChart.legend.enabled = false
        lineChart.xAxis.labelPosition = .bottom
        lineChart.xAxis.labelTextColor = .gray
        lineChart.minOffset = 0
        lineChart.xAxis.spaceMin = 2
        lineChart.xAxis.spaceMax = 3
        lineChart.rightAxis.drawAxisLineEnabled = false
        lineChart.leftAxis.drawAxisLineEnabled = false
        lineChart.rightAxis.axisMinimum = 0
        lineChart.rightAxis.labelPosition = .insideChart
        lineChart.rightAxis.yOffset = -10
        lineChart.rightAxis.labelCount = 3
        lineChart.rightAxis.labelAlignment = .right
        lineChart.rightAxis.labelTextColor = .gray
        lineChart.setExtraOffsets(left: 0, top: 10, right: 0, bottom: 10)

        //Using custom overriden XAxisDaysRenderer
        let renderer = XAxisDaysRenderer(viewPortHandler: lineChart.viewPortHandler, axis: lineChart.xAxis, transformer: lineChart.getTransformer(forAxis: .right))
        lineChart.xAxisRenderer = renderer
        lineChart.frame = CGRect(x: 0 , y: 0, width: self.lineChart.frame.width, height: 500) 

        let dataSets = [getLineChartDataSet()]
        lineChart.animate(xAxisDuration: 0.03 * Double(dataSets.first!.count), easingOption: .linear)
        let data = LineChartData(dataSets: dataSets)
        data.setValueFont(.systemFont(ofSize: 7, weight: .light))
        lineChart.data = data
        lineChart.data?.setDrawValues(false)
  
    }
    
    func getChartDataPoints(sessions: [Int], accuracy: [Double]) -> [ChartDataEntry] {
        var dataPoints: [ChartDataEntry] = []
        for count in (0..<sessions.count) {
            dataPoints.append(ChartDataEntry.init(x: Double(sessions[count]), y: accuracy[count]))
        }
        return dataPoints
    }
    
    func getLineChartDataSet() -> LineChartDataSet {
        let dataPoints = getChartDataPoints(sessions: [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30], accuracy: [7000, 8000, 6900,6800,5000,4000,3000,5500,11500,8000,8700,6800,7000,4100,6000,10000,10500,9000,7500,6800,6200,5800,4000,5000,4200,4050,3900,3200,3500, 3800])
        let set = LineChartDataSet(entries: dataPoints, label: "DataSet")
        set.setColors( UIColor.init(red: 34/255, green: 139/255, blue: 221/255, alpha: 1), UIColor.init(red: 164/255, green: 226/255, blue: 95/255, alpha: 1))
        set.isDrawLineWithGradientEnabled = true
        set.gradientPositions = [0, 20000]
//        set.description
        set.lineWidth = 4
        set.circleRadius = 0
        set.circleHoleRadius = 0
        set.mode = .horizontalBezier
        set.axisDependency = .right
        
//        let color = ChartColorTemplates.vordiplom()[0]
//        set.setColor(color)
//        set.setCircleColor(color)
        return set
    }
}

struct GraphSwiftUI_Previews: PreviewProvider {
    static var previews: some View {
        GraphSwiftUI()
    }
}

// Overriding Charts lib XAxisDaysRenderer to manually set days of xAxis to 1 ..30 (default is 0..30)
class XAxisDaysRenderer: XAxisRenderer {
    override func computeAxis(min: Double, max: Double, inverted: Bool) {
        axis.entries = [1, 5, 10, 15, 20, 25, 30]
    }
}
