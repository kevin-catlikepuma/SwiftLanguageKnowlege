//: Playground - noun: a place where people can play

import Cocoa

var str = "Hello, playground"

var homeDir = NSHomeDirectory()
var tempDir = NSTemporaryDirectory()
var nsTempDir : NSString = tempDir
nsTempDir.lastPathComponent

nsTempDir.pathComponents

nsTempDir.pathExtension