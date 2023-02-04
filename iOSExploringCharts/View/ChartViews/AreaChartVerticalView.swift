
import SwiftUI
import Charts

struct AreaChartVerticalView: View {
    
    let dailySales: [DailySalesType]
    
    var body: some View {
        Chart {
            ForEach(dailySales) {
                AreaMark(
                    x: .value("Day", $0.day),
                    y: .value("Sales", $0.sales)
                )
            }
        }.padding()
    }
}

struct AreaChartVerticalView_Previews: PreviewProvider {
    static var previews: some View {
        AreaChartVerticalView(dailySales: defaultDailySales)
    }
}
