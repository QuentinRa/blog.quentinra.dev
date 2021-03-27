const SWITCH = "<p style=\"margin-bottom: 0.5rem;display: flex;justify-content: center;\">\n" +
    "                <span style=\"margin-right: 5px;margin-bottom: auto;margin-top: auto;\">🌙</span>\n" +
    "                <label class=\"switch\">\n" +
    "                    <input type=\"checkbox\" onclick=\"changeCss()\">\n" +
    "                    <span class=\"slider round\"></span>\n" +
    "                </label>\n" +
    "                <span style=\"margin-left: 5px;margin-bottom: auto;margin-top: auto;\">🔆</span>\n" +
    "            </p>";

const PATH = '_static/_style/css/';

window.onload = function ()
{
    let d = document.createElement('div');
    d.innerHTML = SWITCH;
    document.querySelector('.icon.icon-home').parentNode
        .insertBefore(d, document.querySelector('.icon.icon-home').nextSibling)

    let mode = window.localStorage.getItem('mode');
    if (mode == null){
        // it's already dark
        // do nothing
    } else {
        // it's light
        // set input field
        let input = document.querySelector('.slider').parentNode.children[0];
        // manual check
        input.checked = true;
        // load
        loadCss(true);
    }
}

/**
 * Chance css according according to storage
 * or simply load it.
 */
function changeCss()
{
    // mode
    let mode = window.localStorage.getItem('mode');
    // file
    let file;

    // we need to get our file
    if (mode == null){ // dark ? switch to light
        file = true;
        // we can change
        window.localStorage.setItem('mode', 'true');
    } else {
        // light, go back to dark
        file = false;
        // clear
        window.localStorage.removeItem('mode');
    }

    // then load
    loadCss(file);
}

function loadCss(darkToWhite)
{
    let oldL = document.getElementsByTagName("link").item(3);

    let cssFile;
    if(darkToWhite) // switch to light
        cssFile = oldL.href.replace('dark','light');
    else
        cssFile = oldL.href.replace('light','dark');

    let newL = document.createElement("link");
    newL.setAttribute("rel", "stylesheet");
    newL.setAttribute("type", "text/css");
    newL.setAttribute("href", cssFile);

    document.getElementsByTagName("link").item(3).parentNode.replaceChild(newL, oldL);
}