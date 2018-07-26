//
//  UICollectionViewWrapper.swift
//  wanted
//
//  Created by Ross on 2018. 4. 19..
//  Copyright © 2018년 WantedLab. All rights reserved.
//

import Foundation

public class UICollectionViewWrapper: NSObject, UICollectionViewWrapperProtocol, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    private weak var delegate: UICollectionViewWrapperDelegate?
    private weak var dataSource: UICollectionViewWrapperDataSource?
    var collectionView: UICollectionView?
    
    public func setDelegate(_ delegate: UICollectionViewWrapperDelegate, collectionView: UICollectionView?) {
        self.delegate = delegate
        self.collectionView = collectionView
        self.collectionView?.delegate = self
    }
    
    public func setDataSource(_ dataSource: UICollectionViewWrapperDataSource) {
        //assert(nil != self.collectionView)
        self.collectionView?.dataSource = self
        self.dataSource = dataSource
    }
    
    public func register(_ nib: UINib?, forCellWithReuseIdentifier identifier: String) {
        self.collectionView?.register(nib, forCellWithReuseIdentifier: identifier)
    }
    
    public func register(_ viewClass: Swift.AnyClass?, forSupplementaryViewOfKind elementKind: String, withReuseIdentifier identifier: String) {
        self.collectionView?.register(viewClass, forSupplementaryViewOfKind: elementKind, withReuseIdentifier: identifier )
    }
    
    public func register(_ nib: UINib?, forSupplementaryViewOfKind kind: String, withReuseIdentifier identifier: String) {
        self.collectionView?.register(nib, forSupplementaryViewOfKind: kind, withReuseIdentifier: identifier)
    }
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        guard let delegate = self.delegate else { return CGSize.zero }
        guard let ret = delegate.collectionView?(collectionView, layout: collectionViewLayout, referenceSizeForHeaderInSection: section) else { return CGSize.zero }
        return ret
    }
    
    public func numberOfSections(in collectionView: UICollectionView) -> Int {
        guard let collectionView = self.collectionView, let dataSource = self.dataSource else { return 0 }
        guard let ret = dataSource.numberOfSections?(in: collectionView)
            else { return 1 }
        return ret
    }
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let dataSource = self.dataSource else { return 0 }
        return dataSource.collectionView(collectionView, numberOfItemsInSection: section)
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let dataSource = self.dataSource else { return UICollectionViewCell() }
        return dataSource.collectionView(collectionView, cellForItemAt: indexPath)
    }
    
    public func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        guard let reusableView = self.dataSource?.collectionView?(collectionView, viewForSupplementaryElementOfKind: kind, at: indexPath) else { return UICollectionReusableView() }
        return reusableView
    }
    
    public func dequeueReusableCell(withReuseIdentifier identifier: String, for indexPath: IndexPath) -> UICollectionViewCell {
        guard let collectionView = collectionView else { return UICollectionViewCell() }
        return collectionView.dequeueReusableCell(withReuseIdentifier:identifier, for: indexPath)
    }
    
    public func dequeueReusableSupplementaryView(ofKind elementKind: String, withReuseIdentifier identifier: String, for indexPath: IndexPath) -> UICollectionReusableView {
        guard let collectionView = collectionView else { return UICollectionReusableView() }
        return collectionView.dequeueReusableSupplementaryView(ofKind: elementKind, withReuseIdentifier: identifier, for: indexPath)
    }
    
    public func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        self.delegate?.collectionView?(collectionView, willDisplay: cell, forItemAt: indexPath)
    }
    
    public func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.delegate?.collectionView?(collectionView, didSelectItemAt: indexPath)
    }
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        guard let flowLayout = delegate as? UICollectionViewWrapperFlowLayout,
            let ret = flowLayout.collectionView?(collectionView, layout: collectionViewLayout, sizeForItemAt: indexPath) else { return CGSize(width: 0, height: 0) }
        return ret
    }
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        guard let flowLayout = delegate as? UICollectionViewWrapperFlowLayout,
            let ret = flowLayout.collectionView?(collectionView, layout: collectionViewLayout, insetForSectionAt: section) else { return UIEdgeInsetsMake(0, 0, 0, 0) }
        return ret
    }
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        guard let flowLayout = delegate as? UICollectionViewWrapperFlowLayout,
            let ret = flowLayout.collectionView?(collectionView, layout: collectionViewLayout, minimumLineSpacingForSectionAt: section) else { return 0 }
        return ret
    }
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        guard let flowLayout = delegate as? UICollectionViewWrapperFlowLayout,
            let ret = flowLayout.collectionView?(collectionView, layout: collectionViewLayout, minimumInteritemSpacingForSectionAt: section) else { return 0 }
        return ret
    }
    
    public func scrollViewDidScroll(_ scrollView: UIScrollView) {
        self.delegate?.scrollViewDidScroll?(scrollView)
    }
    
    public func setupBackgroundView(_ view: UIView?) {
        self.collectionView?.backgroundView = view
    }
    
    public func bringSubview(toFront subView: UIView) {
        self.collectionView?.bringSubview(toFront: subView)
    }
    
    public func reloadData() {
        self.collectionView?.reloadData()
    }
    
    public func reloadItems(at indexPaths: [IndexPath]) {
        self.collectionView?.reloadItems(at: indexPaths)
    }
    
    public func getNumberOfSections() -> Int {
        guard let collectionView = collectionView else { return 0 }
        return collectionView.numberOfSections
    }
}
