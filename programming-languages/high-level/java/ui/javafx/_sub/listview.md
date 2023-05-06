# ListView

<div class="row row-cols-md-2"><div>

JavaFX has the ListView to display a scrollable list of items. Simply add a JavaFX ListView component in your FXML. You can load data from your [controller](../index.md#controller), and use a custom view for cells:

```java
import javafx.scene.control.ListView;

public class XXXController {
    @FXML
    public ListView<YYY> yyyListView;
	
    public void init() {
        // ⚠️ There are more appropriate ways to do this
        //  refer to extending ObservableList<E>
        ArrayList<YYY> yyy = ...;
        yyyListView.setItems(FXCollections.observableArrayList(yyy)); // create
        yyyListView.getItems().setAll(yyy); // or update if created
        // 🌺 optional: use custom cells
        yyyListView.setCellFactory(data -> new YYYCell());
    }
}
```

A basic YYYCell doing the SAME as the default cell would be:

```java
import javafx.scene.control.ListCell;

public class YYYCell extends ListCell<YYY> {
    @Override
    protected void updateItem(YYY item, boolean empty) {
        super.updateItem(item, empty);
        setText(empty || item == null ? null : item.toString());
    }
}
```
</div><div>

You can start from there, and choose to use a [FXML](../index.md#fxml) instead of a text:

```java
import javafx.fxml.FXMLLoader;
import javafx.scene.Parent;
import javafx.scene.control.ListCell;

import java.io.IOException;
import java.net.URL;

public class YYYCell extends ListCell<YYY> {
    private final Parent root;
    private final YYYCellController controller;

    public YYYCell() {
        try {
            URL resource = MainUI.class.getResource("/yyy_cell.fxml");
            FXMLLoader loader = new FXMLLoader(resource);
            root = loader.load();
            controller = loader.getController();
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    protected void updateItem(YYY item, boolean empty) {
        super.updateItem(item, empty);
        setText(null);

        if (empty || item == null) {
            setGraphic(null);
        } else {
            controller.update(item); // assumming update exists
            setGraphic(root);
        }
    }
}
```
</div></div>