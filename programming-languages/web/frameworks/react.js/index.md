# React.js

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-md-2"><div>

```tsx
// xxx.tsx
import React, { useEffect, useState } from "react";
import ReactDOM from "react-dom";

const MyExample = () => {
  const [count, setCount] = useState<number>(0);
  const [xxx, setXXX] = useState<string>();

  useEffect(() => { /* onCountUpdated */ }, [count]);
  useEffect(() => {}, []);

  return (
    <>
      <p>{count}</p>
      <button onClick={() => setCount(count + 1)}>count++</button>
    </>
  );
};

ReactDOM.render(
  <React.StrictMode>
    <MyExample />
  </React.StrictMode>,
  document.getElementById("root")
);
```
</div><div>

* [preactjs](https://preactjs.com/) (33.5k ⭐)
* [React](https://github.com/facebook/react) (200k ⭐)
  * [Material UI](https://github.com/mui/material-ui) (83.6k ⭐, UI)
  * [Next](https://github.com/vercel/next.js/) (98k ⭐)
  * [React Native](https://github.com/facebook/react-native)
  * [reactjsexample](https://reactjsexample.com/) (107k ⭐)
* [react-philosophies](https://github.com/mithi/react-philosophies)
</div></div>