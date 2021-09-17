//
//  Constants.swift
//  FundRanking
//
//  Created by Sattra on 9/14/21.
//

import Foundation

class Messages {
    static let _serviceError = "เกิดข้อผิดพลาด"
    static let _serviceDataNotFound = "ไม่พบข้อมูล"
    static let _connectNetworkForUsing = "กรุณาเชื่อมต่อเครือข่ายเพื่อใช้งาน"
    static let _sessionExpire = "คุณไม่ได้ใช้งานนานเกินไป กรุณาเข้าสู่ระบบใหม่"
}

enum PatternDateFormatter: String {
    case dmy = "dd/MM/yyyy"
    case timestamp = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
    case timestampDisplay = "dd/MM/yyyy HH:mm"
    case fullDateTime = "EEE, d MMM yyyy HH:mm:ss Z"
    case time = "HH:mm"
    case timeWithOutSection = "HH:mm:ss"
    case headerMonth = "MMMM yyyy"
    case fullShortDate = "EEEE d MMMM yyyy"
    case shortDate = "d MMMM yyyy"
    case shortMonthYear = "MMM yy"
}

enum LocaleDateTime {
    static let th = Locale(identifier: "th_TH")
    static let en = Locale(identifier: "en_US_POSIX")
}
