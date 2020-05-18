//
//  TodayDataView.swift
//  SunnyRunnerBlueTooth
//
//  Created by LiaoGuoYin on 2020/5/14.
//  Copyright © 2020 LiaoGuoYin. All rights reserved.
//

import SwiftUI

struct TodayDataView: View {
    @State private var action: Int? = 0
    
    init() {
        UITableViewCell.appearance().backgroundColor = UIColor.clear
        UITableView.appearance().backgroundColor = UIColor.clear
        
        UITableView.appearance().separatorStyle = .none
    }
    
    var body: some View {
        NavigationView {
            List {
                Section(header: Text("实时蓝牙数据")) {
                    VStack(spacing: 8) {
                        HStack {
                            TodayDataCell(name: "时下 HeartBeat", data: "82 BPM", dataConsult: "59 - 96 BPM", currentActivityStatusType: .silence)
                            
                            TodayDataCell(name: "时下 Temperature", data: "28.4 ℃", dataConsult: "36.0 - 37.3 ℃", currentActivityStatusType: .silence)
                        }
                        
                        HStack {
                            TodayDataCell(name: "Step 合计", data: "64 步", dataConsult: "0+ Steps", currentActivityStatusType: .silence)
                            
                            TodayDataCell(name: "Distance 合计", data: "88 米", dataConsult: "0+ Meters", currentActivityStatusType: .silence)
                        }
                        Text("最近一次更新：30s 前")
                            .font(.caption)
                            .padding(6)
                            .shadow(radius: 10)
                    }
                }
                
                Section(header: Text("今日数据")) {
                    DayView(data: DayData(date: "2020.5.18", time: "8:35", distance: 88, step: 64, heartBeat: 83))
                }
            }
            .listStyle(GroupedListStyle())
            .navigationBarTitle(Text("All Data"), displayMode: .automatic)
            .navigationBarItems(
                leading: NavigationLink(destination: RankListView().navigationBarTitle(Text("今日步数排名")), label: {
                    Image(systemName: "person.2.square.stack")
                        .font(.headline)
                        .foregroundColor(Color(.systemRed))
                }),
                trailing: NavigationLink(destination: DaysView()) {
                    Image(systemName: "clock.fill")
                        .font(.headline)
                        .foregroundColor(Color(.systemRed))
                }
                .buttonStyle(BorderlessButtonStyle()))
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct TodayDataView_Previews: PreviewProvider {
    static var previews: some View {
        TodayDataView()
    }
}
