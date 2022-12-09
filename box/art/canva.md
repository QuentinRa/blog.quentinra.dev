# ✏️ Canva  ✏️ 

<div class="row row-cols-md-2"><div>

### Canva: select all images

This JavaScript code is selecting all images that you have on Canva. It's only useful if you want to delete all of them. ➡️ The script won't delete them, it's up to you to do the last action.

Another use of this script, is that if you are familiar with JavaScript, you can tune it do only select some images <small>(ex: based on their name)</small>.
</div><div>

```javascript
// select the "class" shared by every button
const className = document.querySelectorAll("*[d~='1.06L9.53']")[4]
    ?.parentNode?.parentNode?.parentNode?.parentNode?.firstChild?.classList[0]

// not found, damn, they changed something
if (className === undefined) {
    console.log("Error: can't find className")
} else {
    // otherwise, if they were not selected, select them
    for (i of document.querySelectorAll('.'+className))
        if (!i.checked)
            i.click()
    // then, manually press the trash icon
}
```
</div></div>

<br>

### Canva: delete all images in the trash automatically

<div class="row row-cols-md-2"><div>

There is this video [Canva - How to delete ALL images from trash folder automatically](https://www.youtube.com/watch?v=eCCk5EFYHDM) which uses an auto-clicker, but

* 😫 You can't use your computer while deleting stuff
* 💣 There is a need for additional software <small>(and the suggested download link is from a dangerous website with cracked software...)</small>
* 🤯 Elements aren't always at the same location

So, I made some complex JavaScript, because their code is complex.

<br>

#### Explanations

You must run the script on the page: `https://canva.com/folder/trash`.

1. The script will select the tab "images" and navigate to it (`images`).

2. The script will swap the list view (`layout`)

3. Then, we will start the main job (`await doJob()`)

##### For the main job, what I do is

1. Fetching the first delete icon (`popup`)

2. It will open a popup with restore/delete permanently the associated element. The script waits **0.8s** for the popup to open, then click on delete permanently (`deleteNode`)

3. The script will wait for **0.8s** for the big popup with the last confirmation to open. Then, it will check the checkbox saying that it may break your designs (`checkbox`)

4. The script will wait **0.4s**, and then press the confirmation button (`confirmation`)

5. Finally, the script will wait **0.4s**, and start again

> It's worth noting that the script won't work if the page has changed. It was working as of December 2022.

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