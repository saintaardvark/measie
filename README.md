measie will take a list of URLs and create an .epub eBook from them,
one chapter per URL.  It does so very *badly*, by using sed to grab
only the HTML that's needed.  This, of course, puts me in a state of
[sin](http://stackoverflow.com/questions/1732348/regex-match-open-tags-except-xhtml-self-contained-tags).

It depends on wget, sed and [calibre's](http://calibre-ebook.com/)
conversion tools.  Many thanks to the [Javascript project name
generator](http://mrsharpoblunto.github.io/foswig.js/) for the name.

License:  [GPLv3](https://www.gnu.org/licenses/quick-guide-gplv3.html).
