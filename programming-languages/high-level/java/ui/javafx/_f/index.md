# TP TCHAT

<hr class="sl">

## SceneBuilder

### ID and Listeners

On IntelliJ, if a @FXML attribute is properly "linked", you will have an orange symbol on the left column, so you easily know if you did something wrong.

### Context Menu

It's a popup shown when using left-click. You must add one on the list view of users. But on Windows, your scene builder may crash, so you need to create the menu somewhere else then copy and paste the code inside your context menu directly in the fxml.

### Tooltip

If you can't add tooltips, add them directly in the fxml

```xml!
<?import javafx.scene.control.Tooltip?>
```

```xml!
<Button>
<tooltip>
<Tooltip text="message" />
</tooltip></Button>
```