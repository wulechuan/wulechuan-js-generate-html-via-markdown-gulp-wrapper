<link rel="stylesheet" href="./dist/css/wulechuan-styles-for-html-via-markdown--vscode.default.min.css">

# 用于吴乐川将 MarkDown 代码转换为 HTML 代码的工具的针对 Gulpjs 工具链的“包裹”程序


## Multilingual Editions of this Article

- [English version of this ReadMe](./ReadMe.md)




## NPM 页

<dl>
<dt>NPM 包名</dt>
<dd>

[@wulechuan/gulp-markdown-to-html](https://www.npmjs.com/package/@wulechuan/gulp-markdown-to-html)

</dd>
<dt>作者</dt>
<dd><p>南昌吴乐川</p></dd>
</dl>





## 简介

本工具系对本人另一程序“[@wulechuan/generate-html-via-markdown](https://www.npmjs.com/package/@wulechuan/generate-html-via-markdown)”的“包裹”版本，以令其功能适用于 Gulpjs 工具链。

使用细则请参阅[该文档](https://github.com/wulechuan/wulechuan-generate-html-via-markdown/blob/master/ReadMe.zh-hans-CN.md)。



## 用法

### 示例 1

```js
const gulp = require('gulp')
const gulpMarkdownToHTML = require('@wulechuan/gulp-markdown-to-html')
module.exports = function myGulpTask1() {
    return gulp.src('./我的第一篇markdown文章.md')
    .pipe(gulpMarkdownToHTML())
    .pipe(gulp.dest('./我的文库'))
}
```


### 示例 2

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
        }
    }))
    .pipe(gulpWrite('./your/output/folder'))
}
```



## 未来计划

暂无。


## 许可证类型

WTFPL

> 注意：
>
> 我未研究过许可证的约束。因此姑且声明为 WTFPL 类型。但实际上该许可证类型可能与我采用的开源模块有冲突。

