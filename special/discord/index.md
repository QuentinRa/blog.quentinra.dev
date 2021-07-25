# Introduction

This isn't a course promoting discord,
and you should already know that discord
is an application allowing users to create

* guilds (=a server)
* channels (to chat/talk)

This course are a gathering on notes about
discord and discord API.

<hr class="sr">

## About the application

The desktop application was made using electron
which means that discord desktop app is simply
running in a chromium browser.

* you can use ``CTRL-SHIFT-I`` and open the developer tools
* you can use ``CTRL-R`` to refresh discord (no real use for this)
* ...

Pressing shift while overing a message show a small
popup allowing to get the message id/channel id
and the guild id (used in the api). You can also
delete/... a message using this but most people
are using the right click for these.

The messages are allowing a lot of markdown syntax
so you can use

* ``**bold**``, ``*italic*``, ``~~strikethrough~~``
* writing <code>\`\`some inline code\`\`</code> or some code block

<pre class="language-ld">
<code class="language-ld"
>```c
int main(void){

}
```</code>
</pre>

* spoiler: ``||text||``
* quote: ```> quote```

<hr class="sl">

## BetterDiscord

Better discord is a software improving discord by allowing
you to install plugins. You can find
the code source/latest version [here](https://github.com/BetterDiscord/BetterDiscord/releases).

* download the [installer](https://github.com/BetterDiscord/Installer/releases/tag/v1.0.0-hotfix)
* install and restart discord
* in settings, you got new menus including plugins menu

To install new plugins, what I do is

* settings > plugin > open the plugin folder
* copy and paste a plugin inside the folder
* the plugin can be found [here](https://betterdiscord.app/plugins)
* go back to discord and don't forget to enable the plugin
* if you have a problem updating a plugin, backup
  the plugin data file and reinstall it.

As a side note, I'm living this repository here
[nitro code generator](https://github.com/logicguy1/Discord-Nitro-Generator-and-Checker)
but I don't know if this is working.

<hr class="sr">

## Discord Bots (JavaScript)

...

<hr class="sl">

## Sources

* <https://support.discord.com/hc/en-us/articles/1500000580222-Ephemeral-Messages-FAQ>