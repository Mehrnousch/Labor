//
//  CalenderView.swift
//  Labor
//
//  Created by mehrnoush abdinian on 12.08.22.
//


import UIKit

class CalendarView: UIView {
    
    var selectedCell: ()-> Void = {}
    
    let titleView = LabelBuilder()
        .setText("Bitte wählen Sie den gewünschten Termin aus:", color: .darkGray, fontSize: AppTheme.label.minimumSize, fontWeight: .regular)
        .build()
    
    var list: [String] = []
    let calendarCollectionView: UICollectionView = {
        let collectionView = UICollectionView()
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .white
        collectionView.showsVerticalScrollIndicator = false
//        collectionView.separatorStyle = .singleLine
        collectionView.allowsSelection = true
        collectionView.allowsMultipleSelection = false
        collectionView.isScrollEnabled = true
        collectionView.layer.masksToBounds = true
//        collectionView.rowHeight = UITableView.automaticDimension
        collectionView.register(CalendarCollectionViewCell.self, forCellWithReuseIdentifier: "CalendarCollectionViewCell")
        
        collectionView.register(SectionHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "header")
        return collectionView
    }()
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        style()
        layout()
    }

    func style() {
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .white
        calendarCollectionView.delegate = self
        calendarCollectionView.dataSource = self
        calendarCollectionView.reloadData()
    }
    
    private func layout() {
        addSubview(titleView)
        addSubview(calendarCollectionView)
       
        
        
        NSLayoutConstraint.activate([
            titleView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
            titleView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            titleView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            
            calendarCollectionView.topAnchor.constraint(equalTo: titleView.bottomAnchor, constant: 20),
            calendarCollectionView.bottomAnchor.constraint(equalTo: bottomAnchor),
            calendarCollectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            calendarCollectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
           
        ])
        
        if let flowLayout = calendarCollectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            flowLayout.scrollDirection = .vertical
        }
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
            layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
            layout.itemSize = CGSize(width: 0, height: 0)
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: - DataSource
extension CalendarView: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
            return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return 8
    }
   

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let myCell = collectionView.dequeueReusableCell(withReuseIdentifier: "timeCell", for: indexPath)as! CalendarCollectionViewCell
        
//        myCell.isSelected = false
//        myCell.layer.borderColor = .init(red: 0.1, green: 0.3, blue: 0.9, alpha: 0.1)
//        myCell.layer.borderWidth = 2
//       
//        collectionView.selectItem(at: indexPath, animated: true, scrollPosition: .left)
//            myCell.isSelected = true
        
            return myCell
        }
    
        
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == UICollectionView.elementKindSectionHeader {
             let sectionHeader = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "header", for: indexPath) as! SectionHeader
            
             return sectionHeader
        }
             return UICollectionReusableView()
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 64)
    }
   
   
}

//MARK: - Delegate
extension CalendarView: UICollectionViewDelegate {
        
        func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//            let laboratoryName = laboratoryName
//            let selectedTime = timeList[indexPath.row]
//            let selectedDate = dateList[indexPath.row]
//            eventHandler?(.askLaborInfo(laboratoryName : laboratoryName, selectedTime : selectedTime, selectedDate : selectedDate))
                print("User tapped on item in cell \(indexPath)")
           
            }
    }

// MARK: - UICollectionViewDelegateFlowLayout

extension CalendarView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout:
    UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
      let padding: CGFloat =  200
      let collectionViewSize = calendarCollectionView.frame.size.width - padding
      return CGSize(width: collectionViewSize/2, height: collectionViewSize/3)
    }
}
