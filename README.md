# AtheyCreek.com

A [Symphony CMS](http://getsymphony.com/) implementation for Athey Creek Christian Fellowship.

- **Official URL**: [atheycreek.com](http://atheycreek.com)
- **Project Lead**: Bryn Ritchie ([bryn@atheycreek.com](mailto:bryn@atheycreek.com?Subject=Web Development Inquiry))

## Code Guide

The purpose of this section is to give a broad overview of the website code and provide necessary documentation for developers that are working on this project.

### Languages

Symphony is built on PHP with XSLT providing the templating language to provide views to work with data that is modeled in `Sections` and controlled via `Data Sources`.

On the front-end we are leveraging the following:

- [Grunt](http://gruntjs.com/): this powerful builder helps combine and minify LESS into CSS as well as concat and minify JS files
- [Bootstrap 2.3](http://getbootstrap.com/2.3.2/): the current version of this site is built on Bootstrap 2.3's LESS implementation, which is built via Grunt (see above)

### Templates

All of the XSL templates used to manipulate the `data-sources` are located in `workspace/assets/xsl`. Each template centers around a section of the site and they contain the logic used to manipulate the data passed from `Sections` to `Data Sources`.

### Data Sources

The `workspace/data-sources` directory houses all of the data that is used on the Athey Creek site. The vast majority are passed into a single page: `Home`. We rely on the `[Conditionalizer](http://symphonyextensions.com/extensions/conditionalizer/)` plugin to ensure that page loads times stay short by only loading the appropriate `Data Sources` on the needed pages.