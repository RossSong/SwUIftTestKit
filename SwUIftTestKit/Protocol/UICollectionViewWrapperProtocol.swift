//
//  UICollectionViewWrapperProtocol.swift
//  wanted
//
//  Created by Ross on 2018. 4. 19..
//  Copyright © 2018년 WantedLab. All rights reserved.
//

import Foundation

@objc public protocol UICollectionViewWrapperFlowLayout: class {
    @objc optional func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    @objc optional func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets
    @objc optional func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat
    @objc optional func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat
    @objc optional func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize
    @objc optional func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize
}

@objc public protocol UICollectionViewWrapperDelegate {
    @objc optional func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath)
    @objc optional func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize
    @objc optional func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath)
    @objc optional func scrollViewDidScroll(_ scrollView: UIScrollView)
}

@objc public protocol UICollectionViewWrapperDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    
    @objc optional func numberOfSections(in collectionView: UICollectionView) -> Int
    @objc optional func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView
    @objc optional func collectionView(_ collectionView: UICollectionView, canMoveItemAt indexPath: IndexPath) -> Bool
    @objc optional func collectionView(_ collectionView: UICollectionView, moveItemAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath)
    @objc optional func indexTitles(for collectionView: UICollectionView) -> [String]?
    @objc optional func collectionView(_ collectionView: UICollectionView, indexPathForIndexTitle title: String, at index: Int) -> IndexPath
}

public protocol UICollectionViewWrapperProtocol {
    func setDelegate(_ delegate: UICollectionViewWrapperDelegate, collectionView: UICollectionView?)
    func setDataSource(_ dataSource: UICollectionViewWrapperDataSource)
    func register(_ nib: UINib?, forCellWithReuseIdentifier identifier: String)
    func register(_ viewClass: Swift.AnyClass?, forSupplementaryViewOfKind elementKind: String, withReuseIdentifier identifier: String)
    func register(_ nib: UINib?, forSupplementaryViewOfKind kind: String, withReuseIdentifier identifier: String)
    func dequeueReusableCell(withReuseIdentifier identifier: String, for indexPath: IndexPath) -> UICollectionViewCell
    func dequeueReusableSupplementaryView(ofKind elementKind: String, withReuseIdentifier identifier: String, for indexPath: IndexPath) -> UICollectionReusableView
    func setupBackgroundView(_ view: UIView?)
    func bringSubview(toFront subView: UIView)
    func reloadData()
    func reloadItems(at indexPaths: [IndexPath])
    func getNumberOfSections() -> Int
}
