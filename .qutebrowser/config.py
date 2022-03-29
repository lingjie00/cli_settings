import dracula.draw

# Load existing settings made via :set
config.load_autoconfig()

# set theme
dracula.draw.blood(c, {
    'spacing': {
        'vertical': 6,
        'horizontal': 8
    }
})

# change default editor
c.editor.command = ["xterm", "-e", "nvim '{}'"]

# enable dark mode
config.set("colors.webpage.darkmode.enabled", True)
config.set("colors.webpage.darkmode.policy.images", "never")

# set font size (for big display)
config.set("fonts.default_size", "18pt")

# set default zoom (for big display)
config.set("zoom.default", "150%")

# set search engine
config.set("url.searchengines", {"DEFAULT": "https://www.google.com/search?q={}"})

# change start page to blank
config.set("url.start_pages", "about:blank")

# quit browser (but save session)
config.bind("<Ctrl-w>", "wq")

# change key bindings
config.unbind("d")
config.bind("x", "tab-close")
config.unbind("u")
config.bind("X", "undo")
config.bind("d", "run-with-count 10 scroll down")
config.bind("u", "run-with-count 10 scroll up")

# fake-key to manipulate insert mode
config.bind("<Ctrl-j>", "fake-key <Ctrl-Left>", "insert")
config.bind("<Ctrl-k>", "fake-key <Ctrl-Right>", "insert")
config.bind("<Ctrl-h>", "fake-key <Home>", "insert")
config.bind("<Ctrl-l>", "fake-key <End>", "insert")
