# Tonic gem — add some tonus for your development :)

### This is beta now

### Build Status ![http://travis-ci.org/gazay/gon](https://secure.travis-ci.org/gazay/tonic.png)

If you want to create your simple static application,
and want to use for that sass-compass/haml/coffee/something
THIS GEM FOR YOU

If you want to easily create custom gh-pages for your application,
and again - want to use for that the same technologies
THIS GEM TOTALY FOR YOU

## Why?

Because make html as html is too mainstream. Now you should know all
benefits of using haml, coffee and sass. And of course other template engines for
other or the same purposes. You should know and I think you love it.

And what will you do if you need to create simple, one-page application?
With static html, with not too big js and styles?
Maybe I don't know something, but you sigh maybe about your
lovely haml/sass/coffee and go to do all this stuff like in nineteens.

Because for one single page you will not to run compass, compile each coffeescript and haml file.
You just sit and write pure html/css/js.

So I thought about it a little and made this gem.

Ar first it was gem just for create gh-pages branch with some content (because I'm too lazy sometimes).
But then I decided to do more - and now it will do all stuff for you. You just need write some nice code :)


## How?

This gem have two functions inside:

  1. tonic-template
  2. tonic for gh-pages

Tonic-template more important here, because it is that thing for easy developing!
Tonic-template uses for it's work several gems, like template engines, rake and sprockets.
Sprockets make this template look like rails assets folder.

You don't need every time run some command in terminal or push somewhere.
You need just write `rake watch`

Tonic for gh-pages is simplier, because it uses only ruby-lang libraries like open3 and pathname,
and it's general purpose - is create new branch `gh-pages`, copy there tonic-template and run bundler.

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

Later I will add comands with tonic, but now I tired :)
And I want to add comands to open needed files from terminal.

### Using tonic for gh-pages

You should be in your repo, for which you want to create gh-pages.
You shouldn't have in this repo this branch already.
So you just run:

```bash
$ gem install tonic
$ tonic
```

It will ask you - do you really want blahblahblah. You say `y` and there is it!
Will be created branch gh-pages, then you checkout there and remove from there all files.
Then tonic will copy tonic-template to this branch and run bundle install.

Then you just work with this template like with ordinary tonic-template.

When you want to push your gh-pages branch to github, just write:

```bash
$ tonic push
```

Or oldschool:

```bash
$ git push -f origin gh-pages
```

## What?

In template used next gems for make it work:

[rake](https://github.com/jimweirich/rake)
[bundler](https://github.com/carlhuda/bundler)
[uglifier](https://github.com/lautis/uglifier)
[sprockets](https://github.com/sstephenson/sprockets)
[haml](https://github.com/nex3/haml)
[compass](https://github.com/chriseppstein/compass)

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

