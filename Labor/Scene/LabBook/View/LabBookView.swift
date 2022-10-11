//
//  LabBookView.swift
//  Labor
//
//  Created by mehrnoush abdinian on 28.08.22.
//

import UIKit

class LabBookView: UIView {
    
    let emptyList = LabelBuilder()
        .setText("There is no experiment for this reservation please press the plus button above to add your experiment.", color: .darkGray, fontSize: AppTheme.label.maximumSize, fontWeight: .regular)
        .build()
    
    var selectedCell: (Int)-> Void = {_ in}
    var deleteCell: (Int, Int) -> Void = {_, _ in}

    var experiments: [ExperimentModel] = []
    let detailesTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.contentInset = UIEdgeInsets(top: 14,left: 0,bottom: 0,right: 0)
        tableView.backgroundColor = .white
        tableView.showsVerticalScrollIndicator = false
        tableView.separatorStyle = .singleLine
        tableView.allowsSelection = true
        tableView.allowsMultipleSelection = false
        tableView.isScrollEnabled = true
        tableView.layer.masksToBounds = true
        tableView.rowHeight = UITableView.automaticDimension
        tableView.register(LabBookTableViewCell.self, forCellReuseIdentifier: "LabBookTableViewCell")
        return tableView
    }()
    
    var reservationId: Int?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        style()
        layout()
    }
    
    func setData(experiments: [ExperimentModel]) {
        if experiments.count > 0 {
            detailesTableView.isHidden = false
            emptyList.isHidden = true
            self.experiments = experiments
            detailesTableView.reloadData()
        } else {
            detailesTableView.isHidden = true
            emptyList.isHidden = false
        }
    }

    func style() {
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .white
        detailesTableView.delegate = self
        detailesTableView.dataSource = self
    }
    
    func layout() {
        addSubview(emptyList)
        addSubview(detailesTableView)
        NSLayoutConstraint.activate([
            emptyList.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 50),
            emptyList.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            emptyList.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
            detailesTableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            detailesTableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            detailesTableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            detailesTableView.leadingAnchor.constraint(equalTo: leadingAnchor),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


//MARK: - Delegate & DataSource
extension LabBookView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return experiments.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 160
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LabBookTableViewCell", for: indexPath) as! LabBookTableViewCell
        let cellRow = experiments[indexPath.row]
        cell.setData(experiment: cellRow)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as! LabBookTableViewCell
        cell.selectionStyle = .none
        let cellRow = experiments[indexPath.row]
        selectedCell(cellRow.id)
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .normal, title: "") { (action, view, completion) in
            let item = self.experiments[indexPath.row]
            if let reservationId = self.reservationId {
                self.deleteCell(reservationId, item.id)
            }
            completion(true)
        }
        deleteAction.image = UIImage(named: "trash")
        deleteAction.backgroundColor = UIColor.white
        
        return UISwipeActionsConfiguration(actions: [deleteAction])
    }
}
