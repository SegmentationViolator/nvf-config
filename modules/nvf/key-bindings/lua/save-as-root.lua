-- this code was taken as is from https://ww2.coastal.edu/mmurphy2/oer/alpine/neovim/ 

local function save_as_root(opts)
    local tool = nil

    if vim.system({'which', 'doas'}):wait().code == 0 then
        tool = 'doas'
    elseif vim.system({'which', 'sudo'}):wait().code == 0 then
        tool = 'sudo'
    end

    if not tool then
        print('Error: neither doas nor sudo is available')
        return
    end

    local output = ''

    local function handle_stdout(channel_id, data, name)
        if #data > 0 then
            if data[1]:find('password') then
                local password = vim.fn.inputsecret('(' .. tool .. ') password: ')
                vim.fn.chansend(channel_id, { password, '' })
            else
                output = output .. data[1]:gsub('\r', '\n')
            end
        end
    end

    local temp_file = vim.fn.tempname()
    vim.cmd.write(temp_file)

    local ebang = true
    local filename = vim.api.nvim_buf_get_name(0)
    if opts.args ~= '' then
        ebang = false
        filename = opts.args
    end

    local channel_id = vim.fn.jobstart({tool, 'dd', 'if=' .. temp_file, 'of=' .. filename}, {
        on_stdout = handle_stdout,
        pty = true,
    })

    if vim.fn.jobwait({channel_id})[1] == 0 then
        if ebang then
            vim.cmd('e!')
        end

        vim.cmd('redraw')
        vim.print('Written (as root): ' .. filename)
    else
        vim.print(output)
    end

    vim.fn.delete(temp_file)
end

vim.api.nvim_create_user_command('W', save_as_root, {desc = 'Save file as root', nargs = '?'})
