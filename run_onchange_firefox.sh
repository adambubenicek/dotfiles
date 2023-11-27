#!/bin/sh

firefox https://addons.mozilla.org/en-US/firefox/addon/bitwarden-password-manager
firefox https://addons.mozilla.org/en-US/firefox/addon/linkhints
firefox https://addons.mozilla.org/en-US/firefox/addon/sponsorblock
firefox https://addons.mozilla.org/en-US/firefox/addon/ublock-origin

find ~/.mozilla/firefox -regex '.*\.default\(-release\)?' | while read dir; do
	cat <<EOF > $dir/user.js
		user_pref("signon.rememberSignons", false);
		user_pref("middlemouse.paste", false);
		user_pref("browser.toolbars.bookmarks.visibility", "never");
		user_pref("browser.tabs.firefox-view", false);
EOF
done

