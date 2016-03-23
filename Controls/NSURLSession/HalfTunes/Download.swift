//
//  Download.swift
//  HalfTunes
//
//  Created by WeiWen on 16/3/23.
//  Copyright © 2016年 Ken Toh. All rights reserved.
//

import Foundation

class Download: NSObject {
    
    var url: String
    var isDownloading = false
    var progress: Float = 0.0
    
    var downloadTask: NSURLSessionDownloadTask?
    var resumeData: NSData?
    
    init(url: String) {
        self.url = url
    }
}