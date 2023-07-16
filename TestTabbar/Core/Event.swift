//
//  Event.swift
//  TestTabbar
//
//  Created by Vitaliy Talalay on 16.07.2023.
//

import Foundation

enum EventPicker: Int, CaseIterable, Codable {
    case active = 1
    case my
    case all
}

// TODO: Удалить свойства place, icon, images
struct Event: Codable, Identifiable {
    var id: String = UUID().uuidString
    var title: String
    var description: String
    var info: String
    var startDate: Date
    var endDate: Date
    var place: String? = nil
    var icon: String? = nil
    var ownerId: String
    var documentId: String? = nil // Uuid Firestore
    var participants: [String]? = []
    var images: [String] = []
    var isVisited: Bool?
    var places: [Place]? = []
    var invitationCode: String?
    var guestsLimit: Double?
//    var style: CardStyles?
    var unreadChatMessage: Int?
    var screensaverImage: String? = nil
    var selectedPhoto: String? = nil
}

extension Event: Equatable {
    static func == (lhs: Event, rhs: Event) -> Bool {
        lhs.id == rhs.id
    }
}

extension Event {
    static func fakeData(id: String = "123456",
                         startDate: String = "10 June 2023"
//                         owner: User = User.emptyUser()
    ) -> Self {
        
        return Event(id: id,
                     title: NSLocalizedString("fake.event.title", comment: ""),
                     description: NSLocalizedString("fake.event.description", comment: ""),
                     info: NSLocalizedString("fake.event.info", comment: ""),
                     startDate: Date(),
                     endDate: Calendar.current.date(byAdding: .day, value: 1, to: Date()) ?? Date(),
                     ownerId: "",
                     places: [
                     Place(city: NSLocalizedString("fake.event.city", comment: ""),
                           address: NSLocalizedString("fake.event.address", comment: ""),
                           latitude: 0,
                           longitude: 0)
                     ],
                     guestsLimit: 100,
//                     style: .main,
                     screensaverImage: "tmp-5"
        )
    }
}

//extension Event {
//    var isMain: Bool {
//        ownerId == AuthManager.shared.userId
//    }
//}

extension Event {
    struct Place: Codable, Identifiable, Equatable {
        var id: String = UUID().uuidString
        var name: String? = nil
        var areaOfInterest: String? = nil
        var country: String?
        var city: String
        var address: String
        var latitude: Double
        var longitude: Double
        
        static func == (lhs: Place, rhs: Place) -> Bool {
            lhs.id == rhs.id
        }
        
        static func emptyPlace(_ city: String = "", _ country: String? = nil) -> Self {
            return Place(country: country, city: city, address: "", latitude: 0, longitude: 0)
        }
    }
}

extension Event {
    func getRelativeTime(startDate: Date, relativeDateFormatter: RelativeDateTimeFormatter) -> String {
        if startDate < Date.now {
            return String(
                NSLocalizedString("event.list.event.status.running", comment: "") +
                relativeDateFormatter.localizedString(for: startDate, relativeTo: .now)
            )
        }
        
        if startDate > Date.now {
            return String(
                NSLocalizedString("event.list.event.status.coming", comment: "") +
                relativeDateFormatter.localizedString(for: startDate, relativeTo: .now)
            )
        }
        return ""
    }
}

