# Gulpjs Oriented Wrapper for Wulechuan's Tool for Generating HTMLs via Markdowns

## Multilingual Editions of this Article

- [简体中文版文档](./ReadMe.zh-hans-CN.md)




## NPM Page

<dl>
<dt>Package Name</dt>
<dd>

[@wulechuan/gulp-markdown-to-html](https://www.npmjs.com/package/@wulechuan/gulp-markdown-to-html)

</dd>
<dt>Author</dt>
<dd><p>wulechuan (南昌吴乐川)</p></dd>
</dl>




## Introduction

This is a gulp oriented wrapper for "[@wulechuan/generate-html-via-markdown](https://www.npmjs.com/package/@wulechuan/generate-html-via-markdown)".


### Highlights

No need to provide literally anything, you get a full featured HTML. Including gorgeous themes, and responsive layout fitting all sizes of screens, and TOC with smart behaviours, and the pretty "back-to-top" button(an anchor in fact).

There're plenty of options which provide full controls over the ouptut HTML contents. Whether the TOC exists? Whether the "back-to-top" button exists? Whether the embedded CSS codes are minified or not? What about the Javascript codes, should they be minified? Everything is under your controls.

### About the Built-in Themes

The CSS file for the built-in theming is from another NPM package of mine, named "[@wulechuan/css-stylus-markdown-themes](https://www.npmjs.com/package/@wulechuan/css-stylus-markdown-themes)".

See some pictures of an example article with 2 default themes (a light-colored one and a dark-colred one) applied [there](https://github.com/wulechuan/wulechuan-themes-for-htmls-via-markdowns/blob/master/docs/refs/en-US/application-examples.md).

<!-- 
> IMPORTANT:
>
> This package "@wulechuan/generate-html-via-markdown"(package A) peer-depends upon the css theming pacakge(package B) said above.
> This means when installing pacakge A, npm will **NOT** automatically install package B as well, but rather print some warning messages after installation of package A. **YOU MUST INSTALL PACKAGE B MANUALLY YOURSELF**.
 -->


## Usage

As said above, this package utilizes "@wulechuan/generate-html-via-markdown". And this package itself has no extra APIs upon that wrapped package.

So, for the details of how to use this package, please refer to the full documentation of [the APIs of @wulechuan/generate-html-via-markdown](https://www.npmjs.com/package/@wulechuan/generate-html-via-markdown#api).


### Examples

#### Example 1

```js
const gulp = require('gulp')
const gulpMarkdownToHTML = require('@wulechuan/gulp-markdown-to-html')
module.exports = function myGulpTask1() {
    return gulp.src('./my-first-markdown-article.md')
    .pipe(gulpMarkdownToHTML())
    .pipe(gulp.dest('./my-articles-folder'))
}
```


#### Example 2

```js
const {
    src: gulpRead,
    dest: gulpWrite,
} = require('gulp')

const gulpMarkdownToHTML = require('@wulechuan/gulp-markdown-to-html')

module.exports = function myGulpTask2() {
    return gulpRead('./your/folder/of/markdowns/**/*.md')
    .pipe(gulpMarkdownToHTML({
        // shouldLogVerbosely: true,
        conversionOptions: {
            cssClassNameOfHeadingPermanentLinks: undefined,
            articleTOCListTagNameIsUL: true,
        },
        manipulationsOverHTML: {
            shouldNotInsertBackToTopAnchor: true,
            shouldNotUseInternalCSSThemingFiles: false,
            htmlTagLanguage: 'en-US',
        },
        behaviousOfBuiltInTOC: {
            shouldShowOnlyTwoLevelsOfTOCItemsAtMost: true, // So that the TOC is more concise and clean.
            atBeginingShouldCollapseAllTOCItemsOfLevelsGreaterThan: 1,
            atBeginingShouldExpandTOCWhenWindowsIsWideEnough: true,
        },
    }))
    .pipe(gulpWrite('./your/output/folder'))
}
```






## TODOs

Nothing at present.



## License

WTFPL

> NOTE:
>
> I'm not an expert about license types. So I temporarily use WTFPL. But I guess this type of license might conflict with the ones used by those npm packages I'm utilizing.
