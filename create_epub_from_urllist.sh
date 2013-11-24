#!/bin/bash

# Hugh Brown
# Nov 2, 2006
#
# bash_template.sh:  A Small but Useful(tm) utility to foo the right bar.
#
# Copyright (C) 2012 Hugh Brown
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 59 Temple Place - Suite 330,
# Boston, MA 02111-1307, USA.
#
# $Id$
# $URL$

# Much help with parsing args from:
# http://rsalveti.wordpress.com/2007/04/03/bash-parsing-arguments-with-getopts/

usage() {
    cat << EOF
$0: A Small but Useful(tm) utility to foo the right bar.

usage: $0 options

OPTIONS:

   -u [arg]	URL list, one per line.
   -t [title]	Title.
   -v		Verbose.
   -h		This helpful message.
EOF
    exit 1
}

complain_and_die() {
    echo $*
    exit 2
}

URLLIST=
TITLE=
VERBOSE=
while getopts "u:t:vh" OPTION ; do
     case $OPTION in
         u) URLLIST=$OPTARG ;;
         t) TITLE=$OPTARG ;;
         v) VERBOSE=1 ;;
         h) usage ;;
         ?) usage ;;
     esac
done

# Check for mandatory args
if [ -z $URLLIST ]; then
     usage
fi
if [ -z $TITLE ]; then
     usage
fi

chapter=1
OUTPUT=$(echo $TITLE | tr " " "_")

grep ^http $URLLIST | while read url ; do
    output=$(printf "chapter_%02d.html" $chapter)
    wget -O $output $url
    chapter=$(expr $chapter + 1)
done
(echo "<html><head><title>Devops Weekly</title></head><body>"; sed -ne'/<body/,/<\/body>/p' chapter_??.html | sed -e's|^.*<body.*$$|<h1>|i ; s|^.*</body.*$$|</h1>|i'; echo "</body></html>") > ${OUTPUT}.html
	ebook-convert ${OUTPUT}.html ${OUTPUT}.epub  --output-profile=kobo --title="$TITLE" --authors="A Cast of Thousands" --cover="devops_weekly_cover.jpg" --preserve-cover-aspect-ratio
	ebook-viewer ${OUTPUT}.epub
