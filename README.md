# Tonic gem — add some tonus for your github pages

### This gem not ready yet! I'll tell you here with travis-ci, when you can try it.

### I tell you - this is pre-beta. There are no tests!!! Watch it but don't use it yet ;)

### Build Status ![http://travis-ci.org/gazay/gon](https://secure.travis-ci.org/gazay/tonic.png)

If you want to edit your github pages for your projects with Haml/Slim/Sass/Coffee - this gem for you

## An example of typical use

At first, if you don't want have mess with editing your gh-pages,
or you already have them and don't want to change something -
this gem not for you. Tell friends about it and forget about it until you change your mind.

You need to create github page for your gem/app/script. You had till today two options:

  1. You can push 'Autogenerate github page' button in admin area of your repo
  2. You can manualy create branch gh-pages, fill it with html content and push to github

Both of them very easy and in first option you can choose one of many beautiful themes for your page.
But if you want to change something in styles or html or js - you should write and edit files as is -
html in html, css in css, js in js.

## But we both know what we want!

We want to use all that sugar around this technologies. We want haml, we want sass and coffee.
And we don't want to create whole rake app manualy to make dreams true.

So I want to present you this gem. You should only install it:

```bash
$ gem install tonic
```

And then just two commands:

```bash
$ cd path/to/your/github/repo
$ tonic
```

This command will create for this git repo new branch gh-pages with tonic-template
and run `bundle install`.

Tonic-template contains inside directory assets, gemfile with required gems and rakefile.

## Rakefile contains two tasks: :build and :watch.

If you want just build your ready page in haml/sass/coffee from assets directory - run :build.

If you in development mode - run :watch and look at your files in public directory,
how they change when you change templates.
