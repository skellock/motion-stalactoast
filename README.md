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

# Customizable Properties

```ruby

  type                         # what type of notification to show
                               # options are :status_bar, :navigation_bar, :custom

  preferred_height             # when type: :custom, how many points high is the toast?

  presentation_type            # what to do with the content the toast overlaps.
                               # symbol in [:push, :cover]

  under_status_bar             # always keep under the iOS status bar? (boolean)

  keep_navigation_bar_border:  # keep the toast contained with the nav bar? (boolean)

  in_animation:                # a Hash for customizing the arrival of the toast.
    type:                      # :linear, :spring, or :gravity
    direction:                 # :top, :bottom, :left, or :right
    time:                      # how long to appear? (float)

  out_animation:               # a Hash for customizing the departure of the toast.
    type:                      # :linear, :spring, or :gravity
    direction:                 # :top, :bottom, :left, or :right
    time:                      # how long to appear? (float)

  spring_damping:              # how much resistance the :spring animations have (float default 0.6)
  spring_initial_velocity:     # how much initial velocity the :spring animations have (float default 1.0)
  gravity:                     # how much gravity the :gravity animations have (float default 0.1)
  
  text:                        # what the message says (optionally can be a string if not customizations are needed)
    value:                     # the message
    color:                     # a UIColor
    font:                      # a UIFont
    shadow_color:              # a UIColor
    shadow_offset:             # a CGSize
    max_lines:                 # :unlimited or a Fixnum to cap wrapping.

  text:                        # what the subtitle says (optionally can be a string if not customizations are needed)
    value:                     # the message
    color:                     # a UIColor
    font:                      # a UIFont
    shadow_color:              # a UIColor
    shadow_offset:             # a CGSize
    max_lines:                 # :unlimited or a Fixnum to cap wrapping.

  background_color:            # UIColor of the background.  Semi-transparent colors look neato.

```

# Wierd Things

* So not all combinations of options work with each other.  CRToast might throw some warnings in your console to reward your conflicting choices.  No big deal.
* motion-toast uses the Pod CRToast but links it from Github on the master branch.  Never do this at home.  I'll fix.

# HISTORY

### 0.1.0 | June 6th, 2015
* [feature] first release



