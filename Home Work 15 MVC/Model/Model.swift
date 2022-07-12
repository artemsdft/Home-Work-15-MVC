//
//  Model.swift
//  Home Work 15 MVC
//
//  Created by Артем Дербин on 12.07.2022.
//

import Foundation
import UIKit

struct CellModel: Hashable {
    var image: String
    var labelText: String
    var typeSection: Sections
}

enum Sections: Int, CaseIterable {
    case firstSection
    case secondSection
    case thirdSection
    case fourthSection
}

extension CellModel {
    static var firstSection: [CellModel] = [
        CellModel(image: "avatar", labelText: "Артем Дербин", typeSection: .firstSection)
    ]
    static var  secondSections: [CellModel] = [
        CellModel(image: "airPlane", labelText: "Авиарежим", typeSection: .secondSection),
        CellModel(image: "wi-fi", labelText: "WI-FI", typeSection: .secondSection),
        CellModel(image: "bluetooth", labelText: "Bluetooth", typeSection: .secondSection),
        CellModel(image: "cell", labelText: "Сотовая связь", typeSection: .secondSection),
        CellModel(image: "modem", labelText: "Режим модема", typeSection: .secondSection),
        CellModel(image: "vpn", labelText: "VPN", typeSection: .secondSection)
    ]
    static var thirdSection: [CellModel] = [
        CellModel(image: "bell", labelText: "Уведомления", typeSection: .thirdSection),
        CellModel(image: "pod", labelText: "Звуки, тактильные сигналы", typeSection: .thirdSection),
        CellModel(image: "moon", labelText: "Фокусирование", typeSection: .thirdSection),
        CellModel(image: "watch", labelText: "Экранное время", typeSection: .thirdSection)
    ]
    static var fourthSections: [CellModel] = [
        CellModel(image: "setting", labelText: "Основные", typeSection: .fourthSection),
        CellModel(image: "switch", labelText: "Пункт управления", typeSection: .fourthSection),
        CellModel(image: "display", labelText: "Экран и яркость", typeSection: .fourthSection),
        CellModel(image: "displayHome", labelText: "Экран Домой", typeSection: .fourthSection),
        CellModel(image: "universalAccess", labelText: "Универсальный доступ", typeSection: .fourthSection)
    ]
}

