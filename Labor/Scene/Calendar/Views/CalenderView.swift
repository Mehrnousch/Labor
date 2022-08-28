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
    
    let dateList = ["01.02.2022","02.02.2022","03.02.2022","04.02.2022","05.02.2022","06.02.2022","07.02.2022","08.02.2022","09.02.2022", "10.02.2022", "11.02.2022"]
    let timeList = ["08:00","09:00", "10:00", "11:00", "12:00", "13:00", "14:00", "15:00"]
    private let calendarCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 2
        layout.minimumInteritemSpacing = 2
        //        layout.itemSize = CGSize.init(width: 100, height: 60)
        layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.register(CalendarCollectionViewCell.self, forCellWithReuseIdentifier: "CalendarCollectionViewCell")
        cv.register(SectionHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "header")
        cv.contentInset  = UIEdgeInsets(top: 4, left: 4, bottom: 4, right: 4)
        cv.allowsMultipleSelection = false
        cv.allowsSelection = true
        cv.isScrollEnabled = true
        cv.showsVerticalScrollIndicator = false
        cv.backgroundColor = .clear
        return cv
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
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


//MARK: - Delegate & DataSource
extension CalendarView: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        if dateList.isEmpty {
            return 0
        } else {
            return dateList.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if timeList.isEmpty {
            return 0
        } else {
            return timeList.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CalendarCollectionViewCell", for: indexPath) as! CalendarCollectionViewCell
        let time = timeList[indexPath.row]
        cell.setupCell(data: time)
        cell.isSelected = false
        collectionView.selectItem(at: indexPath, animated: true, scrollPosition: .left)
        cell.isSelected = true
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == UICollectionView.elementKindSectionHeader {
            let sectionHeader = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "header", for: indexPath) as! SectionHeader
            
            let date = dateList[indexPath.row]
            sectionHeader.setupCell(data: date)
            
            return sectionHeader
        }
        return UICollectionReusableView()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 64)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout:
    UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
      let padding: CGFloat =  200
      let collectionViewSize = calendarCollectionView.frame.size.width - padding
        return CGSize(width: collectionViewSize/1.76, height: collectionViewSize/2.4)
    }
}
