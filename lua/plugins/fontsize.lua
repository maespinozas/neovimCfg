return{
 "Sup3Legacy/fontsize.nvim",
 lazy = false,
 opts = {},

 config = function()
require('fontsize').init(
    {
        -- Required argument
        font = "Fira Code, Nerd Font",

        -- Optional arguments
        min = 6,
        default = 10,
        max = 24,
        step = 1,
    }
)
 end


}
