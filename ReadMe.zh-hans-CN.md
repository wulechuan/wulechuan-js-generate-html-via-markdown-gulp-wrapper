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


### 产品亮点

不须带任何参数，即可轻松获得一份华丽的 HTML 文档。其自带精美主题，宽窄屏全自适应排版。包含文章纲要列表，“返回顶部”按钮（实则链接）等等。

你亦可通过丰富的参数项，精准控制输出 HTML 之方方面面。从文章纲要列表到“返回顶部”按钮。甚至控制内嵌 CSS 和 Javascript 是否为压缩版本，亦有两个专门的选项。


### 内嵌样式

内嵌样式来源于本人创建和维护的另一项目，即《[@wulechuan/css-stylus-markdown-themes](https://www.npmjs.com/package/@wulechuan/css-stylus-markdown-themes)》。其文档中亦有若干截图，直观展示一篇文档在应用默认样式后之样貌。见 [该文档](https://github.com/wulechuan/wulechuan-themes-for-htmls-via-markdowns/blob/master/docs/refs/zh-hans-CN/application-examples.md)。


## 用法

### 示例 1

不带任何参数，使用默认配置。

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

通过参数项，精准控制输出的 HTML。

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
