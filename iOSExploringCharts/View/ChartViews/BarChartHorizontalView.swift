
import SwiftUI
import Charts

struct BarChartHorizontalView: View {
    
    let dailySales: [DailySalesType]
    
    var body: some View {
        Chart {
            ForEach(dailySales) { sale in
                BarMark(
                    x: .value("Sales", sale.sales),
                    y: .value("Day", sale.day)
                )
                .foregroundStyle(by:.value("Day", sale.day))
            }
        }.padding()
        Chart {
            ForEach(dailySales) { sale in
                BarMark(
                    x: .value("Sales", sale.sales),
                    y: .value("Day", sale.day)
                )
                .foregroundStyle(by:.value("Day", sale.day))
            }
        }.padding()
    }
}

struct BarChartHorizontalView_Previews: PreviewProvider {
    static var previews: some View {
        BarChartHorizontalView(dailySales: defaultDailySales)
    }
}
