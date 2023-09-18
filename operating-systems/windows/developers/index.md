# Windows For Developers

<div class="row row-cols-md-2"><div>

...
</div><div>

...
</div></div>

<hr class="sep-both">

## InnoSetup

<div class="row row-cols-md-2"><div>

[InnoSetup](https://github.com/jrsoftware/issrc) is a tool to create modern Windows installers. You can download it [here](https://jrsoftware.org/isdl.php) 🍬. Simply install and run the software.

Use the `Create a new file using the Script wizard` wizard. It will generate a `.iss` with the configuration to generate the installer.

#### Target folder

Ex: All files will be stored in the `app` folder.

```diff
-Source: "a\path\to\app\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs
+Source: "a\path\to\app\*"; DestDir: "{app}\app"; Flags: ignoreversion recursesubdirs createallsubdirs
```
</div><div>

#### CLI options

```ps
PS> file.exe /SILENT      # Only show the progress bar
PS> file.exe /VERYSILENT  # No installer visible
# Add custom options
PS> file.exe /VERYSILENT /MERGETASKS="desktopicon,postinstall"
```
</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-md-2"><div>

...
</div><div>
</div></div>