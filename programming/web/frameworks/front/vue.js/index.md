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
// import a component, see components:
import HelloWorld from '../components/HelloWorld.vue'

export default {
  // you can use these in "template"
  components: { HelloWorld },
  data() {
    // declare references here. These are variables
    // that can be used in the HTML. If they are modified
    // then, the HTML element is updated too.
    // (bi-directional data-biding)
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
    <button @click="increment">Square is: {{ square }}</button>
  </div>
</template>
```

Inside braces, or inside Vue attributes, you can use JavaScript, but only expression (ex: `true ? "ok" : "false"`). Otherwise, you will have to use methods/computed properties.

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
</div><div>

* **v-model**: bi-directional data-binding. Now, if the value is modified by the element, then the data is modified too.

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

On a component

```
<MyComponent
  v-for="(item, index) in items"
  :item="item"
  :index="index"
/>
```

</div></div>

<hr class="sep-both">

## 🐏 Notes 🐏

<div class="row row-cols-md-2"><div>

* `%PUBLIC_URL%` placeholder
* Vue is a declarative framework
* nextTick in Methods
* writable computed
* deep watchers
* template refs
</div><div>

```
<script setup>
import { ref, onMounted } from 'vue'
// reactive state
const count = ref(0)
</script>
```
</div></div>