
import SwiftUI
import Charts

struct LineChartVerticalView: View {
    let dailySales: [DailySalesType]
    
    var body: some View {
        Chart {
            ForEach(dailySales) { sale in
                LineMark(
                    x: .value("Day", sale.day),
                    y: .value("Sales", sale.sales)
                )
            }
        }.padding()
    }
}

struct LineChartVerticalView_Previews: PreviewProvider {
    static var previews: some View {
        LineChartVerticalView(dailySales: defaultDailySales)
    }
}
