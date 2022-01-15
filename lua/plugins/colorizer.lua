if vim.fn.has('termguicolors') == 1 then
  vim.opt.termguicolors = true
end

require'colorizer'.setup (
  {'*';},
  {
    RGB = true;
    RRGGBB = true;
    names = false;
    RRGGBBAA = true;
    rgb_fn = true;
    hsl_fn = true;
    css = true;
    css_fn = true;
  }
)


