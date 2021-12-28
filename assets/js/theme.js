
$(document).ready(function(){
// Based on [joshwcomeau.com/gatsby/dark-mode/]
  const getSavedTheme = () => {
    const theme = window.localStorage.getItem("theme");
    // If the user has explicitly chosen light or dark,
    // let's use it. Otherwise, this value will be null.
    if (typeof theme === "string") return theme;

    // If they are using a browser/OS that doesn't support
    // color themes, let's not do anything.
    return null;
  };

  const saveTheme = (theme) => {
    // If the user has explicitly chosen light or dark, store the default theme
    if (typeof theme === "string")
      window.localStorage.setItem("theme", theme);
  };

  const mediaTheme = () => {
    // If they haven't been explicitly set, let's check the media query
    const mql = matchMedia("(prefers-color-scheme: dark)");
    const hasMediaQueryPreference = typeof mql.matches === "boolean";
    if (hasMediaQueryPreference) return mql.matches ? "dark" : "light";
  };

  const html = document.querySelector("html");

  // Get theme from html tag, if it has a theme or get it from localStorage
  const checkCurrentTheme = () => {
    const themeAttr = html.getAttribute("data-theme");
    if (themeAttr) return themeAttr;

    return getSavedTheme();
  };

  // Set theme in localStorage, as well as in the html tag
  const applyTheme = (theme) => {
    html.className = theme;
    html.setAttribute("data-theme", theme);
  };

  try {
    let theme = getSavedTheme();
    if (theme == null) theme = mediaTheme();
    html.setAttribute("data-theme", theme);
    html.classList.add(theme);

    // If a user changes overall system theme, update site theme as well,
    // but don't save the change in local storage
    window
      .matchMedia("(prefers-color-scheme: dark)")
      .addEventListener("change", (e) => {
        applyTheme(e.matches ? "dark" : "light");
      });

    // On theme switcher button click toggle the theme between dark and light mode
    document
      .querySelector("#theme-toggle")
      .addEventListener("click", () => {
        let theme = checkCurrentTheme() === "dark" ? "light" : "dark";
        applyTheme(theme);
        saveTheme(theme);
      });
  } catch (e) {
    console.warn("Theming isn't available on this browser.", e);
  }
});