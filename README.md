# measie

## Overview

measie will take a list of URLs and create an .epub eBook from them,
one chapter per URL.  It does so very *badly*, by using sed to grab
only the HTML that's needed.  This, of course, puts me in a state of
[sin](http://stackoverflow.com/questions/1732348/regex-match-open-tags-except-xhtml-self-contained-tags).

## Dependencies

It depends on wget, sed and [calibre's](http://calibre-ebook.com/)
conversion tools.

## Thanks

Many thanks to the [Javascript project name
generator](http://mrsharpoblunto.github.io/foswig.js/) for the name.

## License

measie is relased under the [GPLv3](https://www.gnu.org/licenses/quick-guide-gplv3.html).

## TODO

* Use proper HTML parsing, which probably means a rewrite in
  Perl/Python/ruby/etc.
* Optionally, use Calibre's recipes!  
* Option to include images from web pages -- and probably just larger
  ones, on the assumption that they're illustrations and not decorations.


## Home

You can find measie at:

* http://git.saintaardvarkthecarpeted.com
* https://github.com/saintaardvark/measie
