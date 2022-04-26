const {
    src: gulpRead,
    dest: gulpWrite,
    parallel,
} = require('gulp')

const gulpMarkdownToHTML = require('..')





function generateHTMLViaReadMeEnUS() {
    return gulpRead('../文档集/说明书/ReadMe.en-US.md')
        .pipe(gulpMarkdownToHTML({
            // 须在控制台打印详尽细节: true,

            将Markdown转换为HTML之阶段: {
                文章纲要列表应采用UL标签而非OL标签: true,
            },

            对HTML做进一步处理之阶段: {
                产出之HTML文件之HTML标签之语言属性之取值: 'en-US',
            },
        }))
        .pipe(gulpWrite('./诸测试之输出'))
}





function generateHTMLViaReadMeZhHansCN() {
    return gulpRead('../ReadMe.md')
        .pipe(gulpMarkdownToHTML({
            // 须在控制台打印详尽细节: true,

            将Markdown转换为HTML之阶段: {
                文章纲要列表应采用UL标签而非OL标签: true,
            },
        }))
        .pipe(gulpWrite('./诸测试之输出'))
}





module.exports.default = parallel(
    generateHTMLViaReadMeEnUS,
    generateHTMLViaReadMeZhHansCN
)
