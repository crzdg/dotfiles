-- credits to https://github.com/furgerf/dotfiles/blob/master/vim/ftplugin/python.vim
vim.cmd[[
    let test#python#pytest#executable = 'python3 -m pytest'
    let test#python#runner = 'pytest'
    let test#python#pytest#options = '--ignore=deps --exitfirst --failed-first --new-first --capture=sys -vv'
    let test#python#pytest#file_pattern = '\v(test_[^/]+|[^/]+_tests)\.py$'
    function! DockerTransform(cmd) abort
        return ' docker-compose -f docker-compose.test.yml run --rm tests ' . a:cmd
    endfunction
    let g:test#custom_transformations = {'docker': function('DockerTransform')}
    let g:test#transformation = 'docker'
    function! MyFloaterm(cmd)
        execute 'FloatermNew --autoclose=1 --width=0.9 --height=0.9 '.a:cmd
    endfunction
    let g:test#basic#start_normal = 0
    let g:test#neovim#start_normal = 0
    let g:test#preserve_screen = 0
    let g:test#strategy = "harpoon"
]]
