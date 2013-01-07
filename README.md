each_section
============

Description
-----------

each_line with Regular Expression separators.

String やら IO 等が持っている #each_line は便利な基本メソッドですよね。
でも、区切り文字を $/ 以外に設定するとき、個人的に不満な箇所が２つあります。
* その時点で line と言い難い
  -> 可読性が落ちる
* 区切り文字に正規表現が使えない。
  -> これが使えるだけでも簡単なパーサなら作れるのに・・・

と思う事が良く有りました。(最近あんまないけど・・・)
なら作ってしまえということで生まれた小物ライブラリです。

Features
--------

* String#each_section (also #sections)
* IO#each_section (also #sections)
* ARGF#each_section (also #sections)
* StringIO#each_section (also #sections)

Usage
-----

```ruby
require 'each_section'

string.each_section /regexp/i do |section|
  do_something section
end
```

Requirements
-------------

* Ruby - [1.8.7 or later](http://travis-ci.org/#!/kachick/each_section)

Install
-------

```bash
$ gem install each_section
```

Build Status
-------------

[![Build Status](https://secure.travis-ci.org/kachick/each_section.png)](http://travis-ci.org/kachick/each_section)

Link
----

* [Home](http://kachick.github.com/each_section)
* [code](https://github.com/kachick/each_section)
* [API](http://kachick.github.com/each_section/yard/frames.html)
* [issues](https://github.com/kachick/each_section/issues)
* [CI](http://travis-ci.org/#!/kachick/each_section)
* [gem](https://rubygems.org/gems/each_section)

License
--------

The MIT X11 License  
Copyright (c) 2010 Kenichi Kamiya  
See MIT-LICENSE for further details.

