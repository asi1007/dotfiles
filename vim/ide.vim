
let g:quickrun_config = {
\   "_" : {
\       "runner" : "vimproc",
\       "runner/vimproc/updatetime" : 20,
\       "outputter" : "multi:buffer:quickfix",
\       "outputter/buffer/split" : ":botright 4sp",
\       "hook/unite_quickfix/enable_failure" : 1,
\       "hook/close_unite_quickfix/enable_hook_loaded" : 1,
\       "hook/close_quickfix/enable_exit" : 1,
\       "hook/close_quickfix/enable_hook_loaded" : 1,
\       "hook/close_quickfix/enable_success" : 1,
\       "hook/close_buffer/enable_failure" : 1,
\       "hook/close_buffer/enable_empty_data" : 1,
\       "hook/shabadoubi_touch_henshin/enable" : 1,
\       "hook/shabadoubi_touch_henshin/wait" : 20,
\	"hook/echo/output_success" : "（＾ω＾U 三 U＾ω＾）",
\	"hook/echo/output_failure" : "(∪´;ﾟ;ω;ﾟ)･;'.､･;'.･;';ﾌﾞﾌｫ",
\       "hook/time/enable" : 1,
\   }
\}
