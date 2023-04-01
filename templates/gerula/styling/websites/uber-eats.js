// ==UserScript==
// @name     UberEats Theme
// @version  1
// @grant    none
// @include  https://www.ubereats.com/*
// ==/UserScript==

const theme = {
  bg: {
    200: "#0f1014",
    300: "#13151a",
    400: "#17191f",
    500: "#1b1d24",
    600: "#1d1e24",
    700: "#23252C",
    800: "#2A2C33",
    900: "#2E3038",
  },

  accent: {
    primary: "#3498DB",
    secondary: "#67cbff",
  },

  red: "#E06C75",
  green: "#98C379",
  yellow: "#E5C07B",
  blue: "#61AFEF",
  purple: "#C678DD",
  cyan: "#56B6C2",
};

const stylesMap = {
  "color: #000000": `color: #fff`,
  "color: rgb(0, 0, 0)": `color: #fff`,
  "color: rgb(84, 84, 84)": `color: #ccc`,
  "color: rgb(5, 148, 79)": `color: ${theme.green}`,
  "color: rgb(152, 195, 121)": `color: ${theme.green}`,
  "color: rgb(247, 108, 40)": `color: white`,
  "color: rgb(36, 122, 0)": `color: white`,

  "background: rgb(5, 148, 79) none repeat scroll 0% 0%": `background: ${theme.green}`,
  "background: rgb(30, 159, 97) none repeat scroll 0% 0%": `background: ${theme.green}`,
  "background: rgba(38, 38, 38, 0.8) none repeat scroll 0% 0%": `background: ${theme.bg[500]}cc`,
  "background: rgb(255, 255, 255) none repeat scroll 0% 0%": `background: ${theme.bg[500]}`,
  "background: #FFFFFF": `background: ${theme.bg[500]}`,
  "background-color: rgb(0, 0, 0)": `background-color: ${theme.bg[900]}`,
  "background-color: rgb(226, 226, 226)": `background-color: ${theme.bg[900]}`,
  "background-color: rgb(255, 255, 255)": `background: ${theme.bg[500]}`,
  "background-color: rgb(238, 238, 238)": `background: ${theme.bg[700]}`,
  "background-color: rgb(246, 246, 246)": `background: ${theme.bg[700]}`,
  "background-color: rgb(240, 247, 237)": `background: ${theme.bg[700]}`,
  "background-color: rgb(255, 248, 245)": `background: ${theme.bg[600]}`,
  "background-color: rgb(238, 247, 237)": `background-color: ${theme.accent.primary}`,
  "background-color: rgb(254, 243, 238)": `background-color: ${theme.accent.primary}`,
  "background-color: rgb(5, 148, 79)": `background-color: ${theme.accent.primary}`,
  "background-color: rgb(230, 242, 237)": `background-color: ${theme.bg[700]}`,
  "background: rgb(204, 204, 204) none repeat scroll 0% 0%": `background: ${theme.bg[900]}`,
  "background: rgb(240, 240, 240) none repeat scroll 0% 0%": `background: ${theme.bg[900]}`,
  "background: rgb(246, 246, 246) none repeat scroll 0% 0%": `background: ${theme.bg[700]}`,
  "background: rgb(238, 238, 238) none repeat scroll 0% 0%": `background: ${theme.bg[700]}`,
  "background: rgb(237, 237, 237) none repeat scroll 0% 0%": `background: ${theme.bg[700]}`,
  "background: rgb(230, 242, 237) none repeat scroll 0% 0%": `background: ${theme.bg[800]}`,
  "background: rgb(19, 35, 40) none repeat scroll 0% 0%": `background: ${theme.bg[800]}`,
  "background: rgb(0, 0, 0) none repeat scroll 0% 0%": `background: ${theme.bg[700]}`,
  "background: rgb(26, 26, 26) none repeat scroll 0% 0%": `background: ${theme.bg[900]}`,
  "background: rgb(27, 29, 36) none repeat scroll 0% 0%": `background: contain; background-color: ${theme.accent.primary}`,
  "background: rgba(0, 0, 0, 0) linear-gradient(rgba(255, 255, 255, 0) 0%, rgb(255, 255, 255) 100%) repeat scroll 0% 0%": `background: none`,
  // Loading skeleton animation
  "background-image: linear-gradient(120deg, rgb(226, 226, 226) 20%, rgb(246, 246, 246) 28%, rgb(226, 226, 226) 43%)": `background: ${theme.bg[800]}`,
  "background: rgba(0, 0, 0, 0) linear-gradient(rgba(255, 255, 255, 0) 2.5%, rgba(255, 255, 255, 0.92) 55.35%) repeat scroll 0% 0%": `background: none`,
  "background: rgba(0, 0, 0, 0) radial-gradient(transparent 14px, rgb(255, 255, 255) 14px) repeat scroll 0% 0%": `background: none`,

  "box-shadow: rgb(226, 226, 226) 0px -1px 0px inset": `box-shadow: none !important`,
  "box-shadow: rgb(226, 226, 226) 0px -2px 0px inset": `box-shadow: none !important`,
  "box-shadow: rgb(0, 0, 0) 0px -2px 0px inset": `box-shadow: none !important`,

  "border: 8px solid rgb(0, 0, 0)": `border-color: #ccc !important`,
  "border: 3px solid white": `border-color: ${theme.bg[700]}`,
  "border: 1px solid rgb(226, 226, 226)": `border-color: ${theme.bg[700]}`,
  "border: 1px solid rgb(246, 246, 246)": `border-color: ${theme.bg[700]}`,
  "border: 1px solid rgb(0, 0, 0)": `border-color: #ccc !important`,
  "border-color: rgb(226, 226, 226)": `border-color: ${theme.bg[700]}`,
  "border-color: rgb(0, 0, 0)": `border-color: ${theme.bg[700]}`,
  "border-bottom: 2px solid rgb(0, 0, 0)": `border-color: ${theme.accent.primary}`,
  "border-bottom: 1px solid rgb(226, 226, 226)": `border-color: ${theme.bg[700]}`,

  // Targets the text area for inputs
  "resize: none": "color: white",
};

const handledStyles = {};

function updateStyles() {
  const cssRules = Array.from(document.styleSheets)
    .reduce((rules, styleSheet) => {
      rules.push(...styleSheet.cssRules);
      return rules;
    }, [])
    .filter((rule) => rule?.selectorText?.startsWith("."));

  for (const rule of cssRules) {
    const style = rule.cssText
      .slice(rule.selectorText.length + 3, rule.cssText.length - 3)
      .trim();
    if (!stylesMap[style]) continue;
    if (handledStyles[rule.selectorText]) continue;
    handledStyles[rule.selectorText] = true;

    rule.parentStyleSheet.insertRule(
      `${rule.selectorText} { ${stylesMap[style]} }`,
      rule.parentStyleSheet.cssRules.length - 1
    );
  }
}

setInterval(updateStyles, 200);
