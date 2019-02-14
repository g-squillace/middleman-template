# Middleman Template

The base Middleman application used at [cantierecreativo], ready to deploy
to [Netlify].

[cantierecreativo]: https://cantierecreativo.net/
[Netlify]: https://www.netlify.com/

## Requirements

This project requires [Node.js](https://nodejs.org/) (v9.3.0) with 
[yarn](https://yarnpkg.com/) and [Ruby](https://ruby-lang.org) (v2.4.3)

## Usage

1. Install or set Ruby (2.4.3) with RBENV:

    ```
    rbenv install/set 2.4.3
    ```

2. Install or use Middleman gem:

    ```
    gem install middleman
    ```

3. Install or set Node (9.3.0) with NVM:

    ```
    nvm install/use 9.3.0
    ```

4. Then run:

    ```
    middleman init project -T=cantierecreativo/middleman-template
    ```

## Configuration

The template init scripts ask you:

- Languages string (it,en)
- DATO API read only
- Base URL of site (https://sitedomain.ext)
- Remote git repository to store ORIGIN
- Remote git repository to store PRODUCTION and Netlify buildable files

After this questions, the init script install all dependencies and create
complete directory site.

You sould change the default data into `data/config.json` and create the proxy
routing for the new site.

The final directory structure is:

```
project/
+-- .gitignore
+-- Gemfile
+-- Gemfile.lock
+-- config.rb
+-- package.json
+-- webpack.config.js
+-- yarn.lock
+-- config
|   +-- i18n-tasks.yml
+-- data
|   +-- config.json
+-- locales
|   +-- it.yml
|   +-- en.yml
+-- source
    +-- images/
    +-- fonts/
    +-- localizable/
    |   +-- index.html.slim
    +-- partials/
    +-- templates
    |   +-- browserconfig.xml.erb
    |   +-- redirects.txt.erb
    |   +-- site.webmanifest.erb
    |   +-- contact_page.html.slim
    +-- 404.html.slim
    +-- index.html.erb
    +-- javascripts
    ¦   +-- index.js
    +-- layouts
    ¦   +-- layout.slim
    +-- stylesheets
        +-- _application.sass
```

To the list of helpers in the system read [HELPERS.md](HELPERS.md)
To the example of code and functions (JS and CSS) that template expose read [EXAMPLE.md](EXAMPLE.md)

## Features and Tools

This template comes with the following features and tools:

- [middleman-dato]: An extension for connect with DatoCMS.
- [middleman-svg]: An extension for inlining SVGs in your views.
- [middleman-minify-html]: Minifies whitespace around HTML when the site is
  built.
- [middleman-search_engine_sitemap]: An extension to manage sitemap.
- [Sass]: CSS pre-processor.
- [Slim]: Templating engine to reduce the syntax to the essential parts.

[middleman-dato]: https://github.com/datocms/middleman-dato
[middleman-svg]: https://github.com/cantierecreativo/middleman-svg
[middleman-minify-html]: https://github.com/middleman/middleman-minify-html
[middleman-search_engine_sitemap]: https://github.com/Aupajo/middleman-search_engine_sitemap
[Sass]: https://github.com/sass/sass
[Slim]: https://github.com/slim-template/slim


## License

Copyright © 2019 CantiereCreativo. This is free software, and may
be redistributed under the terms specified in the [LICENSE] file.

[license]: LICENSE.md
