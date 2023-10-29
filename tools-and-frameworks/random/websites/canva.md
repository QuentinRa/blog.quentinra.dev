# Canva

<div class="row row-cols-lg-2"><div>

Canva is a popular website to create multiple documents such as slides, resumes, simple text documents etc. ✏️

This page mostly contains some hacky solutions in JavaScript to automate painful and tiring tasks.

⚠️ Use at your own risk. Written for developers.
</div><div>
</div></div>

<hr class="sep-both">

<div class="row row-cols-lg-2"><div>

### Canva: select all of your images

**Usage**

* Go to `https://www.canva.com/projects` > images
* Enjoy

**About**

This JavaScript code is selecting all images that you have on Canva.

* Step 1: switch to list view (if needed)
* Step 2: scroll to the bottom of the page
* Step 3: find a way to get the checkbox for one image
* Step 4: click on every checkbox

The script can be modified, for instance, to only select some images based on their name...
</div><div>

```javascript
// Step 1: Use list view (if not already using list view)
document.querySelector('path[d~="5.25h7.5a.75.75"')?.parentNode.parentNode.parentNode.parentNode.click()

// Step 2
const scrollToTheBottomOfElement = async (e) => {
    let previous = e.scrollHeight;
    while (1) {
        e.scrollTo(0, e.scrollHeight);
        await new Promise(resolve => setTimeout(resolve, 400));
        if (e.scrollHeight === previous) break;
        previous = e.scrollHeight;
    }
}
scrollToTheBottomOfElement(document.querySelector('main > div > div'))
    .then((x) => {
        // Step 3: select the "class" shared by every button
        const className = document.querySelectorAll("*[d~='1.06L9.53']")[4]
            ?.parentNode?.parentNode?.parentNode?.parentNode?.firstChild?.classList[0]

        // not found, damn, they changed something
        if (className === undefined) {
            console.log("Error: can't find className")
        } else {
            // Step 4:  we select every unselected images
            for (i of document.querySelectorAll('.'+className))
                if (!i.checked) i.click()
        }
    })
```
</div></div>

<hr class="sep-both">

### Canva: remove paid templates

<div class="row row-cols-lg-2"><div class="mt-2 mt-lg-4">

```javascript!
setInterval(() => {
    Array.from(document.querySelectorAll('span[class]')).filter(span => span.innerHTML === '€').map(span => span.parentNode.parentNode.parentNode.parentNode.parentNode.parentNode.parentNode.parentNode.parentNode.parentNode.parentNode.parentNode).forEach(x => x.parentNode.removeChild(x))
    Array.from(document.querySelectorAll("*[d~='M7.51']")).map(p => p.parentNode.parentNode.parentNode.parentNode.parentNode.parentNode.parentNode.parentNode.parentNode.parentNode.parentNode.parentNode.parentNode.parentNode.parentNode).filter(p => !p.id).forEach(x => x.parentNode?.removeChild(x))}
    , 2000)
```
</div><div class="mt-lg-4">

This script will remove from the currently displayed entries:

* templates with the "paid" icon
* templates with the "premium" icon

Called every 2 seconds <small>(e.g. continue to delete as you scroll)</small>.
</div></div>

<hr class="sep-both">

### Canva: delete all images in the trash automatically

<div class="row row-cols-lg-2"><div>

There is this video [Canva - How to delete ALL images from trash folder automatically](https://www.youtube.com/watch?v=eCCk5EFYHDM) which uses an auto-clicker, but

* 😫 You can't use your computer while deleting stuff
* 💣 There is a need for additional software <small>(and the suggested download link is from a dangerous website with cracked software...)</small>
* 🤯 Elements aren't always at the same location

So, I made some complex JavaScript, because their code is complex. 

⚠️⚠️ 

**You're responsible for any problems. Use it at your own risk.**

⚠️⚠️

<br>

#### Explanations

You must run the script on the page: `https://canva.com/folder/trash`.

1. The script will select the tab "images" and navigate to it (`images`).

2. The script will swap the list view (see `layout`)

3. Then, we will start the main job (see `await doJob()`)

##### For the main job, what I do is

1. Fetching the first delete icon (see `popup`)

2. It will open a popup to restore/delete permanently the associated element. The script waits for **0.8s** for the popup to open, then click on delete permanently (see `deleteNode`)

3. The script will wait for **0.8s** for the big popup with the last confirmation to open. Then, it will check the checkbox saying that it may break your designs (see `checkbox`)

4. The script will wait for **0.1s**, and then press the confirmation button (see `confirmation`)

5. Finally, the script will wait for **0.4s**, and start again

> It's worth noting that the script won't work if the page has changed. It was still working in December 2022.

<br>

#### 🪲 Bugs 🪲

Sometimes an image was deleted, but it's still here in the list, so the script will try to delete it again. It won't have any negative impact, it's just that the script will run a second time for nothing.
</div><div>

```javascript
// https://stackoverflow.com/questions/951021/what-is-the-javascript-version-of-sleep
function sleep(ms) {
    return new Promise(resolve => setTimeout(resolve, ms));
}

async function doJob() {
    await sleep(3000)

    while (true) {
        // goal: open on restore/delete popup
        const popup = document.querySelectorAll("*[d~='14a2']")[1]?.parentNode.parentNode.parentNode.parentNode
        if (popup === undefined) {
            console.log("Cannot fetch element")
            break
        }
        popup.click()
        await sleep(800)

        // goal: open confirmation popup
        const deleteNode = document.querySelectorAll("*[d~=M8]")[0]?.parentNode.parentNode.parentNode.parentNode.parentNode
        if (deleteNode === undefined) {
            console.log("Cannot fetch 'delete'")
            break
        }
        deleteNode.click()
        await sleep(800)

        // goal: check the checkbox (if needed)
        const checkbox = document.querySelector('label > div > input')
        if (checkbox === undefined) {
            console.log("Checkbox not found, stopping just in case.")
            break
        }
        checkbox.click()
        await sleep(100)

        // goal: close the deal
        const confirmation = document.querySelector('body > div:nth-child(2) > div > div > div > div > div > div > div > div > div > div > div > button > span')?.parentNode
        if (confirmation === undefined) {
            console.log("confirmation not found")
            break
        }
        confirmation.click()

        await sleep(400)

        console.log("Removed")
    }
}

const images = document.querySelector('button[role="tab"][id][tabindex="-1"][aria-controls][aria-selected="false"][class]')

if (images) {
    images.click()
    const layout = document.querySelector("*[d~=M5]")?.parentNode.parentNode.parentNode.parentNode

    if (!layout) {
        console.log("Cannot swap layout")
    } else {
        layout.click()
        await doJob()
    }
} else {
    console.log("Cannot open image tab")
}
```
</div></div>