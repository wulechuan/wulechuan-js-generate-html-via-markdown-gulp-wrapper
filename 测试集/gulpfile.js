const {
    src: gulpRead,
    dest: gulpWrite,
    parallel,
} = require('gulp')

const gulpMarkdownToHTML = require('..')





function generateHTMLViaReadMeEnUS() {
    return gulpRead('../文档集/说明书/ReadMe.en-US.md')
        .pipe(gulpMarkdownToHTML({
            // shouldLogVerbosely: true,
            conversionOptions: {
                articleTOCListTagNameIsUL: true,
            },
            manipulationsOverHTML: {
                htmlTagLanguage: 'en-US',
            },
        }))
        .pipe(gulpWrite('./诸测试之输出'))
}





function generateHTMLViaReadMeZhHansCN() {
    return gulpRead('../ReadMe.md')
        .pipe(gulpMarkdownToHTML({
            // shouldLogVerbosely: true,
            conversionOptions: {
                articleTOCListTagNameIsUL: true,
            },
        }))
        .pipe(gulpWrite('./诸测试之输出'))
}





module.exports.default = parallel(
    generateHTMLViaReadMeEnUS,
    generateHTMLViaReadMeZhHansCN
)
