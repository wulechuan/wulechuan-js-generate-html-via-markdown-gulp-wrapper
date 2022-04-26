<link rel="stylesheet" href="./node_modules/@wulechuan/css-stylus-markdown-themes/源代码/发布的源代码/文章排版与配色方案集/层叠样式表/wulechuan-styles-for-html-via-markdown--vscode.default.min.css">

# 用于吴乐川将 MarkDown 代码转换为 HTML 代码的工具的针对 Gulpjs 工具链的“包裹”程序


## Multilingual Editions of this Article

- [English version of this ReadMe](./文档集/说明书/ReadMe.en-US.md)




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

本工具系对本人另一程序“[@wulechuan/generate-html-via-markdown](https://github.com/wulechuan/wulechuan-js-generate-html-via-markdown/blob/master/ReadMe.md)”的“包裹”版本，以令其功能适用于 Gulpjs 工具链。


## 源代码仓库

| <span style="display:inline-block;width:10em;">提供仓库服务之组织</span> | <span style="display:inline-block;width:9em;">仓库组织之国别</span> | 仓库地址 |
| ------------- | :----------: | ------- |
| 码云           | 中华人民共和国 | [https://gitee.com/nanchang-wulechuan/wulechuan-js-generate-html-via-markdown-gulp-wrapper.git](https://gitee.com/nanchang-wulechuan/wulechuan-js-generate-html-via-markdown-gulp-wrapper.git) |
| 阿里云之代码仓库 | 中华人民共和国 | [https://code.aliyun.com/wulechuan/wulechuan-generate-html-via-markdown-gulp-wrapper.git](https://code.aliyun.com/wulechuan/wulechuan-generate-html-via-markdown-gulp-wrapper.git) |
| GitHub         | 美           | [https://github.com/wulechuan/wulechuan-js-generate-html-via-markdown-gulp-wrapper.git](https://github.com/wulechuan/wulechuan-js-generate-html-via-markdown-gulp-wrapper.git) |



### 产品亮点

不须带任何参数，即可轻松获得一份华丽的 HTML 文档。其自带精美主题，宽窄屏全自适应排版。包含文章纲要列表，“返回顶部”按钮（实则链接）等等。

你亦可通过丰富的参数项，精准控制输出 HTML 之方方面面。从文章纲要列表到“返回顶部”按钮。甚至控制内嵌 CSS 和 Javascript 是否为压缩版本，亦有两个专门的选项。


### 内嵌样式

产生的 HTML 文章中，内嵌样式来源于本人创建和维护的另一项目，即《[@wulechuan/css-stylus-markdown-themes](https://www.npmjs.com/package/@wulechuan/css-stylus-markdown-themes)》，暂称“项目甲”，亦称“**工具甲**”。

工具甲之文档集中有若干截图，直观展示一篇文档在应用上述项目自带的两种默认主题样式后之样貌。这两种主题为浅色，另一为深色。见《[关于文章排版与配色效果示例集的说明](https://gitee.com/nanchang-wulechuan/wulechuan-css-stylus-themes-for-htmls-via-markdowns/blob/master/%E6%96%87%E6%A1%A3%E9%9B%86/%E8%AF%B4%E6%98%8E%E4%B9%A6/%E6%B1%89%E8%AF%AD/%E5%85%B3%E4%BA%8E%E6%96%87%E7%AB%A0%E6%8E%92%E7%89%88%E4%B8%8E%E9%85%8D%E8%89%B2%E6%95%88%E6%9E%9C%E7%A4%BA%E4%BE%8B%E9%9B%86%E7%9A%84%E8%AF%B4%E6%98%8E.md)》。

## 用法

如前所述，本 NPM 包在内部调用另一包（即 “@wulechuan/generate-html-via-markdown”）之功能。并且，本 NPM 包本身并未设计额外的 API（应用编程接口）。因此，要了解使用细节，请参阅完整的《[@wulechuan/generate-html-via-markdown 之 API](https://github.com/wulechuan/wulechuan-js-generate-html-via-markdown/blob/HEAD/ReadMe.md#api)》。



### 示例若干

#### 示例 1

处理假想存在的“我的第一篇markdown文章.md”，不带任何参数，使用默认配置。

```js
const gulp = require('gulp')
const gulpMarkdownToHTML = require('@wulechuan/gulp-markdown-to-html')
module.exports = function myGulpTask1() {
    return gulp.src('./我的第一篇markdown文章.md')
    .pipe(gulpMarkdownToHTML()) // 请留意这一行代码。
    .pipe(gulp.dest('./我的文库'))
}
```


#### 示例 2

处理一批假想存在的“`.md`”文件，并通过参数项精准控制输出的 HTML。

```js
const {
    src: gulpRead,
    dest: gulpWrite,
} = require('gulp')

const gulpMarkdownToHTML = require('@wulechuan/gulp-markdown-to-html')

module.exports = function myGulpTask2() {
    return gulpRead('./在你的/计算机中的/某个文件夹内的/文集/**/*.md')
        .pipe(gulpMarkdownToHTML({ // 请留意这一行代码。
            将Markdown转换为HTML之阶段: {
                文章纲要列表应采用UL标签而非OL标签: true,

                针对MarkdownIt生态之诸工具的层叠样式表类名集: {
                    用于各级标题之超链接A标签的: undefined,
                },
            },

            对HTML做进一步处理之阶段: {
                不应注入用于返回文章起始之按钮: true,
                不应采用任何由本工具内建之层叠样式表: false,
                产出之HTML文件之HTML标签之语言属性之取值: 'en-US',
            },

            对本工具现成提供的文章纲要做以下配置: {
                为求文章纲要列表简洁明了故意仅显示两层条目以至于较深层级条目形同作废: true,

                // 注意： 【呈现文章纲要列表面板】与【展开文章纲要列表的某一条目】并非一回事。
                浏览器打开HTML文章最初之时文章纲要列表中凡层级深于该值之条目均应收叠: 1,
                浏览器打开HTML文章最初之时若浏览器窗口足够宽大则直接展开文章纲要列表之面板: true,
            },
        }))
        .pipe(gulpWrite('./在你的/计算机中的/另一个文件夹'))
}
```




## 未来计划

暂无。


## 许可证类型

WTFPL

> ### 注意
>
> 我未研究过许可证的约束。因此姑且声明为 WTFPL 类型。但实际上该许可证类型可能与我采用的开源模块有冲突。

