import dracula.draw


# pyright: reportUndefinedVariable=false

# Load existing settings made via :set
config.load_autoconfig()

# set theme
dracula.draw.blood(c, {"spacing": {"vertical": 6, "horizontal": 8}})

# change default editor
c.editor.command = ["xterm", "-e", "nvim '{}'"]

# enable dark mode
config.set("colors.webpage.darkmode.enabled", True)
config.set("colors.webpage.darkmode.policy.images", "never")

# set font size (for big display)
config.set("fonts.default_size", "13pt")

# set default zoom (for big display)
config.set("zoom.default", "110%")

# set search engine
config.set(
    "url.searchengines",
    {
        "DEFAULT": "https://www.google.com/search?q={}",
        "pdf": "https://www.google.com/search?q=filetype%3Apdf+{}",
        "duck": "https://duckduckgo.com/?q={}",
    },
)

# change start page to blank
config.set("url.start_pages", "about:blank")

# keep a minimal look by hiding status bar and tab bar
config.set("statusbar.show", "always")
config.set("tabs.show", "multiple")

# quit browser (but save session)
config.bind("<Ctrl-w>", "wq")

# goes to home page
config.bind("<Ctrl-o>", "home")

# download images
config.bind("<Ctrl-i>", "hint images download")

# change key bindings
config.unbind("d")
config.bind("x", "tab-close")
config.unbind("u")
config.bind("X", "undo")


# fake-key to manipulate insert mode
config.bind("<Ctrl-j>", "fake-key <Left>", "insert")
config.bind("<Ctrl-k>", "fake-key <Right>", "insert")
config.bind("<Ctrl-h>", "fake-key <Ctrl-Left>", "insert")
config.bind("<Ctrl-l>", "fake-key <Ctrl-Right>", "insert")

# hide status bar/ tabs
config.bind("zb", "config-cycle statusbar.show always never")
config.bind("zt", "config-cycle tabs.show multiple never")
config.bind(
    "zx",
    "config-cycle statusbar.show always never;; config-cycle tabs.show multiple never",
)

# copy url and title
config.bind("yy", "yank inline {url}")
config.bind("yt", "yank inline [{title}]({url})")

# download files to downloads folder
config.set("downloads.location.prompt", False)

# speed up launch time by not opening windows
config.set("qt.args", ["no-window"])

# fix to ensure background do not flash white when opening new tab
config.set("colors.webpage.bg", "#282a36")

# view PDF
config.set("content.pdfjs", True)
