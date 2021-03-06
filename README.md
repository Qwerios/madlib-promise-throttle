# madlib-promise-throttle
[![Build Status](https://travis-ci.org/Qwerios/madlib-promise-throttle.svg?branch=master)](https://travis-ci.org/Qwerios/madlib-promise-throttle) [![NPM version](https://badge.fury.io/js/madlib-promise-throttle.png)](http://badge.fury.io/js/madlib-promise-throttle) [![Built with Grunt](https://cdn.gruntjs.com/builtwith.png)](http://gruntjs.com/)

[![Npm Downloads](https://nodei.co/npm/madlib-promise-throttle.png?downloads=true&stars=true)](https://nodei.co/npm/madlib-promise-throttle.png?downloads=true&stars=true)

A generic promise based throttle


## acknowledgments
The Marviq Application Development library (aka madlib) was developed by me when I was working at Marviq. They were cool enough to let me publish it using my personal github account instead of the company account. We decided to open source it for our mutual benefit and to ensure future updates should I decide to leave the company.


## philosophy
JavaScript is the language of the web. Wouldn't it be nice if we could stop having to rewrite (most) of our code for all those web connected platforms running on JavaScript? That is what madLib hopes to achieve. The focus of madLib is to have the same old boring stuff ready made for multiple platforms. Write your core application logic once using modules and never worry about the basics stuff again. Basics including XHR, XML, JSON, host mappings, settings, storage, etcetera. The idea is to use the tried and proven frameworks where available and use madlib based modules as the missing link.

Currently madLib is focused on supporting the following platforms:

* Web browsers (IE6+, Chrome, Firefox, Opera)
* Appcelerator/Titanium
* PhoneGap
* NodeJS


## installation
```bash
$ npm install madlib-promise-throttle --save
```

## usage
```javascript
var Throttle = require( "madlib-promise-throttle" )

// Initialize the throttle with a delay of 3 seconds
//
var throttle = new Throttle( 3000 );

// This promise will resolve immediately
//
throttle.connect()
.then( ... )
.done()

// This promise will resolve after 3 seconds
//
throttle.connect()
.then( ... )
.done()

// This promise will resolve after 6 seconds
//
throttle.connect()
.then( ... )
.done()
```