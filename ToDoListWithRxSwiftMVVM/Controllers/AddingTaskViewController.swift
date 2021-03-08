//
//  AddingTaskViewController.swift
//  ToDoListWithRxSwiftMVVM
//
//  Created by Taylan Bostanci on 6.03.2021.
//

import UIKit
import RxSwift

class AddingTaskViewController: UIViewController {
    
    @IBOutlet weak var prioritySegmentedControl: UISegmentedControl!
    @IBOutlet weak var taskTitleTextField: UITextField!
    private let taskSubject = PublishSubject<Task>()
    var taskObservable: Observable<Task> {
        return taskSubject.asObservable()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func savingTask() {
        guard let priority = Primary(rawValue: self.prioritySegmentedControl.selectedSegmentIndex),
              let title = self.taskTitleTextField.text else {
            return
        }
        let task = Task(title: title, priority: priority)
        taskSubject.onNext(task)   /// Next element to send to observer(s)
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func back(){
        self.dismiss(animated: true, completion: nil)
    }
}

