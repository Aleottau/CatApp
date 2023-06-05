//
//  CatListViewController.swift
//  catApp
//
//  Created by alejandro on 5/06/23.
//

import UIKit
import SnapKit

class CatListViewController: UIViewController {
    
    private var viewModel: ViewModelProtocol
    var collectionView = UICollectionView(frame: .zero, collectionViewLayout: CompositionalLayout().generateLayout())
    var catDataSource: CatDataSource?
    
    init(viewModel: ViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        makeConstraints()
        getCatsList()
    }
    private func makeConstraints() {
        view.addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    func getCatsList() {
        viewModel.getCatList { [weak self] result in
            switch result {
            case .success(let cats):
                guard let collectionView = self?.collectionView else {
                    return
                }
                self?.catDataSource = CatDataSource(collectionView: collectionView, cats: cats, viewModel: self!.viewModel)
                collectionView.dataSource = self?.catDataSource?.dataSource
                self?.catDataSource?.applySnapshot()
            case .failure(_):
                print("error en controller al traer cats list")
            }
        }
    }
    

}
