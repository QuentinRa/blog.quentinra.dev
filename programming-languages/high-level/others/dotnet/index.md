# .NET (dotnet)

<div class="row row-cols-lg-2"><div>


Microsoft originally developed the [.NET Framework](https://dotnet.microsoft.com/en-us/download/dotnet-framework) for Windows applications. It's unmaintained since 2022. Their renamed the core module to [.NET](https://dotnet.microsoft.com/en-us/) <small>(dotnet)</small> and made it open-source and cross-platform.

Latest notable version are:

* .NET 9.0 <small>(2024)</small>
* .NET Framework 4.8.1 <small>(2022)</small>

📚 Installing .NET components is easy from Visual Studio.
</div><div>

To compile old applications, you can use Azure cloud like in [this project](https://github.com/Flangvik/SharpCollection), or you can install [Visual Studio Community](https://visualstudio.microsoft.com/downloads/) and selecting:

* 🔦 Nuget
* 🤖 Msbuild
* 🗺️ .NET X.0 Runtime
* 🪦 .NET Framework 4.X SDK
* 🪨 .NET Framework 4.x targeting pack
</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-lg-2"><div>

* [nuget](https://www.nuget.org/downloads) (use latest)

```ps
PS> cd 'C:\path\to\project'
PS> & 'C:\path\to\nuget' restore '.\XXX.sln' -Verbosity Detailed -NonInteractive
PS> & 'C:\Program Files\Microsoft Visual Studio\2022\Community\MSBuild\Current\Bin\amd64\msbuild.exe' /nologo /nr:false
```
</div><div>
</div></div>