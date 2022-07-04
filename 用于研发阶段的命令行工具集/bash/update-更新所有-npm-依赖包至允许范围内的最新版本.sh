#!/bin/bash

# 在采用本工具集的其他 npm 项目中，均应这样写：
__wulechuan_temporary_var___source_common_path__='./node_modules/@wulechuan/cli-scripts--npm-project-helpers'





source  "${__wulechuan_temporary_var___source_common_path__}/源代码/发布的源代码/bash/吴乐川-针对命令与函数的辅助工具集.sh"
source  "${__wulechuan_temporary_var___source_common_path__}/源代码/发布的源代码/bash/吴乐川-数据处理-文本.sh"
source  "${__wulechuan_temporary_var___source_common_path__}/源代码/发布的源代码/bash/吴乐川-打印-json.sh"
source  "${__wulechuan_temporary_var___source_common_path__}/源代码/发布的源代码/bash/吴乐川-管理某-npm-项目的依赖包等资源.sh"





function 完整流程 {
    local BY_DEFAULT__SHOULD_DRY_RUN='false'





    local ShouldDryRun
    local NpmArguments

    local ArgumentConfigsArray=(
        # 以下是本函数接受并主动存放在变量中的参数之列表。
        #  命令行参数名                                         | 变量名                            | 取值之类型    | 默认值
        # ---------------------------------------------------------------------------------------------------------------------------------------------------------------
        "--应仅作仿真演练                                       | ShouldDryRun                     | 标准类型_布尔 | ${BY_DEFAULT__SHOULD_DRY_RUN}"
        "--npm-args                                           | NpmArguments                     | 标准类型_文本 | " # --foreground-scripts
    )

    # 以下是本函数接受的，但并不存放在变量中的参数之列表。这些参数的值会直接传递到内层其它函数。
    #   --在安装诸依赖包之前应先删除旧有的_node_modules_文件夹        标准类型_布尔
    #   --在安装诸依赖包之前应先删除旧有的_package-lock点json_文件    标准类型_布尔



    # ------------- 开始 -------------

    local LastTaskReturnCode

    Read-吴乐川读取并处理某函数的参数表  --调试功能之级别 0  "$@"
    LastTaskReturnCode=$?; if [ $LastTaskReturnCode -ne 0 ]; then return $LastTaskReturnCode; fi





    # ────────────────────────────────────────────────────────────────
    #  1) 安装【产品级】和【研发级】依赖包。
    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    #     顺便提醒，虽然一般而言 latest 版本应恰为最高版本，但并不确保。
    # ────────────────────────────────────────────────────────────────

    # 使用示范：
    #
    # 注：
    #     Bash 工具 `Update-吴乐川更新当前_npm_项目的所有依赖包` 的参数 `--内容分割记号` 是可省略的。省略时，采取默认值 |::| 。
    #     但本工具集的 JavaScript 工具故意将该参数配置成了 |:| ，而不是默认值 |::| 。此举是作者吴乐川随意为之，无必要性。
    #
    # Update-吴乐川更新当前_npm_项目的所有依赖包 \
    #     --某产品级依赖包之版本配置 '@wulechuan/text-basic-typography   |::|   null' \
    #     --某产品级依赖包之版本配置 'chalk                              |::|   null' \
    #     --某产品级依赖包之版本配置 'fs-extra                           |::|   null' \
    #     --某产品级依赖包之版本配置 'jsonc-parser                       |::|   null' \
    #     --某研发级依赖包之版本配置 '@wulechuan/cli-scripts--git-push   |::|   null' \
    #     --某研发级依赖包之版本配置 'eslint                             |::|   null' \
    #     --NPM安装依赖包时须额外带上的参数序列="$NpmArguments" \
    #     --应仅作仿真演练 "$ShouldDryRun"

    local versionLockReason_chalk=''
    versionLockReason_chalk="${versionLockReason_chalk}2022 年 5 月 27 日，发现本工具在加载 @wulechuan/generate-html-via-markdown （称甲）时，"
    versionLockReason_chalk="${versionLockReason_chalk}甲会在其尝试加载 chalk 时报错。但错误不易重现。有过若干次，却并非每每出现。"
    versionLockReason_chalk="${versionLockReason_chalk}或许因为 npm 依赖包的安装顺序是不可预期的。"
    versionLockReason_chalk="${versionLockReason_chalk}\\n"
    versionLockReason_chalk="${versionLockReason_chalk}已知 chalk 自第 5 版始，仅支持 ES Module 的加载方式。"
    versionLockReason_chalk="${versionLockReason_chalk}而甲采用的较旧的 require 式写法加载各其依赖包，"
    versionLockReason_chalk="${versionLockReason_chalk}故甲必须采用 chalk 4 或更早的版本。"
    versionLockReason_chalk="${versionLockReason_chalk}\\n"
    versionLockReason_chalk="${versionLockReason_chalk}经反复实验观察"
    versionLockReason_chalk="${versionLockReason_chalk}\\n"
    versionLockReason_chalk="${versionLockReason_chalk}- 凡遭遇故障时，本项目第一层 node_modules 文件夹内的 chalk 是 5.x 版。"
    versionLockReason_chalk="${versionLockReason_chalk}  而甲内的 node_modules 是 4.x 版，这看似符合甲的要求。"
    versionLockReason_chalk="${versionLockReason_chalk}  问题在于，遇到 require 语句时 node 不够可控，"
    versionLockReason_chalk="${versionLockReason_chalk}  此种情形 node 会优先加载 chalk 5。于是出错。"
    versionLockReason_chalk="${versionLockReason_chalk}\\n"
    versionLockReason_chalk="${versionLockReason_chalk}- 凡一切顺利时，本项目第一层 node_modules 文件夹内的 chalk 是 4.x 版。"
    versionLockReason_chalk="${versionLockReason_chalk}\\n"
    versionLockReason_chalk="${versionLockReason_chalk}总结，npm 安排同名不同版的软件包时，顺序受外界不详因素的影响，给人以 “随机” 的感觉。"
    versionLockReason_chalk="${versionLockReason_chalk}同时，node 调用某软件时，并不确保总是努力搜寻 npm 声明的正确的版本。"
    versionLockReason_chalk="${versionLockReason_chalk}两者不知谁该承担责任。"
    versionLockReason_chalk="${versionLockReason_chalk}\\n"
    versionLockReason_chalk="${versionLockReason_chalk}解决的办法是故意令本工具依赖 chalk 第 4 版，尽管本工具自己的代码并不直接引用 chalk 。"
    versionLockReason_chalk="${versionLockReason_chalk}此种做法，作为 node 的一个外因，可有效干预安装 chalk 各的版本时的存储位置的安排。"
    versionLockReason_chalk="${versionLockReason_chalk}迄今为止，尚未失效过。"

    # 如果 @wulechuan/cli-scripts--npm-project-helpers 工具集随附的 JavaScript 程序运行如期，
    # 其将在此后插入当前 npm 项目的依赖包之列表。    另，切勿改动该行。该行之部分文字是供 JavaScript 程序识别的特殊记号。

    Update-吴乐川更新当前_npm_项目的所有依赖包 \
        --某产品级依赖包之版本配置 "      @wulechuan/css-stylus-markdown-themes   |:|   latest   |:|" \
        --某产品级依赖包之版本配置 "      @wulechuan/generate-html-via-markdown   |:|   latest   |:|" \
        --某产品级依赖包之版本配置 "                               plugin-error   |:|   latest   |:|" \
        --某产品级依赖包之版本配置 "                                replace-ext   |:|   latest   |:|" \
        --某产品级依赖包之版本配置 "                                   through2   |:|   latest   |:|" \
        --某研发级依赖包之版本配置 "           @wulechuan/cli-scripts--git-push   |:|   latest   |:|" \
        --某研发级依赖包之版本配置 "@wulechuan/cli-scripts--npm-project-helpers   |:|   latest   |:|" \
        --某研发级依赖包之版本配置 "                                      chalk   |:|   ^4       |:|    ${versionLockReason_chalk}" \
        --某研发级依赖包之版本配置 "                                     eslint   |:|   latest   |:|" \
        --某研发级依赖包之版本配置 "                                   fs-extra   |:|   latest   |:|" \
        --某研发级依赖包之版本配置 "                                       gulp   |:|   latest   |:|" \
        --内容分割记号='|:|' \
        --NPM安装依赖包时须额外带上的参数序列="$NpmArguments" \
        --调试功能之级别 0 \
        --应仅作仿真演练 false

    # 如果 @wulechuan/cli-scripts--npm-project-helpers 工具集随附的 JavaScript 程序运行如期，
    # 其将在此前插入当前 npm 项目的依赖包之列表。    另，切勿改动该行。该行之部分文字是供 JavaScript 程序识别的特殊记号。

    LastTaskReturnCode=$?; if [ $LastTaskReturnCode -ne 0 ]; then return $LastTaskReturnCode; fi







    # ────────────────────────────────────────────────────────────────
    #  2) 更新与研发相关的数据库。
    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    #     例如： Browserslist:caniuse-lite
    # ────────────────────────────────────────────────────────────────

    Write-吴乐川管理某_npm_项目__打印提示语__更新与研发相关的数据库  --应仅作仿真演练 $ShouldDryRun

    if true; then

        echo  '暂无。'

    else

        # ──────────────────────────────────────────────────────

        :        # 当本 else 语句块中没有其它语句时，这句必须存在。

        # ──────────────────────────────────────────────────────

        if false; then
            if [ "$ShouldDryRun" == true ]; then
                echo  -en  "   \e[0;33m【仿真演练】\e[0;0m\n    "
            fi

            echo  'npx  browserslist@latest  --update-db'

            if [ "$ShouldDryRun" == false ]; then
                npx  browserslist@latest  --update-db
            fi

            echo
        fi

        # ──────────────────────────────────────────────────────

    fi

    Write-吴乐川管理某_npm_项目__打印提示语__更新与研发相关的数据库  --应仅作仿真演练 $ShouldDryRun  --系作为该任务之结束提示语







    # ────────────────────────────────────────────────────────────────
    #  3) 其他交代。
    # ────────────────────────────────────────────────────────────────

    Write-吴乐川管理某_npm_项目__打印提示语__其他交代  --应仅作仿真演练 $ShouldDryRun

    if true; then

        echo  '暂无。'

    else

        # ──────────────────────────────────────────────────────
        # 此处不妨做些关于当前 npm 项目的必要交代。
        # 例如注意事项、关键步骤等等。
        # ──────────────────────────────────────────────────────

        :        # 当本 else 语句块中没有其它语句时，这句必须存在。

        # ──────────────────────────────────────────────────────

        # echo -e "\e[33m以下是一个 JavaScript 对象。\e[0;0m"
        # echo
        # echo '{'

        # Write-吴乐川打印_JSON_键          -Indent 1 '爷爷' -ValueIsObject
        # Write-吴乐川打印_JSON_键          -Indent 2 '葫芦娃' -ValueIsObject
        # echo
        # Write-吴乐川打印_JSON_注释_并换行  -Indent 3 '// 实验证明，截止 2022-05-26 ，'
        # Write-吴乐川打印_JSON_注释_并换行  -Indent 3 '// 大娃必须是力娃子。'
        # Write-吴乐川打印_JSON_键          -Indent 3 '大娃'
        # Write-吴乐川打印_JSON_值_文本型    -IsValueOfLastKey '力娃子'
        # Write-吴乐川打印_JSON_某字典结束    -Indent 2
        # Write-吴乐川打印_JSON_某字典结束    -Indent 1

        # echo '}'

        # ──────────────────────────────────────────────────────

    fi

    Write-吴乐川管理某_npm_项目__打印提示语__其他交代  --应仅作仿真演练 $ShouldDryRun  --系作为该任务之结束提示语
}





完整流程  "$@"

__wulechuan_temporary_var___exit_code__exception_code__=$?
if [ $__wulechuan_temporary_var___exit_code__exception_code__ -ne 0 ]; then
    echo  -e  "\e[0;31m──────────────────────── \e[0;0m"
    echo  -e  "\e[0;31m程序异常结束代码： \e[0;33m${__wulechuan_temporary_var___exit_code__exception_code__} \e[0;0m"
    echo  -e  "\e[0;31m──────────────────────── \e[0;0m\n　"
fi

unset -f 完整流程
unset __wulechuan_temporary_var___source_common_path__

return $__wulechuan_temporary_var___exit_code__exception_code__
