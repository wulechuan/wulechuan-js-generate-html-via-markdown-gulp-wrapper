#

# 绝大多数情形下，
# 使用者仅需关注本文件的 PROCESS 一节，
# 而完全不必触碰 BEGIN 、 END 两节。
#
# 顺便提醒，即便故意将 PROCESS 一节写在 BEGIN 之前，或写在 END 之后，
# PowerShell 语言的原生机制也会
# 强制三者依照先 BEGIN ，而后 PROCESS ，最后 END 的顺序执行。
# 为便于修订本文件，遂故意令 PROCESS 一节在最顶部。









Param(
    [Alias('先删NM', '删_node_modules')]
    [switch]$安装之前应先删除旧有的_node_modules_文件夹,

    [Alias('先删PL', '删_package_lock_json')]
    [switch]$安装之前应先删除旧有的_package_lock_json_文件
)









PROCESS {
    [boolean]${script:应仅作仿真演练} = $false



    Try {

        # ───────────────────────────────────────────────────────────────
        #  1) 按需删除 node_modules      文件夹。
        #  2) 按需删除 package-lock.json 文件。
        #  3) 安装依赖包。
        # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
        #     顺便提醒，虽然一般而言 latest 版本应恰为最高版本，但并不确保。
        # ───────────────────────────────────────────────────────────────

        ${private:本产品所有的_npm_依赖包的安装版本配置总表} = @(
            @{
                # 取 '本产品拟囊括这些软件之整体或部分' ，
                # 说白了就是在安装这些依赖包时，会采取该命令：
                #     npm  install ，而不带 --save-dev 之参数。
                这批依赖包之依赖类别 = '本产品拟囊括这些软件之整体或部分'

                这批依赖包之安装版本配置集 = @{
                    # 为方便指称，本注释块中将 @wulechuan/cli-scripts--npm-project-helpers 中的 PowerShell 工具简称为 “【本程序】”。
                    #
                    # 配置示范集：
                    #
                    # 'chalk' = $null                             # 这意味着将安装 chalk 最晚的版本，即 chalk@latest 。
                    # 'chalk' = @($null)                          # 这意味着将安装 chalk 最晚的版本，即 chalk@latest 。
                    # 'chalk' = 'latest'                          # 这意味着将安装 chalk 最晚的版本，即 chalk@latest 。
                    #
                    # 'vue' = @('^2', '不打算迁移至 Vuejs 3。')   # 这意味着将安装 vue 的 `v2.x.x` 版，即 vue@^2 。
                    #
                    # 'vue' = @(  2,  '不打算迁移至 Vuejs 3。')   # 这意味着将安装 vue 的 `v2.x.x` 版，即 vue@^2 。
                    #                                             # 但像这样采用整型（Int32）而不是文本型（String）的写法并不好。
                    #                                             # 类似的，采用浮点型（Double）的写法（例如 2.6 ）也不好。
                    #                                             # 推荐总是采用文本型。例如 '2' 、'2.6' 。
                    #
                    # 'through2' = 0                              # 【本程序】对数字【零】做了特别关照，将其理解为 '0' 。npm 进而将其理解为 '^0.0.0' 。
                    #
                    # - - - 以下均是错误的写法 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
                    #
                    # 'glob' = ($null, '我想升级到最新版本。')    # 这样写，【本程序】将报错并退出！
                    #                                             # 原因：该写法并没有锁定 glob 的版本范围，确给出了所谓 “原因” 。
                    #                                             # 【本程序】要求不锁定版本范围则不应给出原因。如此严格的要求，是故意为之。
                    #                                             # 谨防出现 “原本想锁定版本范围却忘记配置版本” 的情形。
                    #
                    # 'glob' = 1.1.2                              # 这种写法不正确！但【本程序】不会报错！
                    #                                             # 因为，此处 1.1.2 的这种写法，
                    #                                             # PowerShell 不会将其理解为文本（string），
                    #                                             # 而是理解为无效的浮点数（Double），进而替换为 $null 值。
                    #                                             # 由是，【本程序】无从获得 '1.1.2' ，而只能获得 $null ，并自动将 $null 理解为 'latest' 。



                    # 如果 @wulechuan/cli-scripts--npm-project-helpers 工具集随附的 JavaScript 程序运行如期，
                    # 其将在此处插入当前 npm 项目的【产品级】依赖包的列表。    另，切勿改动该行。该行之部分文字是供 JavaScript 程序识别的特殊记号。

                    '@wulechuan/css-stylus-markdown-themes' = $null
                    '@wulechuan/generate-html-via-markdown' = $null
                    'plugin-error'                          = $null
                    'replace-ext'                           = $null
                    'through2'                              = $null
                }
            }



            @{
                # 取 '本产品仅会在研发阶段借助这些软件' ，
                # 说白了就是在安装这些依赖包时，会采取该命令：
                #     npm  install  --save-dev 。
                这批依赖包之依赖类别 = '本产品仅会在研发阶段借助这些软件'

                这批依赖包之安装版本配置集 = @{
                    # 如果 @wulechuan/cli-scripts--npm-project-helpers 工具集随附的 JavaScript 程序运行如期，
                    # 其将在此处插入当前 npm 项目的【研发级】依赖包的列表。    另，切勿改动该行。该行之部分文字是供 JavaScript 程序识别的特殊记号。

                    '@wulechuan/cli-scripts--git-push'            = $null
                    '@wulechuan/cli-scripts--npm-project-helpers' = $null


                    # ─────────────────────────────────────────────────────────────────────────────────
                    # 关于 chalk 
                    # ─────────────────────────────────────────────────────────────────────────────────
                    'chalk'                                       = @('^4', (@(
                        '2022-05-27 发现本工具在加载 @wulechuan/generate-html-via-markdown （称甲）时，'
                        '甲会在其尝试加载 chalk 时报错。但错误不易重现。有过若干次，却并非每每出现。'
                        '或许因为 npm 依赖包的安装顺序是不可预期的。'
                        "`n"
                        '已知 chalk 自第 5 版始，仅支持 ES Module 的加载方式。'
                        '而甲采用的较旧的 require 式写法加载各其依赖包，'
                        '故甲必须采用 chalk 4 或更早的版本。'
                        "`n"
                        '经反复实验观察'
                        "`n"
                        '- 凡遭遇故障时，本项目第一层 node_modules 文件夹内的 chalk 是 5.x 版。'
                        '  而甲内的 node_modules 是 4.x 版，这看似符合甲的要求。'
                        '  问题在于，遇到 require 语句时 node 不够可控，'
                        '  此种情形 node 会有些加载 chalk 5。于是出错。'
                        "`n"
                        '- 凡一切顺利时，本项目第一层 node_modules 文件夹内的 chalk 是 4.x 版。'
                        "`n"
                        '总结，npm 安排同名不同版的软件包时，顺序受外界不详因素的影响，给人以 “随机” 的感觉。'
                        '同时，node 调用某软件时，并不确保总是努力搜寻 npm 声明的正确的版本。'
                        '两者不知谁该承担责任。'
                        "`n"
                        '解决的办法是故意令本工具依赖 chalk 第 4 版，尽管本工具自己的代码并不直接引用 chalk 。'
                        '此种做法，作为 node 的一个外因，可有效干预安装 chalk 各的版本时的存储位置的安排。'
                        '迄今未知，尚未失效过。'
                    ) -join ''))
                    # ─────────────────────────────────────────────────────────────────────────────────

                    'eslint'                                      = $null
                    'fs-extra'                                    = $null
                    'gulp'                                        = $null
                }
            }
        )



        ${private:本产品所有的_npm_依赖包的安装版本配置总表} | Update-吴乐川更新当前_npm_项目的所有批次的依赖包 `
            -应仅作仿真演练:${script:应仅作仿真演练} `
            -安装之前应先删除旧有的_node_modules_文件夹:$安装之前应先删除旧有的_node_modules_文件夹 `
            -安装之前应先删除旧有的_package_lock_json_文件:$安装之前应先删除旧有的_package_lock_json_文件





        # ───────────────────────────────────────────────────────────────
        #  4) 更新与研发相关的数据库。
        # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
        #     例如： Browserslist:caniuse-lite
        # ───────────────────────────────────────────────────────────────

        Write-吴乐川管理某_npm_项目__打印提示语__更新与研发相关的数据库  -应仅作仿真演练:$应仅作仿真演练

        if ($true) {

            Write-Host  '暂无。'

        } else {

            # ───────────────────────────

            if ($false) {
                if (${script:应仅作仿真演练}) {
                    Write-Host  -NoNewline  "   【仿真演练】`n    "
                }

                Write-Host  'npx  browserslist@latest  --update-db'

                if (-not ${script:应仅作仿真演练}) {
                    npx  browserslist@latest  --update-db
                }

                Write-Host
            }

            # ───────────────────────────

        }

        Write-吴乐川管理某_npm_项目__打印提示语__更新与研发相关的数据库  -应仅作仿真演练:$应仅作仿真演练  -该信息系作为任务结束语





        # ───────────────────────────────────────────────────────────────
        #  5) 其他交代。
        # ───────────────────────────────────────────────────────────────

        Write-吴乐川管理某_npm_项目__打印提示语__其他交代  -应仅作仿真演练:$应仅作仿真演练

        if ($true) {

            Write-Host  '暂无。'

        } else {

            # 此处不妨做些关于当前 npm 项目的必要交代。例如注意事项、关键步骤等等。

            # Write-Host -F 'Yellow' '以下是一个 JavaScript 对象。'
            # Write-Host

            # Write-Host '{'

            # Write-吴乐川打印_JSON_键          -Indent 1 '爷爷' -ValueIsObject
            # Write-吴乐川打印_JSON_键          -Indent 2 '葫芦娃' -ValueIsObject
            # Write-Host
            # Write-吴乐川打印_JSON_注释_并换行  -Indent 3 '// 实验证明，截止 2022-05-26 ，'
            # Write-吴乐川打印_JSON_注释_并换行  -Indent 3 '// 大娃必须是力娃子。'
            # Write-吴乐川打印_JSON_键          -Indent 3 '大娃'
            # Write-吴乐川打印_JSON_值_文本型    -IsValueOfLastKey '力娃子'
            # Write-吴乐川打印_JSON_某字典结束    -Indent 2
            # Write-吴乐川打印_JSON_某字典结束    -Indent 1

            # Write-Host '}'

        }

        Write-吴乐川管理某_npm_项目__打印提示语__其他交代  -应仅作仿真演练:$应仅作仿真演练  -该信息系作为任务结束语

    } catch {

        ${private:RunTimeException} = $_

    }
}









