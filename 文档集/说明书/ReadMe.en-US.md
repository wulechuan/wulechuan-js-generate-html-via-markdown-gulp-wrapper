# Gulpjs Oriented Wrapper for Wulechuan's Tool for Generating HTMLs via Markdowns


<link rel="stylesheet" href="../../node_modules/@wulechuan/css-stylus-markdown-themes/源代码/发布的源代码/文章排版与配色方案集/层叠样式表/wulechuan-styles-for-html-via-markdown--vscode.default.min.css">



## Multilingual Editions of this Article

- [简体中文版文档](../../ReadMe.md)




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

### Built-in Themes

The CSS file for the built-in theming is from another NPM package of mine, named "[@wulechuan/css-stylus-markdown-themes](https://www.npmjs.com/package/@wulechuan/css-stylus-markdown-themes)".

See some pictures of an example article with 2 default themes (a light-colored one and a dark-colred one) applied [there](https://github.com/wulechuan/wulechuan-css-stylus-themes-for-htmls-via-markdowns/blob/master/%E6%96%87%E6%A1%A3%E9%9B%86/%E8%AF%B4%E6%98%8E%E4%B9%A6/en-US/application-examples.md).




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
            '将Markdown转换为HTML之阶段': {
                '文章纲要列表应采用UL标签而非OL标签': true,

                '针对MarkdownIt生态之诸工具的层叠样式表类名集': {
                    '用于各级标题之超链接A标签的': undefined,
                },
            },

            '对HTML做进一步处理之阶段': {
                '不应注入用于返回文章起始之按钮': true,
                '不应采用任何由本工具内建之层叠样式表': false,
                '产出之HTML文件之HTML标签之语言属性之取值': 'en-US',
            },

            '对本工具现成提供的文章纲要做以下配置': {
                '为求文章纲要列表简洁明了故意仅显示两层条目以至于较深层级条目形同作废': true,

                // 注意： 【呈现文章纲要列表面板】与【展开文章纲要列表的某一条目】并非一回事。
                '浏览器打开HTML文章最初之时文章纲要列表中凡层级深于该值之条目均应收叠': 1,
                '浏览器打开HTML文章最初之时若浏览器窗口足够宽大则直接展开文章纲要列表之面板': true,
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
