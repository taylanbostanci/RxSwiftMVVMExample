//
//  TaskViewController.swift
//  ToDoListWithRxSwiftMVVM
//
//  Created by Taylan Bostanci on 6.03.2021.
//

import Foundation
import UIKit
import RxSwift
import RxCocoa

class TaskViewController:  UIViewController {
    
    @IBOutlet weak var segmentControl: UISegmentedControl!
    @IBOutlet weak var taskTV: UITableView!
    private var tasks = BehaviorRelay<[Task]>(value: [])
    private var filteredTasks = [Task]()
    let disposeBag = DisposeBag()
    
    @IBAction func priorityValueChanged(segmentedControl: UISegmentedControl) {
        let primary = Primary(rawValue: segmentedControl.selectedSegmentIndex - 1)
        filterTasks(by: primary)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let navC = segue.destination as? UINavigationController,
              let addTaskVC = navC.viewControllers.first as? AddingTaskViewController else { return }
        addTaskVC.taskObservable
            .subscribe(onNext: { [unowned self] task in
                
                let primary = Primary(rawValue: self.segmentControl.selectedSegmentIndex - 1)
                print(task)
                
                var existingTasks = self.tasks.value
                existingTasks.append(task)
                self.tasks.accept(existingTasks)
                self.filterTasks(by: primary)
            }).disposed(by: disposeBag)
    }
    
    private func filterTasks(by primary: Primary?) {
        if primary == nil {
            self.filteredTasks = self.tasks.value
            self.taskTV.reloadData()
        } else {
            self.tasks.map { tasks in
                return tasks.filter { $0.priority == primary!}
            }.subscribe(onNext: { [weak self] tasks in
                self?.filteredTasks = tasks
                self?.taskTV.reloadData()
            }).disposed(by: disposeBag)
        }
    }
}

extension TaskViewController : UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.filteredTasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TaskTableView", for: indexPath)
        cell.textLabel?.text = self.filteredTasks[indexPath.row].title
        return cell
    }
}
