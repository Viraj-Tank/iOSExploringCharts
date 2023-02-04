
import SwiftUI
import Charts


enum ChartType {
    case bar, line, area
}

struct MoreBarChart: View {
    
    let dailySales: [DailySalesType]
    let min: Double
    let max: Double
    let xAxisMarkPosition: AxisMarkPosition = .bottom
    let yAxisMarkPosition: AxisMarkPosition = .leading
    @State var barColors: [Color] = defaultBarColors
    @State var chartType: ChartType = .area
    @State private var isVerticalChart: Bool = true
    
    var body: some View {
        VStack {
            Text("iOS 16 Charts!")
                .font(.largeTitle)
            
                if(isVerticalChart) {
                    switch(chartType) {
                        case .bar :
                            BarChartVerticalView(dailySales: defaultDailySales, barColors: defaultBarColors)
                            
                        case .line :
                            LineChartVerticalView(dailySales: defaultDailySales)
                            
                        case .area :
                            AreaChartVerticalView(dailySales: defaultDailySales)
                    }
                } else { // horizontal case
                    switch(chartType) {
                        case .bar :
                            BarChartHorizontalView(dailySales: defaultDailySales)
                            
                        case .line :
                            LineChartHorizontalView(dailySales: defaultDailySales)
                            
                        case .area :
                            AreaChartHorizontalView(dailySales: defaultDailySales)
                    }
                }

            
            /* Chart {
                ForEach(dailySales) { // you can use item in here or can also use $0 for the same as below
                    
                    if(isVerticalChart) {
                        switch(chartType) {
                            case .bar :
                                BarMark(
                                    x: .value("Value", $0.sales),
                                    y: .value("Day", $0.day)
                                )
                                .foregroundStyle(by:.value("Day", $0.day))
                                
                            case .line :
                                LineMark(
                                    x: .value("Value", $0.sales),
                                    y: .value("Day", $0.day)
                                )
                                
                            case .area :
                                AreaMark(
                                    x: .value("Value", $0.sales),
                                    y: .value("Day", $0.day)
                                )
                        }
                    } else { // horizontal case
                        switch(chartType) {
                            case .bar :
                                BarMark(
                                    x: .value("Day", $0.day),
                                    y: .value("Value", $0.sales)
                                )
                                .foregroundStyle(by:.value("Day", $0.day))
                                
                            case .line :
                                LineMark(
                                    x: .value("Day", $0.day),
                                    y: .value("Value", $0.sales)
                                )
                                
                            case .area :
                                AreaMark(
                                    x: .value("Day", $0.day),
                                    y: .value("Value", $0.sales)
                                )
                        }
                    }
                }
            }*/
            HStack {
                
                ColorfulButtonView(
                    colors: $barColors,
                    dim: 32,
                    offset: 5,
                    action: {
                        barColors = Color.randomColorsN(n: barColors.count)
                    }
                ).padding()
                
                Button(action: {
                    withAnimation {
                        chartType = .bar
                    }
                }, label: {
                    Text("BAR").padding()
                })
                
                Button(action: {
                    withAnimation {
                        chartType = .line
                    }
                }, label: {
                    Text("LINE").padding()
                })
                
                Button(action: {
                    withAnimation {
                        chartType = .area
                    }
                }, label: {
                    Text("AREA").padding()
                })
                
                Image(systemName: "chart.bar.fill").padding()
                    .foregroundColor(.crimson)
                    .rotationEffect(.degrees(isVerticalChart ? 90 : 0))
                    .onTapGesture {
                        isVerticalChart.toggle()
                    }
            }
            
        }.padding()
    }
}

struct MoreBarChart_Preview: PreviewProvider {
    static var previews: some View {
        MoreBarChart(
            dailySales: defaultDailySales,
            min: 0.0,
            max: 700.0
        )
    }
}


