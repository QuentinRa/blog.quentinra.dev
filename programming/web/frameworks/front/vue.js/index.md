# Vue.js

<div class="row row-cols-md-2"><div>

[Vue.js](https://vuejs.org/) is a simplified yet robust alternative to popular front-end frameworks like React or Angular. It's nice to learn this one first, as it has a smaller learning curve, meaning it's easier to learn.

Before, you could use [vue-cli](https://github.com/vuejs/vue-cli) (29.5k ⭐), but now it's in maintenance mode, so they are recommending us to use [vite](https://vitejs.dev/) (50.6k ⭐).

There are two ways of doing the same thing in Vue.

* **Composition API**: use `<script setup>`
* **Options API**: use `<script>`

</div><div>

The official [create-vue](https://github.com/vuejs/create-vue) project is using vite to generate a project

```bash
$ npm create vue@3 --yes
$ cd xxx
$ npm install
$ npm run dev
```

Learn Vue.js

* [vuemastery](https://www.vuemastery.com/)
* [vueschool](https://vueschool.io/)
* [vuejsexamples](https://vuejsexamples.com/)
</div></div>

<hr class="sep-both">

## 📦 Vue Single-File Components (<code>.vue</code>) 📦

<div class="row row-cols-md-2"><div>

The main component is **App**. It will usually load a view stored in `src/views`. To make views easier to manage, and to recycle parts of the code, we are extracting them inside file in `src/components`.

➡️ Ex: a component for the pagination. Another for one product...

A **Single-File Components** is a `.vue` file, split in 3 tags: **script**, **template**, and **style**, so everything related to the component is encapsulated in one place.

```
<script>
// JavaScript
// ex: import a component
import HelloWorld from './components/HelloWorld.vue';
const text = "Hello, World";
</script>

<template>
  <!-- HTML CODE -->
  <!-- ex: use another component -->
  <HelloWorld msg="Hello, World!" />
  <HelloWorld :msg="text" />
</template>

<style scoped>
    /* CSS */
</style>
```

➡️ **Note**: you must use `:msg` if you want to use a variable. For instance, `msg="myVariable"` will pass a text instead of a variable.
</div><div>

#### Passing arguments to a component

A component can receive parameters. They are declared inside `props`.

```
<script>
export default {
  props: {
    msg: String,
    other: { // more complex properties
      type: String,
      required: false,
      default: ""
    }
  }
}
</script>
```

If we remove every check, we could shorten the code to:

```
<script>
export default {
  props: ['msg', 'other']
}
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

## 📖 Options API 📖️

<div class="row row-cols-md-2 mt-4"><div>

The Options API is usually wordier, but it looks more declarative from my point of view, so it's easier to understand how Vue.js works.

```xml
<script>
// import a component, see components:
import HelloWorld from '../components/HelloWorld.vue'

export default {
  // you can use these in "template"
  components: { HelloWorld },
  data() {
    // declare references here. These are variables
    // that can be used in the HTML block. If they are
    // modified, then, the HTML element is updated too.
    // (bidirectional data-biding)
    return {
      count: 0
    }
  },
  watch: {
    // whenever count changes, this function will run
    // you can use paths (ex: 'xxx.yyy.zzz'(newValue))
    count(newCount, oldCount) {
      console.log(newCount)
    }
  },
  // avoid making calculations/complex stuff in template
  // do it in computed instead
  // the difference with methods is that the result
  // is cached until the data is modified
  computed: {
    square() {
        return this.count * this.count
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
    // like stuff that needs the component to be inside the
    // DOM to work.
  },
  created() {},
  // async created() {},
}
</script>
```

<br>

#### Use a data/... inside a template

Example of using the variable `count`

```
<template>
  <div class="home">
    <!-- example of using count (data) -->
    <button @click="count++">Count is: {{ count }}</button>
    <!-- increment (method), and square (computed) -->
    <button @click="increment">Square is: {{ square }}</button>
  </div>
</template>
```

**Takeaway**: inside vue properties <small>(see v-bind)</small>, or braces (`{{ here }}`), you can use **data**, **methods**, **computed**, or JavaScript code, although you should rely on methods/computed in such cases.
</div><div>

#### Directives

* **v-bind**: uni-directional data binding. When the value is updated, the bound attributes/... are updated, but editing the input field won't update the value.

```
<input v-bind:value="count">
<input :value="count"> <!-- same, shortcut -->
<input :[attributeName]="url"> <!-- custom attribute -->
<input :id="`input-${count}`"> <!-- complex value -->
<!-- add class based on a data -->
<div :class="{ 'active': isActive }"></div>
<div :class="['classA', 'classB']"></div>
```

* **v-model**: bidirectional data-binding. Now, if the value is modified by the element, then the data is modified too.

```
<input v-model="count">
<input v-model.lazy="count"> <!-- after changes -->
<input v-model.trim="count"> <!-- trim -->
```

* **v-if**: add/remove from the DOM the element

```
<p v-if="count===0">Zero</p>
<p v-else-if="count===1">One</p>
<p v-else>Greater than one</p>
```

* **v-show**: always add in the DOM, but toggle visibility. When you toggle visibility a lot, it will be less costly than using **v-if**.

```
<p v-show="count===0">Zero</p>
```

* **v-on**/**@**: on event

```
<button @click="count++">Count is: {{ count }}</button>
<button v-on:click="count++">Count is: {{ count }}</button>
<img src=# @error="count--">
<!-- .prevent is a modified to call e.preventDefault() -->
<form @submit.prevent="onSubmit">...</form>
<input @input="e => count = e.target.value">
```

* **v-for**

```
<!-- 0 then 1 -->
<li v-for="item in [1,2]">
  {{ item }}
</li>
<!-- "Element 0: 1" then "Element 1: 2" -->
<li v-for="(item, index) in [1, 2]">
    Element {{ index }}: {{ item }}
</li>
<!-- Other uses -->
<li v-for="({x, y}, index) in [{x: 1, y: 2}]"></li>
<li v-for="(value, key) in myObject"></li>
<li v-for="n in 10"></li>
```

<details class="details-n">
<summary><code>v-for</code> to replicate a composant</summary>

```
<MyComponent
  v-for="(item, index) in items"
  :item="item"
  :index="index"
/>
```

In "MyComponent", you could use code like that.

```javascript
// good practice: define a class for item
import Product from "@/classes/Product";

export default {
  props: {
    item: Product
    // if you don't want to create a class
    // 'item: Object'
  }
}
```
</details>
</div></div>

<hr class="sep-both">

## 📕 Composition API 📕

<div class="row row-cols-md-2"><div>

The code below is the same as declaring `count` inside `data`.

```
<script setup>
import { ref } from 'vue'
const count = ref(0)
</script>
```
</div><div>
</div></div>

<hr class="sep-both">

## 🛣️ Routing 🛣️ 

<div class="row row-cols-md-2"><div>

See [Router](https://router.vuejs.org/guide/#html). See also [Data Fetching](https://router.vuejs.org/guide/advanced/data-fetching.html).

```html
<script setup>
import { RouterLink, RouterView } from 'vue-router'
</script>

<template>
  <header>
    <nav>
      <RouterLink to="/">Home</RouterLink>
      <RouterLink to="/about">About</RouterLink>
    </nav>
  </header>

  <RouterView />
</template>
```

Note that RouterView is where the loaded page will be displayed.
</div><div>

In `main.js` when mounting the app, we "use" a router

```javascript
const router = createRouter({
  history: createWebHistory(import.meta.env.BASE_URL),
  routes: [
    {
      path: '/',
      name: 'home',
      component: HomeView
    },
    {
      path: '/about',
      name: 'about',
      // lazy-loaded when the route is visited
      component: () => import('../views/AboutView.vue')
    }
  ]
})
```

#### Useful methods

You can move to another page with

```javascript
this.$router.push({ name:'about' })
```

You can get query parameters (`?xxx=yyy`) or params (`/user/:id`) with

```javascript
this.$route.query.xxx
this.$route.params.id
```
</div></div>

<hr class="sep-both">

## 🥂 Using Bootstrap in Vue 🥂

<div class="row row-cols-md-2"><div>

First, install bootstrap

```
$ npm install bootstrap
```

Remove everything inside `main.css`. You may keep the import.

```diff
@import './base.css';

- [...]
```
</div><div>

Inside `main.js`, import bootstrap's css.

```diff
...
import "./assets/main.css";
+import "bootstrap/dist/css/bootstrap.css";

const app = createApp(App);
...
```

Done! 🥂
</div></div>

<hr class="sep-both">

## 🐏 Notes 🐏

<div class="row row-cols-md-2"><div>

* nextTick in Methods
* writable computed
* deep watchers
* template refs
* Preprocessors (ts, scss)
* `@/main` matches `src/main.js` (shortcut for src)
* `import "./assets/main.css";`

Links

* [pinia](https://pinia.vuejs.org/)
* [Nuxt.js](https://nuxtjs.org/) (see [vuestripe](https://vuestripe.com/nuxt/), [latest](https://github.com/nuxt/framework), [vue-meta](https://vue-meta.nuxtjs.org/))
* Native: [vue-native](https://github.com/GeekyAnts/vue-native-core) (deprecated) and [nativescript-vue](https://github.com/nativescript-vue/nativescript-vue)
</div><div>

```
<!-- in a template -->
<slot name="xxx"></slot>

<!-- when calling the template -->
<XXXExample>
    <template #xxx>
    ...
    </template>
</XXXExample>
```

* Vue.js - change the page title ([article](https://medium.com/js-dojo/how-to-dynamically-change-the-page-title-with-vue-and-vue-router-99904906ce45))

```javascript
// created
window.document.title = "xxx"
```
</div></div>