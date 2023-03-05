{config, pkgs, ...}:
{
    programs.firefox = {
        enable = true;
        extensions = with pkgs.nur.repos.rycee.firefox-addons; [
            lastpass-password-manager
            ublock-origin
        ];
        profiles.hallam = {
            id = 0;
            isDefault = true;
            settings = {
                "browser.startup.homepage" =
                "https://duckduckgo.com/?kae=d&kp=-2&kak=-1&kax=-1&kaq=-1&kao=-1&kap=-1&kau=-1";
                "signon.rememberSignons" = true;
            };
            #userChrome = builtins.readFile ../../config/firefox/chrome.css;
        };
    };
}
