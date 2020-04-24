//
//  BLEScanView.swift
//  BluetoothPunchCard
//
//  Created by LiaoGuoYin on 2020/4/16.
//  Copyright © 2020 LiaoGuoYin. All rights reserved.
//

import SwiftUI
import CoreBluetooth

struct BLEScanView: View {
    @ObservedObject var bleConnection = BLEConnection()
    
    var body: some View {
        
        VStack {
            BLEScannerView()
                .frame(maxHeight: UIScreen.main.bounds.height / 2)
                .navigationBarTitle("BLE Devices")
            
            Section(header: Text("扫描到附近 \(bleConnection.scannedBLEDevices.count) 个蓝牙设备")) {
                List(bleConnection.scannedBLEDevices, id: \.self) { device in
                    ImageAndTextView(imageName: "dot.radiowaves.right", textName: "\(device.name ?? "unknown")")
                }
//                .listStyle(GroupedListStyle())
            }
        }
        .padding()
    }
}
//
//struct BLEScanView_Previews: PreviewProvider {
//    static var previews: some View {
//        BLEScanView()
//    }
//}
