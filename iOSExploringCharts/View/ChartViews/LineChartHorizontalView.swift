
import SwiftUI
import Charts

struct LineChartHorizontalView: View {
    let dailySales: [DailySalesType]
    
    var body: some View {
        Chart {
            ForEach(dailySales) { sale in
                LineMark(
                    x: .value("Sales", sale.sales),
                    y: .value("Day", sale.day)
                )
            }
        }.padding()
    }
}

struct LineChartHorizontalView_Previews: PreviewProvider {
    static var previews: some View {
        LineChartHorizontalView(dailySales: defaultDailySales)
    }
}
