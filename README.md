[![Build Status](https://travis-ci.org/Sevitec/oneoffixx-docs.svg?branch=gh-pages)](https://travis-ci.org/Sevitec/oneoffixx-docs)

# Docs
Documentation Repository for OneConnexx

[Site](http://docs.oneconnexx.com)

## Dev Notes

Currently used theme: [WinStrap](https://github.com/winjs/winstrap) - with OneConnexx color as accent color.

__Quick guide to change color theme:__

 1. Download node.js from https://nodejs.org/en/#download

 1. Open cmd and run:
 
	npm install -g grunt-cli
	
	npm install -g bower

 1. Open git bash at preferred Location and run: 
 
	git clone https://github.com/winjs/winstrap.git

 1. Change the $color_accent in winstrap\src\scss\win\\_colors.scss.

 1. In git bash, go into folder "winstrap" and run:
 
	grunt

 1. Go to winstrap\dist\css and copy the files into oneconnexx-docs\assets\css
 
 1. Push oneconnexx-docs to oneconnexx-docs github repo, refresh page, there you go.
