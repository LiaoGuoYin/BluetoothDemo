//
//  StudentModel.swift
//  BluetoothiOS
//
//  Created by LiaoGuoYin on 2020/9/9.
//  Copyright © 2020 LiaoGuoYin. All rights reserved.
//

import Foundation

struct StudentForm {
    var id: String
    var name: String
    var mac: String
    var college: College
    var password: String
    var rePassword: String
}

extension StudentForm {
    init() {
        self.init(id: "1710030215", name: "廖国胤", mac: "AS93:C29A", college: .telecommunication, password: "demo", rePassword: "demo")
    }
}

enum College: String, Identifiable, CaseIterable {
    case computer = "计算机学院"
    case business = "工商管理学院"
    case mining = "矿业技术学院"
    case telecommunication = "电子与信息工程学院"
    
    var id: String {self.rawValue}
}