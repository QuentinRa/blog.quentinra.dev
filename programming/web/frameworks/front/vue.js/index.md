# Vue.js

<div class="row row-cols-md-2"><div>

[Vue.js](https://vuejs.org/) is a simplified yet robust alternative to popular front-end frameworks like React or Angular. It's nice to learn this one first, as has a smaller learning curve, meaning it's easier to learn.

Before, you could use [vue-cli](https://github.com/vuejs/vue-cli) (29.5k ⭐), but now it's in maintenance mode, so they are recommending us to use [vite](https://vitejs.dev/) (50.6k ⭐).

</div><div>

The official [create-vue](https://github.com/vuejs/create-vue) project is using vite to generate a project

```bash
$ npm create vue@3 --yes
$ cd xxx
$ npm install
$ npm run dev
```
</div></div>

<hr class="sep-both">

## 📦 Components 📦

<div class="row row-cols-md-2"><div>

The main component is **App**. We are storing each component inside a `.vue` file, so we will have **App.vue**. Each `.vue` file has 3 tags

```
<script setup>
// example: import a component
import HelloWorld from './components/HelloWorld.vue'
</script>

<template>
  <!-- HTML CODE -->
  <!-- use your imported component -->
  <HelloWorld msg="Hello, World!" />
</template>

<style scoped>
    /* component style */
</style>
```
</div><div>

As you have seen, a component can pass arguments to another component. Here, the component is declaring a property `msg`.

```
<script setup>
defineProps({
  msg: {
    type: String,
    required: true
  }
})
</script>
```

Inside the template, you can use it with `{{ property_name }}`

```
<template>
  <p>{{ msg }}</p>
</template>
```

</div></div>

<hr class="sep-both">

## 🐏 Notes 🐏

<div class="row row-cols-md-2"><div>

* `%PUBLIC_URL%` placeholder
</div><div>

...
</div></div>