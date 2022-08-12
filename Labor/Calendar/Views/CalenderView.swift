//
//  CalenderView.swift
//  Labor
//
//  Created by mehrnoush abdinian on 12.08.22.
//


import UIKit

class CalendarView: UIView {
    
    let titleView = LabelBuilder()
        .setText("Please select the desired date:", color: .darkGray, fontSize: AppTheme.label.minimumSize, fontWeight: .regular)
        .build()
    
    var list: [String] = []
    let calendarTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .white
        tableView.showsVerticalScrollIndicator = false
        tableView.separatorStyle = .singleLine
        tableView.allowsSelection = true
        tableView.allowsMultipleSelection = false
        tableView.isScrollEnabled = true
        tableView.layer.masksToBounds = true
        tableView.rowHeight = UITableView.automaticDimension
        tableView.register(CalendarTableViewCell.self, forCellReuseIdentifier: "CalendarTableViewCell")
        return tableView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        style()
        layout()
    }

    func style() {
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .white
        calendarTableView.delegate = self
        calendarTableView.dataSource = self
        
        calendarTableView.reloadData()
    }
    
    private func layout() {
        addSubview(titleView)
        addSubview(calendarTableView)
        NSLayoutConstraint.activate([
            titleView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
            titleView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            titleView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            
            calendarTableView.topAnchor.constraint(equalTo: titleView.bottomAnchor, constant: 20),
            calendarTableView.bottomAnchor.constraint(equalTo: bottomAnchor),
            calendarTableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            calendarTableView.leadingAnchor.constraint(equalTo: leadingAnchor),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


//MARK: - Delegate & DataSource
extension CalendarView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CalendarTableViewCell", for: indexPath) as! CalendarTableViewCell
//        let cellRow = list[indexPath.row]

        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as! CalendarTableViewCell
        cell.selectionStyle = .none
        
    }
}
