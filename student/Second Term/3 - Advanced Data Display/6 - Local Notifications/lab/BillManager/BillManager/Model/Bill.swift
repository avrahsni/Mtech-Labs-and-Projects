// BillManager

import Foundation

struct Bill: Codable {
    let id: UUID
    var amount: Double?
    var dueDate: Date?
    var paidDate: Date?
    var payee: String?
    var remindDate: Date?
    var notificationID: String?
    static var notificationCategoryID: String = "Reminder Notificaitons"
//    var updatedBill = self
    
    init(id: UUID = UUID()) {
        self.id = id
    }
}

extension Bill: Hashable {
//    static func ==(_ lhs: Bill, _ rhs: Bill) -> Bool {
//        return lhs.id == rhs.id
//    }
//
//    func hash(into hasher: inout Hasher) {
//        hasher.combine(id)
//    }
    
//    func scheduleReminder() {
//        
//    }
    
    
    
    
    
    
}
