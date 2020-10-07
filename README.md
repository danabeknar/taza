# Taza 🧼

![Swift](https://img.shields.io/badge/Swfit-5.0-orange.svg)
[![@beknar](https://img.shields.io/badge/contact-%40beknar-brightgreen.svg)](https://t.me/beknar)

Trivial command-line tool build in educational purposes & for personal use.<br>
Allows to easily find unused resources in XCode project.

## How it works
1. A script looks for images. For now it supports 4 types: *.pdf, .png, .img, .jpg*; 
2. It finds image-containable file. There are 4 types as well: *.swift, .m, .xib, .storyboard*;
3. Then it loops through images and files, checking if a file contains an image. The checking depends on the file extension:
- If it's `.swift` file, the script searches `UIImage(named: "imageName")` & `UIImage(named: "imageName.extension")` occurences;
- If it's `.m` file, the script searches `[UIImage imageNamed:@"imageName"]` & `[UIImage imageNamed:@"imageName.extension"]` occurences;
- If it's `.xib`/`.storyboard` file, the script searches `image="imageName"` & `image="imageName.extension"`  occurences;
4.  If the script could find unused image in these files, it prints them in a good-looking way:
![Result](https://raw.github.com/danabeknar/taza/develop/Resources/taza.png)

## Installation
The easiest way to install Taza is using Swift Package Manager:
```bash
$ git clone https://github.com/danabeknar/taza
$ cd taza
$ swift build --configuration release
$ cp -f .build/release/taza /usr/local/bin/taza
```

## Usage
Without any specifications (have to be executed in the directory where Xcode project is located):
```bash
taza
```
Specifies path of project to search for:
```bash
taza --path ~/Example
```

Specifies should script list all found files:
```bash
taza --listFiles
```

Specifies should script list all found resources:
```bash
taza --listResources
```
Or altogether:
```bash
taza --path ~/Example --listFiles --listResources
```

To Do:
-------
- [x] Search specific directory
- [x] List files
- [x] List resources
- [x] Ignore pods
- [ ] Removing images

## Dependencies
- [Files](https://github.com/JohnSundell/Files)
- [ColorizeSwift](https://github.com/mtynior/ColorizeSwift)
- [Commander](https://github.com/kylef/Commander)

## Help, feedback or suggestions?
Feel free to contact me on [Telegram](http://t.me/beknar "Telegram") for discussions, news & announcements about Taza & other projects.
