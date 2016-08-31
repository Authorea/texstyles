# TeX Styles

A collection of ERB-based TeX/LaTeX preamble styles, for the world of scholarly writing and beyond. Founded and maintained by the [Authorea](www.authorea.com) team.

**CAUTION: This repository is in a pre-alpha dev sprint, consider it completely unstable until a 0.1.0 release**

[![Build Status](https://secure.travis-ci.org/Authorea/texstyles.png?branch=master)](https://travis-ci.org/Authorea/texstyles)
[![license](http://img.shields.io/badge/license-MIT-blue.svg)](https://raw.githubusercontent.com/authorea/texstyles/master/LICENSE)
[![Gem Version](https://badge.fury.io/rb/texstyles.svg)](https://badge.fury.io/rb/texstyles)


## Installation

Add this line to your application's Gemfile:

```ruby
gem 'texstyles'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install texstyles

## Usage

## Roadmap

### Supported
 * 100+ and growing scholarly export styles
 * Core metadata items of scholarly articles
 * White/blacklisting LaTeX style and class conflicts
 * Independent citation style specifications

### Upcoming
 * Postamble support: Certain styles use a \begin{env}\end{env} wrapper around the entire article body, see e.g. a0poster
 * Support for the full range of scholarly metadata. Need: \keywords, thesis metadata, journal metadata
 * Decide on and use a standardized scholarly metadata language as input, instead of our custom YML dialect. Suggestions welcome!
 * Gradually improve all export styles to fit the improved metadata scheme.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
