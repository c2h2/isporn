# Isporn

Detect if your picture(s) is pornographic by AI, powered by https://exadeep.com. 

Mid 2015 Correction rate > 90%

## Installation

Add this line to your application's Gemfile:

    gem 'isporn'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install isporn

## Usage

    require 'isporn'

    '/path/to/test.jpg'.isporn?

returns:

    # or => normal
    # or => sexy
    # or => porn

## Limited free use

1. only 1000 picture per IP per day.

## Register and obtain your API key.
https://exadeep.com
