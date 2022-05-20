//
//  ViewController.swift
//  Fibonacci_CodeAssessment
//
//  Created by Byron Hundley on 5/20/22.
//

import UIKit

class ViewController: UIViewController {
    
    fileprivate var fibonacciResults: [Int32] = []
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()
        fibonacci(0)
        print(fibonacciResults)
    }

    func setupTableView() {
        view.addSubview(tableView)
        tableView.frame = view.frame
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    }
    
    func fibonacci(_ num: Int32) {
        guard fibonacciResults.count < 15 else { return }
        
        fibonacciResults.append(num)
        if fibonacciResults.count < 2 {
            fibonacci(1)
        } else {
            let index = fibonacciResults.count - 1
            let num1 = fibonacciResults[index]
            let num2 = fibonacciResults[index - 1]
            fibonacci(num1 + num2)
        }
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fibonacciResults.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let number = fibonacciResults[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = String(number)
        return cell
    }
}
