mac: homebrew packages_mac config

linux: homebrew packages config

packages:
	bash homebrew.sh n

packages_mac:
	bash homebrew.sh y

config:
	bash install y y

reset:
	bash uninstall

homebrew:
	echo "Installing homebrew"
	bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
