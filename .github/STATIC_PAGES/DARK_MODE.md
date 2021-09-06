<h1 class="display-6 fw400 text-center pe-4 pb-2">
<b>Dark mode 🐱‍👤 </b>
</h1>

Originally, no dark mode was available, as  I would need a <b>cookie</b> to store if you enabled it. But, I'm now using the CSS media query `prefers-color-scheme` to check whether your browser is in light or in dark mode. According to your preference, I'm showing the website either in dark or in light.

Previously, you could install an extension such as [Dark reader extension](https://darkreader.org/) to enable the dark mode, but this isn't working well now that I made my dark mode (the website using dark reader may be a bit unreadable).

If you got a better solution, or you want to share your feedback, feel free to open [an issue on GitHub](https://github.com/lgs-games/memorize/issues). Thanks 🚀.

<p class="text-end pt-3">
I hope you'll have fun - Quentin RA "Calistro"
</p>

<details class="details-e">
<summary>My troughs</summary>

* I could use a cookie (=session), but I want to avoid that 🐱‍👤
* I could use JavaScript and switch between the two CSS according to your value in localStorage
* I could make one **big** CSS having rules such as `.dark-theme a` and `.light-theme a`, and switch using JavaScript the class `.dark-theme`/`.light-theme`
</details>