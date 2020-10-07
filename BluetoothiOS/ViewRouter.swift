//
//  ViewRouter.swift
//  BluetoothiOS
//
//  Created by LiaoGuoYin on 2020/9/14.
//  Copyright © 2020 LiaoGuoYin. All rights reserved.
//

import Foundation
import Combine
import SwiftUI
import Alamofire

class ViewRouter: ObservableObject {
    
    @Published var isLogined: Bool = false
    @Published var userType: UserType = UserType.teacher
    
}
