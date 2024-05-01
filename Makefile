all: homebrew config

homebrew:
	bash homebrew.sh n

config:
	bash install y y

reset:
	bash uninstall
