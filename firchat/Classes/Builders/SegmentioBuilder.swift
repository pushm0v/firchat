//
//  SegmentioBuilder.swift
//  firchat
//
//  Created by Bherly Novrandy on 3/21/17.
//  Copyright © 2017 Bherly Novrandy. All rights reserved.
//

import UIKit
import Segmentio

protocol ISegmentioBuilder: class {
    
}

class SegmentioBuilder: ISegmentioBuilder {
    static func setupBadgeCountForIndex(_ segmentioView: Segmentio, index: Int) {
        segmentioView.addBadge(
            at: index,
            count: 10,
            color: ColorPalette.coral
        )
    }
    
    static func buildSegmentioView(segmentioView: Segmentio, segmentioStyle: SegmentioStyle, contents: [(title: String?, image: UIImage?)]) {
        segmentioView.setup(
            content: segmentioContent(contents: contents),
            style: segmentioStyle,
            options: segmentioOptions(segmentioStyle: segmentioStyle, maxVisibleItems: contents.count)
        )
    }
    
    private static func segmentioContent(contents: [(title: String?, image: UIImage?)]) -> [SegmentioItem] {
        var contentsToReturn: [SegmentioItem] = []
        
        for content in contents {
            contentsToReturn.append(SegmentioItem(title: content.title, image: content.image))
        }
        
        return contentsToReturn
    }
    
    private static func segmentioOptions(segmentioStyle: SegmentioStyle, maxVisibleItems: Int) -> SegmentioOptions {
        var imageContentMode = UIViewContentMode.center
        switch segmentioStyle {
        case .imageBeforeLabel, .imageAfterLabel:
            imageContentMode = .scaleAspectFit
        default:
            break
        }
        
        return SegmentioOptions(
            backgroundColor: ColorPalette.blueNavigation,
            maxVisibleItems: maxVisibleItems,
            scrollEnabled: true,
            indicatorOptions: segmentioIndicatorOptions(),
            horizontalSeparatorOptions: nil,
            verticalSeparatorOptions: nil,
            imageContentMode: imageContentMode,
            labelTextAlignment: .center,
            labelTextNumberOfLines: 1,
            segmentStates: segmentioStates(),
            animationDuration: 0.3
        )
    }
    
    private static func segmentioStates() -> SegmentioStates {
        let font = UIFont.systemFont(ofSize: 14)
        let fontBold = UIFont.boldSystemFont(ofSize: 14)
        return SegmentioStates(
            defaultState: segmentioState(
                backgroundColor: ColorPalette.blueNavigation,
                titleFont: font,
                titleTextColor: ColorPalette.white
            ),
            selectedState: segmentioState(
                backgroundColor: ColorPalette.blueNavigation,
                titleFont: fontBold,
                titleTextColor: ColorPalette.greyNavigation
            ),
            highlightedState: segmentioState(
                backgroundColor: ColorPalette.blueNavigation,
                titleFont: font,
                titleTextColor: ColorPalette.white
            )
        )
    }
    
    private static func segmentioState(backgroundColor: UIColor, titleFont: UIFont, titleTextColor: UIColor) -> SegmentioState {
        return SegmentioState(
            backgroundColor: backgroundColor,
            titleFont: titleFont,
            titleTextColor: titleTextColor
        )
    }
    
    private static func segmentioIndicatorOptions() -> SegmentioIndicatorOptions {
        return SegmentioIndicatorOptions(
            type: .bottom,
            ratio: 1,
            height: 5,
            color: ColorPalette.coral
        )
    }
    
    private static func segmentioHorizontalSeparatorOptions() -> SegmentioHorizontalSeparatorOptions {
        return SegmentioHorizontalSeparatorOptions(
            type: .topAndBottom,
            height: 1,
            color: ColorPalette.whiteSmoke
        )
    }
    
    private static func segmentioVerticalSeparatorOptions() -> SegmentioVerticalSeparatorOptions {
        return SegmentioVerticalSeparatorOptions(
            ratio: 1,
            color: ColorPalette.whiteSmoke
        )
    }
}
