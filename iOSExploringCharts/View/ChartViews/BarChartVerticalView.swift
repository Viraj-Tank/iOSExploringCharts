
import SwiftUI
import Charts

struct BarChartVerticalView: View {
    let dailySales: [DailySalesType]
    let barColors: [Color]
    
    var body: some View {
        Chart {
            ForEach(dailySales) { sale in
                BarMark(
                    x: .value("Day", sale.day),
                    y: .value("Sales", sale.sales)
                )
            }
        }.padding()
            .chartForegroundStyleScale(range:barColors)
    }
}

struct BarChartVerticalView_Previews: PreviewProvider {
    static var previews: some View {
        BarChartVerticalView(dailySales: defaultDailySales, barColors: defaultBarColors)
    }
}
