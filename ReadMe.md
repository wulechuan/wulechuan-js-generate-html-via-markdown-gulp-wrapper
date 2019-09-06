<link rel="stylesheet" href="./dist/css/wulechuan-styles-for-html-via-markdown--vscode.default.min.css">

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

So please refer to the [ReadMe.md](https://github.com/wulechuan/wulechuan-generate-html-via-markdown/blob/master/ReadMe.md) there.


## Usage

### Example 1

```js
const gulp = require('gulp')
const gulpMarkdownToHTML = require('@wulechuan/gulp-markdown-to-html')
export function newnewnew() {
    return gulp.src('./my-first-markdown-article.md')
    .pipe(gulpMarkdownToHTML())
    .pipe(gulp.dest('./my-articles-folder'))
}
```


### Example 2

```js
const {
	src: gulpRead,
	dest: gulpWrite,
} = require('gulp')

const gulpMarkdownToHTML = require('@wulechuan/gulp-markdown-to-html')

export function newnewnew() {
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
        }
    }))
    .pipe(gulpWrite('./your/output/folder'))
}
```


## TODOS

Nothing at present.



## License

WTFPL

> NOTE:
>
> I'm not an expert about license types. So I temporarily use WTFPL. But I guess this type of license might conflict with the ones used by those npm packages I'm utilizing.
