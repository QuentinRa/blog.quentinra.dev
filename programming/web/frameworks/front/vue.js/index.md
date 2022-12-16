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

<script>
// some JavaScript
</script>

<template>
  <!-- HTML CODE -->
  <!-- ex: use your imported component -->
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

## 🖼️ Components template 🖼️

<div class="row row-cols-md-2"><div>

There are two ways of doing the same thing is Vue. One is to use `<script setup>` and the other is to use `<script>`. The latter is more wordy, but easier to understand, so we will go with that.

```
<script>
export default {
  data() {
    // declare references here. These are variables
    // that can be used in the HTML. If they are modified
    // then, the HTML element is updated too.
    // (bi-directional data-biding)
    return {
      count: 0
    }
  },
  methods: {
    // declare methods that can be used in the HTML
    increment() {
      this.count++
    }
  },
  mounted() {
    // execute code with document.querySelector/... here,
    // like stuff that need the component to be inside the
    // DOM to work.
  }
}
</script>
```

Example usage

```
<template>
  <div class="home">
    <button @click="count++">Count is: {{ count }}</button>
    <button @click="increment">Count is: {{ count }}</button>
  </div>
</template>
```
</div><div>

You can use `v-bind` for uni-directional data binding

```
<!--
The input field's value will be set to "count".
If the input field's value is changed, then count
won't be modified.
-->
<input v-bind:value="count">
<input :value="count">
<input :id="`input-${count}`">
```

Inside braces, or inside Vue attributes, you can use JavaScript, but only expression (ex: `true ? "ok" : "false"`). Otherwise, you will have to use functions. You may also use other attributes.

* **v-if**: add/remove from the DOM the element

```
<p v-if="count===0">Zero</p>
<p v-else-if="count===1">One</p>
<p v-else>Greater than one</p>
```

* **v-on**/**@**: on event

```
<button @click="count++">Count is: {{ count }}</button>
<button v-on:click="count++">Count is: {{ count }}</button>
```

</div></div>

<hr class="sep-both">

## 🐏 Notes 🐏

<div class="row row-cols-md-2"><div>

* `%PUBLIC_URL%` placeholder
* Vue is a declarative framework
</div><div>

```
<script setup>
import { ref, onMounted } from 'vue'
// reactive state
const count = ref(0)
</script>
```
</div></div>