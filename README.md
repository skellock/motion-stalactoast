# motion-toast
[![Gem Version](https://img.shields.io/gem/v/motion-toast.svg?style=flat)](https://rubygems.org/gems/motion-toast)
[![Build Status](https://img.shields.io/travis/skellock/motion-toast.svg?style=flat)](https://travis-ci.org/skellock/motion-toast)

A RubyMotion library for iOS 7+ to display Toast-like notification messages.

The heavy lifting is provided by CRToast.  It's pretty awesome.  motion-toast is just a warm RubyMotion hug for it.

https://github.com/cruffenach/CRToast

<img src="./_pics/demo.gif" alt="Demo" />


# Installation

Add this to your Gemfile:

```ruby
gem 'motion-toast'
```

Then run this to install it:

```
bundle
```

# Requirements

* iOS 7 or higher


# Usage

Include the MotionToast module in your file.  We're non-polluting by default.

```ruby
include MotionToast
```

Simple and unstyled.
```ruby
toast "Look up.  Look wayyyyyyy up."
```

Passing in some options to customize it.
```ruby
toast "And Blueberry Jam", bg_color: UIColor.blueColor

```

There are 3 types of toasts.

* Status Bar Sized
* Navigation Bar Sized
* Custom Sized


```ruby
toast "Small", type: :status_bar
toast "Bigger", type: :navigation_bar
toast "What have you done?", type: :custom, preferred_height: 300
```


Text can be customized.
```ruby
toast type: :custom,
  preferred_height: 100,
  text: {
    value: "And Peanut Butter", 
    color: UIColor.brownColor, 
    font:  UIFont.systemFontOfSize(20)
    }
```

```ruby

```

# HISTORY

### 0.1.0 | June 5th, 2015
* [feature] first release



