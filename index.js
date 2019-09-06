const through         = require('through2')
const GulpPluginError = require('plugin-error')
const replaceFileExt  = require('replace-ext')

const markdownToHTMLConverter = require('@wulechuan/generate-html-via-markdown')

function createNewGulpError(rawError) {
    return new GulpPluginError('@wulechuan/gulp-markdown-to-html', rawError)
}

module.exports = function (options) {
    return through.obj(function (file, fileEncoding, callback) {

        if (file.isStream()) {
            return callback(createNewGulpError('Streaming is not supported.'))
        }

        if (file.isNull()) {
            return callback(null, file)
        }

        let htmlContent
        try {
            htmlContent = markdownToHTMLConverter(file.contents.toString(fileEncoding || 'utf-8'), options)
        } catch(error) {
            // delete error.input
            return callback(createNewGulpError(error))
        }

        file.path = replaceFileExt(file.path, '.html')
        file.contents = Buffer.from(htmlContent)

        return callback(null, file)
    })
}
