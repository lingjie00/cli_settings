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
config.set("zoom.default", "100%")

# set search engine
config.set("url.searchengines", {"DEFAULT": "https://www.google.com/search?q={}"})

# change start page to blank
config.set("url.start_pages", "about:blank")

# keep a minimal look by hiding status bar and tab bar
config.set("statusbar.show", "never")
config.set("tabs.show", "multiple")

# quit browser (but save session)
config.bind("<Ctrl-w>", "wq")

# download images
config.bind("<Ctrl-i>", "hint images download")

# change key bindings
config.unbind("d")
config.bind("x", "tab-close")
config.unbind("u")
config.bind("X", "undo")
config.bind("d", "cmd-run-with-count 10 scroll down")
config.bind("u", "cmd-run-with-count 10 scroll up")

# fake-key to manipulate insert mode
config.bind("<Ctrl-j>", "fake-key <Left>", "insert")
config.bind("<Ctrl-k>", "fake-key <Right>", "insert")
config.bind("<Ctrl-h>", "fake-key <Ctrl-Left>", "insert")
config.bind("<Ctrl-l>", "fake-key <Ctrl-Right>", "insert")

# hide status bar/ tabs
config.bind("zb", "config-cycle statusbar.show always never")
config.bind("zt", "config-cycle tabs.show multiple never")
config.bind("zx", "config-cycle statusbar.show always never;; config-cycle tabs.show multiple never")

# copy url and title
config.bind("yy", "yank inline [{title}]({url})")

# download files to downloads folder
config.set("downloads.location.prompt", False)

# speed up launch time by not opening windows
config.set("qt.args", ["no-window"])
