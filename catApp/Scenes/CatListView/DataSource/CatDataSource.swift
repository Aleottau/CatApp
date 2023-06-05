//
//  CatDataSource.swift
//  catApp
//
//  Created by alejandro on 5/06/23.
//

import Foundation
import UIKit

protocol CatDataSourceProtocol {
    var dataSource: CatDataSource.DiffDataSource { get }
    func applySnapshot(animatingDiff: Bool)
    
}
class CatDataSource {
    
    var cats: [CatModel] = []
    var collectionView: UICollectionView
    var viewModel: ViewModelProtocol
    typealias DiffDataSource = UICollectionViewDiffableDataSource<Section, AnyHashable>
    typealias Snapshot = NSDiffableDataSourceSnapshot<Section, AnyHashable>
    lazy var dataSource: CatDataSource.DiffDataSource = makeDataSource()
    
    init(collectionView: UICollectionView, cats: [CatModel], viewModel: ViewModelProtocol) {
        self.collectionView = collectionView
        self.cats = cats
        self.viewModel = viewModel
        registerCell(collection: collectionView, identifier: CatCell.identifier)
    }
    private func registerCell(collection: UICollectionView, identifier: String) {
        let nib = UINib(nibName: identifier, bundle: nil)
        collection.register(nib, forCellWithReuseIdentifier: identifier )
    }
    private func modelFrom(itemIdentifier: AnyHashable) -> CatModel? {
        return cats.first { $0.id == itemIdentifier as! String }
    }
    
    private func makeDataSource() -> DiffDataSource {
        let dataSource = DiffDataSource(collectionView: collectionView) { [weak self] collectionView, indexPath, itemIdentifier in
            print(itemIdentifier)
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CatCell.identifier, for: indexPath) as? CatCell, let cat = self?.modelFrom(itemIdentifier: itemIdentifier) else {
                return UICollectionViewCell()
            }
            self?.viewModel.getCatImage(referenceId: cat.imageReference ?? "nil", callback: { result in
                cell.image.image =  try? result.get()
            })
            cell.setdata(model: cat)
            return cell
        }
        return dataSource
    }
}
extension CatDataSource: CatDataSourceProtocol {
    func applySnapshot(animatingDiff: Bool = true) {
        var snapshot = Snapshot()
        snapshot.appendSections([.home])
        snapshot.appendItems(cats.map({ $0.id }), toSection: .home)
        dataSource.apply(snapshot, animatingDifferences: animatingDiff)
    }
    
    
}
