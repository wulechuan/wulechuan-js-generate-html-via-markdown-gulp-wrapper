const {
    src: gulpRead,
    dest: gulpWrite,
    parallel,
} = require('gulp')

const gulpMarkdownToHTML = require('..')

function generateHTMLViaReadMeEnUS() {
    return gulpRead('../ReadMe.md')
        .pipe(gulpMarkdownToHTML({
            // shouldLogVerbosely: true,
            conversionOptions: {
                articleTOCListTagNameIsUL: true,
            },
            manipulationsOverHTML: {
                htmlTagLanguage: 'en-US',
            },
        }))
        .pipe(gulpWrite('./output'))
}

function generateHTMLViaReadMeZhHansCN() {
    return gulpRead('../ReadMe.zh-hans-CN.md')
        .pipe(gulpMarkdownToHTML({
            // shouldLogVerbosely: true,
            conversionOptions: {
                articleTOCListTagNameIsUL: true,
            },
        }))
        .pipe(gulpWrite('./output'))
}

module.exports.default = parallel(
    generateHTMLViaReadMeEnUS,
    generateHTMLViaReadMeZhHansCN,
)
