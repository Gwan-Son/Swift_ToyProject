//
//  ReminderListViewController+Actions.swift
//  Reminder
//
//  Created by 심관혁 on 3/13/24.
//

import UIKit

extension ReminderListViewController {
    @objc func didPressDoneButton(_ sender: ReminderDoneButton) {
        guard let id = sender.id else { return }
        completeReminder(withId: id)
        updateSnapshot()
    }
}
