# Nuxt.js

<div class="row row-cols-md-2"><div>

[Nuxt.js](https://github.com/nuxt/nuxt) is a front-end framework based on [Vue.js](../vue.js/index.md). To build websites on Windows, you need [Visual Studio Build tools](https://visualstudio.microsoft.com/downloads/):

* MSVC v143 - VS 2022 C++ <small>(at least)</small>
* Windows 11 SDK
* C++ Cmake tools for Windows

You can use `npx nuxi init -t v3 <project_name>` to create a new project. Use `npm install`, then use `npm run dev` to run the website.
</div><div>

⚠️ Be sure to read [nuxt.com](https://nuxt.com/docs/getting-started/installation) documentation, which covers Nuxt v3, and not [nuxtjs.org](https://nuxtjs.org/) which covers Nuxt v2.

🚀 You can find modules at [nuxt.com/modules](https://nuxt.com/modules).

🔥 You can get started at [nuxt.new](https://nuxt.new/).
</div></div>

<hr class="sep-both">

## Components

<div class="row row-cols-md-2"><div>

All ".vue" files for a component are stored in `components`. They are automatically imported in other ".vue" files.

We are now able to write `script` in another language:

```xml!
<script setup lang="ts">
// explicit import a component
import HelloWorld from "~/components/HelloWorld.vue";
</script>
```
</div><div>
</div></div>

<hr class="sep-both">

## Layouts

<div class="row row-cols-md-2"><div>

Each page will use a [layout](https://nuxt.com/docs/guide/directory-structure/layouts). Multiple page can use the same layout, but inject some specific components in it.

👉 The default layout used is `./layouts/default.vue`. 

For instance, we could define a layout in which those using it will share the same header (`AppHeader`) and footer (`AppFooter`), but they will have to provide the main div.
</div><div>

```xml!
<template>
  <div>
    <AppHeader />
    <slot />
    <AppFooter />
  </div>
</template>
```

A page can use a layout as follows:

```xml!
<NuxtLayout>
    <!-- this is the content injected in <slot /> -->
</NuxtLayout>
```
</div></div>

<hr class="sep-both">

## Routing

<div class="row row-cols-md-2"><div>

Refer to the [Routing documentation](https://nuxt.com/docs/getting-started/routing).

💡 Images and public content should be put in "public". Given an image at `./public/xxx.png`, you should use `/xxx.png` in the code.
</div><div>

You can access query/params using:

```xml!
<script setup>
const route = useRoute()
// When accessing /posts/1, route.params.id will be 1
console.log(route.params.id)
// When accessing /posts?page=1, route.query.page will be 1
console.log(route.query.page)
</script>
```
</div></div>

<hr class="sep-both">

## Metadata

<div class="row row-cols-md-2"><div>

As per the documentation, you can

```xml!
<script setup lang="ts">
useHead({
  title: 'My App',
  meta: [
    { name: 'description', content: 'My amazing site.' }
  ]
})
</script>
```
</div><div>

To set the config for all pages, edit `/nuxt.config.ts`

```
// https://nuxt.com/docs/api/configuration/nuxt-config
export default defineNuxtConfig({
  css: ['bootstrap/dist/css/bootstrap.min.css'],
  app: {
    head: {
      charset: 'utf-8',
      viewport: 'width=device-width, initial-scale=1',
      title: 'My App',
      meta: [
        { name: 'description', content: 'My amazing site.' }
      ],
      link: [{ rel: 'icon', type: 'image/x-icon', href: '/favicon.png' }]
    }
  }
})
```
</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-md-2"><div>

* [nitro](https://github.com/unjs/nitro)

```js!
// can only access the localStorage from a client
// but, don't use this
if (process.client) {
  const storage = localStorage.getItem('x')
}
```
</div><div>


</div></div>