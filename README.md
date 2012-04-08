# Tonic gem — add some tonus in development your gh-pages :)

### This is beta now

### Build Status ![http://travis-ci.org/gazay/gon](https://secure.travis-ci.org/gazay/tonic.png)

This gem supports [middleman](https://github.com/middleman/middleman)
and will support in near future [jekyll](https://github.com/mojombo/jekyll) for generate template of your site.

If you want to easily create custom gh-pages for your application,
and want to use for that sass-compass/haml/coffee/something

THIS GEM TOTALY FOR YOU


## Why?

Because make html as html is too mainstream. Now you should know all
benefits of using haml, coffee and sass. And of course other template engines for
other or the same purposes. You should know and I think you love it.

There a lot of cool static site generators, from jekyll to this one :)
But no one give to you so simple ui (maybe middleman, but tonic knows how to do gh-pages branch right;)

You can choose with what template you want to develop your site:
tonic, middleman or jekyll (jekyll support not ready yet)


## How?

This gem have two functions inside:

  1. tonic-template
  2. tonic for gh-pages

Tonic-template it is that thing for easy developing.
Tonic-template uses for it's work several gems, like template engines, rake and sprockets.
Sprockets make this template look like rails assets folder.

You don't need every time run some command in terminal or push somewhere.
You need just write `rake watch`

Tonic for gh-pages is simplier, because it uses only ruby-lang libraries like open3 and pathname and dependent on jekyll and middleman,
and it's general purpose - is create new branch `gh-pages`, init there choosen template and run bundler if it's needed.

### Using tonic for gh-pages

You should be in your repo, for which you want to create gh-pages.
You shouldn't have in this repo this branch already.
So you just run:

```bash
$ gem install tonic
$ tonic [middleman|jekyll]
```

Will be created branch gh-pages, then tonic checkout you there and remove from there all (not dot-) files.
Then it will copy choosen template to this branch and run bundle install if it's needed.

And you can work with this template.

When you want to push your gh-pages branch to github, just write:

```bash
$ tonic push
```

Or oldschool:

```bash
$ git push -f origin gh-pages
```

Example you can see on [gh-pages for tonic](http://gazay.github.com/tonic)

And what inside template in [gh-pages branch](https://github.com/gazay/tonic/tree/gh-pages)

### Using tonic-template

For create template for one-page static application you need to do this:

```bash
$ gem install tonic
$ tonic new my_app
```

This will create for you directory with template files, gemfile and rakefile. And it will run bundler for you.

Then you can do two things:

  1. build template files:

  ```bash
  bundle exec rake build
  ```

  2. watch your assets directory for rebuilding on changes:

  ```bash
  bundle exec rake watch
  ```

## What?

In tonic used next gems for make it work:

[rake](https://github.com/jimweirich/rake)

[bundler](https://github.com/carlhuda/bundler)

[uglifier](https://github.com/lautis/uglifier)

[sprockets](https://github.com/sstephenson/sprockets)

[haml](https://github.com/nex3/haml)

[compass](https://github.com/chriseppstein/compass)

[middleman](https://github.com/middleman/middleman)

[jekyll](https://github.com/mojombo/jekyll)

Lot of code for rakefile of template and for octocat in test page
I get from one-page project of my friend @ai [easings.net](https://github.com/ai/easings.net)

## Who?

I did it myself, but use some advices of people and code from their repos:

### Contributors

* @gazay

### A lot of thanks

* @ai for his almost ready template and cool 3d transformations in [easings.net](https://github.com/ai/easings.net)

* @defunkt with his [github-gem](https://github.com/defunkt/github-gem), which I plan to use in future for do things right
and from which I get Shell class for sh command

* @brainopia for style advices

## License

The MIT License

Copyright (c) 2012 gazay

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

