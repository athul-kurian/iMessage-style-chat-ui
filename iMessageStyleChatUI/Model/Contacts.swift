//
//  Contacts.swift
//  iMessageStyleChatUI
//
//  Created by Athul Kurian on 7/11/24.
//

import Foundation

struct PhoneBook {
    private(set) var contactList: [Contact]
    
    mutating func addContact(firstName: String?, middleName: String?, lastName: String?, number: String?, photo: String?) -> Bool {
        if firstName == nil && lastName == nil && number == nil {
            print("Cannot add contact wihtout a first name, last name or number.")
            return false
        }
        
        let contact = Contact(
                        firstName: firstName,
                        middleName: middleName,
                        lastName: lastName,
                        number: number,
                        photo: photo
                    )

        contactList.append(contact)
        return true
    }
    
    struct Contact: Identifiable {
        let id: UUID = UUID()
        let firstName: String?
        let middleName: String?
        let lastName: String?
        let number: String?
        let photo: String?
        let dateCreated: Date = Date()
    }
}

