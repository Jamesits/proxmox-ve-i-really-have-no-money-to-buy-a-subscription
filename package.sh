#!/bin/bash

cd "$( dirname "${BASH_SOURCE[0]}" )"

fpm -s dir -t deb --force \
	-n pve-fake-subscription \
	--description "Pollute Proxmox VE (>=5.0) and Proxmox Mail Gateway (>=5.0) subscription cache so it won't alert you on dashboard login" \
	--url "https://github.com/Jamesits/pve-fake-subscription" \
	-v 0.0.5 \
	--license "GLWTS(Good Luck With That Shit) Public License" \
	--depends "python3" \
	--depends "libpve-common-perl" \
	--architecture all \
	--deb-dist "unstable" \
	--deb-priority "optional" \
	--deb-systemd "usr/lib/systemd/system/pve-fake-subscription.timer" \
	--after-remove "scripts/purge" \
	./usr

	# temporary removed as of https://github.com/jordansissel/fpm/issues/1472
	#--deb-after-purge "scripts/purge" \
