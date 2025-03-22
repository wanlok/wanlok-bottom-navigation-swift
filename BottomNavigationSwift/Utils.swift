//
//  Utils.swift
//  BottomNavigationSwift
//
//  Created by Robert Wan on 22/3/2025.
//

import UIKit

func resize(image: UIImage?, size: CGSize) -> UIImage? {
    guard let image = image else { return nil }
    let renderer = UIGraphicsImageRenderer(size: size)
    return renderer.image { _ in
        image.draw(in: CGRect(origin: .zero, size: size))
    }
}
