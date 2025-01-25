local status_ok_ai, mini_ai = pcall(require, 'mini.ai')
local status_ok_surround, mini_surround = pcall(require, 'mini.surround')
local status_ok_mini_pairs, mini_pairs = pcall(require, 'mini.pairs')

if not status_ok_ai then
    return
end

if not status_ok_surround then
    return
end

if not status_ok_mini_pairs then
    return
end

--  - va)  - [V]isually select [A]round [)]paren
--  - yinq - [Y]ank [I]nside [N]ext [']quote
--  - ci'  - [C]hange [I]nside [']quote
mini_ai.setup()

-- - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
-- - sd'   - [S]urround [D]elete [']quotes
-- - sr)'  - [S]urround [R]eplace [)] [']
mini_surround.setup()

mini_pairs.setup()
