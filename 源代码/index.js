const through         = require('through2')
const GulpPluginError = require('plugin-error')
const replaceFileExt  = require('replace-ext')

const 将Markdown字符串转换为HTML字符串 = require('@wulechuan/generate-html-via-markdown')

/**
 * @param {Error | string} 原始的记载错误的对象
 */
function 构建Gulp生态专用的记载错误的对象_提及的插件名称为本工具(原始的记载错误的对象) {
    return new GulpPluginError('@wulechuan/gulp-markdown-to-html', 原始的记载错误的对象)
}

/** @type {import('..')} */
module.exports = function (将Markdown字符串转换为HTML字符串之转换器之配置项集) {
    return through.obj(function (file, fileEncoding, callback) {
        if (file.isStream()) {
            return callback(构建Gulp生态专用的记载错误的对象_提及的插件名称为本工具('Streaming is not supported.'))
        }

        if (file.isNull()) {
            return callback(null, file)
        }

        /** @type {string} */
        let 转换得到的HTML文件内容全文
        try {
            转换得到的HTML文件内容全文 = 将Markdown字符串转换为HTML字符串(
                file.contents.toString(fileEncoding || 'utf-8'),
                将Markdown字符串转换为HTML字符串之转换器之配置项集
            )
        } catch(error) {
            // delete error.input
            return callback(构建Gulp生态专用的记载错误的对象_提及的插件名称为本工具(error))
        }

        file.path = replaceFileExt(file.path, '.html')
        file.contents = Buffer.from(转换得到的HTML文件内容全文)

        return callback(null, file)
    })
}
