# Taza 🧼

![Swift](https://img.shields.io/badge/Swfit-5.0-orange.svg)
[![@beknar](https://img.shields.io/badge/contact-%40beknar-brightgreen.svg)](https://t.me/beknar)

Trivial command-line tool build in educational purposes & for personal use.<br>
Allows to easily find unused resources in XCode project.

## How it works
1. A script looks for images. For now it supports 4 types: *.pdf, .png, .img, .jpg*; 
2. It finds image-containable file. There are 4 types as well: *.swift, .m, .xib, .storyboard*;
3. Then it loops through images and files, checking if a file contains an image. The checking depends on the file type:
    - If it's `.swift` file, the script searches `UIImage(named: "imageName")` occurences;
    - If it's `.m` file, the script searches `[UIImage imageNamed: @"imageName"]` occurences;
    - If it's `.xib`/`.storyboard` file, the script searches `image="imageName"` occurences;
4.  If the script could find unused image in these files, it prints them in a good-looking way:
![Result](https://i.imgur.com/8dL37RJ.png)

## Installation
The easiest way to install Taza is using Swift Package Manager:
```bash
$ git clone https://github.com/danabeknar/taza
$ cd taza
$ swift build --configuration release
$ cp -f .build/release/taza /usr/local/bin/taza
```

## Usage
Without any specifications (have to be executed in the directory where XCode project is located).
```bash
taza
```

To Do:
-------
- [ ] List all found files
- [ ] Removing of images

## Dependencies
- [Files](https://github.com/JohnSundell/Files)
- [ColorizeSwift](https://github.com/mtynior/ColorizeSwift)

## Help, feedback or suggestions?
Feel free to contact me on [Telegram](http://t.me/beknar "Telegram") for discussions, news & announcements about Sugar & other projects.