BEGIN {
    # 该名为 BEGIN 之代码块故意安排在 PROCESS 代码块之后。但实际上 BEGIN 会在 PROCESS 之前运行。

    ${private:RunTimeException} = $null
    [string]${private:执行本命令前的工作路径} = "$PWD"

    Write-Host "`n【当下工作路径】：`n    '$PWD'"

    if ("$PWD" -match "\\用于研发阶段的命令行工具集\\PowerShell`$") {
        ${private:执行本命令前的工作路径} = "$PWD"
        Set-Location ..\..\ # 确保进程的当前路径为接受本工具集服务的 npm 包的根文件夹。
        Write-Host "`n【当下工作路径】临时变更为：`n    '$PWD'"
    }

    Write-Host
    Write-Host
    Write-Host



    [string]${script:吴乐川的模块的路径} = '.\node_modules\@wulechuan\cli-scripts--npm-project-helpers\源代码\发布的源代码\PowerShell'

    Import-Module  "${script:吴乐川的模块的路径}\吴乐川-打印-json.psm1"
    Import-Module  "${script:吴乐川的模块的路径}\吴乐川-数据处理-文本.psm1"
    Import-Module  "${script:吴乐川的模块的路径}\吴乐川-管理某-npm-项目的依赖包等资源.psm1"
}









END {
    if (${private:执行本命令前的工作路径} -and ("${private:执行本命令前的工作路径}" -ne "$PWD")) {
        Set-Location  "${private:执行本命令前的工作路径}"
        Write-Host "`n【当下工作路径】已复原。"
    }



    if (${private:RunTimeException}) {
        Write-Host
        Write-Host -F 'Red' '执行过程曾出错。'
        Write-Host
        throw ${private:RunTimeException}
    }
}
