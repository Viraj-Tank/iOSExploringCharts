
import SwiftUI
import Charts

struct AreaChartHorizontalView: View {
    let dailySales: [DailySalesType]
    
    var body: some View {
        Chart {
            ForEach(dailySales) { sale in
                AreaMark(
                    x: .value("Sales", sale.sales),
                    y: .value("Day", sale.day)
                )
            }
        }.padding()
    }
}

struct AreaChartHorizontalView_Previews: PreviewProvider {
    static var previews: some View {
        AreaChartHorizontalView(dailySales: defaultDailySales)
    }
}
